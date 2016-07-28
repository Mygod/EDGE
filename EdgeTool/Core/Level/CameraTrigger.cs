using System.IO;
using System.Xml.Linq;
using Mygod.Xml.Linq;

namespace Mygod.Edge.Tool
{
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
            if (ValueIsAngle = element.AttributeCaseInsensitive("Angle") != null)
            {
                Value = element.GetAttributeValueWithDefault<short>("Angle", 22);
                if (element.AttributeCaseInsensitive("FieldOfView") != null)
                    Warning.WriteLine(string.Format(Localization.FieldOfViewIgnored, "CameraTrigger"));
            }
            else if (!(Reset = element.AttributeCaseInsensitive("FieldOfView") == null))
                Value = element.GetAttributeValueWithDefault<short>("FieldOfView", 22);
            if ((Zoom = element.GetAttributeValueWithDefault("Zoom", (short)-1)) < 0)
            {
                Zoom = -1;
                element.GetAttributeValueWithDefault(out StartDelay, "StartDelay");
                element.GetAttributeValueWithDefault(out Duration, "Duration");
                element.GetAttributeValueWithDefault(out SingleUse, "SingleUse");
                if (Duration == 0) Warning.WriteLine(Localization.CameraTriggerDisabled);
                return;
            }
            if (!Reset)
                Warning.WriteLine(string.Format(Localization.AdvancedCameraModeDisabled, "CameraTrigger",
                                                "@Reset, @Angle, @FieldOfView"));
            if (element.AttributeCaseInsensitive("StartDelay") != null) Warning.WriteLine(string.Format(
                Localization.AdvancedCameraModeDisabled, "CameraTrigger", "@StartDelay"));
            if (element.AttributeCaseInsensitive("Duration") != null) Warning.WriteLine(string.Format(
                Localization.AdvancedCameraModeDisabled, "CameraTrigger", "@Duration"));
            if (element.AttributeCaseInsensitive("SingleUse") != null) Warning.WriteLine(string.Format(
                Localization.AdvancedCameraModeDisabled, "CameraTrigger", "@SingleUse"));
        }

        private short zoom, value;
        public short Zoom
        {
            get { return zoom; }
            set
            {
                zoom = value;
                if (value == 0 || value > 6)
                    Warning.WriteLine(string.Format(Localization.ZoomOutOfRange, "CameraTrigger", 6));
            }
        }
        public short Value
        {
            get { return value; }
            set
            {
                this.value = value;
                if (value > 184)
                    Warning.WriteLine(string.Format(Localization.ValueOutOfRange, "CameraTrigger"));
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
                if (!Reset) result.SetAttributeValueWithDefault(ValueIsAngle ? "Angle" : "FieldOfView", Value, 22);
                result.SetAttributeValueWithDefault("StartDelay", StartDelay);
                result.SetAttributeValueWithDefault("Duration", Duration);
                result.SetAttributeValueWithDefault("SingleUse", SingleUse);
            }
            else result.SetAttributeValueWithDefault("Zoom", Zoom);
            return result;
        }
    }
}