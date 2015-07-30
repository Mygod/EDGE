using System;
using System.Collections.Generic;
using System.IO;
using System.Xml.Linq;
using Mygod.Xml.Linq;
#pragma warning disable 612

namespace Mygod.Edge.Tool
{
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
            if (Clones != -1)
                Warning.WriteLine(string.Format(Localization.DeprecatedAttribute, "MovingPlatform", "@Clones"));
            FullBlock = reader.ReadBoolean();
            var count = reader.ReadByte();
            for (var i = 0; i < count; i++) Waypoints.Add(new Waypoint(reader));
        }
        public MovingPlatform(MovingPlatforms parent, XElement element) : this(parent)
        {
            id = element.GetAttributeValue("ID")?.Trim();
            var relatedTo = element.GetAttributeValue("RelatedTo");
            if (string.IsNullOrEmpty(relatedTo))
            {
                element.GetAttributeValueWithDefault(out AutoStart, "AutoStart", true);
                element.GetAttributeValueWithDefault(out LoopStartIndex, "LoopStartIndex", (byte)1);
                element.GetAttributeValueWithDefault(out Clones, "Clones", (short)-1);
                if (Clones != -1)
                    Warning.WriteLine(string.Format(Localization.DeprecatedAttribute, "MovingPlatform", "@Clones"));
                element.GetAttributeValueWithDefault(out FullBlock, "FullBlock", true);
            }
            else
            {
                var relative = parent[relatedTo];
                element.GetAttributeValueWithDefault(out AutoStart, "AutoStart", relative.AutoStart);
                element.GetAttributeValueWithDefault(out LoopStartIndex, "LoopStartIndex", relative.LoopStartIndex);
                element.GetAttributeValueWithDefault(out Clones, "Clones", relative.Clones);
                if (Clones != -1)
                    Warning.WriteLine(string.Format(Localization.DeprecatedAttribute, "MovingPlatform", "@Clones"));
                element.GetAttributeValueWithDefault(out FullBlock, "FullBlock", relative.FullBlock);
                var offset = element.GetAttributeValueWithDefault<Point3D16>("Offset");
                foreach (var waypoint in relative.Waypoints)
                    Waypoints.Add(new Waypoint
                    {
                        Position = waypoint.Position + offset,
                        PauseTime = waypoint.PauseTime,
                        TravelTime = waypoint.TravelTime
                    });
            }
            foreach (var e in element.ElementsCaseInsensitive("Waypoint")) Waypoints.Add(new Waypoint(e));
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
            writer.Write((byte)(AutoStart ? 2 : 0));
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
            result.SetAttributeValueWithDefault("Clones", Clones, (short)-1);
            result.SetAttributeValueWithDefault("FullBlock", FullBlock, true);
            foreach (var element in Waypoints.GetXElements()) result.Add(element);
            return result;
        }

        private string id;
        public string ID { get { if (!IDGenerated) id = parent.RequestID(); return id; } set { id = value; } }
        public bool IDGenerated => !string.IsNullOrWhiteSpace(id);
    }

    public sealed class Waypoints : XElementObjectList<Waypoint>
    {
        public override void Write(BinaryWriter writer)
        {
            writer.Write((byte)Count);
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
}
