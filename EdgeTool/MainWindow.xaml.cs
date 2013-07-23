using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Input;
using System.Windows.Media;
using LibTwoTribes;
using LibTwoTribes.Util;
using Mygod.Windows;
using Mygod.Windows.Dialogs;
using Mygod.Xml.Linq;
using Bitmap = System.Drawing.Bitmap;
using ContextMenu = System.Windows.Forms.ContextMenu;
using MenuItem = System.Windows.Forms.MenuItem;
using MouseButtons = System.Windows.Forms.MouseButtons;
using MouseEventArgs = System.Windows.Forms.MouseEventArgs;
using NotifyIcon = System.Windows.Forms.NotifyIcon;
using ToolTipIcon = System.Windows.Forms.ToolTipIcon;

namespace Mygod.Edge.Tool
{
    public sealed partial class MainWindow
    {
        #region Main

        public MainWindow()
        {
            notifyIcon = new NotifyIcon { Icon = CurrentApp.DrawingIcon, Visible = true, Text = "EdgeTool", 
                ContextMenu = new ContextMenu(new[] { new MenuItem("启动游戏(&S)", RunGame), new MenuItem("安装 &Mod", InstallMods),
                                                      new MenuItem("关闭(&C)", (sender, e) => Close()) }) };
            notifyIcon.MouseClick += OnHideWindow;
            notifyIcon.BalloonTipClicked += OnBalloonClosed;
            notifyIcon.BalloonTipClosed += OnBalloonClosed;
            InitializeComponent();
            LevelList.ItemsSource = levels;
            UserBox.ItemsSource = users;
            GamePath.ItemsSource = Settings.RecentPaths;
            GamePath.Text = Settings.CurrentPath;
            foreach (var name in ModelNames.Split(',')) ModelNameBox.Items.Add(name);
            var files = new List<string>();
            foreach (var arg in App.Args) switch (Path.GetExtension(arg).ToLower())
            {
                case "exe":
                    GamePath.Text = arg;
                    break;
                case "edgemod":
                    InstallEdgeMod(arg);
                    break;
                default:
                    files.Add(arg);
                    break;
            }
            if (files.Count > 0) ProcessCore(files);
            Load(null, null);
            if (!Directory.Exists(User.UsersPath)) return;
            watcher = new FileSystemWatcher(User.UsersPath) { IncludeSubdirectories = true };
            watcher.Created += RefreshAchievements;
            watcher.Changed += RefreshAchievements;
            watcher.Deleted += RefreshAchievements;
            watcher.Renamed += RefreshAchievements;
            watcher.EnableRaisingEvents = true;
            RefreshAchievements();
        }

        private readonly FileSystemWatcher watcher;

        private const string ModelNames = "bumper_bottom,bumper_right,bumper_roof,cam_entry,cam_entry_target,cube_finish_shadow,cube_idle,cube_idle_shadow,cubeanimation_d_front,cubeanimation_e_middle,cubeanimation_full_d,cubeanimation_full_e,cubeanimation_full_g,cubeanimation_full_last_e,cubeanimation_g_hook,cubeanimation_last_e_bottom,cubeanimation_shadow,falling_platform,finish,holoswitch,menu_background,menu_background_shadow,menu_background_skybox,platform,platform_active,platform_active_small,platform_edges_active,platform_edges_active_small,platform_small,prism,prism_finish,prism_shadow,shrinker_tobig,shrinker_tomini,skybox_1,skybox_2,skybox_3,skybox_4,switch,switch_done,switch_ghost,switch_ghost_done";

        private static void ShowInExplorer(string path)
        {
            Process.Start("explorer", "/select,\"" + path + '"');
        }

        private void OnHideWindow(object sender, MouseEventArgs e)
        {
            if (e.Button != MouseButtons.Left) return;
            if (ShowInTaskbar)
            {
                ShowInTaskbar = false;
                Visibility = Visibility.Collapsed;
            }
            else
            {
                ShowInTaskbar = true;
                Visibility = Visibility.Visible;
            }
        }

