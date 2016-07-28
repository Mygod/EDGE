using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;

namespace Mygod.Edge.Tool
{
    public struct Point2D8 : IXSerializable, IEquatable<Point2D8>
    {
        public Point2D8(byte x, byte y)
        {
            X = x;
            Y = y;
        }
        public Point2D8(BinaryReader reader)
        {
            X = reader.ReadByte();
            Y = reader.ReadByte();
        }

        public readonly byte X, Y;

        public bool Equals(Point2D8 other)
        {
            return X == other.X && Y == other.Y;
        }
        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            return obj is Point2D8 && Equals((Point2D8)obj);
        }
        public override int GetHashCode()
        {
            unchecked
            {
                return (X.GetHashCode() * 397) ^ Y.GetHashCode();
            }
        }

        public override string ToString()
        {
            return FormattableString.Invariant($"{X},{Y}");
        }

        public void Write(BinaryWriter writer)
        {
            writer.Write(X);
            writer.Write(Y);
        }

        public static Point2D8 Parse(string str)
        {
            var numbers = str.Trim('(', ')').Split(',');
            byte x, y;
            if (numbers.Length != 2 ||
                !byte.TryParse(numbers[0].Trim(), NumberStyles.Integer, CultureInfo.InvariantCulture, out x) ||
                !byte.TryParse(numbers[1].Trim(), NumberStyles.Integer, CultureInfo.InvariantCulture, out y))
                throw new FormatException(Localization.UnrecognizedCoordinate);
            return new Point2D8(x, y);
        }
    }
    public struct Point3D16 : IXSerializable, IEquatable<Point3D16>, IComparable, IComparable<Point3D16>
    {
        public Point3D16(short x, short y, short z)
        {
            X = x;
            Y = y;
            Z = z;
        }
        public Point3D16(BinaryReader reader)
        {
            X = reader.ReadInt16();
            Y = reader.ReadInt16();
            Z = reader.ReadInt16();
        }

        public readonly short X, Y, Z;

        public bool Equals(Point3D16 other)
        {
            return X == other.X && Y == other.Y && Z == other.Z;
        }
        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            return obj is Point3D16 && Equals((Point3D16)obj);
        }
        public override int GetHashCode()
        {
            unchecked
            {
                var hashCode = X.GetHashCode();
                hashCode = (hashCode * 397) ^ Y.GetHashCode();
                hashCode = (hashCode * 397) ^ Z.GetHashCode();
                return hashCode;
            }
        }

        public int CompareTo(object obj)
        {
            if (!(obj is Point3D16)) throw new NotSupportedException();
            return CompareTo((Point3D16)obj);
        }
        public int CompareTo(Point3D16 other)
        {
            var result = X.CompareTo(other.X);
            if (result != 0) return result;
            result = Y.CompareTo(other.Y);
            return result != 0 ? result : Z.CompareTo(other.Z);
        }

        public static bool operator ==(Point3D16 left, Point3D16 right)
        {
            return left.Equals(right);
        }
        public static bool operator !=(Point3D16 left, Point3D16 right)
        {
            return !left.Equals(right);
        }

        public override string ToString()
        {
            return FormattableString.Invariant($"{X},{Y},{Z}");
        }

        public void Write(BinaryWriter writer)
        {
            writer.Write(X);
            writer.Write(Y);
            writer.Write(Z);
        }

        public static Point3D16 Parse(string str)
        {
            var numbers =
                str.Trim('(', ')').Split(',').Select(s => short.Parse(s, CultureInfo.InvariantCulture)).ToArray();
            return new Point3D16(numbers[0], numbers[1], numbers[2]);
        }

        public static Point3D16 operator +(Point3D16 a, Point3D16 b)
        {
            return new Point3D16((short)(a.X + b.X), (short)(a.Y + b.Y), (short)(a.Z + b.Z));
        }
        public static Point3D16 operator -(Point3D16 a, Point3D16 b)
        {
            return a + -b;
        }
        public static Point3D16 operator -(Point3D16 value)
        {
            return new Point3D16((short)-value.X, (short)-value.Y, (short)-value.Z);
        }
    }

    public struct Rect8
    {
        public Rect8(Point2D8 point, Point2D8 size)
        {
            Point = point;
            Size = size;
        }

        public Rect8(int x, int y, int sizeX, int sizeY)
            : this(new Point2D8((byte)x, (byte)y), new Point2D8((byte)sizeX, (byte)sizeY))
        { }
        public Rect8(BinaryReader reader) : this(new Point2D8(reader), new Point2D8(reader)) { }

        public Point2D8 Point;
        public Point2D8 Size;

        public void Write(BinaryWriter writer)
        {
            Point.Write(writer);
            Size.Write(writer);
        }
    }

    public struct Size2D : IXSerializable, IEquatable<Size2D>
    {
        public Size2D(ushort width, ushort length)
        {
            Width = width;
            Length = length;
        }

        public readonly ushort Width, Length;
        public int FlatBytes => Flat.GetBytes(Width, Length);

        public static implicit operator Size2D(Size3D size)
        {
            return new Size2D(size.Width, size.Length);
        }
        public static bool operator ==(Size2D a, Size2D b)
        {
            return a.Equals(b);
        }
        public static bool operator !=(Size2D a, Size2D b)
        {
            return !(a == b);
        }

        public bool Equals(Size2D other)
        {
            return Width == other.Width && Length == other.Length;
        }
        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            return obj is Size2D && Equals((Size2D)obj);
        }
        public override int GetHashCode()
        {
            unchecked
            {
                return (Width.GetHashCode() * 397) ^ Length.GetHashCode();
            }
        }

        public override string ToString()
        {
            return FormattableString.Invariant($"{Width}x{Length}");
        }

        public void Write(BinaryWriter writer)
        {
            writer.Write(Width);
            writer.Write(Length);
        }
    }
    public struct Size3D : IXSerializable, IComparable, IComparable<Size3D>
    {
        public Size3D(byte height, ushort width, ushort length)
        {
            Height = height;
            Width = width;
            Length = length;
        }
        public Size3D(BinaryReader reader)
        {
            Height = reader.ReadByte();
            Width = reader.ReadUInt16();
            Length = reader.ReadUInt16();
        }

        public readonly ushort Width, Length;
        public readonly byte Height;

        public int CompareTo(Size3D other)
        {
            return (Width * Length * Height).CompareTo(other.Width * other.Length * other.Height);
        }
        public int CompareTo(object obj)
        {
            if (!(obj is Size3D)) throw new NotSupportedException();
            return CompareTo((Size3D)obj);
        }

        public override string ToString()
        {
            return FormattableString.Invariant($"{Width}x{Length}x{Height}");
        }
        public static Size3D Parse(string str)
        {
            var numbers = str.Split('x');
            ushort width, length;
            byte height;
            if (numbers.Length != 3 ||
                !ushort.TryParse(numbers[0].Trim(), NumberStyles.Integer, CultureInfo.InvariantCulture, out width) ||
                !ushort.TryParse(numbers[1].Trim(), NumberStyles.Integer, CultureInfo.InvariantCulture, out length) ||
                !byte.TryParse(numbers[2].Trim(), NumberStyles.Integer, CultureInfo.InvariantCulture, out height))
                throw new FormatException(Localization.UnrecognizedSize);
            return new Size3D(height, width, length);
        }

        public bool IsBlockInArea(int x, int y, int z)
        {
            return x >= 0 && y >= 0 && z >= 0 && x < Width && y < Length && z < Height;
        }
        public bool IsBlockInArea(Point3D16 point)
        {
            return IsBlockInArea(point.X, point.Y, point.Z);
        }
        public bool IsCubeInArea(int x, int y, int z)
        {
            return x >= 0 && y >= 0 && z > 0 && x < Width && y < Length && z <= Height;
        }
        public bool IsCubeInArea(Point3D16 point)
        {
            return IsCubeInArea(point.X, point.Y, point.Z);
        }

        public static bool operator ==(Size3D a, Size3D b)
        {
            return a.Equals(b);
        }
        public static bool operator !=(Size3D a, Size3D b)
        {
            return !a.Equals(b);
        }

        public bool Equals(Size3D other)
        {
            return Width == other.Width && Length == other.Length && Height == other.Height;
        }
        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            return obj is Size3D && Equals((Size3D)obj);
        }
        public override int GetHashCode()
        {
            unchecked
            {
                int hashCode = Width.GetHashCode();
                hashCode = (hashCode * 397) ^ Length.GetHashCode();
                hashCode = (hashCode * 397) ^ Height.GetHashCode();
                return hashCode;
            }
        }

        public void Write(BinaryWriter writer)
        {
            writer.Write(Height);
            writer.Write(Width);
            writer.Write(Length);
        }

        public Size2D DefaultLegacyMinimapSize
        {
            get
            {
                var p = Width + Length;
                return new Size2D((ushort)((p + 9) / 10), (ushort)((p + Height + Height + 9) / 10));
            }
        }
    }

    public sealed class Flat : IXSerializable
    {
        public Flat(int width, int length, byte[] array = null)
        {
            Length = length;
            Width = width;
            data = array == null ? new BitArray(GetBytes(width, length) << 3) : new BitArray(array);
        }
        public Flat(Size2D size, byte[] array = null) : this(size.Width, size.Length, array)
        {
        }
        public Flat(BinaryReader reader, Size2D size)
            : this(size.Width, size.Length, reader.ReadBytes(size.FlatBytes))
        {
        }
        public Flat(string path, Size2D size) : this(size.Width, size.Length)
        {
            if (!File.Exists(path)) return;
            Size2D fileSize;
            var array = ImageConverter.Load(path, out fileSize);
            if (fileSize != size) Warning.WriteLine(string.Format(Localization.ImageSizeIncorrect, path, size));
            else
            {
                detailedInformation = array;
                var pos = 0;
                for (var y = 0; y < size.Length; y++)
                    for (var x = 0; x < size.Width; x++, pos++)
                    {
                        var color = array[pos];
                        this[x, y] = color.R == 255;
                    }
            }
        }

        public static readonly Color Empty = Color.Black,
            HalfBlock = Color.FromArgb(unchecked((int)0xFFFFFF80)), Block = Color.White,
            HalfBlockModelOnly = Color.FromArgb(unchecked((int)0xFF00FF80)), BlockModelOnly = Color.Cyan;

        public void InitImage(bool half = false)
        {
            detailedInformation = new Color[Width * Length];
            var block = half ? HalfBlock : Block;
            for (var y = 0; y < Length; ++y)
                for (var x = 0; x < Width; ++x)
                    detailedInformation[y * Width + x] = this[x, y] ? block : Empty;
        }

        public void SaveToImage(string path, bool half = false)
        {
            if (detailedInformation == null) InitImage(half);
            for (var y = 0; y < Length; y++)
                for (var x = 0; x < Width; x++)
                    if (GetColor(x, y) != Empty)
                    {
                        ImageConverter.Save(detailedInformation, Width, Length, path);
                        return;
                    }
        }

        private readonly BitArray data;
        public readonly int Width, Length;
        private Color[] detailedInformation;

        public static int GetBytes(int width, int length)
        {
            return (width * length + 7) >> 3;
        }

        public int Bytes => GetBytes(Width, Length);

        private int GetPosition(int x, int y)
        {
            int pos = y * Width + x, posBit = pos & 7;  // posBase = pos & ~7 = pos - posBit
            return pos + 7 - posBit - posBit;           // return posBase + (7 - posBit);
        }

        public Color GetColor(int x, int y, bool half = false)
        {
            if (detailedInformation == null) InitImage(half);
            return detailedInformation[y * Width + x];
        }
        public void SetColor(int x, int y, Color color, bool half = false)
        {
            if (detailedInformation == null) InitImage(half);
            detailedInformation[y * Width + x] = color;
        }
        public bool this[int x, int y]
        {
            get { return data[GetPosition(x, y)]; }
            set { data[GetPosition(x, y)] = value; }
        }

        public void Write(BinaryWriter writer)
        {
            var array = new byte[Bytes];
            data.CopyTo(array, 0);
            writer.Write(array);
        }
    }

    public sealed class Cube : List<Flat>, IXSerializable
    {
        public Cube(Size3D size)
        {
            Size = size;
            for (var z = 0; z < size.Height; z++) Add(new Flat(size));
        }
        public Cube(BinaryReader reader, Size3D size)
        {
            Size = size;
            for (var z = 0; z < size.Height; z++) Add(new Flat(reader, size));
        }
        public Cube(string pathFormat, Size3D size)
        {
            Size = size;
            for (var z = 0; z < size.Height; z++) Add(new Flat(string.Format(pathFormat, z), size));
        }

        public Size3D Size;

        public void InitImage()
        {
            for (var z = 0; z < Size.Height; z++) this[z].InitImage(z == 0);
        }
        public Color GetColor(int x, int y, int z)
        {
            return Size.IsBlockInArea(x, y, z) ? this[z].GetColor(x, y) : Flat.Empty;
        }
        public void SetColor(int x, int y, int z, Color value)
        {
            if (Size.IsBlockInArea(x, y, z)) this[z].SetColor(x, y, value);
            else throw new ArgumentOutOfRangeException();
        }
        public bool this[Point3D16 point]
        {
            get { return this[point.X, point.Y, point.Z]; }
            set { this[point.X, point.Y, point.Z] = value; }
        }
        public bool this[int x, int y, int z]
        {
            get { return Size.IsBlockInArea(x, y, z) && this[z][x, y]; }
            set { this[z][x, y] = value; }
        }

        public void Write(BinaryWriter writer)
        {
            foreach (var flat in this) flat.Write(writer);
        }
    }
}
