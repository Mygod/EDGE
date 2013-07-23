using System;
using System.Windows;
using System.Windows.Threading;
using Mygod.Windows;
using Mygod.Windows.Dialogs;

namespace Mygod.Edge.Tool
{
    public partial class App
    {
        public static string[] Args;

        private void OnStartup(object sender, StartupEventArgs e)
        {
            Environment.CurrentDirectory = CurrentApp.Directory;
            AppDomain.CurrentDomain.UnhandledException += OnError;
            Args = e.Args;
        }

        private void OnError(object sender, UnhandledExceptionEventArgs e)
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
    }
}
