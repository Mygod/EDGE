using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Shell;
using System.Xml.XPath;
using Mygod.Edge.Tool.LibTwoTribes;
using Mygod.Edge.Tool.LibTwoTribes.Util;
using Microsoft.WindowsAPICodePack.Dialogs;
using Microsoft.WindowsAPICodePack.Dialogs.Controls;
using Mygod.Net;
using Mygod.Windows;
using Mygod.Xml.Linq;
using MouseButtons = System.Windows.Forms.MouseButtons;
using MouseEventArgs = System.Windows.Forms.MouseEventArgs;
using NotifyIcon = System.Windows.Forms.NotifyIcon;
using ToolTipIcon = System.Windows.Forms.ToolTipIcon;

#pragma warning disable 665

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
            GamePath.ItemsSource = Settings.Instance.RecentPaths;
            GamePath.Text = Settings.Instance.CurrentPath;
            foreach (var name in ModelNames) ModelNameBox.Items.Add(name);
            foreach (var name in AnimationNames) AnimationNameBox.Items.Add(name);
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

        private static readonly string[]
            ModelNames =
            {
                "bumper_bottom", "bumper_right", "bumper_roof", "cam_entry", "cam_entry_target", "cube_finish_shadow",
                "cube_idle", "cube_idle_shadow", "cubeanimation_d_front", "cubeanimation_e_middle",
                "cubeanimation_full_d", "cubeanimation_full_e", "cubeanimation_full_g", "cubeanimation_full_last_e",
                "cubeanimation_g_hook", "cubeanimation_last_e_bottom", "cubeanimation_shadow", "falling_platform",
                "finish", "holoswitch", "menu_background", "menu_background_shadow", "menu_background_skybox",
                "platform", "platform_active", "platform_active_small", "platform_edges_active",
                "platform_edges_active_small", "platform_small", "prism", "prism_finish", "prism_shadow",
                "shrinker_tobig", "shrinker_tomini", "skybox_1", "skybox_2", "skybox_3", "skybox_4", "switch",
                "switch_done", "switch_ghost", "switch_ghost_done"
            },
            AnimationNames =
            {
                "bumper_bottom", "bumper_right", "bumper_roof", "cam_entry_target__loop", "cam_entry__loop",
                "cubeanimation_d_front", "cubeanimation_d_front_shadow", "cubeanimation_e_middle",
                "cubeanimation_e_middle_shadow", "cubeanimation_full_d", "cubeanimation_full_d_shadow",
                "cubeanimation_full_e", "cubeanimation_full_e_shadow", "cubeanimation_full_g",
                "cubeanimation_full_g_shadow", "cubeanimation_full_last_e", "cubeanimation_full_last_e_shadow",
                "cubeanimation_g_hook", "cubeanimation_g_hook_shadow", "cubeanimation_last_e_bottom",
                "cubeanimation_last_e_bottom_shadow", "cube_climbdown", "cube_climbdown_shadow", "cube_climbleft",
                "cube_climbleft_shadow", "cube_climbright", "cube_climbright_shadow", "cube_climbup",
                "cube_climbup_shadow", "cube_finish", "cube_finish_shadow", "cube_idle_shadow", "cube_movedown",
                "cube_movedown_shadow", "cube_moveleft", "cube_moveleft_shadow", "cube_moveright",
                "cube_moveright_shadow", "cube_moveup", "cube_moveup_shadow", "menu_background",
                "menu_background_shadow", "prism", "prism_finish", "prism_shadow", "shrinker_tobig", "shrinker_tomini"
            },
            MobileStandardLevels =
            {
                "level309", "level300", "level310", "level36", "level201", "level37", "level311", "level38", "level59",
                "level301", "level40", "level43", "level206", "level312", "level44", "level42", "level315", "level45",
                "level46", "level60", "level307", "level48", "level202", "level305", "level41", "level303", "level49",
                "level302", "level204", "level304", "level52", "level308", "level50", "level306", "level51",
                "level313", "level47", "level314", "level53", "level54", "level317", "level319", "level318",
                "level222", "level221", "level220", "level400", "level401"
            },
            MobileBonusLevels =
            {
                "hangout_815", "hammer_810", "compost_805", "babylonian_817", "swirl_801", "density_806", "magic_811",
                "cubism_808", "mystic_813", "indiana_804", "chunk_816", "goliath_812", "fourohfour_818", "gears_802",
                "fireworks_800", "zias_850", "winners_820"
            },
            MobileStandardLevelSounds =
            {
                "1st_contact", "training", "playground", "pushing_stars", "bump", "city_rythm", "speedrun",
                "milky_way", "8bit", "metro", "mini_me", "vertex", "equalizer", "peripherique", "time_machine",
                "mind_the_gap", "edge_code", "edge_time", "chase", "landing", "chess", "switch_keep", "mecanic",
                "higher", "squadron", "metronome", "orion", "try_again", "hypnozone", "beat", "star_castle", "sticker",
                "sync_the_wall", "snap", "braintonic", "2nd_contact", "jungle_fever", "speedrun_2", "edge_master",
                "cube_invaders", "starfield", "bonus", "extra_cube", "sliced", "earthquake", "vertigo", "push_me",
                "perfect_cell"
            },
            MobileBonusLevelSounds =
            {
                "hangout", "hammer", "compost", "babylonian", "swirl", "density", "magic", "cubism", "mystic",
                "indiana", "chunk", "goliath", "404", "gears", "fireworks", "zias", "winners"
            },
            MobileMusics =
            {
                "00_Title.mp3", "01_Eternity.mp3", "02_Quiet.mp3", "03_Pad.mp3", null, "05_Tec.mp3", "06_Kakkoi.mp3",
                "07_Dark.mp3", "08_Squadron.mp3", "09_8bits.mp3", "10_Pixel.mp3", "11_Jupiter.mp3", "12_Shame.mp3",
                "13_Debrief.mp3", "14_Space.mp3", "15_Voyage_geometrique.mp3", "16_Mzone.mp3", "17_R2.mp3",
                "18_Mystery_cube.mp3", "19_Duty.mp3", "20_perfect_cell_you_are_perfect_1.mp3", "21_fun.mp3",
                "22_LOL.mp3", "23_lostway.mp3", "24_wall_street.mp3"
            },
            MobileSounds =
            {
                "bumper", "enlarger", "finish", "gameover", "hologram_loop", "hologram_on-off", "menu_back",
                "menu_confirm", "menu_confirm_final", "menu_move", "pf", "pff_amorce", "pff_fall", "player_fall",
                "player_step_0", "player_step_1", "player_step_2", "player_step_3", "player_step_4",
                "player_step_mini_0", "player_step_mini_1", "player_step_mini_2", "player_step_mini_3",
                "player_step_mini_4", "prism", "shrinker", "switch"
            };

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

        private readonly CommonOpenFileDialog
            exeSelector = new CommonOpenFileDialog
            {
                Title = Localization.GameSelectorTitle, DefaultFileName = "edge.exe",
                Filters = { new CommonFileDialogFilter(Localization.ExecutableFilter, "*.exe") }
            },
            outputSelector = new CommonOpenFileDialog
            {
                Title = Localization.OutputPathSelectorTitle, IsFolderPicker = true, AddToMostRecentlyUsedList = false
            },
            projectSelector = new CommonOpenFileDialog
            {
                Title = Localization.ProjectPathSelectorTitle,
                Filters = { new CommonFileDialogFilter(Localization.ProjectFilter, "*.xml") }
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
                searcher?.Abort();
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
                Settings.Instance.SetCurrentPath(GamePath.Text);
                Settings.Save();
                GamePath.ItemsSource = Settings.Instance.RecentPaths;
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
                    Trace.WriteLine($"{Path.GetFileNameWithoutExtension(file)} error: {exc.Message}");
                }
        }

        private void RunGame(object sender = null, EventArgs e = null)
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

        private static readonly Lazy<Level> PlaceholderLevel = new Lazy<Level>(() =>
            new Level("PLACEHOLDER", new Size3D(1, 1, 1)) { ModelTheme = 99, SpawnPoint = new Point3D16(0, 0, 1) });
        private string sfxPath, configDir, ffmpeg, outputDir, orgDir;
        private bool ios;
        private string SfxPath
        {
            get
            {
                if (sfxPath == null)
                {
                    sfxPath = Helper.GetRandomDirectory();
                    Compiler.Compile(false, Edge.AudioDirectory, sfxPath);
                }
                return sfxPath;
            }
        }
        private Regex keepRegex;
        private static readonly Regex VersionMatcher = new Regex("(?<=<integer tag=\"version\">)\\d+(?=<\\/integer>)");
        private bool KeepRegexCheck(string name)
        {
            return keepRegex != null && keepRegex.IsMatch(name);
        }
        private void CompileMobileVersion(object sender, RoutedEventArgs e)
        {
            if (projectSelector.ShowDialog(this) != CommonFileDialogResult.Ok) return;
            dialog?.Dispose();
            dialog = new TaskDialog
            {
                ProgressBar = new TaskDialogProgressBar(), StandardButtons = TaskDialogStandardButtons.Cancel,
                OwnerWindowHandle = WindowHandle, InstructionText = Localization.CompileMobileVersionTitle,
                Caption = Localization.CompileMobileVersionTitle, Text = Localization.Preparing
            };
            cancelled = false;
            new Thread(CompileMobileVersion).Start(projectSelector.FileName);
            var result = dialog.Show();
            if (result == TaskDialogResult.Cancel || result == TaskDialogResult.Close) cancelled = true;
        }

        private static void Start(string path, string args = null)
        {
            Process.Start(new ProcessStartInfo(path, args)
            {
                UseShellExecute = false, CreateNoWindow = true, WorkingDirectory = Path.GetDirectoryName(path)
            }).WaitForExit();
        }
        private void Ffmpeg(string input, string output, bool caf = true)
        {
            Start(ffmpeg, string.Format("-i \"{0}\"{2} \"{1}\" -y", input, output,
                                        ios ? caf ? " -acodec adpcm_ima_qt" : string.Empty : " -f ogg"));
        }
        private string FallbackPath(string path, bool isSfx = false)
        {
            var result = Path.Combine(configDir, path);
            if (File.Exists(result)) return result;
            result = Path.Combine(isSfx ? SfxPath : Edge.GameDirectory, path);
            return File.Exists(result) ? result : null;
        }

        private void UpdateProgress(int value = -1, int maximum = -1)
        {
            Dispatcher.Invoke(() =>
            {
                if (value < 0) TaskbarItemInfo.ProgressState = TaskbarItemProgressState.Indeterminate;
                else
                {
                    if (maximum >= 0) dialog.ProgressBar.Maximum = maximum;
                    if (value > dialog.ProgressBar.Maximum) value = dialog.ProgressBar.Maximum;
                    dialog.ProgressBar.Value = value;
                    TaskbarItemInfo.ProgressState = TaskbarItemProgressState.Normal;
                    TaskbarItemInfo.ProgressValue = (double) value / dialog.ProgressBar.Maximum;
                }
            });
        }
        private void GenerateMobileLevelFiles(int offset, int count, IReadOnlyList<MappingLevel> levelPack,
                                              IList<string> levelList, IList<string> levelSoundList, bool easy = false)
        {
            for (var i = 0; i < count; ++i)
            {
                if (cancelled) return;
                string name;
                UpdateProgress(offset + i);
                dialog.Text = name = levelList[i] + ".bin";
                try
                {
                    string target = Path.Combine(outputDir, name), source = levelPack[i].FileName == null ? null
                        : FallbackPath(Path.Combine("levels", name = levelPack[i].FileName + ".bin"));
                    if (KeepRegexCheck(name)) File.Copy(Path.Combine(orgDir, name), target, true);
                    else
                    {
                        if (source == null) PlaceholderLevel.Value.EasyCompile(target);
                        else if (easy) File.Copy(source, target, true);
                        else
                        {
                            var level = Level.CreateFromCompiled(source);
                            level.SPlusTime *= 100;
                            level.STime *= 100;
                            level.ATime *= 100;
                            level.BTime *= 100;
                            level.CTime *= 100;
                            level.EasyCompile(target);
                        }
                    }
                    dialog.Text = name = levelSoundList[i] + ".caf";
                    if (KeepRegexCheck(name)) File.Copy(Path.Combine(orgDir, name), target, true);
                    else
                    {
                        source = levelPack[i].NameSfx == null ? null
                            : FallbackPath(Path.Combine("sfx", "levelsfx_" + levelPack[i].NameSfx + ".wav"), true);
                        target = Path.Combine(outputDir, name);
                        if (source != null) Ffmpeg(source, target);
                        else File.WriteAllBytes(target, CurrentApp.ReadResourceBytes("Resources/placeholder.caf"));
                    }
                }
                catch (Exception exc)
                {
                    throw new Exception(name, exc);
                }
            }
        }

        private void CloseDialog()
        {
            dialog.Text = Localization.Done;
            if (!cancelled) dialog.Close();
            try
            {
                Dispatcher.Invoke(() => TaskbarItemInfo.ProgressState = TaskbarItemProgressState.None);
            }
            catch (TaskCanceledException) { }
        }
        private void CompileMobileVersion(object arg)
        {
            try
            {
                configDir = Path.GetDirectoryName(arg.ToString());
                orgDir = Path.Combine(configDir, "org");
                ffmpeg = Path.Combine(configDir, "ffmpeg.exe");
                var root = XHelper.Load(arg.ToString()).Root;
                outputDir = Path.Combine(configDir, (ios = root.GetAttributeValue("preset") == "ios")
                                                         ? @"Payload\EDGE Epic.app" : @"src\assets");
                var regex = root.GetAttributeValue("keep");
                keepRegex = regex == null ? null : new Regex(regex, RegexOptions.Compiled);
                List<MappingLevel>
                    levelPackA = new List<MappingLevel>(root.XPathSelectElements("levelpackA/level").Take(48)
                        .Select((c, k) => new MappingLevel(LevelType.Standard, k, c))),
                    levelPackB = new List<MappingLevel>(root.XPathSelectElements("levelpackB/level").Take(17)
                        .Select((c, k) => new MappingLevel(LevelType.Bonus, k, c)));
                while (levelPackA.Count < 48) levelPackA.Add(new MappingLevel(LevelType.Standard, levelPackA.Count));
                while (levelPackB.Count < 17) levelPackB.Add(new MappingLevel(LevelType.Bonus, levelPackB.Count));
                sfxPath = null;
                var sprs = Directory.EnumerateFiles(Path.Combine(Edge.GameDirectory, "sprites"), "*.spr")
                                    .Select(Path.GetFileName).ToList();
                if (cancelled) return;
                UpdateProgress(0, 92 + MobileSounds.Length + sprs.Count + (ios ? 1 : 0));
                GenerateMobileLevelFiles(0, 48, levelPackA, MobileStandardLevels, MobileStandardLevelSounds);
                if (cancelled) return;
                GenerateMobileLevelFiles(48, 17, levelPackB, MobileBonusLevels, MobileBonusLevelSounds, true);
                if (cancelled) return;
                UpdateProgress(65);
                dialog.Text = "cos.bin";
                File.Copy(KeepRegexCheck("cos.bin") ? Path.Combine(orgDir, "cos.bin") : FallbackPath("cos.bin"),
                          Path.Combine(outputDir, "cos.bin"), true);
                if (cancelled) return;
                UpdateProgress(66);
                dialog.Text = "font.bin";
                File.Copy(KeepRegexCheck("font.bin") ? Path.Combine(orgDir, "font.bin") : FallbackPath("font.bin"),
                          Path.Combine(outputDir, "font.bin"), true);
                int i;
                for (i = 0; i <= 24; ++i)
                {
                    if (MobileMusics[i] == null) continue;
                    if (cancelled) return;
                    UpdateProgress(67 + i);
                    dialog.Text = "font.bin";
                    string source = KeepRegexCheck(MobileMusics[i]) ? Path.Combine(orgDir, MobileMusics[i])
                                                 : FallbackPath(Path.Combine("music", Level.Musics[i] + ".ogg")),
                           target = Path.Combine(outputDir, MobileMusics[i]);
                    if (ios) Ffmpeg(source, target, false);
                    else File.Copy(source, target, true);
                }
                i = 91;
                foreach (var sound in MobileSounds)
                {
                    if (cancelled) return;
                    string name = sound + ".caf", target = Path.Combine(outputDir, name);
                    UpdateProgress(++i);
                    dialog.Text = name;
                    if (KeepRegexCheck(name)) File.Copy(Path.Combine(orgDir, name), target, true);
                    else Ffmpeg(FallbackPath(Path.Combine("sfx", sound + ".wav"), true), target);
                }
                foreach (var name in sprs)
                {
                    if (cancelled) return;
                    UpdateProgress(++i);
                    dialog.Text = name;
                    File.Copy(KeepRegexCheck(name) ? Path.Combine(orgDir, name)
                                  : FallbackPath(Path.Combine("sprites", name)), Path.Combine(outputDir, name), true);
                }
                if (cancelled) return;
                if (ios)
                {
                    UpdateProgress(++i);
                    dialog.Text = "iTunesMetadata.plist";
                    var target = Path.Combine(configDir, "iTunesMetadata.plist");
                    File.WriteAllText(target, VersionMatcher.Replace(File.ReadAllText(target),
                                      m => (int.Parse(m.Value) + 1).ToString(CultureInfo.InvariantCulture)));
                }
                if (cancelled) return;
                UpdateProgress(++i);
                dialog.Text = Localization.AlmostThere;
                Start(Path.Combine(configDir, "compile.bat"));
            }
            catch (Exception exc)
            {
                Dispatcher.Invoke(() => TaskDialog.Show(this, Localization.Error,
                    Localization.CompileMobileVersionFailed, footerText: exc.GetMessage(), type: TaskDialogType.Error));
            }
            finally
            {
                CloseDialog();
                if (sfxPath != null)
                {
                    try
                    {
                        Directory.Delete(sfxPath, true);
                    }
                    catch { }
                    sfxPath = null;
                }
            }
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
            Process.Start("https://mygod.tk/misc/edgefans-archive/edgefans.tk/developers.html");
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
            Process.Start
                ("https://mygod.tk/misc/edgefans-archive/edgefans.tk/developers/file-formats/mapping-xml.html");
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
            Process.Start("https://mygod.tk/misc/edgefans-archive/edgefans.tk/edgetool/command-line-arguments.html");
        }
        private void OpenReference(object sender, MouseButtonEventArgs e)
        {
            Process.Start("https://mygod.tk/misc/edgefans-archive/edgefans.tk/developers/file-formats/" +
                ((FrameworkElement)sender).Tag + ".html");
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
            if (!string.IsNullOrWhiteSpace(edgeMod?.Description)) DescriptionBlock.Text = edgeMod.Description;
        }

        private void RefreshEdgeMods(object sender = null, RoutedEventArgs e = null)
        {
            var result = Edge.RefreshEdgeMods();
            if (!string.IsNullOrWhiteSpace(result)) TaskDialog.Show(this, Localization.Error,
                                                        Localization.LoadEdgeModsError, result, TaskDialogType.Error);
        }

        private TaskDialog dialog;
        private int currentFileIndex;
        private bool isDirty, cancelled, needsRunning;

        private void InstallEdgeMods(object sender, EventArgs e)
        {
            if (!Settings.Instance.EdgeModLoaded)
            {
                Settings.Instance.EdgeModLoaded = true;
                Settings.Save();
                TaskDialog.Show(this, Localization.Information, Localization.EdgeModsFirstInstallHint,
                                type: TaskDialogType.Information);
            }
            dialog?.Dispose();
            dialog = new TaskDialog
            {
                ProgressBar = new TaskDialogProgressBar(), StandardButtons = TaskDialogStandardButtons.Cancel,
                OwnerWindowHandle = WindowHandle, InstructionText = Localization.InstallEdgeModsTitle,
                Caption = Localization.InstallEdgeModsTitle, Text = Localization.Preparing,
            };
            UpdateProgress();
            cancelled = false;
            new Thread(InstallEdgeMods).Start();
            var result = dialog.Show();
            if (result == TaskDialogResult.Cancel || result == TaskDialogResult.Close) cancelled = true;
        }

        private void InstallEdgeModsAndRun(object sender, EventArgs e)
        {
            needsRunning = true;
            InstallEdgeMods(sender, e);
        }

        private void InstallEdgeMods()
        {
            currentFileIndex = 0;
            UpdateProgress(0, Edge.EdgeMods.Where(edgeMod => edgeMod.Enabled).Sum(edgeMod => edgeMod.FilesCount));
            var result = Edge.Install(additionalMessage =>
            {
                UpdateProgress(++currentFileIndex);
                dialog.Text = additionalMessage;
            }, ref cancelled);
            CloseDialog();
            Dispatcher.Invoke(() =>
            {
                isDirty = false;
                if (!string.IsNullOrWhiteSpace(result))
                {
                    DescriptionBlock.Text = result;
                    TaskDialog.Show(this, Localization.Finished, Localization.InstallEdgeModsFinished,
                                    Localization.InstallEdgeModsFinishedError, TaskDialogType.Information);
                }
                else if (needsRunning) RunGame();
                needsRunning = false;
            });
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
            if (files?.Where(file => file.EndsWith(".edgemod", true, CultureInfo.InvariantCulture))
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
            item.Header = $"{fileName}.ean ({Helper.GetDecompiledFileName(fileName, ean)}.xml)";
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
            item.Header = $"{fileName}.eso ({Helper.GetDecompiledFileName(fileName, eso)}.xml)";
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
            item.Header = $"{fileName}.ema ({Helper.GetDecompiledFileName(fileName, ema)}.xml)";
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
            item.Header = $"{fileName}.etx ({etx.AssetHeader.Name}.png)";
        }

        private void GetModelTreeHelp(object sender, RoutedEventArgs e)
        {
            Process.Start("https://mygod.tk/misc/edgefans-archive/edgefans.tk/developers/file-formats/asset/" +
                          "drawing-model-tree.html");
        }

        private void GetAnimationTreeHelp(object sender, RoutedEventArgs e)
        {
            Process.Start("https://mygod.tk/misc/edgefans-archive/edgefans.tk/developers/file-formats/asset/ean/" +
                          "drawing-animation-tree.html");
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
            return $"{seconds / 60}'{seconds % 60:00}\"";
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
