using System;
using System.Diagnostics;
using System.IO;
using Mygod.Windows;

namespace Mygod.Edge.Tool
{
    public sealed partial class KeyEventRecorder
    {
        public KeyEventRecorder(App app)
        {
            InitializeComponent();
            (this.app = app).OnStop += OnStop;
            app.OnKeyEvent += OnKeyEvent;
        }

        private void OnStop(object sender, bool save)
        {
            if (save)
            {
                var builder = writer.GetStringBuilder();
                if (builder.Length <= 0) return;
                var dir = Path.Combine(CurrentApp.Directory, "Resources\\Recordings");
                Directory.CreateDirectory(dir);
                var path = Path.Combine(dir, DateTime.Now.ToString("yyyyMMddHHmmss") + ".xml");
                File.WriteAllText(path, builder.ToString());
                writer.Close();
                Process.Start(path);
            }
            Close();
        }

        private void OnKeyEvent(object sender, string name)
        {
            if (startTime == default(DateTime)) startTime = DateTime.Now;
            if (name == last) return;   // remove duplicated elements
            var time = OffsetBox.Value
                + (int)Math.Round((DateTime.Now - startTime).TotalSeconds * 22 / SpeedBox.Value ?? 1);
            writer.WriteLine("<{0}{1} />", last = name, time > 0 ? " TimeOffset=\"" + time + '"' : string.Empty);
        }

        private readonly App app;
        private readonly StringWriter writer = new StringWriter();

        private DateTime startTime;
        private string last;

        private void OnClosed(object sender, EventArgs e)
        {
            app.OnKeyEvent -= OnKeyEvent;
            app.OnStop -= OnStop;
        }
    }
}
