using System.Collections.Generic;
using System.Linq;
using Mygod.IO;

namespace Mygod.Edge.Tool
{
    static class Settings
    {
        static Settings()
        {
            var settingsFile = new IniFile("Settings.ini");
            EdgeModLoadedData = new YesNoData(settingsFile["Settings"], "EdgeModLoaded");
            CurrentPathData = new StringData(RecentPathsData = new StringListData(settingsFile, "RecentPaths"), "Current");
        }

        private static readonly YesNoData EdgeModLoadedData;
        private static readonly StringListData RecentPathsData;
        private static readonly StringData CurrentPathData;

        public static bool EdgeModLoaded { get { return EdgeModLoadedData.Get(); } set { EdgeModLoadedData.Set(value); } }

        public static List<string> RecentPaths { get { return RecentPathsData.Get(); } private set { RecentPathsData.Set(value); } }
        public static string CurrentPath
        {
            get { return CurrentPathData.Get(); }
            set
            {
                CurrentPathData.Set(value);
                var copy = RecentPaths.ToList();
                copy.Insert(0, value);
                RecentPaths = copy.Distinct().ToList();
            }
        }
    }
}
