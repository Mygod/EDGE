using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml.Linq;
using Mygod.Xml.Linq;

namespace Mygod.Edge.Tool
{
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
                        Warning.WriteLine(string.Format(Localization.UnrecognizedChildElement, e.Name, element.Name));

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
                for (var x = -radius.X; x <= radius.X; x++)
                    for (var y = -radius.Y; y <= radius.Y; y++)
                        if (x != 0 || y != 0)
                        {
                            var position = PositionTrigger + new Point3D16((short)x, (short)y, 0);
                            parent.OtherCubes.Add(new OtherCube
                            {
                                PositionTrigger = position,
                                MovingBlockSync = MovingBlockSync,
                                PositionCube = PositionCube,
                                KeyEvents = KeyEvents
                            });
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
            if (child == null)
                level.Buttons.Add(new Button(level.Buttons)
                {
                    Position = position,
                    Visible = NullableBoolean.False,
                    Events = new List<ushort> { (ushort)level.Buttons.BlockEvents.Count }
                });
            else
            {
                var button = new Button(level.Buttons, child)
                {
                    Position = child.GetAttributeValueWithDefault("Position", position),
                    Visible = child.GetAttributeValueWithDefault("Visible", NullableBoolean.False)
                };
                button.Events.Add((ushort)level.Buttons.BlockEvents.Count);
            }
            level.Buttons.BlockEvents.Add(new BlockEvent(level)
            { ID = new IDReference((short)level.MovingPlatforms.Count), Type = BlockEventType.AffectMovingPlatform });
            child = container.ElementCaseInsensitive("MovingPlatform");
            MovingPlatform platform;
            if (child == null)
                platform = new MovingPlatform(level.MovingPlatforms) { AutoStart = false, LoopStartIndex = 0 };
            else
            {
                platform = new MovingPlatform(level.MovingPlatforms, child)
                {
                    AutoStart = child.GetAttributeValueWithDefault<bool>("AutoStart"),
                    LoopStartIndex = child.GetAttributeValueWithDefault<byte>("LoopStartIndex")
                };
            }
            if (platform.Waypoints.Count == 0)
            {
                platform.Waypoints.Add(new Waypoint { Position = position });
                platform.Waypoints.Add(new Waypoint
                {
                    Position = position + moveDirection,
                    TravelTime = (ushort)(mode == OtherCubeMode.Hole ? 1 : 32000)
                });
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
            writer.Write((ushort)KeyEvents.Count);
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
            Direction = (Direction)reader.ReadByte();
            EventType = (KeyEventType)reader.ReadByte();
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
            writer.Write((byte)Direction);
            writer.Write((byte)EventType);
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
}
