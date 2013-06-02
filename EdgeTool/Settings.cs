using System.Collections.Generic;
using System.Linq;
using Mygod.IO;

namespace Mygod.Edge.Tool
{
    static class Settings
    {
        static Settings()
        {
            SettingsFile = new IniFile("Settings.ini");
            SettingsSection = new IniSection(SettingsFile, "Settings");
            ModLoadedData = new YesNoData(SettingsSection, "ModLoaded");
            RecentPathsData = new StringListData(SettingsFile, "RecentPaths");
            CurrentPathData = new StringData(RecentPathsData, "Current");
        }

        private static readonly IniFile SettingsFile;
        private static readonly IniSection SettingsSection;
        private static readonly YesNoData ModLoadedData;
        private static readonly StringListData RecentPathsData;
        private static readonly StringData CurrentPathData;

        public static bool ModLoaded { get { return ModLoadedData.Get(); } set { ModLoadedData.Set(value); } }

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
