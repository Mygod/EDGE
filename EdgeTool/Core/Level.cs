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
using LibTwoTribes;
using LibTwoTribes.Util;
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
        private Level(BinaryReader reader)
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
            if (Temp1 != temp)
                Warning.WriteLine(string.Format("Level 元素：unknown_ushort_1 数值错误！将被自动纠正：{0} => {1}", temp, Temp1));
            temp = reader.ReadUInt16();
            if (Temp2 != temp)
                Warning.WriteLine(string.Format("Level 元素：unknown_ushort_2 数值错误！将被自动纠正：{0} => {1}", temp, Temp2));
            ushort width = reader.ReadUInt16(), length = reader.ReadUInt16();
            var tempByte = reader.ReadByte();
            if (tempByte != 10) Warning.WriteLine(string.Format("Level 元素：unknown_byte_1 数值错误！将被自动纠正：{0} => 10", tempByte));
            temp = reader.ReadUInt16();
            if (Size.Length - 1 != temp)
                Warning.WriteLine(string.Format("Level 元素：unknown_ushort_5 数值错误！将被自动纠正：{0} => {1}", temp, Size.Length - 1));
            temp = reader.ReadUInt16();
            if (0 != temp) Warning.WriteLine(string.Format("Level 元素：unknown_ushort_6 数值错误！将被自动纠正：{0} => 0", temp));
            #endregion
            LegacyMinimap = new Flat(reader, new Size2D(width, length));
            CollisionMap = new Cube(reader, Size);
            SpawnPoint = new Point3D16(reader);
            Zoom = reader.ReadInt16();
            if (Zoom < 0)
            {
                Value = reader.ReadInt16();
                ValueIsAngle = reader.ReadBoolean();
            }
            ExitPoint = new Point3D16(reader);
            var count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) MovingPlatforms.Add(new MovingPlatform(MovingPlatforms, reader));
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) Bumpers.Add(new Bumper(Bumpers, reader));
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) FallingPlatforms.Add(new FallingPlatform(this, reader));
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) Checkpoints.Add(new Checkpoint(reader));
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) CameraTriggers.Add(new CameraTrigger(reader));
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) Prisms.Add(new Prism(reader));
            if (count != prismsCount)
                Warning.WriteLine(string.Format("Level 元素：prisms_count 数值错误！将被自动纠正：{0} => {1}", prismsCount, count));
            if ((count = reader.ReadUInt16()) > 0) Warning.WriteLine("Fan 元素：已过时，请勿使用。");
            for (var i = 0; i < count; i++) Fans.Add(new Fan(reader));
            Buttons = new Buttons(this, reader);
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) OtherCubes.Add(new OtherCube(this, reader));
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) Resizers.Add(new Resizer(this, reader));
            if ((count = reader.ReadUInt16()) > 0) Warning.WriteLine("MiniBlock 元素：已过时，请勿使用。");
            for (var i = 0; i < count; i++) MiniBlocks.Add(new MiniBlock(reader));
            Theme = reader.ReadByte();
            MusicJava = reader.ReadByte();
            Music = reader.ReadByte();
            foreach (var button in Buttons)
            {
                if (button.IsMoving) button.MovingPlatformID.Name.DoNothing();
                foreach (var e in button.Events) Buttons.BlockEvents[e].ID.Name.DoNothing();
            }
            foreach (var cube in OtherCubes)
            {
                cube.MovingBlockSync.Name.DoNothing();
                if (cube.DarkCubeMovingBlockSync != null) cube.DarkCubeMovingBlockSync.Name.DoNothing();
            }
        }
        private Level(string path)
        {
            LegacyMinimap = Flat.LoadFromImage(path + ".png");
            var element = XHelper.Load(path + ".xml").GetElement("Level");
            ID = element.GetAttributeValue<int>("ID");
            Name = element.GetAttributeValue("Name");
            var thresholds = element.GetAttributeValue("TimeThresholds").Split(',').Select(str => ushort.Parse(str.Trim())).ToArray();
            SPlusTime = thresholds[0];
            STime = thresholds[1];
            ATime = thresholds[2];
            BTime = thresholds[3];
            CTime = thresholds[4];
            Size = element.GetAttributeValue<Size3D>("Size");
            CollisionMap = new Cube(path + ".{0}.png", Size);
            SpawnPoint = element.GetAttributeValue<Point3D16>("SpawnPoint");
            ExitPoint = element.GetAttributeValue<Point3D16>("ExitPoint");
            Theme = element.GetAttributeValueWithDefault<byte>("Theme");
            MusicJava = element.GetAttributeValueWithDefault<byte>("MusicJava");
            Music = element.GetAttributeValueWithDefault("Music", (byte)6);
            Zoom = element.GetAttributeValueWithDefault("Zoom", (short)-1);
            var advanced = true;
            if (ValueIsAngle = element.AttributeCaseInsensitive("Angle") != null)
            {
                Value = element.GetAttributeValueWithDefault<short>("Angle");
                if (element.AttributeCaseInsensitive("FieldOfView") != null)
                    Warning.WriteLine("Level 元素：@Angle 与 @FieldOfView 被同时设置！@FieldOfView 将会被忽略。");
            }
            else if (element.AttributeCaseInsensitive("FieldOfView") != null)
                Value = element.GetAttributeValueWithDefault<short>("FieldOfView");
            else advanced = false;
            if (Zoom > 0 && advanced) Warning.WriteLine("Level 元素：高级相机模式被禁用！@Angle 或 @FieldOfView 将被忽略。" +
                                                        "要启用请将 @Zoom 删去或设为负值。");
            element.GetAttributeValueWithDefault(out StaticBlocks, "StaticBlocks");
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
                        FallingPlatforms.Add(new FallingPlatform(this, e));
                        break;
                    case "checkpoint":
                        Checkpoints.Add(new Checkpoint(e));
                        break;
                    case "cameratrigger":
                        CameraTriggers.Add(new CameraTrigger(e));
                        break;
                    case "prism":
                        Prisms.Add(new Prism(e));
                        break;
                    case "fan":
                        Fans.Add(new Fan(e));
                        Warning.WriteLine("Fan 元素：已过时，请勿使用。");
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
                        Warning.WriteLine("MiniBlock 元素：已过时，请勿使用。");
                        break;
                    default:
                        Warning.WriteLine(e.Name + " 元素：无法识别在 Level 元素下的该子元素，它将被忽略。");
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
            return new Level(path);
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
        public Point3D16 ExitPoint
        {
            get { return exitPoint; }
            set
            {
                exitPoint = value;
                if (!Size.IsCubeInArea(value)) Warning.WriteLine("Level 元素：@ExitPoint 超出关卡大小！这会导致游戏崩溃！");
            }
        }
        public short Zoom
        {
            get { return zoom; }
            set
            {
                zoom = value;
                if (value == 0 || value > 5) Warning.WriteLine("Level 元素：@Zoom 超出范围！在实际游戏中将使用 1 级缩放。");
            }
        }
        public short Value
        {
            get { return value; }
            set
            {
                this.value = value;
                if (value > 184) Warning.WriteLine("Level 元素：@Angle 或 @FieldOfView 大于 184！在实际游戏中将使用 184。");
            }
        }
        public byte Theme
        {
            get { return theme; }
            set
            {
                theme = value;
                if (theme > 3) Warning.WriteLine("Level 元素：@Theme 超出范围！在实际游戏中的显示效果将使用白色主题（0）。");
            }
        }
        public byte MusicJava
        {
            get { return musicJava; }
            set
            {
                musicJava = value;
                if (value > 11) Warning.WriteLine("Level 元素：@MusicJava 超出范围！在实际游戏中将播放 00_menus。");
            }
        }
        public byte Music
        {
            get { return music; }
            set
            {
                music = value;
                if (value > 24) Warning.WriteLine("Level 元素：@Music 超出范围！在实际游戏中将播放 06_Kakkoi。");
            }
        }

        private Point3D16 exitPoint;
        private short zoom, value;
        private byte theme, musicJava, music;

        public StaticBlocksOperation StaticBlocks;
        public bool ValueIsAngle;
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

        static Level()
        {
            Vec3 x = new Vec3(1, 0, 0), y = new Vec3(0, 1, 0), z = new Vec3(0, 0, 1);
            XNormals = new[] { x, x, x, x, x, x };
            YNormals = new[] { y, y, y, y, y, y };
            ZNormals = new[] { z, z, z, z, z, z };
        }
        private const string ModelsNamespace = "050DB82A";
        private static readonly string[] ChildModels = new[] { "4B2B74E0", "A261604B", "DCB465C9", "04166BFF" },
                                         Materials = new[] { "F7501547", "1E1A01EC", "60CF046E", "B86D0A58" };
        private static readonly Vec3[] XNormals, YNormals, ZNormals;    // normals for two triangles

        public void Compile(string path)
        {
            FilePath = path;
            var level = this;
            switch (StaticBlocks)
            {
                case StaticBlocksOperation.ToMovingPlatforms:
                case StaticBlocksOperation.ToMovingPlatformsGlowing:
                    level = (Level) MemberwiseClone();
                    level.MovingPlatforms = new MovingPlatforms(MovingPlatforms);   // there's no need to copy other stuff
                    var glowing = StaticBlocks == StaticBlocksOperation.ToMovingPlatformsGlowing;
                    for (short x = 0; x < level.Size.Width; x++) for (short y = 0; y < level.Size.Length; y++)
                        for (short z = 0; z < level.Size.Height; z++) if (level.CollisionMap[x, y, z])
                        {
                            var platform = new MovingPlatform(level.MovingPlatforms);
#pragma warning disable 665
                            platform.LoopStartIndex = (byte)((platform.AutoStart = glowing) ? 1 : 0);
#pragma warning restore 665
                            platform.Waypoints.Add(new Waypoint { Position = new Point3D16(x, y, (short)(z + 1)) });
                            if (z == 0) platform.FullBlock = false;
                            level.MovingPlatforms.Add(platform);
                        }
                    break;
                case StaticBlocksOperation.ToModel:
                    List<Vec3> vertices = new List<Vec3>(), normals = new List<Vec3>();
                    var texCoords = new List<Vec2>();
                    for (short x = 0; x < level.Size.Width; x++) for (short y = 0; y < level.Size.Length; y++)
                        for (short z = 0; z < level.Size.Height; z++) if (level.CollisionMap[x, y, z])
                        {
                            int x1 = x + 1, y1 = y + 1, z1 = z + 1;
                            float texY, texY1, zB;
                            if (z > 3) texY = texY1 = 0;
                            else
                            {
                                texY1 = 1 - (z > 3 ? 3 : z) * 0.25F;
                                texY = texY1 - 0.25F;
                            }
                            if (!level.CollisionMap[x, y, z1] &&
                                (Math.Abs(x - ExitPoint.X) > 1 || Math.Abs(y - ExitPoint.Y) > 1 || z != ExitPoint.Z - 1))
                            {
                                vertices.Add(new Vec3(x, z1, y));
                                vertices.Add(new Vec3(x1, z1, y));
                                vertices.Add(new Vec3(x, z1, y1));
                                vertices.Add(new Vec3(x, z1, y1));
                                vertices.Add(new Vec3(x1, z1, y));
                                vertices.Add(new Vec3(x1, z1, y1));
                                normals.AddRange(YNormals);
                                float texX = ((x + y) & 1) == 0 ? 0.51F : 0.76F, texX1 = texX + 0.23F;
                                texCoords.Add(new Vec2(texX, texY));
                                texCoords.Add(new Vec2(texX1, texY));
                                texCoords.Add(new Vec2(texX, texY1));
                                texCoords.Add(new Vec2(texX, texY1));
                                texCoords.Add(new Vec2(texX1, texY));
                                texCoords.Add(new Vec2(texX1, texY1));
                            }
                            if (z == 0)
                            {
                                zB = 0.5F;
                                texY1 -= 0.125F;
                            }
                            else zB = z;
                            if (!level.CollisionMap[x1, y, z])
                            {
                                vertices.Add(new Vec3(x1, zB, y));
                                vertices.Add(new Vec3(x1, zB, y1));
                                vertices.Add(new Vec3(x1, z1, y));
                                vertices.Add(new Vec3(x1, zB, y1));
                                vertices.Add(new Vec3(x1, z1, y1));
                                vertices.Add(new Vec3(x1, z1, y));
                                normals.AddRange(XNormals);
                                texCoords.Add(new Vec2(0.49F, texY1));
                                texCoords.Add(new Vec2(0.26F, texY1));
                                texCoords.Add(new Vec2(0.49F, texY));
                                texCoords.Add(new Vec2(0.26F, texY1));
                                texCoords.Add(new Vec2(0.26F, texY));
                                texCoords.Add(new Vec2(0.49F, texY));
                            }
                            if (!level.CollisionMap[x, y1, z])
                            {
                                vertices.Add(new Vec3(x, zB, y1));
                                vertices.Add(new Vec3(x, z1, y1));
                                vertices.Add(new Vec3(x1, zB, y1));
                                vertices.Add(new Vec3(x, z1, y1));
                                vertices.Add(new Vec3(x1, z1, y1));
                                vertices.Add(new Vec3(x1, zB, y1));
                                normals.AddRange(ZNormals);
                                texCoords.Add(new Vec2(0.01F, texY1));
                                texCoords.Add(new Vec2(0.01F, texY));
                                texCoords.Add(new Vec2(0.24F, texY1));
                                texCoords.Add(new Vec2(0.01F, texY));
                                texCoords.Add(new Vec2(0.24F, texY));
                                texCoords.Add(new Vec2(0.24F, texY1));
                            }
                        }
                    var currentTheme = level.Theme > 3 ? 0 : level.Theme;
                    var fileName = Path.GetFileNameWithoutExtension(path) + ".rmdl";
                    new ESO
                    {
                        AssetHeader = new AssetHeader(AssetUtil.EngineVersion.Version1804_Edge, fileName, "models"),
                        Header = new ESOHeader
                        {
                            V01 = 1, V02 = 4096, V20 = 1, ScaleXYZ = 1, Scale = new Vec3(1, 1, 1), NumModels = 1,
                            NodeChild = AssetHash.Parse(ChildModels[currentTheme] + ModelsNamespace),
                            Translate = new Vec3(0, 0, -Size.Length),
                            BoundingMax = new Vec3(Size.Width + 1, Size.Height + 1, Size.Length + 1)
                        },
                        Models = new[]
                        {
                            new ESOModel
                            {
                                TypeFlags = ESOModel.Flags.Normals | ESOModel.Flags.TexCoords, Vertices = vertices.ToArray(),
                                Normals = normals.ToArray(), TexCoords = texCoords.ToArray(),
                                MaterialAsset = AssetHash.Parse(Materials[currentTheme] + ModelsNamespace)
                            }
                        }
                    }.Save(Path.Combine(Path.GetDirectoryName(path), AssetUtil.CRCFullName(fileName, "models") + ".eso"));
                    break;
            }
            using (var stream = new FileStream(path, FileMode.Create, FileAccess.Write, FileShare.Read))
            using (var writer = new BinaryWriter(stream)) level.Write(writer);
        }
        public void Decompile(string path)
        {
            File.WriteAllText(path + ".xml", GetXElement().ToString());
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
                writer.Write(Value);
                writer.Write(ValueIsAngle);
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
            if (Zoom < 0) element.SetAttributeValueWithDefault(ValueIsAngle ? "Angle" : "FieldOfView", Value);
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

    public enum StaticBlocksOperation
    {
        DoNothing, ToMovingPlatforms, ToMovingPlatformsGlowing, ToModel
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
        public MappingLevels()
        {
        }
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

        public bool IsBlockInArea(int x, int y, int z)
        {
            return x >= 0 && y >= 0 && z >= 0 && x < Width && y < Length && z < Height;
        }
        public bool IsBlockInArea(Point3D16 point)
        {
            return IsBlockInArea(point.X, point.Y, point.Z);
        }
        public bool IsCubeInArea(int x, int y, int z)
        {
            return x >= 0 && y >= 0 && z > 0 && x < Width && y < Length && z <= Height;
        }
        public bool IsCubeInArea(Point3D16 point)
        {
            return IsCubeInArea(point.X, point.Y, point.Z);
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

        public bool this[Point3D16 point]
        {
            get { return this[point.X, point.Y, point.Z]; }
            set { this[point.X, point.Y, point.Z] = value; }
        }
        public bool this[int x, int y, int z]
        {
            get { return Size.IsBlockInArea(x, y, z) && this[z][x, y]; }
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
        public MovingPlatforms()
        {
        }
        public MovingPlatforms(IEnumerable<MovingPlatform> collection)
        {
            foreach (var platform in collection) Add(platform);
        }

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
            if (Clones != -1) Warning.WriteLine("MovingPlatform 元素：@Clones 已过时，请勿使用。");
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
                if (Clones != -1) Warning.WriteLine("MovingPlatform 元素：@Clones 已过时，请勿使用。");
                element.GetAttributeValueWithDefault(out FullBlock, "FullBlock", true);
                foreach (var e in element.ElementsCaseInsensitive("Waypoint")) Waypoints.Add(new Waypoint(e));
            }
            else
            {
                var relative = parent[relatedTo];
                element.GetAttributeValueWithDefault(out AutoStart, "AutoStart", relative.AutoStart);
                element.GetAttributeValueWithDefault(out LoopStartIndex, "LoopStartIndex", relative.LoopStartIndex);
                element.GetAttributeValueWithDefault(out Clones, "Clones", relative.Clones);
                if (Clones != -1) Warning.WriteLine("MovingPlatform 元素：@Clones 已过时，请勿使用。");
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
            Enabled = reader.ReadBoolean();
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
            element.GetAttributeValueWithDefault(out Enabled, "Enabled", true);
            element.GetAttributeValue(out Position, "Position");
            North = new BumperSide(element.ElementCaseInsensitive("North"));
            East = new BumperSide(element.ElementCaseInsensitive("East"));
            South = new BumperSide(element.ElementCaseInsensitive("South"));
            West = new BumperSide(element.ElementCaseInsensitive("West"));
        }

        public bool Enabled = true;
        public Point3D16 Position;
        public BumperSide North, East, South, West; // assuming north as -Y in blockspace, top-right in screenspace

        private readonly Bumpers parent;
        private string id;
        public string ID { get { if (!IDGenerated) id = parent.RequestID(); return id; } set { id = value; } }
        public bool IDGenerated { get { return !string.IsNullOrWhiteSpace(id); } }

        public void Write(BinaryWriter writer)
        {
            writer.Write(Enabled);
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
            result.SetAttributeValueWithDefault("Enabled", Enabled, true);
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
        public FallingPlatform(Level parent)
        {
            this.parent = parent;
        }
        public FallingPlatform(Level parent, BinaryReader reader) : this(parent)
        {
            Position = new Point3D16(reader);
            FloatTime = reader.ReadUInt16();
        }
        public FallingPlatform(Level parent, XElement element) : this(parent)
        {
            Position = element.GetAttributeValue<Point3D16>("Position");
            element.GetAttributeValueWithDefault(out FloatTime, "FloatTime", (ushort) 20);
        }

        private readonly Level parent;
        private Point3D16 position;
        public ushort FloatTime = 20;

        public Point3D16 Position
        {
            get { return position; }
            set
            {
                position = value;
                if (value.Equals(parent.ExitPoint)) Warning.WriteLine("FallingPlatform 元素：@Position 与 /Level/@ExitPoint 相同！" +
                                                                      "终点将被腐蚀，关卡将无法过关！");
                if (parent.CollisionMap[value]) Warning.WriteLine("FallingPlatform 元素：" + value + " 处已经有静态方块！" +
                                                                  "该静态方块将被腐蚀。");
                if (value.Z <= 0) Warning.WriteLine("FallingPlatform 元素：Z 坐标小于等于 0！" +
                                                    "玩家方块在此可掉落平台上将无法向上翻滚/EDGE！");
                else if (value.Z <= parent.Size.Height && (value.X >= 0 && value.X <= parent.Size.Width && value.Y == parent.Size.Length
                                                        || value.X == parent.Size.Width && value.Y >= 0 && value.Y <= parent.Size.Length))
                    Warning.WriteLine("FallingPlatform 元素：将可掉落平台放在 " + value + " 将使其可见但可被穿透！" +
                                      "请移动该平台位置或扩大关卡大小。");
            }
        }

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
            RespawnZ = reader.ReadUInt16();
            Radius = new Point2D8(reader);
        }
        public Checkpoint(XElement element)
        {
            element.GetAttributeValue(out Position, "Position");
            element.GetAttributeValueWithDefault(out RespawnZ, "RespawnZ");
            element.GetAttributeValueWithDefault(out Radius, "Radius");
        }

        public Point3D16 Position;
        public ushort RespawnZ;
        public Point2D8 Radius;

        public void Write(BinaryWriter writer)
        {
            Position.Write(writer);
            writer.Write(RespawnZ);
            Radius.Write(writer);
        }

        public XElement GetXElement()
        {
            var result = new XElement("Checkpoint");
            result.SetAttributeValue("Position", Position);
            result.SetAttributeValueWithDefault("RespawnZ", RespawnZ);
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
            var advanced = true;
            if (Reset = element.GetAttributeValueWithDefault<bool>("Reset"))
            {
                if (element.AttributeCaseInsensitive("FieldOfView") != null)
                    Warning.WriteLine("CameraTrigger 元素：@Reset 被设为 True！@FieldOfView 将会被忽略。");
                if (element.AttributeCaseInsensitive("Angle") != null)
                    Warning.WriteLine("CameraTrigger 元素：@Reset 被设为 True！@Angle 将会被忽略。");
            }
            else if (ValueIsAngle = element.AttributeCaseInsensitive("Angle") != null)
            {
                Value = element.GetAttributeValueWithDefault<short>("Angle");
                if (element.AttributeCaseInsensitive("FieldOfView") != null)
                    Warning.WriteLine("CameraTrigger 元素：@Angle 与 @FieldOfView 被同时设置！@FieldOfView 将会被忽略。");
            }
            else if (element.AttributeCaseInsensitive("FieldOfView") != null)
                Value = element.GetAttributeValueWithDefault<short>("FieldOfView");
            else advanced = false;
            Zoom = element.GetAttributeValueWithDefault("Zoom", (short)-1);
            if (Zoom < 0)
            {
                Zoom = -1;
                element.GetAttributeValueWithDefault(out StartDelay, "StartDelay");
                element.GetAttributeValueWithDefault(out Duration, "Duration");
                element.GetAttributeValueWithDefault(out SingleUse, "SingleUse");
                if (Duration == 0) Warning.WriteLine("CameraTrigger 元素：由于 @Duration 当前为 0，该元素将在实际游戏中被禁用。");
            }
            else
            {
                if (advanced) Warning.WriteLine("CameraTrigger 元素：高级相机模式被禁用！@Reset、@Angle 或 @FieldOfView 将会被忽略。" +
                                                "要启用请将 @Zoom 删去或设为负值。");
                if (element.AttributeCaseInsensitive("StartDelay") != null)
                    Warning.WriteLine("CameraTrigger 元素：高级相机模式被禁用！@StartDelay 将会被忽略。要启用请将 @Zoom 删去或设为负值。");
                if (element.AttributeCaseInsensitive("Duration") != null)
                    Warning.WriteLine("CameraTrigger 元素：高级相机模式被禁用！@Duration 将会被忽略。要启用请将 @Zoom 删去或设为负值。");
                if (element.AttributeCaseInsensitive("SingleUse") != null)
                    Warning.WriteLine("CameraTrigger 元素：高级相机模式被禁用！@SingleUse 将会被忽略。要启用请将 @Zoom 删去或设为负值。");
            }
        }

        private short zoom, value;
        public short Zoom
        {
            get { return zoom; }
            set
            {
                zoom = value;
                if (value == 0 || value > 6) Warning.WriteLine("CameraTrigger 元素：@Zoom 超出范围！在实际游戏中将使用 1 级缩放。");
            }
        }
        public short Value
        {
            get { return value; } 
            set
            {
                this.value = value;
                if (value > 184) Warning.WriteLine("CameraTrigger 元素：@Angle 或 @FieldOfView 大于 184！在实际游戏中将使用 184。");
            }
        }

        public Point3D16 Position;
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
            var result = new XElement("CameraTrigger");
            result.SetAttributeValue("Position", Position);
            result.SetAttributeValueWithDefault("Radius", Radius);
            if (Zoom == -1)
            {
                result.SetAttributeValueWithDefault("Reset", Reset);
                result.SetAttributeValueWithDefault(ValueIsAngle ? "Angle" : "FieldOfView", Value);
                result.SetAttributeValueWithDefault("StartDelay", StartDelay);
                result.SetAttributeValueWithDefault("Duration", Duration);
                result.SetAttributeValueWithDefault("SingleUse", SingleUse);
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
            if (Energy != 1) Warning.WriteLine("Prism 元素：@Energy 已过时，请勿使用。");
        }
        public Prism(XElement element)
        {
            element.GetAttributeValue(out Position, "Position");
            element.GetAttributeValueWithDefault(out Energy, "Energy", (byte)1);
            if (Energy != 1) Warning.WriteLine("Prism 元素：@Energy 已过时，请勿使用。");
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
            DisableCount = reader.ReadByte();
            Mode = (ButtonMode) reader.ReadByte();
            ParentID = reader.ReadInt16();
            SequenceInOrder = reader.ReadBoolean();
            reader.ReadByte();  // Siblings count is useless at this point
            if (IsMoving = reader.ReadBoolean())
                MovingPlatformID = new IDReference<MovingPlatform>(parent.Parent.MovingPlatforms, reader.ReadInt16());
            else Position = new Point3D16(reader);
            var count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) Events.Add(reader.ReadUInt16());
            CheckChild();
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
                    if (Mode != ButtonMode.StayDown)
                    {
                        Warning.WriteLine("Button 元素：在按钮序列中的按钮在实际游戏中会被强制使用 StayDown 模式。");
                        Mode = ButtonMode.StayDown;
                    }
                    if (e.AttributeCaseInsensitive("AffectMovingPlatforms") != null ||
                        e.AttributeCaseInsensitive("AffectBumpers") != null || e.AttributeCaseInsensitive("TriggerAchievements") != null ||
                        e.AttributeCaseInsensitive("AffectButtons") != null)
                        Warning.WriteLine("Button 元素：在按钮序列中的按钮所触发的事件将被游戏忽略。");
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
            element.GetAttributeValueWithDefault(out DisableCount, "DisableCount");
            element.GetAttributeValueWithDefault(out Mode, "Mode", ButtonMode.StayDown);
            if (IsMoving = element.GetAttributeValue("MovingPlatformID") != null)
                MovingPlatformID = new IDReference<MovingPlatform>(parent.Parent.MovingPlatforms, element.GetAttributeValue("MovingPlatformID"));
            else element.GetAttributeValueWithDefault(out Position, "Position");
            parent.Add(this);
        }
        private void CheckChild()
        {
            if (ParentID <= 0) return;
            if (Mode != ButtonMode.StayDown) Warning.WriteLine("Button 元素：在按钮序列中的按钮在实际游戏中会被强制使用 StayDown 模式。");
            if (Events.Count > 0) Warning.WriteLine("Button 元素：在按钮序列中的按钮所触发的事件将被游戏忽略。");
        }

        private bool initialized;

        private readonly Buttons parent;
        private string id;
        public string ID { get { if (!IDGenerated) id = parent.RequestID(); return id; } set { id = value; } }
        public bool IDGenerated { get { return !string.IsNullOrWhiteSpace(id); } }

        public NullableBoolean Visible = NullableBoolean.True;
        public byte DisableCount;
        public ButtonMode Mode = ButtonMode.StayDown;
        public short ParentID = -1;
        public bool SequenceInOrder;
        public bool IsMoving;
        public IDReference<MovingPlatform> MovingPlatformID;
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
            writer.Write(DisableCount);
            writer.Write((byte) Mode);
            writer.Write(ParentID);
            writer.Write(SequenceInOrder);
            writer.Write(parent.GetSiblingsCount(this));
            writer.Write(IsMoving);
            if (IsMoving) writer.Write(MovingPlatformID.Index);
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
            result.SetAttributeValueWithDefault("DisableCount", DisableCount);
            if (type == ButtonType.Standalone) result.SetAttributeValueWithDefault("Mode", Mode, ButtonMode.StayDown);
            if (IsMoving) result.SetAttributeValueWithDefault("MovingPlatformID", MovingPlatformID.Name);
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
                        Warning.WriteLine(e.Name + " 元素：无法识别在 " + element.Name + " 元素下的该子元素，它将被忽略。");
                    
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
        public Resizer(Level parent)
        {
            this.parent = parent;
        }
        public Resizer(Level parent, BinaryReader reader) : this(parent)
        {
            Position = new Point3D16(reader);
            Visible = reader.ReadBoolean();
            Direction = (ResizeDirection) reader.ReadByte();
        }
        public Resizer(Level parent, XElement element) : this(parent)
        {
            Direction = (ResizeDirection)Enum.Parse(typeof(ResizeDirection), element.Name.LocalName.Remove(0, 7), true);
            Position = element.GetAttributeValue<Point3D16>("Position");
            element.GetAttributeValueWithDefault(out Visible, "Visible", true);
            var radius = element.GetAttributeValueWithDefault<Point2D8>("Radius");
            if (radius.Equals(default(Point2D8))) return;
            for (var x = -radius.X; x <= radius.X; x++) for (var y = -radius.Y; y <= radius.Y; y++) if (x != 0 || y != 0)
                parent.Resizers.Add(new Resizer(parent) { Position = Position + new Point3D16((short)x, (short)y, 0), 
                                                          Visible = Visible, Direction = Direction });
        }

        private readonly Level parent;
        private Point3D16 position;
        public Point3D16 Position
        {
            get { return position; }
            set
            {
                position = value;
                if (value.Z > parent.Size.Height || value.Z <= 0)
                    Warning.WriteLine("Resizer" + Direction + " 元素：Z 坐标超出范围！这会导致游戏崩溃。");
                if (value.X >= parent.Size.Width || value.X < 0 || value.Y >= parent.Size.Length || value.Y < 0)
                    Warning.WriteLine("Resizer" + Direction + " 元素：X 坐标 和/或 Y 坐标超出范围！该方块尺寸调整器将在关卡中可见，" +
                                      "但没有任何实际作用，也不会添加任何静态方块，并有几率导致游戏崩溃！");
            }
        }
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