        private void OnBalloonClosed(object sender, EventArgs e)
        {
            Interlocked.Exchange(ref balloonShown, 0);
        }

        private void OnClosing(object sender, CancelEventArgs e)
        {
            notifyIcon.Visible = false;
            notifyIcon.Dispose();
        }

        private readonly NotifyIcon notifyIcon;
        private int balloonShown;
        public static Edge Edge;
        private readonly ObservableCollection<Level> levels = new ObservableCollection<Level>();
        private readonly ObservableCollection<User> users = new ObservableCollection<User>();
        private Thread searcher;
        private readonly OpenFileDialog exeSelector = new OpenFileDialog {Title = "请选择 edge.exe", Filter = "可执行文件 (*.exe)|*.exe"};
        private readonly FolderBrowserDialog outputSelector = new FolderBrowserDialog
            { Description = "请选择要保存的位置", UseDescriptionForTitle = true };

        private void Browse(object sender, RoutedEventArgs e)
        {
            if (exeSelector.ShowDialog() == true) GamePath.Text = exeSelector.FileName;
        }

        private void Load(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(GamePath.Text) || !File.Exists(GamePath.Text))
            {
                if (sender != null) TaskDialog.Show(this, "加载失败。", "路径不合法！", TaskDialogType.Error);
                return;
            }
            try
            {
                Edge = new Edge(GamePath.Text);
                ModGrid.ItemsSource = Edge.Mods;
                if (searcher != null) searcher.Abort();
                try
                {
                    MappingLevels.Current = new MappingLevels(Edge.LevelsDirectory);
                }
                catch { }
                levels.Clear();
                searcher = new Thread(Load);
                searcher.Start();
                User current = null;
                if (Edge.SteamOtl != null) current = users.FirstOrDefault(user => user.Name == Edge.SteamOtl.SettingsUserName);
                if (current != null) UserBox.SelectedItem = users;
                RunGameButton.IsEnabled = true;
                SwitchProfileButton.IsEnabled = Edge.SteamOtl != null;
                Settings.CurrentPath = GamePath.Text;
                GamePath.ItemsSource = Settings.RecentPaths;
            }
            catch (Exception exc)
            {
                if (sender != null) TaskDialog.Show(this, "加载失败。", exc.Message, TaskDialogType.Error);
                SwitchProfileButton.IsEnabled = RunGameButton.IsEnabled = false;
            }
        }

        private void Load()
        {
            foreach (var file in Directory.EnumerateFiles(Edge.LevelsDirectory, "*.bin", SearchOption.AllDirectories)
                .Where(file => Path.GetFileName(file) != "font.bin"))
                try
                {
                    var level = Level.CreateFromCompiled(file);
                    Dispatcher.Invoke(() => levels.Add(level));
                }
                catch (Exception exc)
                {
                    Trace.WriteLine(string.Format("{0} error: {1}", Path.GetFileNameWithoutExtension(file), exc.Message));
                }
        }

        private void RunGame(object sender, EventArgs e)
        {
            if (Edge != null) Process.Start(new ProcessStartInfo(Edge.GamePath) { WorkingDirectory = Edge.GameDirectory });
        }

        private void OnDragOver(object sender, DragEventArgs e)
        {
            e.Handled = true;
            e.Effects = e.Data.GetDataPresent(DataFormats.FileDrop, true) ? e.AllowedEffects & DragDropEffects.Copy : DragDropEffects.None;
            DropTargetHelper.DragOver(e.GetPosition(this), e.Effects);
        }
        private void OnDragLeave(object sender, DragEventArgs e)
        {
            e.Handled = true;
            DropTargetHelper.DragLeave(e.Data);
        }

        #endregion

        #region Browse levels

        private void ShowMinimap(object sender, RoutedEventArgs e)
        {
            foreach (var level in LevelList.SelectedItems.OfType<Level>()) new MinimapWindow(level).Show();
        }

        private void Decompile(object sender, RoutedEventArgs e)
        {
            if (outputSelector.ShowDialog(this) != true) return;
            ProcessCore(LevelList.SelectedItems.OfType<Level>().Select(level => level.FilePath), outputSelector.SelectedPath);
            if (!string.IsNullOrWhiteSpace(WarningBox.Text)) Tabs.SelectedItem = CompileTab;
        }

