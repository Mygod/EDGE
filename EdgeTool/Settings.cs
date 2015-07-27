using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using Mygod.Runtime.Serialization.Json;

namespace Mygod.Edge.Tool
{
    [DataContract] class Settings
    {
        private static readonly string Path = "Settings.json";
        public static readonly Settings
            Instance = JsonSerialization.DeserializeFromFile<Settings>(Path) ?? new Settings();
        private Settings() { }

        public static void Save()
        {
            JsonSerialization.SerializeToFile(Path, Instance);
        }

        [DataMember] public bool EdgeModLoaded;
        [DataMember] public string[] RecentPaths = new string[0];
        [DataMember] public string CurrentPath;

        public void SetCurrentPath(string value)
        {
            RecentPaths = new[] { CurrentPath = value }.Concat(RecentPaths).Distinct().ToArray();
        }
    }
}
