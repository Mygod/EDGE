using System;
using System.Collections.ObjectModel;
using System.IO;
using System.Xml.Linq;
using Mygod.Xml.Linq;

namespace Mygod.Edge.Tool
{
    public sealed class MappingLevel : IComparable, IComparable<MappingLevel>
    {
        public MappingLevel(LevelType type, int index, string fileName = null, int leaderboardID = 0,
                            string nameSfx = null)
        {
            Type = type;
            Index = index;
            FileName = fileName.ToCorrectPath();
            LeaderboardID = leaderboardID;
            NameSfx = nameSfx;
        }

        public MappingLevel(LevelType type, int index, XElement element) : this(type, index,
            element.GetAttributeValue("filename"), element.GetAttributeValueWithDefault<int>("leaderboard_id"),
            element.GetAttributeValue("name_sfx")) { }

        public LevelType Type;
        public readonly string FileName, NameSfx;
        public readonly int Index, LeaderboardID;

        public int CompareTo(MappingLevel other)
        {
            if (Type == LevelType.None) return other.Type == LevelType.None ? 0 : 1;
            if (other.Type == LevelType.None) return -1;
            var i = Type.CompareTo(other.Type);
            return i == 0 ? Index.CompareTo(other.Index) : i;
        }

        public int CompareTo(object obj)
        {
            return CompareTo(obj as MappingLevel);
        }

        public override string ToString()
        {
            if (Type == LevelType.None) return string.Empty;
            return (Type == LevelType.Standard ? "Normal" : Type.ToString()) + " #" + Index;
        }

        public XElement GetXElement()
        {
            var result = new XElement("level");
            result.SetAttributeValueWithDefault("filename", FileName);
            result.SetAttributeValueWithDefault("leaderboard_id", LeaderboardID);
            result.SetAttributeValueWithDefault("name_sfx", NameSfx);
            return result;
        }
    }

    public sealed class MappingLevels : KeyedCollection<string, MappingLevel>
    {
        public MappingLevels()
        {
        }
        public MappingLevels(string levelsDir)
            : this(XHelper.Load(Path.Combine(levelsDir, "mapping.xml")).Root, levelsDir)
        {
        }
        public MappingLevels(XContainer container, string levelsDir = null)
        {
            this.levelsDir = levelsDir;
            foreach (var type in new[] { LevelType.Standard, LevelType.Bonus, LevelType.Extended })
            {
                var levels = container.ElementCaseInsensitive(type.ToString());
                var index = 0;
                if (levels != null)
                    foreach (var level in levels.ElementsCaseInsensitive("level"))
                        Add(new MappingLevel(type, ++index, level));
            }
        }

        protected override string GetKeyForItem(MappingLevel item)
        {
            return item.FileName;
        }

        private readonly string levelsDir;

        public static MappingLevels Current = new MappingLevels();

        public static MappingLevel GetMapping(Level level)
        {
            if (Current == null) throw new Exception("MappingLevels is not initialized yet!");
            var path = level.GetRelativePath(Current.levelsDir);
            if (Current.Contains(path)) return Current[path];
            var mapping = new MappingLevel(LevelType.None, 0, path, 0, string.Empty);
            Current.Add(mapping);
            return mapping;
        }
    }
}
