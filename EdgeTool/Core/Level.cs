using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml.Linq;
using Mygod.Xml.Linq;

#pragma warning disable 612,618
#pragma warning disable 665
// ReSharper disable ObjectCreationAsStatement

namespace Mygod.Edge.Tool
{
    public interface IXSerializable
    {
        void Write(BinaryWriter writer);
    }
    public interface IXElement : IXSerializable
    {
        XElement GetXElement();
    }
    public interface IXElementWithDefault : IXElement
    {
        XElement GetXElement(XName name);
        bool IsDefault();
    }
    public interface IXElements : IXSerializable
    {
        IEnumerable<XElement> GetXElements();
    }
    public interface IWithID
    {
        string ID { get; set; }
        bool IDGenerated { get; }
    }

    public class XSerializableList<T> : List<T> where T : IXSerializable
    {
        public virtual void Write(BinaryWriter writer)
        {
            writer.Write((ushort)Count);
            WriteCore(writer);
        }
        public void WriteCore(BinaryWriter writer)
        {
            foreach (var obj in this) obj.Write(writer);
        }
    }
    public class XElementObjectList<T> : XSerializableList<T>, IXElements where T : IXElement
    {
        public virtual IEnumerable<XElement> GetXElements()
        {
            return this.Select(obj => obj.GetXElement());
        }
    }
    public class XElementObjectListWithID<T> : XElementObjectList<T> where T : IXElement, IWithID
    {
        private int currentID;
        private readonly Dictionary<string, int> dictionary = new Dictionary<string, int>();

        public string RequestID()
        {
            string result;
            do result = RequestIDCore(); 
            while (dictionary.ContainsKey(result));
            return result;
        }
        protected virtual string RequestIDCore()
        {
            return (++currentID).ToString(CultureInfo.InvariantCulture);
        }

        public new void Add(T value)
        {
            if (value.IDGenerated) dictionary.Add(value.ID, Count);
            base.Add(value);
        }
        public new void AddRange(IEnumerable<T> values)
        {
            foreach (var value in values) Add(value);
        }
        public new void Clear()
        {
            dictionary.Clear();
            base.Clear();
        }
        public bool Contains(string id)
        {
            return dictionary.ContainsKey(id);
        }
        public int IndexOf(string id)
        {
            return dictionary[id];
        }
        public new void Insert(int index, T value)
        {
            foreach (var pair in dictionary.ToArray().Where(pair => pair.Value >= index))
            {
                dictionary.Remove(pair.Key);
                dictionary.Add(pair.Key, pair.Value + 1);
            }
            if (value.IDGenerated) dictionary.Add(value.ID, index);
            base.Insert(index, value);
        }
        public new void InsertRange(int index, IEnumerable<T> value)
        {
            var values = value.ToArray();
            foreach (var pair in dictionary.ToArray().Where(pair => pair.Value >= index))
            {
                dictionary.Remove(pair.Key);
                dictionary.Add(pair.Key, pair.Value + index);
            }
            var i = 0;
            foreach (var v in values.Where(v => v.IDGenerated)) dictionary.Add(v.ID, index + i++);
            base.InsertRange(index, values);
        }
        public new void Remove(T value)
        {
            if (value.IDGenerated && dictionary.ContainsKey(value.ID)) dictionary.Remove(value.ID);
            base.Remove(value);
        }
        public new void RemoveAt(int index)
        {
            Remove(this[index]);
        }
        public new void RemoveRange(int index, int count)
        {
            for (var i = 0; i < count; i++) RemoveAt(index + i);
        }
        public T this[string id] { get { return this[IndexOf(id)]; } set { this[IndexOf(id)] = value; } }

        public void UpdateID(T value, string newValue)
        {
            if (dictionary.ContainsKey(newValue)) throw new DuplicateNameException("ID 重复！");
            var index = dictionary[value.ID];
            dictionary.Remove(value.ID);
            dictionary.Add(newValue, index);
        }
    }

    public interface IIDReference
    {
        string Name { get; set; }
        short Index { get; set; }
    }
    public sealed class NormalID : IIDReference
    {
        public NormalID(short id)
        {
            Index = id;
        }
        public NormalID(IDReference reference)
        {
            if (reference.IsName) Name = reference.Name;
            else Index = reference.Index;
        }

        public string Name { get { return Index.ToString(CultureInfo.InvariantCulture); } set { Index = short.Parse(value); } }
        public short Index { get; set; }
    }
    public sealed class IDReference : IIDReference
    {
        public IDReference(string name)
        {
            Name = name;
        }
        public IDReference(short index)
        {
            Index = index;
        }

        public bool IsName;
        private string name;
        private short index;
        public string Name
        {
            get { if (IsName) return name; throw new NotSupportedException(); }
            set
            {
                if (value.Contains("(") || value.Contains(")") || value.Contains(",")) 
                    throw new FormatException("ID 不能包含“(,)”中的任何一个字符！");
                IsName = true; 
                name = value.Trim();
            }
        }
        public short Index
        {
            get { if (IsName) throw new NotSupportedException(); return index; }
            set { IsName = false; index = value; }
        }
    }
    public sealed class IDReference<T> : IIDReference where T : IXElement, IWithID
    {
        public IDReference(XElementObjectListWithID<T> lookup, IDReference parent)
        {
            this.lookup = lookup;
            reference = parent;
        }
        public IDReference(XElementObjectListWithID<T> lookup, string name)
        {
            this.lookup = lookup;
            reference = new IDReference(name);
        }
        public IDReference(XElementObjectListWithID<T> lookup, short index)
        {
            this.lookup = lookup;
            reference = new IDReference(index);
        }

        private readonly IDReference reference;
        private readonly XElementObjectListWithID<T> lookup;
        public string Name
        {
            get { if (reference.IsName) return reference.Name; return Index < 0 ? null : lookup[Index].ID; }
            set { reference.Name = value; }
        }
        public short Index
        {
            get { return reference.IsName ? (short) lookup.IndexOf(lookup[Name]) : reference.Index; }
            set { reference.Index = value; }
        }
    }

    public enum NullableBoolean
    {
        False, True, Null
    }

    public static class Warning
    {
        private static StringBuilder builder;
        public static void Start()
        {
            if (builder != null) throw new Exception("Warning is already in use.");
            builder = new StringBuilder();
        }
        public static void Clear()
        {
            builder = null;
        }
        public static void WriteLine(string message)
        {
            if (builder == null) Trace.WriteLine(message);
            else builder.AppendLine(message);
        }
        public static string Fetch()
        {
            return builder.ToString();
        }
    }

