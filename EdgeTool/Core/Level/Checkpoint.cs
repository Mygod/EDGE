using System.IO;
using System.Xml.Linq;
using Mygod.Xml.Linq;

namespace Mygod.Edge.Tool
{
    public sealed class Checkpoint : IXElement
    {
        public Checkpoint()
        {
        }
        public Checkpoint(BinaryReader reader)
        {
            Position = new Point3D16(reader);
            RespawnZ = reader.ReadInt16();
            Radius = new Point2D8(reader);
        }
        public Checkpoint(XElement element)
        {
            element.GetAttributeValue(out Position, "Position");
            element.GetAttributeValueWithDefault(out RespawnZ, "RespawnZ");
            element.GetAttributeValueWithDefault(out Radius, "Radius");
        }

        public Point3D16 Position;
        public short RespawnZ;
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
}