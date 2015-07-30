using System.IO;
using System.Xml.Linq;
using Mygod.Xml.Linq;

namespace Mygod.Edge.Tool
{
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
            element.GetAttributeValueWithDefault(out FloatTime, "FloatTime", (ushort)20);
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
                if (value.Equals(parent.ExitPoint))
                    Warning.WriteLine(string.Format(Localization.ExitPointCorrupted, "FallingPlatform"));
                if (parent.CollisionMap[value])
                    Warning.WriteLine(string.Format(Localization.FallingPlatformStaticBlock, value));
                if (value.Z <= 0) Warning.WriteLine(Localization.FallingPlatformZOutOfRange);
                else if (value.Z <= parent.Size.Height
                    && (value.X >= 0 && value.X <= parent.Size.Width && value.Y == parent.Size.Length
                        || value.X == parent.Size.Width && value.Y >= 0 && value.Y <= parent.Size.Length))
                    Warning.WriteLine(string.Format(Localization.FallingPlatformXYOutOfRange, value));
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
}