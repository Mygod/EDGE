using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml.Linq;
using Mygod.IO;
using Mygod.Windows;
using Mygod.Xml.Linq;

namespace Mygod.Edge.Tool
{
    public sealed class AchievementSection : IniSection
    {
        public AchievementSection(IniSection section) : base(section.IniFile, section.Name)
        {
            state = new Int64HexData(this, "State");
            time = new Int64HexData(this, "Time");
        }

        private readonly Int64HexData state, time;
        private const long UnlockedState = 0x0100000001;

        public bool Unlocked
        {
            get { return state.Get() == UnlockedState; }
            set
            {
                if ((value ? UnlockedState : 0) == state.Get()) return;
                if (value)
                {
                    state.Set(UnlockedState);
                    time.Set(0x3143333333);
                }
                else
                {
                    state.Set(0);
                    time.Set(0);
                    Remove();
                }
            }
        }
    }

    public class Achievement
    {
        static Achievement()
        {
            ResourcesPath = Path.Combine(Path.GetDirectoryName(CurrentApp.Path), "Resources");
            AchievementsPath = Path.Combine(ResourcesPath, "Achievements.xml");
            Achievements = XDocument.Parse(File.ReadAllText(AchievementsPath)).ElementCaseInsensitive("achievements")
                .ElementsCaseInsensitive("achievement").Select(a => new Achievement(a)).ToDictionary(a => a.ID);
        }

        public static readonly string ResourcesPath, AchievementsPath;
        public static readonly Dictionary<string, Achievement> Achievements;

        public Achievement(XElement element)
        {
            ID = element.GetAttributeValue("id");
            Title = element.GetAttributeValue("title");
            Description = element.GetAttributeValue("description");
            Help = element.GetAttributeValue("help");
            Points = element.GetAttributeValue<int>("points");
        }
        public Achievement(IniSection section, Achievement achievement)
        {
            this.section = new AchievementSection(section);
            ID = achievement.ID;
            Title = achievement.Title;
            Description = achievement.Description;
            Help = achievement.Help;
            Points = achievement.Points;
        }

        private readonly AchievementSection section;

        public string ID { get; private set; }
        public Uri PictureUri
        {
            get { return new Uri(Path.Combine(CurrentApp.Directory, string.Format("Resources/{0}.jpg", ID)), UriKind.Absolute); }
        }
        public string Title { get; private set; }
        public string Description { get; private set; }
        public string Help { get; private set; }
        public bool Unlocked { get { return section.Unlocked; } set { section.Unlocked = value; } }
        public bool NeedHelp { get { return !Unlocked && !string.IsNullOrWhiteSpace(Help); } }
        public bool HelpUnavailable { get { return !Unlocked && string.IsNullOrWhiteSpace(Help); } }
        public int Points { get; private set; }

        public override string ToString()
        {
            return Title;
        }
    }

    public class User
    {
        private User(string name)
        {
            var achievements = new IniFile(Path.Combine(GetStatsDirectory(Name = name), AchievementFileName));
            Achievements = Achievement.Achievements.Select(a => new Achievement(achievements[a.Key], a.Value))
                .OrderBy(a => a.Unlocked).ToArray();
            UnlockedCount = Achievements.Count(a => a.Unlocked);
            Points = Achievements.Sum(a => a.Points);
            UnlockedPoints = Achievements.Where(a => a.Unlocked).Sum(a => a.Points);
        }

        public static string GetStatsDirectory(string name)
        {
            return Path.Combine(UsersPath, name, "38740/stats");
        }
        public static IEnumerable<User> GetUsers()
        {
            return new DirectoryInfo(UsersPath).EnumerateDirectories().Select(info => new User(info.Name));
        }

        public const string AchievementFileName = "achievements.ini";
        public static readonly string UsersPath
            = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData), "OUTLAWS");

        public string Name { get; private set; }
        public Achievement[] Achievements { get; private set; }
        public int Points { get; private set; }
        public int UnlockedCount { get; private set; }
        public int UnlockedPoints { get; private set; }
    }
}
