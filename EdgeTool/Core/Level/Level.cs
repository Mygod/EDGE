using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using Mygod.Xml.Linq;
#pragma warning disable 612

namespace Mygod.Edge.Tool
{
    public sealed class Level : IXElement
    {
        private Level()
        {
            Bumpers = new Bumpers(this);
        }
        public Level(string name, Size3D size) : this()
        {
            Name = name;
            CollisionMap = new Cube(Size = size);
            LegacyMinimap = new Flat(LegacyMinimapSize);
            ExitPoint = new Point3D16(0, 0, 1);
            Buttons = new Buttons(this);
        }
        private Level(BinaryReader reader) : this()
        {
            ID = reader.ReadInt32();
            var nameLength = reader.ReadInt32();
            Name = Encoding.UTF8.GetString(reader.ReadBytes(nameLength));
            SPlusTime = reader.ReadUInt16();
            STime = reader.ReadUInt16();
            ATime = reader.ReadUInt16();
            BTime = reader.ReadUInt16();
            CTime = reader.ReadUInt16();
            CheckTime();
            var prismsCount = reader.ReadInt16();
            Size = new Size3D(reader);
            #region Boring verifying
            var temp = reader.ReadUInt16();
            if (Temp1 != temp)
                Warning.WriteLine(string.Format(Localization.LevelInvalidArgument, temp, Temp1, "unknown_ushort_1"));
            temp = reader.ReadUInt16();
            if (Temp2 != temp)
                Warning.WriteLine(string.Format(Localization.LevelInvalidArgument, temp, Temp2, "unknown_ushort_2"));
            ushort width = reader.ReadUInt16(), length = reader.ReadUInt16();
            var legacyMinimapValid = true;
            if (LegacyMinimapSize.Width != width)
            {
                Warning.WriteLine(string.Format(Localization.LevelInvalidArgument, width, LegacyMinimapSize.Width,
                                                "unknown_ushort_3"));
                legacyMinimapValid = false;
            }
            if (LegacyMinimapSize.Length != length)
            {
                Warning.WriteLine(string.Format(Localization.LevelInvalidArgument, width, LegacyMinimapSize.Length,
                                                "unknown_ushort_4"));
                legacyMinimapValid = false;
            }
            if (!legacyMinimapValid) Warning.WriteLine(Localization.LevelLegacyMinimapMalformed);
            var tempByte = reader.ReadByte();
            if (tempByte != 10)
                Warning.WriteLine(string.Format(Localization.LevelInvalidArgument, temp, 10, "unknown_byte_1"));
            temp = reader.ReadUInt16();
            if (Size.Length - 1 != temp)
                Warning.WriteLine(string.Format
(Localization.LevelInvalidArgument, temp, Size.Length - 1, "unknown_ushort_5"));
            temp = reader.ReadUInt16();
            if (0 != temp)
                Warning.WriteLine(string.Format(Localization.LevelInvalidArgument, temp, 0, "unknown_ushort_6"));
            #endregion
            if (legacyMinimapValid) LegacyMinimap = new Flat(reader, LegacyMinimapSize);
            else
            {
                LegacyMinimap = new Flat(LegacyMinimapSize);
                reader.ReadBytes((width * length + 7) / 8);
            }
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
                Warning.WriteLine(string.Format
(Localization.LevelInvalidArgument, prismsCount, count, "prisms_count"));
            if ((count = reader.ReadUInt16()) > 0)
                Warning.WriteLine(string.Format(Localization.DeprecatedElement, "Fan"));
            for (var i = 0; i < count; i++) Fans.Add(new Fan(reader));
            Buttons = new Buttons(this, reader);
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) OtherCubes.Add(new OtherCube(this, reader));
            count = reader.ReadUInt16();
            for (var i = 0; i < count; i++) Resizers.Add(new Resizer(this, reader));
            if ((count = reader.ReadUInt16()) > 0)
                Warning.WriteLine(string.Format(Localization.DeprecatedElement, "MiniBlock"));
            for (var i = 0; i < count; i++) MiniBlocks.Add(new MiniBlock(reader));
            ModelTheme = Theme = reader.ReadByte();
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
                cube.DarkCubeMovingBlockSync?.Name.DoNothing();
            }
        }
        private Level(string path) : this()
        {
            var element = XHelper.Load(path + ".xml").GetElement("Level");
            ID = element.GetAttributeValue<int>("ID");
            Name = element.GetAttributeValueWithDefault("Name", string.Empty);
            var thresholds = element.GetAttributeValueWithDefault("TimeThresholds", "1,2,3,4,5").Split(',')
                                    .Select(str => ushort.Parse(str.Trim())).ToArray();
            SPlusTime = thresholds[0];
            STime = thresholds[1];
            ATime = thresholds[2];
            BTime = thresholds[3];
            CTime = thresholds[4];
            CheckTime();
            Size = element.GetAttributeValue<Size3D>("Size");
            LegacyMinimap = new Flat(path + ".png", LegacyMinimapSize);
            CollisionMap = new Cube(path + ".{0}.png", Size);
            SpawnPoint = element.GetAttributeValue<Point3D16>("SpawnPoint");
            ExitPoint = element.GetAttributeValue<Point3D16>("ExitPoint");
            Theme = element.GetAttributeValueWithDefault<byte>("Theme");
            ModelTheme = element.GetAttributeValueWithDefault("ModelTheme", Theme);
            MusicJava = element.GetAttributeValueWithDefault<byte>("MusicJava");
            Music = element.GetAttributeValueWithDefault("Music", (byte)6);
            Zoom = element.GetAttributeValueWithDefault("Zoom", (short)-1);
            var advanced = true;
            if (ValueIsAngle = element.AttributeCaseInsensitive("Angle") != null)
            {
                Value = element.GetAttributeValueWithDefault<short>("Angle", 22);
                if (element.AttributeCaseInsensitive("FieldOfView") != null)
                    Warning.WriteLine(string.Format(Localization.FieldOfViewIgnored, "Level"));
            }
            else if (element.AttributeCaseInsensitive("FieldOfView") != null)
                Value = element.GetAttributeValueWithDefault<short>("FieldOfView", 22);
            else if (Zoom < 0) Value = 22;
            else advanced = false;
            if (Zoom >= 0 && advanced)
                Warning.WriteLine(string.Format(Localization.AdvancedCameraModeDisabled,
                                                "Level", "@Angle, @FieldOfView"));
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
                        Warning.WriteLine(string.Format(Localization.DeprecatedElement, "Fan"));
                        break;
                    case "button":
                    case "buttonsequence":
                        // ReSharper disable once ObjectCreationAsStatement
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
                        Warning.WriteLine(string.Format(Localization.DeprecatedElement, "MiniBlock"));
                        break;
                    default:
                        Warning.WriteLine(string.Format(Localization.UnrecognizedChildElement, e.Name, "Level"));
                        break;
                }
        }
        public static Level CreateFromCompiled(string path)
        {
            using (var stream = File.OpenRead(path))
            using (var reader = new BinaryReader(stream))
                return new Level(reader) { FilePath = path };
        }
        public static Level CreateFromDecompiled(string path)
        {
            return new Level(path);
        }

        public string FilePath { get; private set; }
        public MappingLevel Mapping => MappingLevels.GetMapping(this);

        public string GetRelativePath(string levelsDir)
        {
            return FilePath.GetRelativePath(levelsDir).RemoveExtension().ToCorrectPath();
        }

        private void CheckTime()
        {
            if (SPlusTime >= STime || STime >= ATime || ATime >= BTime || BTime >= CTime)
                Warning.WriteLine(Localization.LevelTimeThresholdsAscending);
        }

        public int ID { get; set; }
        public string Name { get; set; }
        public ushort SPlusTime { get; set; }
        public ushort STime { get; set; }
        public ushort ATime { get; set; }
        public ushort BTime { get; set; }
        public ushort CTime { get; set; }
        public Size3D Size { get; set; }
        public ushort Temp1 => (ushort)(Size.Width + Size.Length);
        public ushort Temp2 => (ushort)(Temp1 + Size.Height + Size.Height);

        public Size2D LegacyMinimapSize => new Size2D((ushort)((Temp1 + 9) / 10), (ushort)((Temp2 + 9) / 10));

        public Point3D16 SpawnPoint
        {
            get { return spawnPoint; }
            set
            {
                spawnPoint = value;
                if (value.Z < -20) Warning.WriteLine(Localization.SpawnPointOutOfRange);
            }
        }
        public Point3D16 ExitPoint
        {
            get { return exitPoint; }
            set
            {
                exitPoint = value;
                if (!Size.IsCubeInArea(value)) Warning.WriteLine(Localization.ExitPointOutOfRange);
            }
        }
        public short Zoom
        {
            get { return zoom; }
            set
            {
                zoom = value;
                if (value == 0 || value > 5) Warning.WriteLine(string.Format(Localization.ZoomOutOfRange, "Level", 4));
            }
        }
        public short Value
        {
            get { return value; }
            set
            {
                this.value = value;
                if (value > 184) Warning.WriteLine(string.Format(Localization.ValueOutOfRange, "Level"));
            }
        }
        public byte Theme
        {
            get { return theme; }
            set
            {
                theme = value;
                if (theme > 3) Warning.WriteLine(Localization.ThemeOutOfRange);
            }
        }
        public byte MusicJava
        {
            get { return musicJava; }
            set
            {
                musicJava = value;
                if (value > 11) Warning.WriteLine(Localization.MusicJavaOutOfRange);
            }
        }
        public byte Music
        {
            get { return music; }
            set
            {
                music = value;
                if (value > 24) Warning.WriteLine(Localization.MusicOutOfRange);
            }
        }

        private Point3D16 spawnPoint, exitPoint;
        private short zoom, value;
        private byte theme, musicJava, music;

        public byte ModelTheme { get; set; }
        public bool ValueIsAngle;
        public Flat LegacyMinimap;
        public Cube CollisionMap;
        public MovingPlatforms MovingPlatforms = new MovingPlatforms();
        public Bumpers Bumpers;
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

        public static readonly string[]
            Musics =
            {
                "00_Title", "01_Eternity", "02_Quiet", "03_Pad", "04_Jingle", "05_Tec", "06_Kakkoi", "07_Dark",
                "08_Squadron", "09_8bits", "10_Pixel", "11_Jupiter", "12_Shame", "13_Debrief", "14_Space",
                "15_Voyage_geometrique", "16_Mzone", "17_R2", "18_Mystery_cube", "19_Duty", "20_PerfectCell", "21_fun",
                "22_lol", "23_lostway", "24_wall_street"
            },
            MusicsJava =
            {
                "00_menus", "01_braintonik", "02_cube_dance", "03_essai_2", "04_essai_01", "05_test", "06_mysterycube",
                "07_03_EDGE", "08_jungle", "09_RetardTonic", "10_oldschool_simon", "11_planant"
            };

        public string MusicName => Music > 24 ? (Musics[6] + " (" + Music + ")") : Musics[Music];
        public string MusicJavaName => MusicJava > 11 ? (MusicsJava[0] + " (" + MusicJava + ")")
                                                      : MusicsJava[MusicJava];

        public Level EasyCompile(string path)
        {
            FilePath = path;
            var level = (Level)MemberwiseClone();
            level.MovingPlatforms = new MovingPlatforms(MovingPlatforms);   // there's no need to copy other stuff
            for (short x = 0; x < level.Size.Width; x++)
                for (short y = 0; y < level.Size.Length; y++)
                    for (short z = 0; z < level.Size.Height; z++)
                    {
                        var color = level.CollisionMap.GetColor(x, y, z);
                        if (color.R == 255 || color.R < 128) continue;
                        var platform = new MovingPlatform(level.MovingPlatforms);
                        if ((color.R & 0x40) == 0)
                        {
                            platform.AutoStart = false;
                            platform.LoopStartIndex = 0;
                        }
                        if ((color.R & 0x20) == 0) platform.FullBlock = false;
                        platform.Waypoints.Add(new Waypoint { Position = new Point3D16(x, y, (short)(z + 1)) });
                        level.MovingPlatforms.Add(platform);
                    }
            using (var stream = new FileStream(path, FileMode.Create, FileAccess.Write, FileShare.Read))
            using (var writer = new BinaryWriter(stream)) level.Write(writer);
            return level;
        }
        public IEnumerable<string> Compile(string path)
        {
            var level = EasyCompile(path);
            yield return path;
            if (ModelTheme <= 3) yield return new ModelGenerator(level, ModelTheme).Generate(path);
        }
        public IEnumerable<string> Decompile(string path)
        {
            var temp = path + ".xml";
            File.WriteAllText(temp, GetXElement().ToString());
            yield return temp;
            temp = path + ".png";
            LegacyMinimap.SaveToImage(temp);
            yield return temp;
            CollisionMap.InitImage();
            foreach (var resizer in Resizers.Where(resizer => Size.IsCubeInArea(resizer.Position) &&
                CollisionMap.GetColor(resizer.Position.X, resizer.Position.Y, resizer.Position.Z - 1) == Flat.Empty))
                CollisionMap.SetColor(resizer.Position.X, resizer.Position.Y, resizer.Position.Z - 1,
                                      resizer.Position.Z == 1 ? Flat.HalfBlockModelOnly : Flat.BlockModelOnly);
            for (var z = 0; z < Size.Height; z++)
            {
                temp = path + '.' + z + ".png";
                CollisionMap[z].SaveToImage(temp);
                yield return path + '.' + z + ".png";
            }
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
            writer.Write((ushort)Prisms.Count);
            Size.Write(writer);
            writer.Write(Temp1);
            writer.Write(Temp2);
            LegacyMinimapSize.Write(writer);
            writer.Write((byte)10);
            writer.Write((ushort)(Size.Length - 1));
            writer.Write((ushort)0);
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
            var element = new XElement("Level", new XAttribute("ID", ID), new XAttribute("Size", Size));
            element.SetAttributeValueWithDefault("Name", Name, string.Empty);
            element.SetAttributeValueWithDefault("TimeThresholds",
                FormattableString.Invariant($"{SPlusTime},{STime},{ATime},{BTime},{CTime}"), "1,2,3,4,5");
            element.SetAttributeValue("SpawnPoint", SpawnPoint);
            element.SetAttributeValue("ExitPoint", ExitPoint);
            element.SetAttributeValueWithDefault("Theme", Theme);
            element.SetAttributeValueWithDefault("MusicJava", MusicJava);
            element.SetAttributeValueWithDefault("Music", Music, 6);
            if (Zoom < 0) element.SetAttributeValueWithDefault(ValueIsAngle ? "Angle" : "FieldOfView", Value);
            else element.SetAttributeValueWithDefault("Zoom", Zoom, (short)-1);
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
        None, Standard, Extended, Bonus
    }
}
