using System.Collections.Generic;
using System.Runtime.Serialization;
using Mygod.Runtime.Serialization.Json;

namespace Mygod.Edge.Tool
{
    [DataContract]
    class Settings
    {
        private static readonly string Path = "Settings.json";
        public static readonly Settings Instance = JsonSerialization.DeserializeFromFile<Settings>(Path);

        public static void Save()
        {
            JsonSerialization.SerializeToFile(Path, Instance);
        }

        [DataMember]
        public bool EdgeModLoaded;
        [DataMember]
        public List<string> RecentPaths = new List<string>();
        [DataMember]
        public string CurrentPath = "Current";
    }
}