        private void ShowLevelInExplorer(object sender, RoutedEventArgs e)
        {
            foreach (var level in LevelList.SelectedItems.OfType<Level>()) ShowInExplorer(level.FilePath);
        }

        private void OnSort(object sender, DataGridSortingEventArgs e)
        {
            e.Handled = e.Column.Header.ToString() == "#";
            if (!e.Handled) return;
            e.Column.SortDirection = e.Column.SortDirection != ListSortDirection.Ascending ? ListSortDirection.Ascending
                                                                                           : ListSortDirection.Descending;
            ((ListCollectionView)CollectionViewSource.GetDefaultView(levels)).CustomSort = new LevelSorter();
        }

        private void OnGridInitialized(object sender, EventArgs e)
        {
            var column = LevelList.Columns.First();
            column.SortDirection = ListSortDirection.Ascending;
            LevelList.Items.SortDescriptions.Add(new SortDescription(column.SortMemberPath, ListSortDirection.Ascending));
        }

        private void FloatingAutoFix(object sender, RoutedEventArgs e)
        {
            var result = TaskDialog.Show(this, "你想要启动史诗般的发光特效吗？", type: TaskDialogType.YesNoCancelQuestion, 
                                         defaultButtonIndex: 7);
            if (result == TaskDialogSimpleResult.Cancel) return;
            foreach (var level in LevelList.SelectedItems.OfType<Level>().Select(level => Level.CreateFromCompiled(level.FilePath)))
            {
                for (short x = 0; x < level.Size.Width; x++) for (short y = 0; y < level.Size.Length; y++)
                    for (short z = 0; z < level.Size.Height; z++) if (level.CollisionMap[x, y, z])
                    {
                        var platform = new MovingPlatform(level.MovingPlatforms);
#pragma warning disable 665
                        platform.LoopStartIndex = (byte) ((platform.AutoStart = result == TaskDialogSimpleResult.Yes) ? 1 : 0);
#pragma warning restore 665
                        platform.Waypoints.Add(new Waypoint { Position = new Point3D16(x, y, (short)(z + 1)) });
                        if (z == 0) platform.FullBlock = false;
                        level.MovingPlatforms.Add(platform);
                    }
                var fileName = Path.GetFileNameWithoutExtension(level.FilePath) + "_fixed.bin";
                // ReSharper disable AssignNullToNotNullAttribute
                level.Compile(Path.Combine(Path.GetDirectoryName(level.FilePath), fileName));
                // ReSharper restore AssignNullToNotNullAttribute
            }
            TaskDialog.Show(this, "修复完毕。", "修复结果存放在levels的文件夹中，文件名以_fixed.bin结尾。", TaskDialogType.Information);
        }

        private void DrawLevelModelTree(object sender, RoutedEventArgs e)
        {
            var level = LevelList.SelectedItem as Level;
            if (level == null) return;
            ModelNameBox.Text = Path.GetFileNameWithoutExtension(level.FilePath);
            Tabs.SelectedItem = DrawModelTreeTab;
            DrawModelTree(sender, e);
        }

        #endregion

        #region Browse achievements

        private void ShowHelp(object sender, MouseButtonEventArgs e)
        {
            var tag = (string)((Image)sender).Tag;
            if (!string.IsNullOrWhiteSpace(tag)) Process.Start(tag);
        }

        private void SetDefaultProfile(object sender, RoutedEventArgs e)
        {
            if (Edge.SteamOtl != null) Edge.SteamOtl.SettingsUserName = ((User) UserBox.SelectedItem).Name;
        }

        private void ForceUnlockAchievement(object sender, MouseButtonEventArgs e)
        {
            var item = AchievementsList.SelectedItem as Achievement;
            if (item != null && TaskDialog.Show(this, "确定要(取消)解锁该成就吗？", type: TaskDialogType.YesNoQuestion)
                == TaskDialogSimpleResult.Yes) item.Unlocked = !item.Unlocked;
        }

