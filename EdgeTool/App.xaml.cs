using System.Windows;

namespace Mygod.Edge.Tool
{
    public partial class App
    {
        public static string[] Args;

        private void OnStartup(object sender, StartupEventArgs e)
        {
            Args = e.Args;
        }
    }
}
