using System;
using System.IO;
using System.Xml.Linq;
using Mygod.Xml.Linq;

namespace Mygod.Edge.Tool
{
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
            Direction = (ResizeDirection)reader.ReadByte();
        }
        public Resizer(Level parent, XElement element) : this(parent)
        {
            Direction = (ResizeDirection)Enum.Parse(typeof(ResizeDirection), element.Name.LocalName.Remove(0, 7), true);
            Position = element.GetAttributeValue<Point3D16>("Position");
            element.GetAttributeValueWithDefault(out Visible, "Visible", true);
            var radius = element.GetAttributeValueWithDefault<Point2D8>("Radius");
            if (radius.Equals(default(Point2D8))) return;
            for (var x = -radius.X; x <= radius.X; x++)
                for (var y = -radius.Y; y <= radius.Y; y++)
                    if (x != 0 || y != 0)
                        parent.Resizers.Add(new Resizer(parent)
                        {
                            Position = Position + new Point3D16((short)x, (short)y, 0),
                            Visible = Visible,
                            Direction = Direction
                        });
        }

        private readonly Level parent;
        private Point3D16 position;
        public Point3D16 Position
        {
            get { return position; }
            set
            {
                position = value;
                if (value.Equals(parent.ExitPoint))
                    Warning.WriteLine(string.Format(Localization.ExitPointCorrupted, "Resizer" + Direction));
                if (value.Z > parent.Size.Height || value.Z <= 0)
                    Warning.WriteLine(string.Format(Localization.ResizerZOutOfRange, Direction));
                if (value.X >= parent.Size.Width || value.X < 0 || value.Y >= parent.Size.Length || value.Y < 0)
                    Warning.WriteLine(string.Format(Localization.ResizerXYOutOfRange, Direction));
            }
        }
        public bool Visible = true;
        public ResizeDirection Direction;

        public void Write(BinaryWriter writer)
        {
            Position.Write(writer);
            writer.Write(Visible);
            writer.Write((byte)Direction);
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
}