    public sealed class Level : IXElement
    {
        public Level(BinaryReader reader)
        {
            ID = reader.ReadInt32();
            var nameLength = reader.ReadInt32();
            Name = Encoding.UTF8.GetString(reader.ReadBytes(nameLength));
            SPlusTime = reader.ReadUInt16();
            STime = reader.ReadUInt16();
            ATime = reader.ReadUInt16();
            BTime = reader.ReadUInt16();
            CTime = reader.ReadUInt16();
            var prismsCount = reader.ReadUInt16();
            Size = new Size3D(reader);
            #region Boring verifying
            var temp = reader.ReadUInt16();
            if (Temp1 != temp) Warning.WriteLine(string.Format("unknown_ushort_1 数值错误！将被自动纠正：{0} => {1}", temp, Temp1));
            temp = reader.ReadUInt16();
            if (Temp2 != temp) Warning.WriteLine(string.Format("unknown_ushort_2 数值错误！将被自动纠正：{0} => {1}", temp, Temp2));
            ushort width = reader.ReadUInt16(), length = reader.ReadUInt16();
            int temp3 = (Temp1 + 9) / 10, temp4 = (Temp2 + 9) / 10;
            if (width != temp3 || length != temp4) Warning.WriteLine(string.Format(
                "缩略图不是默认大小，可能很老的游戏无法支持这玩意儿，其大小将不会被自动纠正：{0}x{1} => {2}x{3}",
                width, length, temp3, temp4));
            var tempByte = reader.ReadByte();
            if (tempByte != 10) Warning.WriteLine(string.Format("unknown_byte_1 数值错误！将被自动纠正：{0} => 10", tempByte));
            temp = reader.ReadUInt16();
            if (Size.Length - 1 != temp)
                Warning.WriteLine(string.Format("unknown_ushort_5 数值错误！将被自动纠正：{0} => {1}", temp, Size.Length - 1));
            temp = reader.ReadUInt16();
            if (0 != temp) Warning.WriteLine(string.Format("unknown_ushort_6 数值错误！将被自动纠正：{0} => 0", temp));
            #endregion
            LegacyMinimap = new Flat(reader, new Size2D(width, length));
            CollisionMap = new Cube(reader, Size);
            SpawnPoint = new Point3D16(reader);
            Zoom = reader.ReadInt16();
            if (Zoom < 0)
            {
                FieldOfView = reader.ReadUInt16();
                AutoAdjustZoom = reader.ReadBoolean();
            }
            ExitPoint = new Point3D16(reader);
            var count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) MovingPlatforms.Add(new MovingPlatform(MovingPlatforms, reader));
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) Bumpers.Add(new Bumper(Bumpers, reader));
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) FallingPlatforms.Add(new FallingPlatform(reader));
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) Checkpoints.Add(new Checkpoint(reader));
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) CameraTriggers.Add(new CameraTrigger(reader));
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) Prisms.Add(new Prism(reader));
            if (count != prismsCount)
                Warning.WriteLine(string.Format("prisms_count 数值错误！将被自动纠正：{0} => {1}", prismsCount, count));
            if ((count = reader.ReadUInt16()) > 0) Warning.WriteLine("Fan 元素已过时，请勿使用。");
            for (var i = 0; i < count; i++) Fans.Add(new Fan(reader));
            Buttons = new Buttons(this, reader);
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) OtherCubes.Add(new OtherCube(this, reader));
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) Resizers.Add(new Resizer(reader));
            if ((count = reader.ReadUInt16()) > 0) Warning.WriteLine("MiniBlock 元素已过时，请勿使用。");
            for (var i = 0; i < count; i++) MiniBlocks.Add(new MiniBlock(reader));
            Theme = reader.ReadByte();
            MusicJava = reader.ReadByte();
            Music = reader.ReadByte();
            foreach (var button in Buttons)
            {
                if (button.IsMoving) button.MovingBlockID.Name.DoNothing();
                foreach (var e in button.Events) Buttons.BlockEvents[e].ID.Name.DoNothing();
            }
            foreach (var cube in OtherCubes)
            {
                cube.MovingBlockSync.Name.DoNothing();
                if (cube.DarkCubeMovingBlockSync != null) cube.DarkCubeMovingBlockSync.Name.DoNothing();
            }
        }
        private Level(XElement element)
        {
            ID = element.GetAttributeValue<int>("ID");
            Name = element.GetAttributeValue("Name");
            var thresholds = element.GetAttributeValue("TimeThresholds").Split(',').Select(str => ushort.Parse(str.Trim())).ToArray();
            SPlusTime = thresholds[0];
            STime = thresholds[1];
            ATime = thresholds[2];
            BTime = thresholds[3];
            CTime = thresholds[4];
            Size = element.GetAttributeValue<Size3D>("Size");
            SpawnPoint = element.GetAttributeValue<Point3D16>("SpawnPoint");
            ExitPoint = element.GetAttributeValue<Point3D16>("ExitPoint");
            element.GetAttributeValueWithDefault(out Theme, "Theme");
            element.GetAttributeValueWithDefault(out MusicJava, "MusicJava");
            element.GetAttributeValueWithDefault(out Music, "Music");
            element.GetAttributeValueWithDefault(out Zoom, "Zoom", (short)-1);
            element.GetAttributeValueWithDefault(out FieldOfView, "FieldOfView");
            element.GetAttributeValueWithDefault(out AutoAdjustZoom, "AutoAdjustZoom");
            if (Zoom >= 0 && (FieldOfView != 0 || AutoAdjustZoom)) Warning.WriteLine("Level 元素：高级缩放模式被禁用！" +
                "@FieldOfView 与 @AutoAdjustZoom 将被忽略。要启用请将 @Zoom 删去或设为负值。");
            Buttons = new Buttons(this);
            foreach (var e in element.Elements())
                switch (e.Name.LocalName.ToLower())
                {
                    case "movingplatform":
                        MovingPlatforms.Add(new MovingPlatform(MovingPlatforms, e));
                        break;
                    case "bumper":
                        Bumpers.Add(new Bumper(Bumpers, e));
                        break;
                    case "fallingplatform":
                        FallingPlatforms.Add(new FallingPlatform(e));
                        break;
                    case "checkpoint":
                        Checkpoints.Add(new Checkpoint(e));
                        break;
                    case "cameratrigger":
                    case "advancedcameratrigger":
                        CameraTriggers.Add(new CameraTrigger(e));
                        break;
                    case "prism":
                        Prisms.Add(new Prism(e));
                        break;
                    case "fan":
                        Fans.Add(new Fan(e));
                        Warning.WriteLine("Fan 元素已过时，请勿使用。");
                        break;
                    case "button":
                    case "buttonsequence":
                        new Button(Buttons, e);
                        break;
                    case "othercube":
                    case "darkcube":
                        OtherCubes.Add(new OtherCube(this, e));
                        break;
                    case "resizergrow":
                    case "resizershrink":
                        Resizers.Add(new Resizer(this, e));
                        break;
                    case "miniblock":
                        MiniBlocks.Add(new MiniBlock(e));
                        Warning.WriteLine("MiniBlock 元素已过时，请勿使用。");
                        break;
                    default:
                        Warning.WriteLine("Level 元素有无法识别的子元素，它将被忽略：" + e.Name);
                        break;
                }
        }
        public static Level CreateFromCompiled(string path)
        {
            using (var stream = File.OpenRead(path)) using (var reader = new BinaryReader(stream))
                return new Level(reader) { FilePath = path };
        }
        public static Level CreateFromDecompiled(string path)
        {
            var result = new Level(XHelper.Load(path + ".xml").GetElement("Level"))
                { LegacyMinimap = Flat.LoadFromImage(path + ".png") };
            result.CollisionMap = new Cube(path + ".{0}.png", result.Size);
            return result;
        }

        public string FilePath { get; private set; }
        public MappingLevel Mapping { get { return MappingLevels.GetMapping(this); } }

        public string GetRelativePath(string levelsDir)
        {
            return FilePath.GetRelativePath(levelsDir).RemoveExtension().ToCorrectPath();
        }

        public int ID { get; set; }
        public string Name { get; set; }
        public ushort SPlusTime { get; set; }
        public ushort STime { get; set; }
        public ushort ATime { get; set; }
        public ushort BTime { get; set; }
        public ushort CTime { get; set; }
        public Size3D Size { get; set; }
        public ushort Temp1 { get { return (ushort) (Size.Width + Size.Length); } }
        public ushort Temp2 { get { return (ushort) (Temp1 + Size.Height + Size.Height); } }
        public Point3D16 SpawnPoint { get; set; }
        public Point3D16 ExitPoint { get; set; }
        public short Zoom;
        public ushort FieldOfView;
        public bool AutoAdjustZoom;
        public Flat LegacyMinimap;
        public Cube CollisionMap;
        public MovingPlatforms MovingPlatforms = new MovingPlatforms();
        public Bumpers Bumpers = new Bumpers();
        public XElementObjectList<FallingPlatform> FallingPlatforms = new XElementObjectList<FallingPlatform>();
        public XElementObjectList<Checkpoint> Checkpoints = new XElementObjectList<Checkpoint>();
        public XElementObjectList<CameraTrigger> CameraTriggers = new XElementObjectList<CameraTrigger>();
        public XElementObjectList<Prism> Prisms = new XElementObjectList<Prism>();
        [Obsolete]
        public XElementObjectList<Fan> Fans = new XElementObjectList<Fan>();
        public Buttons Buttons;
        public XElementObjectList<OtherCube> OtherCubes = new XElementObjectList<OtherCube>();
        public XElementObjectList<Resizer> Resizers = new XElementObjectList<Resizer>();
        [Obsolete]
        public XElementObjectList<MiniBlock> MiniBlocks = new XElementObjectList<MiniBlock>();
        public byte Theme, MusicJava, Music;

        private static readonly string[] Musics = {"00_Title", "01_Eternity", "02_Quiet", "03_Pad", "04_Jingle", "05_Tec", "06_Kakkoi", 
                                                   "07_Dark", "08_Squadron", "09_8bits", "10_Pixel", "11_Jupiter", "12_Shame", 
                                                   "13_Debrief", "14_Space", "15_Voyage_geometrique", "16_Mzone", "17_R2", 
                                                   "18_Mystery_cube", "19_Duty", "20_PerfectCell", "21_fun", "22_lol", "23_lostway", 
                                                   "24_wall_street"},
                                         MusicsJava = { "00_menus", "01_braintonik", "02_cube_dance", "03_essai_2", "04_essai_01", 
                                                        "05_test", "06_mysterycube", "07_03_EDGE", "08_jungle", "09_RetardTonic", 
                                                        "10_oldschool_simon", "11_planant" };

        public string MusicName { get { return Music > 24 ? (Musics[6] + " (" + Music + ")") : Musics[Music]; } }
        public string MusicJavaName { get { return MusicJava > 11 ? (MusicsJava[0] + " (" + MusicJava + ")") : MusicsJava[MusicJava]; } }

        public void Compile(string path)
        {
            FilePath = path;
            using (var stream = new FileStream(path, FileMode.Create, FileAccess.Write, FileShare.Read))
                using (var writer = new BinaryWriter(stream)) Write(writer);
        }
        public void Decompile(string path)
        {
            File.WriteAllText(path + ".xml", GetXElement().GetString());
            LegacyMinimap.SaveToImage(path + ".png");
            for (var z = 0; z < Size.Height; z++) CollisionMap[z].SaveToImage(path + '.' + z + ".png");
        }

        public void Write(BinaryWriter writer)
        {
            writer.Write(ID);
            writer.Write(Encoding.UTF8.GetByteCount(Name));
            writer.Write(Encoding.UTF8.GetBytes(Name));
            writer.Write(SPlusTime);
            writer.Write(STime);
            writer.Write(ATime);
            writer.Write(BTime);
            writer.Write(CTime);
            writer.Write((ushort) Prisms.Count);
            Size.Write(writer);
            writer.Write(Temp1);
            writer.Write(Temp2);
            writer.Write((ushort)LegacyMinimap.Width);
            writer.Write((ushort)LegacyMinimap.Length);
            writer.Write((byte) 10);
            writer.Write((ushort) (Size.Length - 1));
            writer.Write((ushort) 0);
            LegacyMinimap.Write(writer);
            CollisionMap.Write(writer);
            SpawnPoint.Write(writer);
            writer.Write(Zoom);
            if (Zoom < 0)
            {
                writer.Write(FieldOfView);
                writer.Write(AutoAdjustZoom);
            }
            ExitPoint.Write(writer);
            MovingPlatforms.Write(writer);
            Bumpers.Write(writer);
            FallingPlatforms.Write(writer);
            Checkpoints.Write(writer);
            CameraTriggers.Write(writer);
            Prisms.Write(writer);
            Fans.Write(writer);
            Buttons.Write(writer);
            OtherCubes.Write(writer);
            Resizers.Write(writer);
            MiniBlocks.Write(writer);
            writer.Write(Theme);
            writer.Write(MusicJava);
            writer.Write(Music);
        }
        public XElement GetXElement()
        {
            var element = new XElement("Level", new XAttribute("ID", ID), new XAttribute("Name", Name), new XAttribute("TimeThresholds", 
                                       string.Format("{0},{1},{2},{3},{4}", SPlusTime, STime, ATime, BTime, CTime)), 
                                       new XAttribute("Size", Size),
                                       new XAttribute("SpawnPoint", SpawnPoint), new XAttribute("ExitPoint", ExitPoint));
            element.SetAttributeValueWithDefault("Theme", Theme);
            element.SetAttributeValueWithDefault("MusicJava", MusicJava);
            element.SetAttributeValueWithDefault("Music", Music);
            if (Zoom < 0)
            {
                element.SetAttributeValueWithDefault("FieldOfView", FieldOfView);
                element.SetAttributeValueWithDefault("AutoAdjustZoom", AutoAdjustZoom);
            }
            else element.SetAttributeValueWithDefault("Zoom", Zoom, (short) -1);
            foreach (var e in MovingPlatforms.GetXElements()) element.Add(e);
            foreach (var e in Bumpers.GetXElements()) element.Add(e);
            foreach (var e in FallingPlatforms.GetXElements()) element.Add(e);
            foreach (var e in Checkpoints.GetXElements()) element.Add(e);
            foreach (var e in CameraTriggers.GetXElements()) element.Add(e);
            foreach (var e in Prisms.GetXElements()) element.Add(e);
            foreach (var e in Fans.GetXElements()) element.Add(e);
            foreach (var e in Buttons.GetXElements()) element.Add(e);
            foreach (var e in OtherCubes.GetXElements()) element.Add(e);
            foreach (var e in Resizers.GetXElements()) element.Add(e);
            foreach (var e in MiniBlocks.GetXElements()) element.Add(e);
            return element;
        }
    }

    public enum LevelType
    {
        None, Standard, Bonus, Extended
    }

    public sealed class MappingLevel : IComparable, IComparable<MappingLevel>
    {
        public MappingLevel(LevelType type, int index, string fileName, int leaderboardID, string nameSfx)
        {
            Type = type;
            Index = index;
            FileName = fileName.ToCorrectPath();
            LeaderboardID = leaderboardID;
            NameSfx = nameSfx;
        }
        public MappingLevel(LevelType type, int index, XElement element) : this(type, index, element.GetAttributeValue("filename"),
            element.GetAttributeValueWithDefault<int>("leaderboard_id"), element.GetAttributeValue("name_sfx"))
        {
        }

        public LevelType Type;
        public readonly string FileName, NameSfx;
        public readonly int Index, LeaderboardID;

        public int CompareTo(MappingLevel other)
        {
            if (Type == 0) return other.Type == 0 ? 0 : 1;
            if (other.Type == 0) return -1;
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
        public MappingLevels(string levelsDir) : this(XHelper.Load(Path.Combine(levelsDir, "mapping.xml")).Root, levelsDir)
        {
        }
        public MappingLevels(XContainer container, string levelsDir = null)
        {
            this.levelsDir = levelsDir;
            foreach (var type in new[] { LevelType.Standard, LevelType.Bonus, LevelType.Extended })
            {
                var levels = container.ElementCaseInsensitive(type.ToString());
                var index = 0;
                if (levels != null) foreach (var level in levels.ElementsCaseInsensitive("level"))
                    Add(new MappingLevel(type, ++index, level));
            }
        }

        protected override string GetKeyForItem(MappingLevel item)
        {
            return item.FileName;
        }

        private readonly string levelsDir;

        public static MappingLevels Current;

        public static MappingLevel GetMapping(Level level)
        {
            if (Current == null) throw new Exception("MappingLevels is not initialized yet!");
            var path = level.GetRelativePath(Current.levelsDir);
            if (Current.Contains(path)) return Current[path];
            var mapping = new MappingLevel(LevelType.None, 0, path, 0, string.Empty);
            Current.Add(mapping);
            return mapping;
        }

        public string GetXsl()
        {
            var result = new StringBuilder("<xsl:transform version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n  <xsl:template match=\"* | comment()\">\r\n    <xsl:copy>\r\n      <xsl:copy-of select=\"@*\" />\r\n      <xsl:apply-templates />\r\n    </xsl:copy>\r\n  </xsl:template>\r\n");
            foreach (var group in this.GroupBy(m => m.Type))
            {
                result.AppendFormat("  <xsl:template match=\"/levels/{0}\">\r\n    <xsl:element name=\"{1}\">\r\n      <xsl:for-each select=\"/levels/{0}/@*\">\r\n        <xsl:attribute name=\"{1}\">\r\n          <xsl:value-of select=\".\" />\r\n        </xsl:attribute>\r\n      </xsl:for-each>\r\n      <xsl:attribute name=\"special_locked_level_count\">0</xsl:attribute>\r\n      <xsl:apply-templates />\r\n", group.Key.ToString().ToLower(), "{name()}");
                foreach (var item in group) result.AppendLine("      " + item.GetXElement());
                result.AppendLine("    </xsl:element>\r\n  </xsl:template>");
            }
            result.AppendLine("</xsl:transform>");
            return result.ToString();
        }
    }

    public struct Point2D8 : IXSerializable, IEquatable<Point2D8>
    {
        public Point2D8(byte x, byte y)
        {
            X = x;
            Y = y;
        }
        public Point2D8(BinaryReader reader)
        {
            X = reader.ReadByte();
            Y = reader.ReadByte();
        }

        public readonly byte X, Y;

        public bool Equals(Point2D8 other)
        {
            return X == other.X && Y == other.Y;
        }
        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            return obj is Point2D8 && Equals((Point2D8) obj);
        }
        public override int GetHashCode()
        {
            unchecked
            {
                return (X.GetHashCode() * 397) ^ Y.GetHashCode();
            }
        }

        public override string ToString()
        {
            return string.Format("{0},{1}", X, Y);
        }

        public void Write(BinaryWriter writer)
        {
            writer.Write(X);
            writer.Write(Y);
        }

        public static Point2D8 Parse(string str)
        {
            var numbers = str.Trim('(', ')').Split(',');
            byte x, y;
            if (numbers.Length != 2 || !byte.TryParse(numbers[0].Trim(), out x) || !byte.TryParse(numbers[1].Trim(), out y))
                throw new FormatException("无法识别的坐标！");
            return new Point2D8(x, y);
        }
    }
    public struct Point3D16 : IXSerializable, IEquatable<Point3D16>
    {
        public Point3D16(short x, short y, short z)
        {
            X = x;
            Y = y;
            Z = z;
        }
        public Point3D16(BinaryReader reader)
        {
            X = reader.ReadInt16();
            Y = reader.ReadInt16();
            Z = reader.ReadInt16();
        }

        public readonly short X, Y, Z;

        public bool Equals(Point3D16 other)
        {
            return X == other.X && Y == other.Y && Z == other.Z;
        }

        public override string ToString()
        {
            return string.Format("{0},{1},{2}", X, Y, Z);
        }

        public void Write(BinaryWriter writer)
        {
            writer.Write(X);
            writer.Write(Y);
            writer.Write(Z);
        }

        public static Point3D16 Parse(string str)
        {
            var numbers = str.Trim('(', ')').Split(',').Select(short.Parse).ToArray();
            return new Point3D16(numbers[0], numbers[1], numbers[2]);
        }

        public static Point3D16 operator +(Point3D16 a, Point3D16 b)
        {
            return new Point3D16((short) (a.X + b.X), (short) (a.Y + b.Y), (short) (a.Z + b.Z));
        }
        public static Point3D16 operator -(Point3D16 a, Point3D16 b)
        {
            return a + -b;
        }
        public static Point3D16 operator -(Point3D16 value)
        {
            return new Point3D16((short)-value.X, (short)-value.Y, (short)-value.Z);
        }
    }

    public struct Size2D
    {
        public Size2D(ushort width, ushort length)
        {
            Width = width;
            Length = length;
        }

        public readonly ushort Width, Length;
        public int FlatBytes { get { return Flat.GetBytes(Width, Length); } }

        public static implicit operator Size2D(Size3D size)
        {
            return new Size2D(size.Width, size.Length);
        }

        public override string ToString()
        {
            return string.Format("{0}x{1}", Width, Length);
        }
    }
    public struct Size3D : IXSerializable
    {
        public Size3D(byte height, ushort width, ushort length)
        {
            Height = height;
            Width = width;
            Length = length;
        }
        public Size3D(BinaryReader reader)
        {
            Height = reader.ReadByte();
            Width = reader.ReadUInt16();
            Length = reader.ReadUInt16();
        }

        public readonly ushort Width, Length;
        public readonly byte Height;

        public override string ToString()
        {
            return string.Format("{0}x{1}x{2}", Width, Length, Height);
        }
        public static Size3D Parse(string str)
        {
            var numbers = str.Split('x');
            ushort width, length;
            byte height;
            if (numbers.Length != 3 || !ushort.TryParse(numbers[0].Trim(), out width) || !ushort.TryParse(numbers[1].Trim(), out length)
                || !byte.TryParse(numbers[2].Trim(), out height)) throw new FormatException("无法识别的关卡大小！");
            return new Size3D(height, width, length);
        }

        public static bool operator ==(Size3D a, Size3D b)
        {
            return a.Equals(b);
        }
        public static bool operator !=(Size3D a, Size3D b)
        {
            return !a.Equals(b);
        }

        public bool Equals(Size3D other)
        {
            return Width == other.Width && Length == other.Length && Height == other.Height;
        }
        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            return obj is Size3D && Equals((Size3D)obj);
        }
        public override int GetHashCode()
        {
            unchecked
            {
                int hashCode = Width.GetHashCode();
                hashCode = (hashCode * 397) ^ Length.GetHashCode();
                hashCode = (hashCode * 397) ^ Height.GetHashCode();
                return hashCode;
            }
        }

        public void Write(BinaryWriter writer)
        {
            writer.Write(Height);
            writer.Write(Width);
            writer.Write(Length);
        }

        public Size2D DefaultLegacyMinimapSize
        {
            get
            {
                var p = Width + Length;
                return new Size2D((ushort)((p + 9) / 10), (ushort)((p + Height + Height + 9) / 10));
            }
        }
    }

    public sealed class Flat : IXSerializable
    {
        public Flat(int width, int length, byte[] array = null)
        {
            Length = length;
            Width = width;
            data = array == null ? new BitArray(GetBytes(width, length) << 3) : new BitArray(array);
        }
        public Flat(BinaryReader reader, Size2D size) : this(size.Width, size.Length, reader.ReadBytes(size.FlatBytes))
        {
        }
        public Flat(string path, Size2D size) : this(size.Width, size.Length)
        {
            if (!File.Exists(path)) return;
            var array = ImageConverter.Load(path);
            if (array.Length != size.Width * size.Length)
                Warning.WriteLine(string.Format("{0}：文件尺寸不正确，应为 {1}！其内容将不会被加载。", path, size));
            else InitFromBitmapData(array, size);
        }

        public static Flat LoadFromImage(string path)
        {
            if (!File.Exists(path)) return new Flat(0, 0);
            Size2D size;
            var array = ImageConverter.Load(path, out size);
            var result = new Flat(size.Width, size.Length);
            result.InitFromBitmapData(array, size);
            return result;
        }

        public void SaveToImage(string path)
        {
            if (IsEmpty) return;
            var array = new BitArray(Width * Length);
            var pos = 0;
            for (var y = 0; y < Length; y++) for (var x = 0; x < Width; x++) array[pos++] = this[x, y];
            ImageConverter.Save(array, Width, Length, path);
        }

        private void InitFromBitmapData(BitArray array, Size2D size)
        {
            var pos = 0;
            for (var y = 0; y < size.Length; y++) for (var x = 0; x < size.Width; x++) this[x, y] = array[pos++];
        }

        private readonly BitArray data;
        public readonly int Width, Length;

        public static int GetBytes(int width, int length)
        {
            return (width * length + 7) >> 3;
        }

        public int Bytes { get { return GetBytes(Width, Length); } }

        public bool IsEmpty
        {
            get
            {
                for (var x = 0; x < Width; x++) for (var y = 0; y < Length; y++) if (this[x, y]) return false;
                return true;
            }
        }

        private int GetPosition(int x, int y)
        {
            int pos = y * Width + x, posBit = pos & 7;  // posBase = pos & ~7 = pos - posBit
            return pos + 7 - posBit - posBit;           // return posBase + (7 - posBit);
        }

        public bool this[int x, int y]
        {
            get { return data[GetPosition(x, y)]; }
            set { data[GetPosition(x, y)] = value; }
        }

        public void Write(BinaryWriter writer)
        {
            var array = new byte[Bytes];
            data.CopyTo(array, 0);
            writer.Write(array);
        }
    }

    public sealed class Cube : List<Flat>, IXSerializable
    {
        public Cube(BinaryReader reader, Size3D size)
        {
            Size = size;
            for (var z = 0; z < size.Height; z++) Add(new Flat(reader, size));
        }
        public Cube(string pathFormat, Size3D size)
        {
            Size = size;
            for (var z = 0; z < size.Height; z++) Add(new Flat(string.Format(pathFormat, z), size));
        }

        public Size3D Size;

        public bool this[int x, int y, int z]
        {
            get { return this[z][x, y]; }
            set { this[z][x, y] = value; }
        }

        public void SaveToImages(string pathFormat)
        {
            for (var z = 0; z < Size.Height; z++) this[z].SaveToImage(string.Format(pathFormat, z));
        }

        public void Write(BinaryWriter writer)
        {
            foreach (var flat in this) flat.Write(writer);
        }
    }

    public sealed class MovingPlatforms : XElementObjectListWithID<MovingPlatform>
    {
        protected override string RequestIDCore()
        {
            return "Block" + base.RequestIDCore();
        }
    }
    public sealed class MovingPlatform : IXElement, IWithID
    {
        public MovingPlatform(MovingPlatforms parent)
        {
            this.parent = parent;
        }
        public MovingPlatform(MovingPlatforms parent, BinaryReader reader) : this(parent)
        {
            AutoStart = reader.ReadByte() != 0;
            LoopStartIndex = reader.ReadByte();
            Clones = reader.ReadInt16();
            if (Clones != -1) Warning.WriteLine("@Clones 已过时，请勿使用。");
            FullBlock = reader.ReadBoolean();
            var count = reader.ReadByte();
            for (var i = 0; i < count; i++) Waypoints.Add(new Waypoint(reader));
        }
        public MovingPlatform(MovingPlatforms parent, XElement element) : this(parent)
        {
            id = element.GetAttributeValue("ID");
            if (id != null) id = id.Trim();
            var relatedTo = element.GetAttributeValue("RelatedTo");
            if (string.IsNullOrEmpty(relatedTo))
            {
                element.GetAttributeValueWithDefault(out AutoStart, "AutoStart", true);
                element.GetAttributeValueWithDefault(out LoopStartIndex, "LoopStartIndex", (byte) 1);
                element.GetAttributeValueWithDefault(out Clones, "Clones", (short)-1);
                if (Clones != -1) Warning.WriteLine("@Clones 已过时，请勿使用。");
                element.GetAttributeValueWithDefault(out FullBlock, "FullBlock", true);
                foreach (var e in element.ElementsCaseInsensitive("Waypoint")) Waypoints.Add(new Waypoint(e));
            }
            else
            {
                var relative = parent[relatedTo];
                element.GetAttributeValueWithDefault(out AutoStart, "AutoStart", relative.AutoStart);
                element.GetAttributeValueWithDefault(out LoopStartIndex, "LoopStartIndex", relative.LoopStartIndex);
                element.GetAttributeValueWithDefault(out Clones, "Clones", relative.Clones);
                if (Clones != -1) Warning.WriteLine("@Clones 已过时，请勿使用。");
                element.GetAttributeValueWithDefault(out FullBlock, "FullBlock", relative.FullBlock);
                var offset = element.GetAttributeValueWithDefault<Point3D16>("Offset");
                foreach (var waypoint in relative.Waypoints) Waypoints.Add(new Waypoint
                    { Position = waypoint.Position + offset, PauseTime = waypoint.PauseTime, TravelTime = waypoint.TravelTime });
            }
        }

        private readonly MovingPlatforms parent;

        public bool AutoStart = true;
        public byte LoopStartIndex = 1;
        [Obsolete]
        public short Clones = -1;
        public bool FullBlock = true;
        public Waypoints Waypoints = new Waypoints();

        public void Write(BinaryWriter writer)
        {
            writer.Write((byte) (AutoStart ? 2 : 0));
            writer.Write(LoopStartIndex);
            writer.Write(Clones);
            writer.Write(FullBlock);
            Waypoints.Write(writer);
        }

        public XElement GetXElement()
        {
            var result = new XElement("MovingPlatform");
            if (IDGenerated) result.SetAttributeValue("ID", ID);
            result.SetAttributeValueWithDefault("AutoStart", AutoStart, true);
            result.SetAttributeValueWithDefault("LoopStartIndex", LoopStartIndex, (byte)1);
            result.SetAttributeValueWithDefault("Clones", Clones, (short) -1);
            result.SetAttributeValueWithDefault("FullBlock", FullBlock, true);
            foreach (var element in Waypoints.GetXElements()) result.Add(element);
            return result;
        }

        private string id;
        public string ID { get { if (!IDGenerated) id = parent.RequestID(); return id; } set { id = value; } }
        public bool IDGenerated { get { return !string.IsNullOrWhiteSpace(id); } }
    }
    public sealed class Waypoints : XElementObjectList<Waypoint>
    {
        public override void Write(BinaryWriter writer)
        {
            writer.Write((byte) Count);
            WriteCore(writer);
        }
    }
    public sealed class Waypoint : IXElement
    {
        public Waypoint()
        {
        }
        public Waypoint(BinaryReader reader)
        {
            Position = new Point3D16(reader);
            TravelTime = reader.ReadUInt16();
            PauseTime = reader.ReadUInt16();
        }
        public Waypoint(XElement element)
        {
            element.GetAttributeValue(out Position, "Position");
            element.GetAttributeValueWithDefault(out TravelTime, "TravelTime");
            element.GetAttributeValueWithDefault(out PauseTime, "PauseTime");
        }

        public Point3D16 Position;
        public ushort TravelTime, PauseTime;

        public void Write(BinaryWriter writer)
        {
            Position.Write(writer);
            writer.Write(TravelTime);
            writer.Write(PauseTime);
        }

        public XElement GetXElement()
        {
            var result = new XElement("Waypoint");
            result.SetAttributeValue("Position", Position);
            result.SetAttributeValueWithDefault("TravelTime", TravelTime);
            result.SetAttributeValueWithDefault("PauseTime", PauseTime);
            return result;
        }
    }

    public sealed class Bumpers : XElementObjectListWithID<Bumper>
    {
        protected override string RequestIDCore()
        {
            return "Bumper" + base.RequestIDCore();
        }
    }
    public sealed class Bumper : IXElement, IWithID
    {
        public Bumper(Bumpers parent)
        {
            this.parent = parent;
        }
        public Bumper(Bumpers parent, BinaryReader reader) : this(parent)
        {
            AutoStart = reader.ReadBoolean();
            Position = new Point3D16(reader);
            North = new BumperSide(reader);
            East = new BumperSide(reader);
            South = new BumperSide(reader);
            West = new BumperSide(reader);
        }
        public Bumper(Bumpers parent, XElement element) : this(parent)
        {
            id = element.GetAttributeValue("ID");
            if (id != null) id = id.Trim();
            element.GetAttributeValueWithDefault(out AutoStart, "AutoStart", true);
            element.GetAttributeValue(out Position, "Position");
            North = new BumperSide(element.ElementCaseInsensitive("North"));
            East = new BumperSide(element.ElementCaseInsensitive("East"));
            South = new BumperSide(element.ElementCaseInsensitive("South"));
            West = new BumperSide(element.ElementCaseInsensitive("West"));
        }

        public bool AutoStart = true;
        public Point3D16 Position;
        public BumperSide North, East, South, West; // assuming north as -Y in blockspace, top-right in screenspace

        private readonly Bumpers parent;
        private string id;
        public string ID { get { if (!IDGenerated) id = parent.RequestID(); return id; } set { id = value; } }
        public bool IDGenerated { get { return !string.IsNullOrWhiteSpace(id); } }

        public void Write(BinaryWriter writer)
        {
            writer.Write(AutoStart);
            Position.Write(writer);
            North.Write(writer);
            East.Write(writer);
            South.Write(writer);
            West.Write(writer);
        }

        public XElement GetXElement()
        {
            var result = new XElement("Bumper");
            if (IDGenerated) result.SetAttributeValue("ID", ID);
            result.SetAttributeValueWithDefault("AutoStart", AutoStart, true);
            result.SetAttributeValue("Position", Position);
            result.SetElementWithDefault("North", North);
            result.SetElementWithDefault("East", East);
            result.SetElementWithDefault("South", South);
            result.SetElementWithDefault("West", West);
            return result;
        }
    }
    public sealed class BumperSide : IXElementWithDefault
    {
        public BumperSide()
        {
        }
        public BumperSide(BinaryReader reader)
        {
            StartDelay = reader.ReadInt16();
            PulseRate = reader.ReadInt16();
        }
        public BumperSide(XElement element)
        {
            if (element == null)
            {
                StartDelay = PulseRate = -1;
                return;
            }
            element.GetAttributeValueWithDefault(out StartDelay, "StartDelay");
            element.GetAttributeValueWithDefault(out PulseRate, "PulseRate");
        }

        public short StartDelay, PulseRate;

        public void Write(BinaryWriter writer)
        {
            writer.Write(StartDelay);
            writer.Write(PulseRate);
        }

        public XElement GetXElement()
        {
            return GetXElement("BumperSide");
        }

        public XElement GetXElement(XName name)
        {
            if (IsDefault()) return null;
            var result = new XElement(name);
            result.SetAttributeValueWithDefault("StartDelay", StartDelay);
            result.SetAttributeValueWithDefault("PulseRate", PulseRate);
            return result;
        }

        public bool IsDefault()
        {
            return StartDelay == -1 && PulseRate == -1;
        }
    }

    public sealed class FallingPlatform : IXElement
    {
        public FallingPlatform()
        {
        }
        public FallingPlatform(BinaryReader reader)
        {
            Position = new Point3D16(reader);
            if (Position.Z <= 0) Warning.WriteLine("FallingPlatform/@Position 的 Z 坐标小于等于 0！在破解版游戏中运行该关会导致崩溃。");
            FloatTime = reader.ReadUInt16();
        }
        public FallingPlatform(XElement element)
        {
            element.GetAttributeValue(out Position, "Position");
            element.GetAttributeValueWithDefault(out FloatTime, "FloatTime", (ushort) 20);
        }

        public Point3D16 Position;
        public ushort FloatTime = 20;

        public void Write(BinaryWriter writer)
        {
            Position.Write(writer);
            writer.Write(FloatTime);
        }

        public XElement GetXElement()
        {
            var result = new XElement("FallingPlatform");
            result.SetAttributeValue("Position", Position);
            result.SetAttributeValueWithDefault("FloatTime", FloatTime, (ushort)20);
            return result;
        }
    }

    public sealed class Checkpoint : IXElement
    {
        public Checkpoint()
        {
        }
        public Checkpoint(BinaryReader reader)
        {
            Position = new Point3D16(reader);
            RespawnOffsetZ = reader.ReadUInt16();
            Radius = new Point2D8(reader);
        }
        public Checkpoint(XElement element)
        {
            element.GetAttributeValue(out Position, "Position");
            element.GetAttributeValueWithDefault(out RespawnOffsetZ, "RespawnOffsetZ");
            element.GetAttributeValueWithDefault(out Radius, "Radius");
        }

        public Point3D16 Position;
        public ushort RespawnOffsetZ;
        public Point2D8 Radius;

        public void Write(BinaryWriter writer)
        {
            Position.Write(writer);
            writer.Write(RespawnOffsetZ);
            Radius.Write(writer);
        }

        public XElement GetXElement()
        {
            var result = new XElement("Checkpoint");
            result.SetAttributeValue("Position", Position);
            result.SetAttributeValueWithDefault("RespawnOffsetZ", RespawnOffsetZ);
            result.SetAttributeValueWithDefault("Radius", Radius);
            return result;
        }
    }

    public sealed class CameraTrigger : IXElement
    {
        public CameraTrigger()
        {
        }
        public CameraTrigger(BinaryReader reader)
        {
            Position = new Point3D16(reader);
            Zoom = reader.ReadInt16();
            Radius = new Point2D8(reader);
            if (Zoom != -1) return;
            Reset = reader.ReadBoolean();
            StartDelay = reader.ReadUInt16();
            Duration = reader.ReadUInt16();
            Value = reader.ReadInt16();
            SingleUse = reader.ReadBoolean();
            ValueIsAngle = reader.ReadBoolean();
        }
        public CameraTrigger(XElement element)
        {
            element.GetAttributeValue(out Position, "Position");
            element.GetAttributeValueWithDefault(out Radius, "Radius");
            if (element.Name == "CameraTrigger") element.GetAttributeValueWithDefault(out Zoom, "Zoom");
            else
            {
                Zoom = -1;
                element.GetAttributeValueWithDefault(out Reset, "Reset");
                element.GetAttributeValueWithDefault(out StartDelay, "StartDelay");
                element.GetAttributeValueWithDefault(out Duration, "Duration");
                element.GetAttributeValueWithDefault(out SingleUse, "SingleUse");
                element.GetAttributeValueWithDefault(out Value,
                    (ValueIsAngle = element.GetAttributeValue("Angle") != null) ? "Angle" : "FieldOfView");
            }
        }

        public Point3D16 Position;
        public short Zoom, Value;
        public Point2D8 Radius;
        public bool Reset;
        public ushort StartDelay, Duration;
        public bool SingleUse, ValueIsAngle;

        public void Write(BinaryWriter writer)
        {
            Position.Write(writer);
            writer.Write(Zoom);
            Radius.Write(writer);
            if (Zoom != -1) return;
            writer.Write(Reset);
            writer.Write(StartDelay);
            writer.Write(Duration);
            writer.Write(Value);
            writer.Write(SingleUse);
            writer.Write(ValueIsAngle);
        }

        public XElement GetXElement()
        {
            var result = new XElement(Zoom == -1 ? "AdvancedCameraTrigger" : "CameraTrigger");
            result.SetAttributeValue("Position", Position);
            result.SetAttributeValueWithDefault("Radius", Radius);
            if (Zoom == -1)
            {
                result.SetAttributeValueWithDefault("Reset", Reset);
                result.SetAttributeValueWithDefault("StartDelay", StartDelay);
                result.SetAttributeValueWithDefault("Duration", Duration);
                result.SetAttributeValueWithDefault("SingleUse", SingleUse);
                result.SetAttributeValueWithDefault(ValueIsAngle ? "Angle" : "FieldOfView", Value);
            }
            else result.SetAttributeValueWithDefault("Zoom", Zoom);
            return result;
        }
    }

    public sealed class Prism : IXElement
    {
        public Prism()
        {
        }
        public Prism(BinaryReader reader)
        {
            Position = new Point3D16(reader);
            Energy = reader.ReadByte();
            if (Energy != 1) Warning.WriteLine("@Energy 已过时，请勿使用。");
        }
        public Prism(XElement element)
        {
            element.GetAttributeValue(out Position, "Position");
            element.GetAttributeValueWithDefault(out Energy, "Energy", (byte)1);
            if (Energy != 1) Warning.WriteLine("@Energy 已过时，请勿使用。");
        }

        public Point3D16 Position;
        [Obsolete]
        public byte Energy = 1;

        public void Write(BinaryWriter writer)
        {
            Position.Write(writer);
            writer.Write(Energy);
        }

        public XElement GetXElement()
        {
            var result = new XElement("Prism");
            result.SetAttributeValue("Position", Position);
            result.SetAttributeValueWithDefault("Energy", Energy, (byte)1);
            return result;
        }
    }

    public sealed class Buttons : XElementObjectListWithID<Button>
    {
        public Buttons(Level parent)
        {
            Parent = parent;
        }
        public Buttons(Level parent, BinaryReader reader) : this(parent)
        {
            var count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) BlockEvents.Add(new BlockEvent(parent, reader));
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) Add(new Button(this, reader));
        }

        public readonly Level Parent;
        public XSerializableList<BlockEvent> BlockEvents = new XSerializableList<BlockEvent>();

        public override void Write(BinaryWriter writer)
        {
            BlockEvents.Write(writer);
            base.Write(writer);
        }
        public override IEnumerable<XElement> GetXElements()
        {
            var dic = new Dictionary<int, XElement>();
            var children = new List<Button>();
            for (var i = 0; i < Count; i++) switch (this[i].Type)
            {
                case ButtonType.Standalone:
                {
                    var button = this[i];
                    var element = button.GetXElement();
                    AddEvents(element, button);
                    yield return element;
                    break;
                }
                case ButtonType.ButtonSequence:
                {
                    var button = this[i];
                    var sequence = new XElement("ButtonSequence");
                    sequence.SetAttributeValueWithDefault("SequenceInOrder", button.SequenceInOrder);
                    AddEvents(sequence, button);
                    sequence.Add(button.GetXElement());
                    dic.Add(i, sequence);
                    break;
                }
                case ButtonType.Children:
                {
                    children.Add(this[i]);
                    break;
                }
            }
            foreach (var child in children) dic[child.ParentID].Add(child.GetXElement());
            foreach (var pair in dic) yield return pair.Value;
        }

        private void AddEvents(XElement element, Button button)
        {
            var builders = new StringBuilder[4];
            foreach (var e in button.Events)
            {
                var ev = BlockEvents[e];
                var index = (int) ev.Type;
                if (builders[index] == null) builders[index] = new StringBuilder(ev.ToString());
                else builders[index].Append(',' + ev.ToString());
            }
            for (var i = 0; i < 4; i++) if (builders[i] != null)
                element.SetAttributeValue(((BlockEventType)i).ToString() + 's', builders[i].ToString());
        }
        public IEnumerable<ushort> AddEvents(XElement element)
        {
            for (var i = 0; i < 4; i++)
            {
                var type = (BlockEventType) i;
                var attr = element.GetAttributeValue(type.ToString() + 's');
                if (attr == null) continue;
                foreach (var e in attr.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries)
                                      .Select(str => BlockEvent.Parse(Parent, type, str)))
                {
                    yield return (ushort) BlockEvents.Count;
                    BlockEvents.Add(e);
                }
            }
        }

        public byte GetSiblingsCount(Button button)
        {
            return (byte) this.Count(child => child.ParentID != -1 && this[child.ParentID] == button);
        }

        protected override string RequestIDCore()
        {
            return "Button" + base.RequestIDCore();
        }
    }
    public sealed class Button : IXElement, IWithID
    {
        public Button(Buttons parent)
        {
            this.parent = parent;
        }
        public Button(Buttons parent, BinaryReader reader) : this(parent)
        {
            Visible = (NullableBoolean)reader.ReadByte();
            PressCount = reader.ReadByte();
            Mode = (ButtonMode) reader.ReadByte();
            ParentID = reader.ReadInt16();
            SequenceInOrder = reader.ReadBoolean();
            reader.ReadByte();  // Siblings count is useless at this point
            if (IsMoving = reader.ReadBoolean())
                MovingBlockID = new IDReference<MovingPlatform>(parent.Parent.MovingPlatforms, reader.ReadInt16());
            else Position = new Point3D16(reader);
            var count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) Events.Add(reader.ReadUInt16());
        }
        public Button(Buttons parent, XElement element) : this(parent)
        {
            var parentID = (short)parent.Count;
            foreach (var e in element.Elements())
                if (initialized)
                    new Button(parent, e) { Mode = ButtonMode.StayDown, SequenceInOrder = SequenceInOrder, ParentID = parentID };
                else
                {
                    Initialize(e);
                    Events = new List<ushort>(parent.AddEvents(element));
                    Mode = ButtonMode.StayDown; // force set this again
                    element.GetAttributeValueWithDefault(out SequenceInOrder, "SequenceInOrder");
                }
            if (initialized) return;
            Initialize(element);
            Events = new List<ushort>(parent.AddEvents(element));
        }
        private void Initialize(XElement element)
        {
            initialized = true;
            id = element.GetAttributeValue("ID");
            if (id != null) id = id.Trim();
            element.GetAttributeValueWithDefault(out Visible, "Visible", NullableBoolean.True);
            element.GetAttributeValueWithDefault(out PressCount, "PressCount");
            element.GetAttributeValueWithDefault(out Mode, "Mode", ButtonMode.StayDown);
            if (IsMoving = element.GetAttributeValue("MovingBlockID") != null)
                MovingBlockID = new IDReference<MovingPlatform>(parent.Parent.MovingPlatforms, element.GetAttributeValue("MovingBlockID"));
            else element.GetAttributeValueWithDefault(out Position, "Position");
            parent.Add(this);
        }

        private bool initialized;

        private readonly Buttons parent;
        private string id;
        public string ID { get { if (!IDGenerated) id = parent.RequestID(); return id; } set { id = value; } }
        public bool IDGenerated { get { return !string.IsNullOrWhiteSpace(id); } }

        public NullableBoolean Visible = NullableBoolean.True;
        public byte PressCount;
        public ButtonMode Mode = ButtonMode.StayDown;
        public short ParentID = -1;
        public bool SequenceInOrder;
        public bool IsMoving;
        public IDReference<MovingPlatform> MovingBlockID;
        public Point3D16 Position;
        public List<ushort> Events = new List<ushort>();

        public ButtonType Type
        {
            get
            {
                if (Mode == ButtonMode.StayDown)
                    if (ParentID == -1)
                    {
                        if (parent.GetSiblingsCount(this) > 0) return ButtonType.ButtonSequence;
                    }
                    else if (parent[ParentID] != this && parent[ParentID].Type == ButtonType.ButtonSequence) return ButtonType.Children;
                return ButtonType.Standalone;
            }
        }

        public void Write(BinaryWriter writer)
        {
            writer.Write((byte)Visible);
            writer.Write(PressCount);
            writer.Write((byte) Mode);
            writer.Write(ParentID);
            writer.Write(SequenceInOrder);
            writer.Write(parent.GetSiblingsCount(this));
            writer.Write(IsMoving);
            if (IsMoving) writer.Write(MovingBlockID.Index);
            else Position.Write(writer);
            writer.Write((ushort) Events.Count);
            foreach (var e in Events) writer.Write(e);
        }

        public XElement GetXElement()
        {
            var type = Type;
            var result = new XElement("Button");
            if (IDGenerated) result.SetAttributeValue("ID", ID);
            result.SetAttributeValueWithDefault("Visible", Visible, NullableBoolean.True);
            result.SetAttributeValueWithDefault("PressCount", PressCount);
            if (type == ButtonType.Standalone) result.SetAttributeValueWithDefault("Mode", Mode, ButtonMode.StayDown);
            if (IsMoving) result.SetAttributeValueWithDefault("MovingBlockID", MovingBlockID.Name);
            else result.SetAttributeValue("Position", Position);
            return result;
        }
    }
    public enum ButtonMode : byte
    {
        Toggle, StayUp, StayDown
    }
    public enum ButtonType : byte
    {
        Standalone, ButtonSequence, Children
    }
    public sealed class BlockEvent : IXSerializable, IEquatable<BlockEvent>
    {
        public BlockEvent(Level parent)
        {
            this.parent = parent;
        }
        public BlockEvent(Level parent, BinaryReader reader) : this(parent)
        {
            Type = (BlockEventType)reader.ReadByte();
            id = new IDReference(reader.ReadInt16());
            Payload = reader.ReadUInt16();
        }

        private readonly Level parent;

        public BlockEventType Type;
        public ushort Payload;
        private IDReference id;

        public IIDReference ID
        {
            get
            {
                switch (Type)
                {
                    case BlockEventType.AffectMovingPlatform: return new IDReference<MovingPlatform>(parent.MovingPlatforms, id);
                    case BlockEventType.AffectBumper: return new IDReference<Bumper>(parent.Bumpers, id);
                    case BlockEventType.TriggerAchievement: return new NormalID(id);
                    case BlockEventType.AffectButton: return new IDReference<Button>(parent.Buttons, id);
                    default: return id;
                }
            }
            set { id = (IDReference) value; }
        }

        public void Write(BinaryWriter writer)
        {
            writer.Write((byte)Type);
            writer.Write(ID.Index);
            writer.Write(Payload);
        }

        private static readonly Regex Parser = new Regex(@"([^\(]*)(\((.*?)\))?", RegexOptions.Compiled);

        public override int GetHashCode()
        {
            unchecked
            {
                // ReSharper disable NonReadonlyFieldInGetHashCode
                var hashCode = (int)Type;
                hashCode = (hashCode * 397) ^ Payload.GetHashCode();
                hashCode = (hashCode * 397) ^ id.Index.GetHashCode();
                return hashCode;
                // ReSharper restore NonReadonlyFieldInGetHashCode
            }
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            return obj is BlockEvent && Equals((BlockEvent) obj);
        }

        public bool Equals(BlockEvent other)
        {
            if (ReferenceEquals(null, other)) return false;
            if (ReferenceEquals(this, other)) return true;
            return Type == other.Type && Payload == other.Payload && Equals(id, other.id);
        }

        public override string ToString()
        {
            return Payload == 0 ? ID.Name : string.Format("{0} ({1})", ID.Name, Payload);
        }

        public static BlockEvent Parse(Level parent, BlockEventType type, string value)
        {
            var match = Parser.Match(value);
            if (!match.Success) throw new FormatException("无法识别！");
            var result = new BlockEvent(parent) { Type = type, id = new IDReference(match.Groups[1].Value.Trim()) };
            if (match.Groups[3].Success) result.Payload = ushort.Parse(match.Groups[3].Value.Trim());
            return result;
        }
    }
    public enum BlockEventType : byte
    {
        AffectMovingPlatform, AffectBumper, TriggerAchievement, AffectButton
    }

    public sealed class OtherCube : IXElement
    {
        public OtherCube()
        {
        }
        public OtherCube(Level parent, BinaryReader reader)
        {
            PositionTrigger = new Point3D16(reader);
            MovingBlockSync = new IDReference<MovingPlatform>(parent.MovingPlatforms, reader.ReadInt16());
            if (MovingBlockSync.Index == -2)
            {
                DarkCubeRadius = new Point2D8(reader);
                DarkCubeMovingBlockSync = new IDReference<MovingPlatform>(parent.MovingPlatforms, reader.ReadInt16());
            }
            var count = reader.ReadUInt16();
            PositionCube = new Point3D16(reader);
            for (var i = 0; i < count; i++) KeyEvents.Add(new KeyEvent(reader));
        }
        public OtherCube(Level parent, XElement element)
        {
            element.GetAttributeValue(out PositionTrigger, "PositionTrigger");
            var id = element.GetAttributeValue("MovingBlockSync");
            var sync = id == null ? new IDReference<MovingPlatform>(parent.MovingPlatforms, -1)
                                  : new IDReference<MovingPlatform>(parent.MovingPlatforms, id);
            element.GetAttributeValueWithDefault(out DarkCubeRadius, "Radius");
            element.GetAttributeValue(out PositionCube, "PositionCube");
            foreach (var e in element.Elements())
                try
                {
                    KeyEvents.Add(new KeyEvent(e));
                }
                catch
                {
                    if (!e.Name.LocalName.Equals("MovingPlatform", StringComparison.InvariantCultureIgnoreCase)
                        && !e.Name.LocalName.Equals("Button", StringComparison.InvariantCultureIgnoreCase))
                        Warning.WriteLine(element.Name + " 有无法识别的子元素：" + e.Name);
                }
            if (element.Name == "OtherCube")
            {
                MovingBlockSync = sync;
                var mode = element.GetAttributeValueWithDefault("Mode", OtherCubeMode.AutoHide);
                var moveDirection = element.GetAttributeValueWithDefault("MoveDirection", GetDefaultDirection(mode));
                if (mode == OtherCubeMode.Hole) PositionTrigger -= moveDirection;
                AddHelper(parent, mode, PositionTrigger, moveDirection, element);
                if (DarkCubeRadius.Equals(default(Point2D8))) return;
                var radius = DarkCubeRadius;
                DarkCubeRadius = default(Point2D8);
                for (var x = -radius.X; x <= radius.X; x++) for (var y = -radius.Y; y <= radius.Y; y++) if (x != 0 || y != 0)
                {
                    var position = PositionTrigger + new Point3D16((short) x, (short) y, 0);
                    parent.OtherCubes.Add(new OtherCube { PositionTrigger = position, MovingBlockSync = MovingBlockSync,
                                                          PositionCube = PositionCube, KeyEvents = KeyEvents });
                    AddHelper(parent, mode, position, moveDirection, element);
                }
            }
            else
            {
                MovingBlockSync = new IDReference<MovingPlatform>(parent.MovingPlatforms, -2);
                DarkCubeMovingBlockSync = sync;
            }
        }

        private static Point3D16 GetDefaultDirection(OtherCubeMode mode)
        {
            switch (mode)
            {
                case OtherCubeMode.MoveAway: return new Point3D16(0, -1, 0);
                case OtherCubeMode.Hole: return new Point3D16(0, 0, 1);
                default: return default(Point3D16);
            }
        }

        private static void AddHelper(Level level, OtherCubeMode mode, Point3D16 position, Point3D16 moveDirection,
                                      XContainer container)
        {
            if (mode == OtherCubeMode.AutoHide) return;
            var child = container.ElementCaseInsensitive("Button");
            if (child == null) level.Buttons.Add(new Button(level.Buttons) { Position = position, Visible = NullableBoolean.False, 
                                                            Events = new List<ushort> { (ushort) level.Buttons.BlockEvents.Count } });
            else
            {
                var button = new Button(level.Buttons, child) { Position = child.GetAttributeValueWithDefault("Position", position),
                    Visible = child.GetAttributeValueWithDefault("Visible", NullableBoolean.False) };
                button.Events.Add((ushort)level.Buttons.BlockEvents.Count);
            }
            level.Buttons.BlockEvents.Add(new BlockEvent(level)
                { ID = new IDReference((short) level.MovingPlatforms.Count), Type = BlockEventType.AffectMovingPlatform });
            child = container.ElementCaseInsensitive("MovingPlatform");
            MovingPlatform platform;
            if (child == null) platform = new MovingPlatform(level.MovingPlatforms) { AutoStart = false, LoopStartIndex = 0 };
            else
            {
                platform = new MovingPlatform(level.MovingPlatforms, child) {
                    AutoStart = child.GetAttributeValueWithDefault<bool>("AutoStart"),
                    LoopStartIndex = child.GetAttributeValueWithDefault<byte>("LoopStartIndex")
                };
            }
            if (platform.Waypoints.Count == 0)
            {
                platform.Waypoints.Add(new Waypoint { Position = position });
                platform.Waypoints.Add(new Waypoint { Position = position + moveDirection, 
                                                      TravelTime = (ushort) (mode == OtherCubeMode.Hole ? 1 : 32000) });
            }
            level.MovingPlatforms.Add(platform);
        }

        public Point3D16 PositionTrigger;
        public IDReference<MovingPlatform> MovingBlockSync;
        public Point2D8 DarkCubeRadius;
        public IDReference<MovingPlatform> DarkCubeMovingBlockSync;
        public Point3D16 PositionCube;
        public XElementObjectList<KeyEvent> KeyEvents = new XElementObjectList<KeyEvent>();

        public void Write(BinaryWriter writer)
        {
            PositionTrigger.Write(writer);
            writer.Write(MovingBlockSync.Index);
            if (MovingBlockSync.Index == -2)
            {
                DarkCubeRadius.Write(writer);
                writer.Write(DarkCubeMovingBlockSync.Index);
            }
            writer.Write((ushort) KeyEvents.Count);
            PositionCube.Write(writer);
            KeyEvents.WriteCore(writer);
        }

        public XElement GetXElement()
        {
            var result = new XElement(MovingBlockSync.Index == -2 ? "DarkCube" : "OtherCube");
            result.SetAttributeValue("PositionTrigger", PositionTrigger);
            if (MovingBlockSync.Index == -2)
            {
                result.SetAttributeValueWithDefault("Radius", DarkCubeRadius);
                result.SetAttributeValueWithDefault("MovingBlockSync", DarkCubeMovingBlockSync.Name);
            }
            else result.SetAttributeValueWithDefault("MovingBlockSync", MovingBlockSync.Name);
            result.SetAttributeValue("PositionCube", PositionCube);
            foreach (var e in KeyEvents.GetXElements()) result.Add(e);
            return result;
        }
    }
    public enum OtherCubeMode
    {
        AutoHide, MoveAway, Hole
    }
    public sealed class KeyEvent : IXElement
    {
        public KeyEvent()
        {
        }
        public KeyEvent(BinaryReader reader)
        {
            TimeOffset = reader.ReadUInt16();
            Direction = (Direction) reader.ReadByte();
            EventType = (KeyEventType) reader.ReadByte();
        }
        public KeyEvent(XElement element)
        {
            Direction = new[] { Direction.West, Direction.East, Direction.North, Direction.South }
                .First(dir => element.Name.LocalName.StartsWith(dir.ToString(), StringComparison.Ordinal));
            EventType = new[] { KeyEventType.Down, KeyEventType.Up }
                .First(dir => element.Name.LocalName.EndsWith(dir.ToString(), StringComparison.Ordinal));
            element.GetAttributeValueWithDefault(out TimeOffset, "TimeOffset");
        }

        public ushort TimeOffset;
        public Direction Direction;
        public KeyEventType EventType;

        public void Write(BinaryWriter writer)
        {
            writer.Write(TimeOffset);
            writer.Write((byte) Direction);
            writer.Write((byte) EventType);
        }

        public XElement GetXElement()
        {
            var result = new XElement(Direction.ToString() + EventType);
            result.SetAttributeValueWithDefault("TimeOffset", TimeOffset);
            return result;
        }
    }
    public enum Direction : byte
    {
        West, East, North, South
    }
    public enum KeyEventType : byte
    {
        Down, Up
    }

    public sealed class Resizer : IXElement
    {
        public Resizer()
        {
        }
        public Resizer(BinaryReader reader)
        {
            Position = new Point3D16(reader);
            Visible = reader.ReadBoolean();
            Direction = (ResizeDirection) reader.ReadByte();
        }
        public Resizer(Level parent, XElement element)
        {
            Direction = (ResizeDirection)Enum.Parse(typeof(ResizeDirection), element.Name.LocalName.Remove(0, 7), true);
            element.GetAttributeValue(out Position, "Position");
            element.GetAttributeValueWithDefault(out Visible, "Visible", true);
            var radius = element.GetAttributeValueWithDefault<Point2D8>("Radius");
            if (radius.Equals(default(Point2D8))) return;
            for (var x = -radius.X; x <= radius.X; x++) for (var y = -radius.Y; y <= radius.Y; y++) if (x != 0 || y != 0)
                parent.Resizers.Add(new Resizer { Position = Position + new Point3D16((short)x, (short)y, 0), 
                                                  Visible = Visible, Direction = Direction });
        }

        public Point3D16 Position;
        public bool Visible = true;
        public ResizeDirection Direction;

        public void Write(BinaryWriter writer)
        {
            Position.Write(writer);
            writer.Write(Visible);
            writer.Write((byte) Direction);
        }

        public XElement GetXElement()
        {
            var result = new XElement("Resizer" + Direction);
            result.SetAttributeValue("Position", Position);
            result.SetAttributeValueWithDefault("Visible", Visible, true);
            return result;
        }
    }
    public enum ResizeDirection : byte
    {
        Shrink, Grow
    }

    [Obsolete]
    public sealed class Fan : IXElement
    {
        [Obsolete]
        public Fan()
        {
        }
        [Obsolete]
        public Fan(BinaryReader reader)
        {
        }
        [Obsolete]
        public Fan(XElement element)
        {
        }

        [Obsolete]
        public void Write(BinaryWriter writer)
        {
        }
        [Obsolete]
        public XElement GetXElement()
        {
            return new XElement("Fan");
        }
    }
    [Obsolete]
    public sealed class MiniBlock : IXElement
    {
        [Obsolete]
        public MiniBlock()
        {
        }
        [Obsolete]
        public MiniBlock(BinaryReader reader)
        {
        }
        [Obsolete]
        public MiniBlock(XElement element)
        {
        }

        [Obsolete]
        public void Write(BinaryWriter writer)
        {
        }
        [Obsolete]
        public XElement GetXElement()
        {
            return new XElement("MiniBlock");
        }
    }
}