        private void RefreshAchievements(object sender = null, FileSystemEventArgs e = null)
        {
            var skipBalloons = false;
            User currentUser = null;
            var unlockedAchievements = new HashSet<string>();
            Dispatcher.Invoke(() =>
            {
                currentUser = UserBox.SelectedItem as User;
                if (!(skipBalloons = currentUser == null))
                    unlockedAchievements = new HashSet<string>(from a in currentUser.Achievements where a.Unlocked select a.ID);
                users.Clear();
                foreach (var user in User.GetUsers())
                {
                    users.Add(user);
                    if (currentUser == null || user.Name == currentUser.Name) UserBox.SelectedItem = currentUser = user;
                }
                AchievementsTip.Text = users.Count == 0
                    ? "对不起，你还没有玩过游戏或你使用了不支持的版本。该功能当前仅支持 V1.0.2483.7086 的破解版。"
                    : "提示：右击可强制(取消)解锁。开启 EdgeTool 后玩 EDGE 可即时看到获得的成就。";
            });
            if (skipBalloons || currentUser == null) return;
            foreach (var achievement in currentUser.Achievements)
                if (achievement.Unlocked && !unlockedAchievements.Contains(achievement.ID))
                {
                    while (Interlocked.Exchange(ref balloonShown, 1) == 1) Thread.Sleep(500);
                    notifyIcon.ShowBalloonTip(5000, "成就 " + achievement.Title + " 解锁！", "恭喜你解锁了一个成就！快去 EdgeTool 看看吧！"
                        + Environment.NewLine + "说明：" + achievement.Description, ToolTipIcon.Info);
                }
        }

        #endregion

        #region Compile & Decompile

        private void ShowReferenceGuide(object sender, RoutedEventArgs e)
        {
            Process.Start("http://edgefans.tk/developers");
        }

        private void OnBinaryDragEnter(object sender, DragEventArgs e)
        {
            e.Handled = true;
            if (e.Data.GetDataPresent(DataFormats.FileDrop, true))
            {
                e.Effects = e.AllowedEffects & DragDropEffects.Copy;
                DropTargetHelper.DragEnter(this, e.Data, e.GetPosition(this), e.Effects, "(反)编译");
            }
            else
            {
                e.Effects = DragDropEffects.None;
                DropTargetHelper.DragEnter(this, e.Data, e.GetPosition(this), e.Effects);
            }
        }
        private void OnBinaryDrop(object sender, DragEventArgs e)
        {
            e.Handled = true;
            e.Effects = e.Data.GetDataPresent(DataFormats.FileDrop, true) ? e.AllowedEffects & DragDropEffects.Copy : DragDropEffects.None;
            DropTargetHelper.Drop(e.Data, e.GetPosition(this), e.Effects);
            if (e.Effects != DragDropEffects.Copy) return;
            var files = e.Data.GetData(DataFormats.FileDrop, true) as string[];
            if (files == null) return;
            var count = ProcessCore(files);
            if (count > 0) TaskDialog.Show(this, "(反)编译完毕。", "共(反)编译了 " + count + " 个文件。", TaskDialogType.Information);
        }

