using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
using System.Xml.Linq;
using Mygod.Collections.ObjectModel;
using Mygod.IO;
using Mygod.Windows;
using Mygod.Xml.Linq;

namespace Mygod.Edge.Tool
{
    public sealed class AchievementSections : KeyedCollection<string, AchievementSection>
    {
        protected override string GetKeyForItem(AchievementSection item)
        {
            return item.Name;
        }
    }
    public sealed class AchievementSection : IniSection
    {
#pragma warning disable 612
        public AchievementSection(IniFile iniFile, string name) : base(iniFile, name)
        {
            state = new Int64HexData(this, "State");
            time = new Int64HexData(this, "Time");
        }

        private readonly Int64HexData state, time;
        private const long AchievedState = 0x0100000001;

        public bool Achieved
        {
            get { return state.Get() == AchievedState; }
            set
            {
                if ((value ? AchievedState : 0) == state.Get()) return;
                if (value)
                {
                    state.Set(AchievedState);
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

    public sealed class Achievements : KeyedCollection<string, Achievement>
    {
        public static Dictionary<string, string> GlobalPercents;
        private static int refreshing;
        private static readonly string ResourcesPath = Path.Combine(CurrentApp.Directory, "Resources"),
                                       AchievementsPath = Path.Combine(ResourcesPath, "Achievements.xml");

        static Achievements()
        {
            Current = new Achievements();
            foreach (var a in from a in XDocument.Parse(File.ReadAllText(AchievementsPath))
                                  .ElementCaseInsensitive("achievements").ElementsCaseInsensitive("achievement")
                              select new Achievement(a))
                Current.Add(a);
            RefreshGlobalPercents();
        }

        private Achievements()
        {
        }

        protected override string GetKeyForItem(Achievement item)
        {
            return item.ApiName;
        }

        public static void RefreshGlobalPercents()
        {
            if (Interlocked.Exchange(ref refreshing, 1) <= 0)
            {
                Task.Factory.StartNew(delegate
                {
                    try
                    {
                        GlobalPercents = XDocument.Parse(new WebClient().DownloadString(
                            "http://api.steampowered.com/ISteamUserStats/GetGlobalAchievementPercentagesForApp/" +
                            "v0002/?gameid=38740&format=xml")).Root.Element("achievements")
                            .Elements("achievement").ToDictionary(element => element.Element("name").Value,
                                                                  element => element.Element("percent").Value);
                        foreach (var achievement in Current)
                        {
                            achievement.OnPropertyChanged("GlobalPercent");
                            achievement.OnPropertyChanged("GlobalPercentText");
                        }
                    }
                    catch (Exception exc)
                    {
                        Trace.WriteLine("Error when fetching global achievement percentages: " + exc.GetMessage());
                    }
                    finally
                    {
                        Interlocked.Exchange(ref refreshing, 0);
                    }
                });
            }
        }

        public static string CountString => Current.Count.ToString(CultureInfo.InvariantCulture);

        public static Achievements Current { get; private set; }
    }
    public sealed class Achievement : INotifyPropertyChanged
    {
        internal Achievement(XElement element)
        {
            ApiName = element.GetAttributeValue("apiname");
            Title = element.GetAttributeValue("title");
            Description = element.GetAttributeValue("description");
            Help = element.GetAttributeValue("help");
            Points = element.GetAttributeValue<int>("points");
        }

        public event PropertyChangedEventHandler PropertyChanged;
        internal void OnPropertyChanged(string propertyName)
        {
            var propertyChanged = PropertyChanged;
            propertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public override string ToString()
        {
            return Title;
        }

        public string ApiName { get; }
        public string Title { get; }
        public string Description { get; }
        public double GlobalPercent => Achievements.GlobalPercents != null && Achievements.GlobalPercents
            .ContainsKey(ApiName) ? double.Parse(Achievements.GlobalPercents[ApiName]) : double.NaN;
        public string GlobalPercentText => Achievements.GlobalPercents != null && Achievements.GlobalPercents
            .ContainsKey(ApiName) ? Achievements.GlobalPercents[ApiName] : null;

        public string Help { get; }
        public Uri PictureUri => new Uri(Path.Combine(CurrentApp.Directory, $"Resources/Achievements/{ApiName}.jpg"),
            UriKind.Absolute);
        public int Points { get; }

        public bool CurrentUserAchieved => Users.Current.CurrentUser.GetAchieved(this);
    }

    public sealed class Users : ObservableKeyedCollection<string, User>
    {
        public static readonly string Root =
            Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData), "OUTLAWS");
        public static readonly Users Current = new Users();

        private Users()
        {
            Refresh();
        }

        protected override string GetKeyForItem(User item)
        {
            return item.Name;
        }

        public static string GetStatsDirectory(string name)
        {
            return Path.Combine(Root, name, "38740/stats");
        }

        public void Refresh()
        {
            HashSet<string> users = Directory.Exists(Root)
                ? new HashSet<string>(from info in new DirectoryInfo(Root).EnumerateDirectories() select info.Name)
                : new HashSet<string>(), removing = new HashSet<string>(from user in this select user.Name);
            foreach (var user in users) removing.Remove(user);
            foreach (var user in removing) Remove(user);
            foreach (var user in users) if (Contains(user)) base[user].Refresh(); else Add(new User(user));
        }

        private User currentUser;
        public User CurrentUser
        {
            get { return currentUser; }
            set { currentUser = value; OnPropertyChanged("CurrentUser"); }
        } 
    }
    public sealed class User
    {
        private readonly IniFile achievementsFile;
        private const string AchievementsIniFileName = "achievements.ini";
        private AchievementSections sections;

        internal User(string name)
        {
            achievementsFile = new IniFile(Path.Combine(Users.GetStatsDirectory(Name = name),
#pragma warning restore 612
                                                        AchievementsIniFileName));
            Refresh();
        }
        
        public void Refresh()
        {
            sections = new AchievementSections();
            foreach (var section in from a in Achievements.Current
                                    select new AchievementSection(achievementsFile, a.ApiName)) sections.Add(section);
            var source = (from section in sections where section.Achieved select section).ToArray();
            AchievedAchievementsCount = source.Count(section => section.Achieved);
            Points = sections.Sum(section => Achievements.Current[section.Name].Points);
            AchievedPoints = source.Sum(section => Achievements.Current[section.Name].Points);
        }

        public bool GetAchieved(Achievement achievement)
        {
            return sections[achievement.ApiName].Achieved;
        }
        public void SetAchieved(Achievement achievement, bool achieved)
        {
            sections[achievement.ApiName].Achieved = achieved;
        }

        public int AchievedAchievementsCount { get; private set; }
        public int AchievedPoints { get; private set; }
        public string Name { get; }
        public int Points { get; private set; }
    }
}
