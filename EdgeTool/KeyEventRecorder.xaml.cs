using System;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Windows.Forms;
using Mygod.Windows;
using Mygod.Windows.Input;

namespace Mygod.Edge.Tool
{
    public sealed partial class KeyEventRecorder
    {
        private UserActivityHook hook;

        private void OnKey(bool up, Keys key)
        {
            string name;
            switch (key)
            {
                case Keys.Down:
                case Keys.S:
                case Keys.NumPad2:
                    name = "South";
                    break;
                case Keys.Left:
                case Keys.A:
                case Keys.NumPad4:
                    name = "West";
                    break;
                case Keys.Right:
                case Keys.D:
                case Keys.NumPad6:
                    name = "East";
                    break;
                case Keys.Up:
                case Keys.W:
                case Keys.NumPad8:
                    name = "North";
                    break;
                case Keys.F10:
                    if (up)
                    {
                        OnStop(false);
                        writer = new StringWriter();
                        Show();
                    }
                    return;
                case Keys.F11:
                    if (up) OnStop(true);
                    return;
                case Keys.F12:
                    if (up) OnStop(false);
                    return;
                default:
                    return;
            }
            if (writer == null) return;
            name += up ? "Up" : "Down";
            if (startTime == default(DateTime)) startTime = DateTime.Now;
            if (name == last) return;   // remove duplicated elements
            var time = OffsetBox.Value
                + (int)Math.Round((DateTime.Now - startTime).TotalSeconds * 22 / SpeedBox.Value ?? 1);
            writer.WriteLine("<{0}{1} />", last = name, time > 0 ? " TimeOffset=\"" + time + '"' : string.Empty);
        }

        private void OnKeyDown(object sender, KeyEventArgs e)
        {
            OnKey(false, e.KeyCode);
        }

        private void OnKeyUp(object sender, KeyEventArgs e)
        {
            OnKey(true, e.KeyCode);
        }

        private static KeyEventRecorder instance;
        public static KeyEventRecorder Instance => instance ?? (instance = new KeyEventRecorder());

        private KeyEventRecorder()
        {
            InitializeComponent();
            (hook = new UserActivityHook()).KeyDown += OnKeyDown;
            hook.KeyUp += OnKeyUp;
        }

        private void OnStop(bool save)
        {
            if (writer == null) return;
            if (save)
            {
                var builder = writer.GetStringBuilder();
                if (builder.Length <= 0) return;
                var dir = Path.Combine(CurrentApp.Directory, "Resources\\Recordings");
                Directory.CreateDirectory(dir);
                var path = Path.Combine(dir, DateTime.Now.ToString("yyyyMMddHHmmss") + ".xml");
                File.WriteAllText(path, builder.ToString());
                Process.Start(path);
            }
            writer.Close();
            writer = null;
        }

        private StringWriter writer;

        private DateTime startTime;
        private string last;
        private static bool shuttingDown;

        private void OnClosing(object sender, CancelEventArgs e)
        {
            if (shuttingDown)
            {
                OnStop(false);
                hook.Dispose();
                hook = null;
            }
            else
            {
                e.Cancel = true;
                Hide();
            }
        }

        public static void Shutdown(bool now = false)
        {
            shuttingDown = true;
            if (instance != null && now) instance.Close();
        }
    }
}