        private int ProcessCore(IEnumerable<string> files, string directory = null)
        {
            var count = 0;
            bool? exFormat = null;
            WarningBox.Text = string.Empty;
            foreach (var file in files)
            {
                var fileName = Path.GetFileNameWithoutExtension(file);
                directory = directory ?? Path.GetDirectoryName(file);
                string inputPath = Path.Combine(Path.GetDirectoryName(file), fileName), outputPath = Path.Combine(directory, fileName);
                Warning.Start();
                try
                {
                    switch (Path.GetExtension(file).ToLowerInvariant())
                    {
                        case ".bin":
                            if (fileName.Equals("cos", StringComparison.InvariantCultureIgnoreCase))
                            {
                                var array = new short[181];
                                using (var stream = File.OpenRead(file)) using (var reader = new BinaryReader(stream))
                                    for (var i = 0; i <= 180; i++) array[i] = reader.ReadInt16();
                                File.WriteAllText(outputPath + ".txt", 
                                    string.Join(Environment.NewLine, array.Select(value => value / 256.0)));
                            }
                            else Level.CreateFromCompiled(file).Decompile(outputPath);
                            break;
                        case ".xml":
                            var root = XHelper.Load(file).Elements().First();
                            switch (root.Name.LocalName.ToLowerInvariant())
                            {
                                case "level":
                                    Level.CreateFromDecompiled(inputPath).Compile(outputPath + ".bin");
                                    break;
                                case "animation":
                                    AssetHelper.ParseEan(root, fileName)
                                        .Save(Path.Combine(directory, AssetUtil.CRCFullName(fileName, "models") + ".ean"));
                                    break;
                                case "material":
                                {
                                    string name, compiledFileName;
                                    Helper.AnalyzeFileName(out name, out compiledFileName, fileName);
                                    var ema = AssetHelper.ParseEma(root, name);
                                    ema.Save(Path.Combine(directory, compiledFileName + ".ema"));
                                    break;
                                }
                                case "models":
                                {
                                    string name, compiledFileName;
                                    Helper.AnalyzeFileName(out name, out compiledFileName, fileName);
                                    var eso = AssetHelper.ParseEso(root, name);
                                    eso.Save(Path.Combine(directory, compiledFileName + ".eso"));
                                    break;
                                }
                            }
                            break;
                        case ".loc":
                            LOC.FromFile(file).SaveXsl(outputPath + ".xls");
                            break;
                        case ".xls":    
                            LocHelper.FromXsl(file).Save(outputPath + ".loc");
                            break;
                        case ".etx":
                            var etx = ETX.FromFile(file);
                            etx.GetBitmap().Save(Path.Combine(directory, etx.AssetHeader.Name + ".png"));
                            break;
                        case ".png":
                            if (!exFormat.HasValue) exFormat = TaskDialog.Show(this, "要使用新版 .etx 格式吗？", 
                                "仅适用于 Steam 正版。（非 Demo）", TaskDialogType.YesNoQuestion) == TaskDialogSimpleResult.Yes;
                            using (var bitmap = new Bitmap(file))
                            {
                                var name = AssetUtil.CRCFullName(fileName, "textures") + ".etx";
                                if (exFormat.Value) ETX1804.CreateFromImage(bitmap, fileName).Save(Path.Combine(directory, name));
                                else ETX1803.CreateFromImage(bitmap, fileName).Save(Path.Combine(directory, name));
                            }
                            break;
                        case ".ean":
                            var ean = EAN.FromFile(file);
                            File.WriteAllText(Path.Combine(directory, ean.AssetHeader.Name + ".xml"), 
                                              AssetHelper.GetEanElement(ean).ToString());
                            break;
                        case ".ema":
                        {
                            var ema = EMA.FromFile(file);
                            File.WriteAllText(Path.Combine(directory, Helper.GetDecompiledFileName(fileName, ema) + ".xml"),
                                              AssetHelper.GetEmaElement(ema).ToString());
                            break;
                        }
                        case ".eso":
                        {
                            var eso = ESO.FromFile(file);
                            File.WriteAllText(Path.Combine(directory, Helper.GetDecompiledFileName(fileName, eso) + ".xml"),
                                              AssetHelper.GetEsoElement(eso).ToString());
                            break;
                        }
                        case ".txt":
                            using (var stream = new FileStream(outputPath + ".bin", FileMode.Create, FileAccess.Write, FileShare.Read))
                            using (var writer = new BinaryWriter(stream))
                                foreach (var num in File.ReadAllText(file).Split(new[] { '\r', '\n' },
                                    StringSplitOptions.RemoveEmptyEntries).Select(double.Parse))
                                    writer.Write((short) Math.Round(num * 256));
                            break;
                        default:
                            throw new NotSupportedException("对不起，无法识别您要(反)编译的文件！");
                    }
                    count++;
                }
                catch (Exception exc)
                {
                    TaskDialog.Show(this, fileName + " (反)编译失败。",
                        string.Format("错误信息：" + Environment.NewLine + exc.GetMessage()), TaskDialogType.Error);
                }
                if (!string.IsNullOrWhiteSpace(Warning.Fetch()))
                    WarningBox.Text += string.Format("{0}{1}{2}{1}", file, Environment.NewLine, Warning.Fetch());
                Warning.Clear();
            }
            return count;
        }

