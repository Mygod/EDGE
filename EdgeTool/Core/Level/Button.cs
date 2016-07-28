using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml.Linq;
using Mygod.Xml.Linq;

namespace Mygod.Edge.Tool
{
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
        public readonly XSerializableList<BlockEvent> BlockEvents = new XSerializableList<BlockEvent>();

        public override void Write(BinaryWriter writer)
        {
            BlockEvents.Write(writer);
            base.Write(writer);
        }
        public override IEnumerable<XElement> GetXElements()
        {
            var dic = new Dictionary<int, XElement>();
            var children = new List<Button>();
            for (var i = 0; i < Count; i++)
                switch (this[i].Type)
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
                var index = (int)ev.Type;
                if (builders[index] == null) builders[index] = new StringBuilder(ev.ToString());
                else builders[index].Append(',' + ev.ToString());
            }
            for (var i = 0; i < 4; i++)
                if (builders[i] != null)
                    element.SetAttributeValue(((BlockEventType)i).ToString() + 's', builders[i].ToString());
        }
        public IEnumerable<ushort> AddEvents(XElement element)
        {
            for (var i = 0; i < 4; i++)
            {
                var type = (BlockEventType)i;
                var attr = element.GetAttributeValue(type.ToString() + 's');
                if (attr == null) continue;
                foreach (var e in attr.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries)
                                      .Select(str => BlockEvent.Parse(Parent, type, str)))
                {
                    yield return (ushort)BlockEvents.Count;
                    BlockEvents.Add(e);
                }
            }
        }

        public byte GetSiblingsCount(Button button)
        {
            return (byte)this.Count(child => child.ParentID != -1 && this[child.ParentID] == button);
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
            Mode = (ButtonMode)reader.ReadByte();
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
                    // ReSharper disable once ObjectCreationAsStatement
                    new Button(parent, e)
                    {
                        Mode = ButtonMode.StayDown,
                        SequenceInOrder = SequenceInOrder,
                        ParentID = parentID
                    };
                else
                {
                    Initialize(e);
                    Events = new List<ushort>(parent.AddEvents(element));
                    if (Mode != ButtonMode.StayDown)
                    {
                        Warning.WriteLine(Localization.ButtonSequenceForceStayDownMode);
                        Mode = ButtonMode.StayDown;
                    }
                    if (e.AttributeCaseInsensitive("AffectMovingPlatforms") != null ||
                        e.AttributeCaseInsensitive("AffectBumpers") != null ||
                        e.AttributeCaseInsensitive("TriggerAchievements") != null ||
                        e.AttributeCaseInsensitive("AffectButtons") != null)
                        Warning.WriteLine(Localization.ButtonSequenceEventIgnored);
                    element.GetAttributeValueWithDefault(out SequenceInOrder, "SequenceInOrder");
                }
            if (initialized) return;
            Initialize(element);
            Events = new List<ushort>(parent.AddEvents(element));
        }
        private void Initialize(XElement element)
        {
            initialized = true;
            id = element.GetAttributeValue("ID")?.Trim();
            element.GetAttributeValueWithDefault(out Visible, "Visible", NullableBoolean.True);
            element.GetAttributeValueWithDefault(out DisableCount, "DisableCount");
            element.GetAttributeValueWithDefault(out Mode, "Mode", ButtonMode.StayDown);
            if (IsMoving = element.GetAttributeValue("MovingPlatformID") != null)
                MovingPlatformID = new IDReference<MovingPlatform>
                    (parent.Parent.MovingPlatforms, element.GetAttributeValue("MovingPlatformID"));
            else element.GetAttributeValueWithDefault(out Position, "Position");
            parent.Add(this);
        }
        private void CheckChild()
        {
            if (ParentID <= 0) return;
            if (Mode != ButtonMode.StayDown)
                Warning.WriteLine(Localization.ButtonSequenceForceStayDownMode);
            if (Events.Count > 0)
                Warning.WriteLine(Localization.ButtonSequenceEventIgnored);
        }

        private bool initialized;

        private readonly Buttons parent;
        private string id;
        public string ID { get { if (!IDGenerated) id = parent.RequestID(); return id; } set { id = value; } }
        public bool IDGenerated => !string.IsNullOrWhiteSpace(id);

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
                    else if (parent[ParentID] != this && parent[ParentID].Type == ButtonType.ButtonSequence)
                        return ButtonType.Children;
                return ButtonType.Standalone;
            }
        }

        public void Write(BinaryWriter writer)
        {
            writer.Write((byte)Visible);
            writer.Write(DisableCount);
            writer.Write((byte)Mode);
            writer.Write(ParentID);
            writer.Write(SequenceInOrder);
            writer.Write(parent.GetSiblingsCount(this));
            writer.Write(IsMoving);
            if (IsMoving) writer.Write(MovingPlatformID.Index);
            else Position.Write(writer);
            writer.Write((ushort)Events.Count);
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
                    case BlockEventType.AffectMovingPlatform:
                        return new IDReference<MovingPlatform>(parent.MovingPlatforms, id);
                    case BlockEventType.AffectBumper: return new IDReference<Bumper>(parent.Bumpers, id);
                    case BlockEventType.TriggerAchievement: return new NormalID(id);
                    case BlockEventType.AffectButton: return new IDReference<Button>(parent.Buttons, id);
                    default: return id;
                }
            }
            set { id = (IDReference)value; }
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
            return obj is BlockEvent && Equals((BlockEvent)obj);
        }

        public bool Equals(BlockEvent other)
        {
            if (ReferenceEquals(null, other)) return false;
            if (ReferenceEquals(this, other)) return true;
            return Type == other.Type && Payload == other.Payload && Equals(id, other.id);
        }

        public override string ToString()
        {
            return Payload == 0 ? ID.Name : FormattableString.Invariant($"{ID.Name} ({Payload})");
        }

        public static BlockEvent Parse(Level parent, BlockEventType type, string value)
        {
            var match = Parser.Match(value);
            if (!match.Success) throw new FormatException(Localization.UnrecognizedEvent);
            var result = new BlockEvent(parent) { Type = type, id = new IDReference(match.Groups[1].Value.Trim()) };
            if (match.Groups[3].Success)
                result.Payload = ushort.Parse(match.Groups[3].Value.Trim(), CultureInfo.InvariantCulture);
            return result;
        }
    }
    public enum BlockEventType : byte
    {
        AffectMovingPlatform, AffectBumper, TriggerAchievement, AffectButton
    }
}