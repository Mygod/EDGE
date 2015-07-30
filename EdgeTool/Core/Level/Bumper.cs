using System.IO;
using System.Xml.Linq;
using Mygod.Xml.Linq;

namespace Mygod.Edge.Tool
{
    public sealed class Bumpers : XElementObjectListWithID<Bumper>
    {
        public Bumpers(Level parent)
        {
            Parent = parent;
        }

        public readonly Level Parent;

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
            id = element.GetAttributeValue("ID")?.Trim();
            element.GetAttributeValueWithDefault(out Enabled, "Enabled", true);
            Position = element.GetAttributeValue<Point3D16>("Position");
            North = new BumperSide(element.ElementCaseInsensitive("North"));
            East = new BumperSide(element.ElementCaseInsensitive("East"));
            South = new BumperSide(element.ElementCaseInsensitive("South"));
            West = new BumperSide(element.ElementCaseInsensitive("West"));
        }

        public bool Enabled = true;
        private Point3D16 position;
        public Point3D16 Position
        {
            get { return position; }
            set
            {
                position = value;
                if (value.X <= 0 && value.Y < parent.Parent.Size.Length ||
                    value.Y <= 0 && value.X < parent.Parent.Size.Width)
                    Warning.WriteLine(Localization.BumperPositionOutOfRange);
            }
        }
        public BumperSide North, East, South, West; // assuming north as -Y in blockspace, top-right in screenspace

        private readonly Bumpers parent;
        private string id;
        public string ID { get { if (!IDGenerated) id = parent.RequestID(); return id; } set { id = value; } }
        public bool IDGenerated => !string.IsNullOrWhiteSpace(id);

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
}