        #endregion

        #region Mod

        private void UpdateDescription(object sender, SelectionChangedEventArgs e)
        {
            var mod = ModGrid.SelectedItem as EdgeMod;
            if (mod != null && !string.IsNullOrWhiteSpace(mod.Description)) DescriptionBlock.Text = mod.Description;
        }

        private void RefreshMods(object sender = null, RoutedEventArgs e = null)
        {
            var result = Edge.RefreshMods();
            if (!string.IsNullOrWhiteSpace(result)) TaskDialog.Show(this, "加载 mod 时出现了问题。", result, TaskDialogType.Error);
        }

        private ProgressDialog dialog;
        private long filesCount, currentFileIndex;

        private void InstallMods(object sender, EventArgs e)
        {
            if (!Settings.ModLoaded)
            {
                Settings.ModLoaded = true;
                TaskDialog.Show(this, type: TaskDialogType.Information,
                    mainInstruction: "第一次安装 Mod （以及执行清理后第一次安装）时速度可能较慢，请耐心等待。");
            }
            dialog = new ProgressDialog { Description = "开始安装中……", ShowTimeRemaining = true, 
                Text = "安装 Mod", WindowTitle = "安装 Mod", UseCompactPathsForDescription = true };
            dialog.DoWork += InstallMods;
            dialog.RunWorkerCompleted += InstallModsCompleted;
            dialog.ShowDialog(this);
        }

