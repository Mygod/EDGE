using System;
using System.Diagnostics;
using System.IO;
using System.Windows.Forms;
using Mygod.Windows;
using Mygod.Windows.Input;

namespace Mygod.Edge.Tool
{
    public sealed partial class KeyEventRecorder
    {
        public KeyEventRecorder()
        {
            InitializeComponent();
            hook.KeyDown += OnKeyDown;
            hook.KeyUp += OnKeyUp;
        }

        private readonly UserActivityHook hook = new UserActivityHook();
        private readonly StringWriter writer = new StringWriter();

        private DateTime startTime;
        private string last;

        private void OnKeyDown(object sender, KeyEventArgs e)
        {
            OnKey(false, e.KeyCode);
        }

        private void OnKeyUp(object sender, KeyEventArgs e)
        {
            OnKey(true, e.KeyCode);
        }

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
                case Keys.F12:
                    if (up) Close();
                    return;
                default:
                    return;
            }
            if (startTime == default(DateTime)) startTime = DateTime.Now;
            name += up ? "Up" : "Down";
            if (name == last) return;   // remove duplicated elements
            var time = OffsetBox.Value
                + (int) Math.Round((DateTime.Now - startTime).TotalSeconds * 22 / SpeedBox.Value ?? 1);
            writer.WriteLine("<{0}{1} />", last = name, time > 0 ? " TimeOffset=\"" + time + '"' : string.Empty);
        }

        private void OnClosed(object sender, EventArgs e)
        {
            hook.Dispose();
            var builder = writer.GetStringBuilder();
            if (builder.Length <= 0) return;
            var dir = Path.Combine(CurrentApp.Directory, "Resources\\Recordings");
            Directory.CreateDirectory(dir);
            var path = Path.Combine(dir, DateTime.Now.ToString("yyyyMMddHHmmss") + ".xml");
            File.WriteAllText(path, builder.ToString());
            writer.Close();
            Process.Start(path);
        }
    }
}
