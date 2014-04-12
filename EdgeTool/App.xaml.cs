using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Reflection;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Threading;
using Microsoft.WindowsAPICodePack.Dialogs;
using Mygod.Windows;
using MessageBox = System.Windows.MessageBox;

namespace Mygod.Edge.Tool
{
    public sealed partial class App
    {
        static App()
        {
            AppDomain.CurrentDomain.SetData("PRIVATE_BINPATH", "Resources\\Libraries");
            var m = typeof(AppDomainSetup).GetMethod("UpdateContextProperty",
                                                     BindingFlags.NonPublic | BindingFlags.Static);
            var fusion = typeof(AppDomain).GetMethod("GetFusionContext",
                                                     BindingFlags.NonPublic | BindingFlags.Instance);
            m.Invoke(null, new[] { fusion.Invoke(AppDomain.CurrentDomain, null), "PRIVATE_BINPATH",
                                   "Resources\\Libraries" });
        }

        public static readonly List<string> EdgeMods = new List<string>();
        public static string GamePath;

        private CommonOpenFileDialog fileSelector;

        private void OnStartup(object sender, StartupEventArgs e)
        {
            Environment.CurrentDirectory = CurrentApp.Directory;
            AppDomain.CurrentDomain.UnhandledException += OnError;
            fileSelector = new CommonOpenFileDialog
                { Title = "请选择要(反)编译的文件", Multiselect = true, AddToMostRecentlyUsedList = false };
            string directory = null;
            bool exFormat = false, previousDir = false, shouldNotClose = false, windowShown = false;
            bool? forceStart = null;
            var files = new List<string>();
            foreach (var arg in e.Args)
            {
                if (previousDir)
                {
                    directory = arg;
                    previousDir = false;
                }
                else if (arg.StartsWith("-new", true, CultureInfo.InvariantCulture)) exFormat = true;
                else if (arg.StartsWith("-old", true, CultureInfo.InvariantCulture)) exFormat = false;
                else if (arg.StartsWith("-dir", true, CultureInfo.InvariantCulture)) previousDir = true;
                else if (arg.StartsWith("-fs", true, CultureInfo.InvariantCulture)) forceStart = true;
                else if (arg.StartsWith("-fc", true, CultureInfo.InvariantCulture)) forceStart = false;
                else if (arg.StartsWith("-c4u", true, CultureInfo.InvariantCulture))
                {
                    Tool.MainWindow.CheckForUpdates();
                    shouldNotClose = true;
                }
                else if (arg.StartsWith("-cml", true, CultureInfo.InvariantCulture))
                {
                    Tool.MainWindow.ConvertMobiLevel();
                    shouldNotClose = true;
                }
                else if (arg.StartsWith("-rke", true, CultureInfo.InvariantCulture))
                {
                    KeyEventRecorder.Instance.Show();
                    windowShown = shouldNotClose = true;
                }
                else if (arg.StartsWith("-c", true, CultureInfo.InvariantCulture)
                         && fileSelector.ShowDialog() == CommonFileDialogResult.Ok)
                    files.AddRange(fileSelector.FileNames);
                else if (arg.StartsWith("-lg", true, CultureInfo.InvariantCulture))
                {
                    var path = GamePath ?? Settings.CurrentPath;
                    Process.Start(new ProcessStartInfo(path) { WorkingDirectory = Path.GetDirectoryName(path) });
                    shouldNotClose = true;
                }
                else switch (Path.GetExtension(arg).ToLower())
                {
                    case "exe": GamePath = arg; break;
                    case "edgemod": EdgeMods.Add(arg); break;
                    default: files.Add(arg); break;
                }
            }
            if (files.Count > 0)
            {
                foreach (var file in files)
                {
                    Console.WriteLine("------ (反)编译 {0} ------", file);
                    var result = Compiler.Compile(exFormat, file, directory);
                    if (result.Item1 != null) Console.WriteLine("错误：" + result.Item1.GetMessage());
                    if (!string.IsNullOrWhiteSpace(result.Item2))
                        Console.WriteLine("警告：{0}{1}", Environment.NewLine, result.Item2);
                    if (result.Item1 == null) Console.WriteLine("(反)编译成功。");
                }
                shouldNotClose = true;
            }
            if (forceStart == false
                || shouldNotClose && !forceStart.HasValue && GamePath == null && EdgeMods.Count == 0)
                if (windowShown)
                {
                    KeyEventRecorder.Shutdown();
                    return;
                }
                else Shutdown();
            (MainWindow = new MainWindow()).Show();
        }

        private static void OnError(object sender, UnhandledExceptionEventArgs e)
        {
            var exc = e.ExceptionObject as Exception;
            if (exc != null) MessageBox.Show(string.Format(
                "你这个混账东西干了什么？赶紧向 Mygod 工作室™ 报告错误信息和你的不当行径。{0}错误信息：{0}{1}",
                Environment.NewLine, exc.GetMessage()), "哇靠崩溃啦！", MessageBoxButton.OK, MessageBoxImage.Error);
        }

        private void OnError(object sender, DispatcherUnhandledExceptionEventArgs e)
        {
            TaskDialog.Show(null, "严重错误", "哇靠崩溃啦！", "你这个混账东西干了什么？赶紧向 Mygod 工作室™ 报告错误信息" +
                            "和你的不当行径。", TaskDialogType.Error, e.Exception.GetMessage());
            e.Handled = true;
            Shutdown();
        }

        private void ShowHelp(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            var tag = (string)((Image)sender).Tag;
            if (!string.IsNullOrWhiteSpace(tag)) Process.Start(tag);
        }
    }
}