        private void InstallModsCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            Dispatcher.Invoke(() =>
            {
                if (string.IsNullOrWhiteSpace(e.Result.ToString()))
                    TaskDialog.Show(this, "安装完毕。", type: TaskDialogType.Information);
                else
                {
                    DescriptionBlock.Text = e.Result.ToString();
                    TaskDialog.Show(this, "安装完毕。", "但是出了一些问题，去看看详情吧。", TaskDialogType.Information);
                }
            });
        }

        private void InstallMods(object sender, DoWorkEventArgs e)
        {
            filesCount = Edge.Mods.Where(mod => mod.Enabled).Sum(mod => mod.FilesCount);
            currentFileIndex = 0;
            e.Result = Edge.Install(UpdateProgress, e);
        }

        private void UpdateProgress(string additionalMessage)
        {
            Dispatcher.Invoke(() => dialog.ReportProgress((int) (currentFileIndex++ * 100 / filesCount), null, additionalMessage));
        }

        private void CleanUpInstall(object sender, RoutedEventArgs e)
        {
            Edge.CleanUp();
            TaskDialog.Show(this, "清理完毕。", "所有 Mod 已被临时卸载。想要再次安装点击安装即可。", TaskDialogType.Information);
        }

        private void OnModDragEnter(object sender, DragEventArgs e)
        {
            e.Handled = true;
            if (e.Data.GetDataPresent(DataFormats.FileDrop, true))
            {
                e.Effects = e.AllowedEffects & DragDropEffects.Copy;
                DropTargetHelper.DragEnter(this, e.Data, e.GetPosition(this), e.Effects, "安装 %1", "Mod");
            }
            else
            {
                e.Effects = DragDropEffects.None;
                DropTargetHelper.DragEnter(this, e.Data, e.GetPosition(this), e.Effects);
            }
        }
        private void OnModDrop(object sender, DragEventArgs e)
        {
            e.Handled = true;
            e.Effects = e.Data.GetDataPresent(DataFormats.FileDrop, true) ? e.AllowedEffects & DragDropEffects.Copy : DragDropEffects.None;
            DropTargetHelper.Drop(e.Data, e.GetPosition(this), e.Effects);
            if (e.Effects != DragDropEffects.Copy) return;
            var files = e.Data.GetData(DataFormats.FileDrop, true) as string[];
            if (files == null) return;
            if (files.Where(file => file.EndsWith(".edgemod", true, CultureInfo.InvariantCulture)).Count(InstallEdgeMod) == 0) return;
            TaskDialog.Show(this, "安装成功。", type: TaskDialogType.Information);
            RefreshMods();
        }

        private bool InstallEdgeMod(string file)
        {
            string id = Path.GetFileNameWithoutExtension(file), target = Path.Combine(Edge.ModsDirectory, Path.GetFileName(file));
            if (File.Exists(target) && TaskDialog.Show(this, id + " 已存在。", "是否要覆盖？", TaskDialogType.YesNoQuestion)
                != TaskDialogSimpleResult.Yes) return false;
            try
            {
                File.Copy(file, target, true);
                return true;
            }
            catch (Exception exc)
            {
                TaskDialog.Show(this, id + " 安装失败。", exc.Message, TaskDialogType.Error);
            }
            return false;
        }

        private void DeleteCurrentMod(object sender, RoutedEventArgs e)
        {
            var mod = ModGrid.SelectedItem as EdgeMod;
            if (mod == null) return;
            File.Delete(mod.FilePath);
            RefreshMods();
        }

        private void DeleteDisabledMods(object sender, RoutedEventArgs e)
        {
            foreach (var mod in Edge.Mods.Where(mod => !mod.Enabled)) File.Delete(mod.FilePath);
            RefreshMods();
        }

        #endregion

        #region Model Tree

        private void DrawModelTree(object sender, RoutedEventArgs e)
        {
            ModelTreeView.Items.Clear();
            DrawEso(ModelTreeView.Items, AssetUtil.CRCFullName(ModelNameBox.Text, "models", false));
        }

        private static void DrawEso(IList parent, string fileName)
        {
            var item = new TreeViewItem { IsExpanded = true };
            parent.Add(item);
            var path = Path.Combine(Edge.ModelsDirectory, fileName + ".eso");
            item.Tag = path;
            if (!File.Exists(path))
            {
                item.Header = fileName + ".eso (不存在)";
                item.Foreground = Brushes.Red;
                return;
            }
            var eso = ESO.FromFile(path);
            item.Header = string.Format("{0}.eso ({1}.xml)", fileName, Helper.GetDecompiledFileName(fileName, eso));
            foreach (var model in eso.Models.Where(model => !model.MaterialAsset.IsZero()))
                DrawEma(item.Items, model.MaterialAsset.ToString());
            if (!eso.Header.NodeChild.IsZero()) DrawEso(item.Items, eso.Header.NodeChild.ToString());
            if (!eso.Header.NodeSibling.IsZero()) DrawEso(parent, eso.Header.NodeSibling.ToString());
        }

        private static void DrawEma(IList parent, string fileName)
        {
            var item = new TreeViewItem { IsExpanded = true };
            parent.Add(item);
            var path = Path.Combine(Edge.ModelsDirectory, fileName + ".ema");
            item.Tag = path;
            if (!File.Exists(path))
            {
                item.Header = fileName + ".ema (不存在)";
                item.Foreground = Brushes.Red;
                return;
            }
            var ema = EMA.FromFile(path);
            item.Header = string.Format("{0}.ema ({1}.xml)", fileName, Helper.GetDecompiledFileName(fileName, ema));
            foreach (var texture in ema.Textures) DrawEtx(item.Items, texture.Asset.ToString());
        }

        private static void DrawEtx(IList parent, string fileName)
        {
            var item = new TreeViewItem { IsExpanded = true };
            parent.Add(item);
            var path = Path.Combine(Edge.TexturesDirectory, fileName + ".etx");
            item.Tag = path;
            if (!File.Exists(path))
            {
                item.Header = fileName + ".etx (不存在)";
                item.Foreground = Brushes.Red;
                return;
            }
            var etx = ETX.FromFile(path);
            item.Header = string.Format("{0}.etx ({1}.png)", fileName, etx.AssetHeader.Name);
        }

        private void GetModelTreeHelp(object sender, RoutedEventArgs e)
        {
            Process.Start("http://edgefans.tk/developers/file-formats/asset/drawing-model-tree");
        }

        private void ShowFileInExplorer(object sender, RoutedEventArgs e)
        {
            var item = ModelTreeView.SelectedItem as TreeViewItem;
            if (item != null) ShowInExplorer(item.Tag.ToString());
        }

        private void OnModelDragEnter(object sender, DragEventArgs e)
        {
            e.Handled = true;
            if (e.Data.GetDataPresent(DataFormats.FileDrop, true))
            {
                e.Effects = e.AllowedEffects & DragDropEffects.Copy;
                DropTargetHelper.DragEnter(this, e.Data, e.GetPosition(this), e.Effects, "绘制模型树");
            }
            else
            {
                e.Effects = DragDropEffects.None;
                DropTargetHelper.DragEnter(this, e.Data, e.GetPosition(this), e.Effects);
            }
        }

        private void OnModelDrop(object sender, DragEventArgs e)
        {
            e.Handled = true;
            e.Effects = e.Data.GetDataPresent(DataFormats.FileDrop, true) ? e.AllowedEffects & DragDropEffects.Copy : DragDropEffects.None;
            DropTargetHelper.Drop(e.Data, e.GetPosition(this), e.Effects);
            if (e.Effects != DragDropEffects.Copy) return;
            var files = e.Data.GetData(DataFormats.FileDrop, true) as string[];
            if (files == null || files.Length == 0) return;
            using (var stream = File.OpenRead(files[0]))
            {
                var name = new AssetHeader(stream).Name;
                if (name.EndsWith(".rmdl", true, CultureInfo.InvariantCulture)) name = name.Remove(name.Length - 5);
                ModelNameBox.Text = name;
            }
            DrawModelTree(sender, e);
        }

        public static ModelWindow ModelWindow;
        private void ViewModel(bool debug = false)
        {
            var item = ModelTreeView.SelectedItem as TreeViewItem;
            if (item == null) return;
            var path = item.Tag.ToString();
            if (!path.EndsWith(".eso", false, CultureInfo.InvariantCulture)) return;
            if (ModelWindow == null) (ModelWindow = new ModelWindow()).Show();
            ModelWindow.Draw(path, debug);
            ModelWindow.Activate();
        }
        private void ViewModel(object sender, RoutedEventArgs e)
        {
            ViewModel();
        }
        private void ViewModelDebug(object sender, RoutedEventArgs e)
        {
            ViewModel(true);
        }

        #endregion
    }

    public sealed class LevelSorter : IComparer
    {
        public int Compare(object x, object y)
        {
            return MappingLevels.GetMapping((Level)x).CompareTo(MappingLevels.GetMapping((Level)y));
        }
    }

    [ValueConversion(typeof(bool), typeof(Visibility))]
    public sealed class VisibleWhileTrueConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == null) value = false;
            if (!(value is bool)) return null;
            return (bool)value ? Visibility.Visible : Visibility.Collapsed;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (!(value is Visibility)) return null;
            return ((Visibility)value) == Visibility.Visible;
        }
    }

    [ValueConversion(typeof(bool), typeof(Visibility))]
    public sealed class VisibleWhileNotNullConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return value != null ? Visibility.Visible : Visibility.Collapsed;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotSupportedException();
        }
    }

    [ValueConversion(typeof(ushort), typeof(string))]
    public sealed class SecondsConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (!(value is ushort)) return null;
            var seconds = (ushort)value;
            if (seconds < 60) return seconds.ToString(CultureInfo.InvariantCulture) + '"';
            return string.Format("{0}'{1:00}\"", seconds / 60, seconds % 60);
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotSupportedException();
        }
    }

    [ValueConversion(typeof(string), typeof(string))]
    public sealed class BinFilePathConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return value.ToString().GetRelativePath(MainWindow.Edge.LevelsDirectory).RemoveExtension().ToCorrectPath();
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return Path.Combine(MainWindow.Edge.LevelsDirectory, value + ".bin");
        }
    }
}
