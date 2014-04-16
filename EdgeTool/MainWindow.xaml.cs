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
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Input;
using System.Windows.Media;
using Mygod.Edge.Tool.LibTwoTribes;
using Mygod.Edge.Tool.LibTwoTribes.Util;
using Microsoft.WindowsAPICodePack.Dialogs;
using Microsoft.WindowsAPICodePack.Dialogs.Controls;
using Mygod.Net;
using Mygod.Windows;
using Mygod.Windows.Dialogs;
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
            notifyIcon = new NotifyIcon { Icon = CurrentApp.DrawingIcon, Text = "EdgeTool" };
            notifyIcon.MouseClick += OnHideWindow;
            notifyIcon.BalloonTipClicked += OnBalloonClosed;
            notifyIcon.BalloonTipClosed += OnBalloonClosed;
            InitializeComponent();
            DecompileHistoryBox.ItemsSource = decompileHistory;
            checkBoxes = CheckBoxPanel.Children.OfType<CheckBox>().ToDictionary(box => box.Content as string);
            LevelList.ItemsSource = levels;
            GamePath.ItemsSource = Settings.RecentPaths;
            GamePath.Text = Settings.CurrentPath;
            foreach (var name in ModelNames.Split(',').OrderBy(name => name)) ModelNameBox.Items.Add(name);
            foreach (var name in AnimationNames.Split(',').OrderBy(name => name)) AnimationNameBox.Items.Add(name);
            if (!string.IsNullOrWhiteSpace(App.GamePath)) GamePath.Text = App.GamePath;
            Load(null, null);
            foreach (var edgemod in App.EdgeMods) InstallEdgeMod(edgemod);
            if (!Directory.Exists(Users.Root)) return;
            var watcher = new FileSystemWatcher(Users.Root) { IncludeSubdirectories = true };
            watcher.Created += RefreshAchievements;
            watcher.Changed += RefreshAchievements;
            watcher.Deleted += RefreshAchievements;
            watcher.Renamed += RefreshAchievements;
            watcher.EnableRaisingEvents = true;
            GC.KeepAlive(watcher);
            RefreshAchievements();
        }

        private static readonly string
            ModelNames = "bumper_bottom,bumper_right,bumper_roof,cam_entry,cam_entry_target,cube_finish_shadow,cube_idle,cube_idle_shadow,cubeanimation_d_front,cubeanimation_e_middle,cubeanimation_full_d,cubeanimation_full_e,cubeanimation_full_g,cubeanimation_full_last_e,cubeanimation_g_hook,cubeanimation_last_e_bottom,cubeanimation_shadow,falling_platform,finish,holoswitch,menu_background,menu_background_shadow,menu_background_skybox,platform,platform_active,platform_active_small,platform_edges_active,platform_edges_active_small,platform_small,prism,prism_finish,prism_shadow,shrinker_tobig,shrinker_tomini,skybox_1,skybox_2,skybox_3,skybox_4,switch,switch_done,switch_ghost,switch_ghost_done",
            AnimationNames = "bumper_bottom,bumper_right,bumper_roof,cam_entry_target__loop,cam_entry__loop,cubeanimation_d_front,cubeanimation_d_front_shadow,cubeanimation_e_middle,cubeanimation_e_middle_shadow,cubeanimation_full_d,cubeanimation_full_d_shadow,cubeanimation_full_e,cubeanimation_full_e_shadow,cubeanimation_full_g,cubeanimation_full_g_shadow,cubeanimation_full_last_e,cubeanimation_full_last_e_shadow,cubeanimation_g_hook,cubeanimation_g_hook_shadow,cubeanimation_last_e_bottom,cubeanimation_last_e_bottom_shadow,cube_climbdown,cube_climbdown_shadow,cube_climbleft,cube_climbleft_shadow,cube_climbright,cube_climbright_shadow,cube_climbup,cube_climbup_shadow,cube_finish,cube_finish_shadow,cube_idle_shadow,cube_movedown,cube_movedown_shadow,cube_moveleft,cube_moveleft_shadow,cube_moveright,cube_moveright_shadow,cube_moveup,cube_moveup_shadow,menu_background,menu_background_shadow,prism,prism_finish,prism_shadow,shrinker_tobig,shrinker_tomini";

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
            KeyEventRecorder.Shutdown(true);
        }

        private readonly NotifyIcon notifyIcon;
        private int balloonShown;
        public static Edge Edge;
        private readonly ObservableCollection<Level> levels = new ObservableCollection<Level>();
        private Thread searcher;

        private readonly CommonOpenFileDialog exeSelector = new CommonOpenFileDialog
        {
            Title = Localization.GameSelectorTitle, DefaultFileName = "edge.exe",
            Filters = { new CommonFileDialogFilter(Localization.ExecutableFilter, "*.exe") }
        },
                                              outputSelector = new CommonOpenFileDialog
        {
            Title = Localization.OutputPathSelectorTitle, IsFolderPicker = true, AddToMostRecentlyUsedList = false
        };

        private static readonly CommonOpenFileDialog LevelSelector = new CommonOpenFileDialog
        {
            Title = Localization.LevelFileSelectorTitle, Multiselect = true, AddToMostRecentlyUsedList = false,
            Controls = { new CommonFileDialogCheckBox(Localization.ConvertToPcBox) },
            Filters = { new CommonFileDialogFilter(Localization.EdgeLevelFilter, "*.bin") }
        };

        private void Browse(object sender, RoutedEventArgs e)
        {
            if (exeSelector.ShowDialog() == CommonFileDialogResult.Ok) GamePath.Text = exeSelector.FileName;
        }

        private void Load(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(GamePath.Text) || !File.Exists(GamePath.Text))
            {
                if (sender != null) TaskDialog.Show(this, Localization.Error, Localization.LoadingFailed,
                                                    Localization.InvalidPath, TaskDialogType.Error);
                return;
            }
            try
            {
                Edge = new Edge(GamePath.Text);
                Edge.DisabledEdgeModsChanged += (a, b) => isDirty = true;
                EdgeModGrid.ItemsSource = Edge.EdgeMods;
                if (searcher != null) searcher.Abort();
                try
                {
                    MappingLevels.Current = new MappingLevels(Edge.LevelsDirectory);
                }
                catch
                {
                    Trace.WriteLine("Failed to load mappings.xml!");
                }
                levels.Clear();
                searcher = new Thread(Load);
                searcher.Start();
                User current = null;
                if (Edge.SteamOtl != null)
                    current = Users.Current.FirstOrDefault(user => user.Name == Edge.SteamOtl.SettingsUserName);
                else if (Users.Current.CurrentUser == null) current = Users.Current.FirstOrDefault();
                if (current != null) Users.Current.CurrentUser = current;
                AchievementsList.Items.Refresh();
                RunGameButton.IsEnabled = true;
                SwitchProfileButton.IsEnabled = Edge.SteamOtl != null;
                Settings.CurrentPath = GamePath.Text;
                GamePath.ItemsSource = Settings.RecentPaths;
            }
            catch (Exception exc)
            {
                if (sender != null) TaskDialog.Show(this, Localization.Error, Localization.LoadingFailed,
                                                    exc.Message, TaskDialogType.Error);
                SwitchProfileButton.IsEnabled = RunGameButton.IsEnabled = false;
            }
        }

        private void RefreshAchievementsList(object sender, RoutedEventArgs e)
        {
            AchievementsList.Items.Refresh();
        }

        private void Load()
        {
            foreach (var file in Directory.EnumerateFiles(Edge.LevelsDirectory, "*.bin", SearchOption.AllDirectories))
                try
                {
                    var level = Level.CreateFromCompiled(file);
                    Dispatcher.Invoke(() => levels.Add(level));
                }
                catch (Exception exc)
                {
                    Trace.WriteLine(string.Format("{0} error: {1}", Path.GetFileNameWithoutExtension(file),
                                                  exc.Message));
                }
        }

        private void RunGame(object sender, EventArgs e)
        {
            if (Edge == null || (isDirty && TaskDialog.Show(this, Localization.Ask, Localization.ProceedConfirm,
                Localization.EdgeModsChangesNotAppliedMessage, TaskDialogType.OKCancelQuestion)
                != TaskDialogResult.Ok)) return;
            Process.Start(new ProcessStartInfo(Edge.GamePath) { WorkingDirectory = Edge.GameDirectory });
            isDirty = false;
        }

        private void OnDragOver(object sender, DragEventArgs e)
        {
            e.Handled = true;
            e.Effects = e.Data.GetDataPresent(DataFormats.FileDrop, true)
                ? e.AllowedEffects & DragDropEffects.Copy : DragDropEffects.None;
            DropTargetHelper.DragOver(e.GetPosition(this), e.Effects);
        }
        private void OnDragLeave(object sender, DragEventArgs e)
        {
            e.Handled = true;
            DropTargetHelper.DragLeave(e.Data);
        }

        private void RecordKeyEvent(object sender, RoutedEventArgs e)
        {
            KeyEventRecorder.Instance.Show();
            KeyEventRecorder.Instance.Activate();
        }

        private void ConvertMobiLevel(object sender, RoutedEventArgs e)
        {
            ConvertMobiLevel(this);
        }
        public static void ConvertMobiLevel(Window window = null)
        {
            if (LevelSelector.ShowDialog(window) != CommonFileDialogResult.Ok) return;
            var pc = ((CommonFileDialogCheckBox)LevelSelector.Controls[0]).IsChecked;
            var count = 0;
            foreach (var file in LevelSelector.FileNames)
                try
                {
                    using (var stream = new FileStream(file, FileMode.Open, FileAccess.ReadWrite, FileShare.Read))
                    {
                        var reader = new BinaryReader(stream);
                        var writer = new BinaryWriter(stream);
                        stream.Position = 4;
                        stream.Position = reader.ReadUInt32() + 8;
                        for (var i = 0; i < 5; i++)
                        {
                            var temp = reader.ReadUInt16();
                            stream.Seek(-2, SeekOrigin.Current);
                            writer.Write((ushort) (pc ? temp / 100 : temp * 100));
                        }
                    }
                    count++;
                }
                catch (Exception exc)
                {
                    TaskDialog.Show(window, Localization.Error, Localization.ConversionFailed, file,
                                    TaskDialogType.Error, exc.GetMessage());
                }
            if (count > 0) TaskDialog.Show(window, Localization.Finished, Localization.ConversionFinished, 
                             string.Format(Localization.ConversionFinishedDetails, count), TaskDialogType.Information);
        }
        private void CheckForUpdates(object sender, RoutedEventArgs e)
        {
            CheckForUpdates(this);
        }
        public static void CheckForUpdates(Window window = null)
        {
            WebsiteManager.CheckForUpdates(
                () => TaskDialog.Show(window, Localization.Finished, Localization.NoUpdatesAvailable,
                                      type: TaskDialogType.Information),
                exc => TaskDialog.Show(window, Localization.Error, Localization.CheckForUpdatesFailed,
                                       type: TaskDialogType.Error, expandedInfo: exc.GetMessage()));
        }
        private void Help(object sender, RoutedEventArgs e)
        {
            Process.Start("http://edgefans.tk/developers");
        }

        private void PopContextMenu(object sender, RoutedEventArgs e)
        {
            var button = (FrameworkElement)sender;
            button.ContextMenu.Placement = PlacementMode.Bottom;
            button.ContextMenu.PlacementTarget = button;
            button.ContextMenu.IsOpen = true;
        }

        private static string GetPath(object parameter)
        {
            return Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
                                "Two Tribes", parameter.ToString(), "settings.ini");
        }

        private void OpenSettingsIni(object sender, ExecutedRoutedEventArgs e)
        {
            Process.Start(GetPath(e.Parameter));
        }

        private void SettingsIniCanOpen(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = File.Exists(GetPath(e.Parameter));
        }

        #endregion

        #region Browse levels

        private void ShowMinimap(object sender, RoutedEventArgs e)
        {
            foreach (var level in LevelList.SelectedItems.OfType<Level>()) new MinimapWindow(level).Show();
        }

        private void Decompile(object sender, RoutedEventArgs e)
        {
            if (outputSelector.ShowDialog(this) != CommonFileDialogResult.Ok) return;
            ProcessCore(LevelList.SelectedItems.OfType<Level>().Select(level => level.FilePath),
                        outputSelector.FileName);
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
            var descending = e.Column.SortDirection == ListSortDirection.Ascending;
            e.Column.SortDirection = descending ? ListSortDirection.Descending : ListSortDirection.Ascending;
            ((ListCollectionView)CollectionViewSource.GetDefaultView(levels)).CustomSort =
                new LevelSorter(descending);
        }

        private void OnGridInitialized(object sender, EventArgs e)
        {
            var column = LevelList.Columns.First();
            column.SortDirection = ListSortDirection.Ascending;
            LevelList.Items.SortDescriptions.Add(new SortDescription(column.SortMemberPath,
                                                                     ListSortDirection.Ascending));
        }

        private void DrawLevelModelTree(object sender, RoutedEventArgs e)
        {
            var level = LevelList.SelectedItem as Level;
            if (level == null) return;
            ModelNameBox.Text = Path.GetFileNameWithoutExtension(level.FilePath);
            Tabs.SelectedItem = DrawModelTreeTab;
            DrawModelTree(sender, e);
        }

        private void ModifyMappingXml(object sender, RoutedEventArgs e)
        {
            Process.Start(Path.Combine(Edge.LevelsDirectory, "mapping.xml"));
        }

        private void ShowMappingXmlHelp(object sender, RoutedEventArgs e)
        {
            Process.Start("http://edgefans.tk/developers/file-formats/mapping-xml");
        }

        #endregion

        #region Browse achievements

        private void RefreshGlobalPercent(object sender, RoutedEventArgs e)
        {
            Achievements.RefreshGlobalPercents();
        }

        private void SetDefaultProfile(object sender, RoutedEventArgs e)
        {
            if (Edge.SteamOtl != null) Edge.SteamOtl.SettingsUserName = Users.Current.CurrentUser.Name;
        }

        private void ForceUnlockAchievement(object sender, MouseButtonEventArgs e)
        {
            var item = AchievementsList.SelectedItem as Achievement;
            if (item != null && Users.Current.CurrentUser != null && TaskDialog.Show(this, Localization.Ask,
                Localization.AchievementUnlockConfirm, type: TaskDialogType.YesNoQuestion) == TaskDialogResult.Yes)
                Users.Current.CurrentUser.SetAchieved(item, !Users.Current.CurrentUser.GetAchieved(item));
        }

        private void RefreshAchievements(object sender = null, FileSystemEventArgs e = null)
        {
            var achievedBefore = new HashSet<string>();
            Dispatcher.Invoke(() =>
            {
                if (Users.Current.CurrentUser != null) achievedBefore = new HashSet<string>(
                    from a in Achievements.Current where Users.Current.CurrentUser.GetAchieved(a) select a.ApiName);
                Users.Current.Refresh();
                AchievementsList.Items.Refresh();
                AchievementsTip.Visibility = Visibility.Visible;
            });
            if (Users.Current.CurrentUser == null) return;
            foreach (var achievement in Achievements.Current.Where(achievement =>
                !achievedBefore.Contains(achievement.ApiName) && Users.Current.CurrentUser.GetAchieved(achievement)))
            {
                while (Interlocked.Exchange(ref balloonShown, 1) == 1) Thread.Sleep(500);
                notifyIcon.Visible = true;
                notifyIcon.ShowBalloonTip(5000, string.Format(Localization.AchievementUnlocked, achievement.Title),
                    Localization.AchievementUnlockedDetails + achievement.Description, ToolTipIcon.Info);
            }
        }

        private void SortAchievements(object sender, RoutedEventArgs e)
        {
            var tag = (((FrameworkElement)e.OriginalSource).Tag ?? string.Empty).ToString();
            AchievementsList.Items.SortDescriptions.Clear();
            if (string.IsNullOrWhiteSpace(tag)) return;
            var descending = tag.EndsWith("_DESCENDING", true, CultureInfo.InvariantCulture);
            if (descending) tag = tag.Substring(0, tag.Length - 11);
            AchievementsList.Items.SortDescriptions.Add(new SortDescription(tag, 
                descending ? ListSortDirection.Descending : ListSortDirection.Ascending));
        }

        #endregion

        #region Compile & Decompile

        private readonly ObservableCollection<List<string>>
            decompileHistory = new ObservableCollection<List<string>>();
        private readonly Dictionary<string, CheckBox> checkBoxes;

        private void ShowCommandLineHelp(object sender, RoutedEventArgs e)
        {
            Process.Start("http://edgefans.tk/edgetool/command-line-arguments");
        }
        private void OpenReference(object sender, MouseButtonEventArgs e)
        {
            Process.Start("http://edgefans.tk/developers/file-formats/" + ((FrameworkElement)sender).Tag);
        }

        private void OnBinaryDragEnter(object sender, DragEventArgs e)
        {
            e.Handled = true;
            if (e.Data.GetDataPresent(DataFormats.FileDrop, true))
            {
                e.Effects = e.AllowedEffects & DragDropEffects.Copy;
                DropTargetHelper.DragEnter(this, e.Data, e.GetPosition(this), e.Effects, Localization.Decompile);
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
            e.Effects = e.Data.GetDataPresent(DataFormats.FileDrop, true)
                ? e.AllowedEffects & DragDropEffects.Copy : DragDropEffects.None;
            DropTargetHelper.Drop(e.Data, e.GetPosition(this), e.Effects);
            if (e.Effects != DragDropEffects.Copy) return;
            var files = e.Data.GetData(DataFormats.FileDrop, true) as string[];
            if (files == null) return;
            var count = ProcessCore(files);
            WarningBox.Text += string.Format(Localization.DecompileFinishedDetails, count);
        }

        private int ProcessCore(IEnumerable<string> allFiles, string directory = null, bool addToHistory = true)
        {
            var files = allFiles.ToList();
            if (addToHistory) decompileHistory.Add(files);
            var count = 0;
            bool? exFormat = null;
            WarningBox.Text = string.Empty;
            foreach (var file in files)
            {
                if (file.EndsWith(".png", true, CultureInfo.InvariantCulture) && !exFormat.HasValue)
                    exFormat = TaskDialog.Show(this, Localization.Ask, Localization.NewEtxConfirmTitle,
                        Localization.NewEtxConfirmDetails, TaskDialogType.YesNoQuestion) == TaskDialogResult.Yes;
                var result = Compiler.Compile(exFormat ?? false, file, directory);
                if (result.Item1 == null)
                {
                    count++;
                    foreach (var entry in result.Item3.Where(entry => checkBoxes[entry.Type].IsChecked == true))
                        try
                        {
                            Process.Start(entry.FileName);
                        }
                        catch (Win32Exception exc)
                        {
                            TaskDialog.Show(this, Localization.Error, Localization.StartDecompiledFileFailed,
                                            exc.Message, TaskDialogType.Error);
                        }
                }
                else TaskDialog.Show(this, Localization.Error, string.Format(Path.GetFileNameWithoutExtension(file),
                    Localization.DecompileFailed), footerText: result.Item1.GetMessage(), type: TaskDialogType.Error);
                if (!string.IsNullOrWhiteSpace(result.Item2))
                    WarningBox.Text += string.Format("{0}{1}{2}{1}", file, Environment.NewLine, result.Item2);
            }
            return count;
        }

        private void DecompileHistory(object sender, RoutedEventArgs e)
        {
            var count = ProcessCore(DecompileHistoryBox.SelectedItems.OfType<List<string>>()
                            .SelectMany(a => a).Distinct(), addToHistory: false);
            WarningBox.Text += string.Format(Localization.DecompileFinishedDetails, count);
        }
        private void ClearHistory(object sender, RoutedEventArgs e)
        {
            decompileHistory.Clear();
        }

        #endregion

        #region EdgeMod

        private void UpdateDescription(object sender, SelectionChangedEventArgs e)
        {
            var edgeMod = EdgeModGrid.SelectedItem as EdgeMod;
            if (edgeMod != null && !string.IsNullOrWhiteSpace(edgeMod.Description))
                DescriptionBlock.Text = edgeMod.Description;
        }

        private void RefreshEdgeMods(object sender = null, RoutedEventArgs e = null)
        {
            var result = Edge.RefreshEdgeMods();
            if (!string.IsNullOrWhiteSpace(result)) TaskDialog.Show(this, Localization.Error,
                                                        Localization.LoadEdgeModsError, result, TaskDialogType.Error);
        }

        private ProgressDialog dialog;
        private long filesCount, currentFileIndex;
        private bool isDirty;

        private void InstallEdgeMods(object sender, EventArgs e)
        {
            if (!Settings.EdgeModLoaded)
            {
                Settings.EdgeModLoaded = true;
                TaskDialog.Show(this, Localization.Information, Localization.EdgeModsFirstInstallHint,
                                type: TaskDialogType.Information);
            }
            dialog = new ProgressDialog
            {
                Description = Localization.InstallEdgeModsPreparing,
                Text = Localization.InstallEdgeModsTitle, WindowTitle = Localization.InstallEdgeModsTitle,
                ShowTimeRemaining = true, UseCompactPathsForDescription = true
            };
            dialog.DoWork += InstallEdgeMods;
            dialog.RunWorkerCompleted += InstallEdgeModsCompleted;
            dialog.ShowDialog(this);
        }

        private void InstallEdgeModsAndRun(object sender, EventArgs e)
        {
            needsRunning = true;
            InstallEdgeMods(sender, e);
        }

        private bool needsRunning;

        private void InstallEdgeModsCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            Dispatcher.Invoke(() =>
            {
                isDirty = false;
                if (!string.IsNullOrWhiteSpace(e.Result.ToString()))
                {
                    DescriptionBlock.Text = e.Result.ToString();
                    TaskDialog.Show(this, Localization.Finished, Localization.InstallEdgeModsFinished,
                                    Localization.InstallEdgeModsFinishedError, TaskDialogType.Information);
                }
                else if (needsRunning) RunGame(sender, e);
                needsRunning = false;
            });
        }

        private void InstallEdgeMods(object sender, DoWorkEventArgs e)
        {
            filesCount = Edge.EdgeMods.Where(edgeMod => edgeMod.Enabled).Sum(edgeMod => edgeMod.FilesCount);
            currentFileIndex = 0;
            e.Result = Edge.Install(UpdateProgress, e);
        }

        private void UpdateProgress(string additionalMessage)
        {
            Dispatcher.Invoke(() => dialog.ReportProgress(filesCount == 0 ? 100
                : (int) (currentFileIndex++ * 100 / filesCount), null, additionalMessage));
        }

        private void CleanUpInstall(object sender, RoutedEventArgs e)
        {
            Edge.CleanUp();
            TaskDialog.Show(this, Localization.Finished, Localization.CleanupFinished,
                            Localization.CleanupFinishedDetails, TaskDialogType.Information);
            isDirty = true;
        }

        private void OnEdgeModDragEnter(object sender, DragEventArgs e)
        {
            e.Handled = true;
            if (e.Data.GetDataPresent(DataFormats.FileDrop, true))
            {
                e.Effects = e.AllowedEffects & DragDropEffects.Copy;
                DropTargetHelper.DragEnter(this, e.Data, e.GetPosition(this), e.Effects,
                                           Localization.InstallEdgeMods.Replace("EdgeMods", "%1"), "EdgeMods");
            }
            else
            {
                e.Effects = DragDropEffects.None;
                DropTargetHelper.DragEnter(this, e.Data, e.GetPosition(this), e.Effects);
            }
        }
        private void OnEdgeModDrop(object sender, DragEventArgs e)
        {
            e.Handled = true;
            e.Effects = e.Data.GetDataPresent(DataFormats.FileDrop, true)
                ? e.AllowedEffects & DragDropEffects.Copy : DragDropEffects.None;
            DropTargetHelper.Drop(e.Data, e.GetPosition(this), e.Effects);
            if (e.Effects != DragDropEffects.Copy) return;
            var files = e.Data.GetData(DataFormats.FileDrop, true) as string[];
            if (files == null) return;
            if (files.Where(file => file.EndsWith(".edgemod", true, CultureInfo.InvariantCulture))
                     .Count(InstallEdgeMod) > 0) RefreshEdgeMods();
        }

        private bool InstallEdgeMod(string file)
        {
            string id = Path.GetFileNameWithoutExtension(file),
                   target = Path.Combine(Edge.ModsDirectory, Path.GetFileName(file));
            if (File.Exists(target) && TaskDialog.Show(this, Localization.Ask,
                string.Format(Localization.FileAlreadyExists, id), Localization.FileAlreadyExistsDetails,
                TaskDialogType.YesNoQuestion) != TaskDialogResult.Yes) return false;
            try
            {
                File.Copy(file, target, true);
                isDirty = true;
                return true;
            }
            catch (Exception exc)
            {
                TaskDialog.Show(this, Localization.Error, string.Format(Localization.InstallEdgeModFailed, id),
                                exc.Message, TaskDialogType.Error);
            }
            return false;
        }

        private void DeleteCurrentEdgeMod(object sender, RoutedEventArgs e)
        {
            var edgeMod = EdgeModGrid.SelectedItem as EdgeMod;
            if (edgeMod == null) return;
            if (!Edge.GetIsDisabled(edgeMod)) isDirty = true;
            File.Delete(edgeMod.FilePath);
            RefreshEdgeMods();
        }

        private void DeleteDisabledEdgeMods(object sender, RoutedEventArgs e)
        {
            foreach (var edgeMod in Edge.EdgeMods.Where(edgeMod => !edgeMod.Enabled)) File.Delete(edgeMod.FilePath);
            RefreshEdgeMods();
        }

        #endregion

        #region Draw Tree

        private void DrawAnimationTree(object sender, RoutedEventArgs e)
        {
            AnimationTreeView.Items.Clear();
            DrawEan(AnimationTreeView.Items, AssetUtil.CrcFullName(AnimationNameBox.Text, "models", false));
        }

        private void DrawModelTree(object sender, RoutedEventArgs e)
        {
            ModelTreeView.Items.Clear();
            DrawEso(ModelTreeView.Items, AssetUtil.CrcFullName(ModelNameBox.Text, "models", false));
        }

        private static void DrawEan(IList parent, string fileName)
        {
            var item = new TreeViewItem { IsExpanded = true };
            parent.Add(item);
            var path = Path.Combine(Edge.ModelsDirectory, fileName + ".ean");
            item.Tag = path;
            if (!File.Exists(path))
            {
                item.Header = fileName + ".ean" + Localization.NotExists;
                item.Foreground = Brushes.Red;
                return;
            }
            var ean = EAN.FromFile(path);
            item.Header = string.Format("{0}.ean ({1}.xml)", fileName, Helper.GetDecompiledFileName(fileName, ean));
            if (!ean.Header.NodeChild.IsZero()) DrawEan(item.Items, ean.Header.NodeChild.ToString());
            if (!ean.Header.NodeSibling.IsZero()) DrawEan(parent, ean.Header.NodeSibling.ToString());
        }

        private static void DrawEso(IList parent, string fileName)
        {
            var item = new TreeViewItem { IsExpanded = true };
            parent.Add(item);
            var path = Path.Combine(Edge.ModelsDirectory, fileName + ".eso");
            item.Tag = path;
            if (!File.Exists(path))
            {
                item.Header = fileName + ".eso" + Localization.NotExists;
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
                item.Header = fileName + ".ema" + Localization.NotExists;
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
                item.Header = fileName + ".etx" + Localization.NotExists;
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

        private void GetAnimationTreeHelp(object sender, RoutedEventArgs e)
        {
            Process.Start("http://edgefans.tk/developers/file-formats/asset/ean/drawing-animation-tree");
        }

        private void ShowFileInExplorer(object sender, RoutedEventArgs e)
        {
            var item = (Equals(Tabs.SelectedItem, DrawModelTreeTab) ? ModelTreeView : AnimationTreeView)
                            .SelectedItem as TreeViewItem;
            if (item != null) ShowInExplorer(item.Tag.ToString());
        }

        private void OnModelDragEnter(object sender, DragEventArgs e)
        {
            e.Handled = true;
            if (e.Data.GetDataPresent(DataFormats.FileDrop, true))
            {
                e.Effects = e.AllowedEffects & DragDropEffects.Copy;
                DropTargetHelper.DragEnter(this, e.Data, e.GetPosition(this), e.Effects, Localization.DrawModelTree);
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
            e.Effects = e.Data.GetDataPresent(DataFormats.FileDrop, true)
                ? e.AllowedEffects & DragDropEffects.Copy : DragDropEffects.None;
            DropTargetHelper.Drop(e.Data, e.GetPosition(this), e.Effects);
            if (e.Effects != DragDropEffects.Copy) return;
            var files = e.Data.GetData(DataFormats.FileDrop, true) as string[];
            if (files == null || files.Length == 0) return;
            using (var stream = File.OpenRead(files[0]))
            {
                var name = new AssetHeader(stream).Name;
                ModelNameBox.Text = name.EndsWith(".rmdl", true, CultureInfo.InvariantCulture)
                    ? name.Remove(name.Length - 5) : Path.GetFileNameWithoutExtension(files[0]);
            }
            DrawModelTree(sender, e);
        }

        private void OnAnimationDragEnter(object sender, DragEventArgs e)
        {
            e.Handled = true;
            if (e.Data.GetDataPresent(DataFormats.FileDrop, true))
            {
                e.Effects = e.AllowedEffects & DragDropEffects.Copy;
                DropTargetHelper.DragEnter(this, e.Data, e.GetPosition(this), e.Effects, Localization.DrawAnimTree);
            }
            else
            {
                e.Effects = DragDropEffects.None;
                DropTargetHelper.DragEnter(this, e.Data, e.GetPosition(this), e.Effects);
            }
        }

        private void OnAnimationDrop(object sender, DragEventArgs e)
        {
            e.Handled = true;
            e.Effects = e.Data.GetDataPresent(DataFormats.FileDrop, true)
                ? e.AllowedEffects & DragDropEffects.Copy : DragDropEffects.None;
            DropTargetHelper.Drop(e.Data, e.GetPosition(this), e.Effects);
            if (e.Effects != DragDropEffects.Copy) return;
            var files = e.Data.GetData(DataFormats.FileDrop, true) as string[];
            if (files == null || files.Length == 0) return;
            using (var stream = File.OpenRead(files[0]))
            {
                var name = new AssetHeader(stream).Name;
                AnimationNameBox.Text = name.EndsWith(".rcha", true, CultureInfo.InvariantCulture)
                    ? name.Remove(name.Length - 5) : Path.GetFileNameWithoutExtension(files[0]);
            }
            DrawAnimationTree(sender, e);
        }

        public static ModelWindow ModelWindow;
        private void ViewModel(object sender, RoutedEventArgs e)
        {
            var item = ModelTreeView.SelectedItem as TreeViewItem;
            if (item == null) return;
            var path = item.Tag.ToString();
            if (!path.EndsWith(".eso", false, CultureInfo.InvariantCulture)) return;
            if (ModelWindow == null) (ModelWindow = new ModelWindow()).Show();
            ModelWindow.DrawChildModels = DrawChildModelsBox.IsChecked == true;
            ModelWindow.DebugMode = EnableDebugModeBox.IsChecked == true;
            ModelWindow.Draw(path);
            ModelWindow.Activate();
        }

        private void ViewAnimation(bool loop = true)
        {
            var item = AnimationTreeView.SelectedItem as TreeViewItem;
            if (item == null) return;
            var path = item.Tag.ToString();
            if (!path.EndsWith(".ean", false, CultureInfo.InvariantCulture)) return;
            if (ModelWindow == null) TaskDialog.Show(this, Localization.Error, Localization.ApplyAnimNoModelTitle,
                                                     Localization.ApplyAnimNoModelDescription, TaskDialogType.Error);
            else 
            {
                ModelWindow.ApplyAnimation(path, loop);
                ModelWindow.Activate();
            }
        }
        private void ViewAnimation(object sender, RoutedEventArgs e)
        {
            ViewAnimation();
        }
        private void ViewAnimationNonLoop(object sender, RoutedEventArgs e)
        {
            ViewAnimation(false);
        }

        #endregion
    }

    public sealed class LevelSorter : IComparer
    {
        public LevelSorter(bool descending)
        {
            this.descending = descending;
        }

        private readonly bool @descending;

        public int Compare(object x, object y)
        {
            var result = ((Level) x).Mapping.CompareTo(((Level) y).Mapping);
            return descending ? -result : result;
        }
    }

    [ValueConversion(typeof(string), typeof(Image))]
    public sealed class AchievementStatusConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var achievement = value as Achievement;
            if (achievement == null || Users.Current.CurrentUser == null)
                return Application.Current.Resources["Disabled"];
            if (Users.Current.CurrentUser.GetAchieved(achievement)) return Application.Current.Resources["Achieved"];
            var result = (Image) Application.Current.Resources["Help"];
            result.Tag = achievement.Help;
            return result;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotSupportedException();
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
            return value.ToString().GetRelativePath(MainWindow.Edge.LevelsDirectory)
                        .RemoveExtension().ToCorrectPath();
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return Path.Combine(MainWindow.Edge.LevelsDirectory, value + ".bin");
        }
    }

    [ValueConversion(typeof(double), typeof(string))]
    public sealed class GlobalPercentTextConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return value != null ? value.ToString() + '%' : Localization.Unknown;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotSupportedException();
        }
    }

    [ValueConversion(typeof(List<string>), typeof(string))]
    public sealed class FilesConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var list = value as List<string>;
            if (list == null || list.Count == 0) return Localization.HistoryListEmpty;
            return (list.Count > 1 ? string.Format(Localization.HistoryList, list[0], list.Count) : list[0]);
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotSupportedException();
        }
    }
}
