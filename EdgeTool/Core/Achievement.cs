using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml.Linq;
using Mygod.Windows;
using Mygod.Xml.Linq;

namespace Mygod.Edge.Tool
{
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
            picture = element.GetAttributeValue("picture");
            Title = element.GetAttributeValue("title");
            Description = element.GetAttributeValue("description");
            Help = element.GetAttributeValue("help");
            Disabled = (element.GetAttributeValue("disabled") ?? string.Empty).ToLower() == "true";
            Points = int.Parse(element.GetAttributeValue("points"));
        }
        public Achievement(User user, Achievement achievement)
        {
            this.user = user;
            ID = achievement.ID;
            picture = achievement.picture;
            Title = achievement.Title;
            Description = achievement.Description;
            Help = achievement.Help;
            Disabled = achievement.Disabled;
            Points = achievement.Points;
        }

        private readonly string picture;
        private readonly User user;
        public string FilePath { get { return Path.Combine(user.Path, user.Name + "_swarm/wins/" + ID); } }

        public string ID { get; private set; }
        public Uri PictureUri
        {
            get { return new Uri(Path.Combine(CurrentApp.Directory, string.Format("Resources/{0}.jpg", picture)), UriKind.Absolute); }
        }
        public string Title { get; private set; }
        public string Description { get; private set; }
        public string Help { get; private set; }
        public bool Unlocked { get { return File.Exists(FilePath); } }
        public bool Disabled { get; private set; }
        public bool NeedHelp { get { return !Unlocked && !string.IsNullOrWhiteSpace(Help); } }
        public bool HelpUnavailable { get { return !Unlocked && string.IsNullOrWhiteSpace(Help); } }
        public DateTime UnlockTime { get { return Unlocked ? new FileInfo(FilePath).LastWriteTime : DateTime.MaxValue; } }
        public int Points { get; private set; }

        public override string ToString()
        {
            return Title;
        }
    }

    public class User
    {
        public User(string path)
        {
            var i = path.LastIndexOf('\\');
            Path = path.Substring(0, i);
            Name = path.Substring(i + 1, path.Length - i - 7);
            Achievements = Achievement.Achievements.Select(a => new Achievement(this, a.Value))
                .OrderBy(a => a.Unlocked ? 2 : a.Disabled ? 1 : 0).ThenByDescending(a => a.UnlockTime).ToArray();
            AchievementsUnlockedCount = Achievements.Count(a => a.Unlocked);
            AchievementsPoints = Achievements.Sum(a => a.Points);
            AchievementsUnlockedPoints = Achievements.Where(a => a.Unlocked).Sum(a => a.Points);
            LevelsPlayedCount = new DirectoryInfo(path).EnumerateFiles("heatmap_*.bjson").Count();
        }

        public readonly string Path;
        public string Name { get; private set; }
        public Achievement[] Achievements { get; private set; }
        public int AchievementsPoints { get; private set; }
        public int AchievementsUnlockedCount { get; private set; }
        public int AchievementsUnlockedPoints { get; private set; }
        public int LevelsPlayedCount { get; private set; }
        public static int LevelsCount { get; set; }
    }
}
