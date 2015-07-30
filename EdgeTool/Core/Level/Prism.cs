using System;
using System.IO;
using System.Xml.Linq;
using Mygod.Xml.Linq;
#pragma warning disable 612

namespace Mygod.Edge.Tool
{
    public sealed class Prism : IXElement
    {
        public Prism()
        {
        }
        public Prism(BinaryReader reader)
        {
            Position = new Point3D16(reader);
            Energy = reader.ReadByte();
            if (Energy != 1) Warning.WriteLine(string.Format(Localization.DeprecatedAttribute, "Prism", "@Energy"));
        }
        public Prism(XElement element)
        {
            element.GetAttributeValue(out Position, "Position");
            element.GetAttributeValueWithDefault(out Energy, "Energy", (byte)1);
            if (Energy != 1) Warning.WriteLine(string.Format(Localization.DeprecatedAttribute, "Prism", "@Energy"));
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
}