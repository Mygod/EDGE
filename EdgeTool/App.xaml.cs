using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Threading;
using Mygod.Windows;
using Mygod.Windows.Dialogs;

namespace Mygod.Edge.Tool
{
    public partial class App
    {
        public static readonly List<string> EdgeMods = new List<string>();
        public static string GamePath;

        private void OnStartup(object sender, StartupEventArgs e)
        {
            Environment.CurrentDirectory = CurrentApp.Directory;
            AppDomain.CurrentDomain.UnhandledException += OnError;
            string directory = null;
            bool exFormat = false, previousDir = false;
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
                else if (arg.StartsWith("-forceStart", true, CultureInfo.InvariantCulture)) forceStart = true;
                else if (arg.StartsWith("-forceClose", true, CultureInfo.InvariantCulture)) forceStart = false;
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
                    if (!string.IsNullOrWhiteSpace(result.Item2)) Console.WriteLine("警告：{0}{1}", Environment.NewLine, result.Item2);
                    if (result.Item1 == null) Console.WriteLine("(反)编译成功。");
                }
                if (!forceStart.HasValue && GamePath == null && EdgeMods.Count == 0) Shutdown();
            }
            if (forceStart == false) Shutdown();
        }

        private static void OnError(object sender, UnhandledExceptionEventArgs e)
        {
            var exc = e.ExceptionObject as Exception;
            if (exc != null) MessageBox.Show(string.Format(
                "你这个混账东西干了什么？赶紧向 Mygod工作室™ 报告错误信息和你的不当行径。{0}错误信息：{0}{1}",
                Environment.NewLine, exc.GetMessage()), "哇靠崩溃啦！", MessageBoxButton.OK, MessageBoxImage.Error);
        }

        private void OnError(object sender, DispatcherUnhandledExceptionEventArgs e)
        {
            TaskDialog.Show(mainInstruction: "哇靠崩溃啦！", footerText: e.Exception.GetMessage(), type: TaskDialogType.Error,
                            content: "你这个混账东西干了什么？赶紧向 Mygod工作室™ 报告错误信息和你的不当行径。");
            e.Handled = true;
            Shutdown();
        }

        private void ShowHelp(object sender, MouseButtonEventArgs e)
        {
            var tag = (string)((Image)sender).Tag;
            if (!string.IsNullOrWhiteSpace(tag)) Process.Start(tag);
        }
    }
}
