using System;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;

namespace Mygod.Edge.Tool.LibTwoTribes.Util
{
    public struct Vec3 : IEquatable<Vec3>
    {
        private float m_X, m_Y, m_Z;

        public Vec3(float x, float y, float z)
        {
            m_X = x;
            m_Y = y;
            m_Z = z;
        }

        public float X { get { return m_X; } set { m_X = value; } }
        public float Y { get { return m_Y; } set { m_Y = value; } }
        public float Z { get { return m_Z; } set { m_Z = value; } }

        public bool Equals(Vec3 other)
        {
            return Math.Abs(X - other.X) < 1e-4 && Math.Abs(Y - other.Y) < 1e-4 && Math.Abs(Z - other.Z) < 1e-4;
        }

        public static Vec3 FromStream(Stream stream)
        {
            var output = new Vec3();
            using (var br = new BinaryReader(stream, Encoding.Unicode, true))
            {
                output.X = br.ReadSingle();
                output.Y = br.ReadSingle();
                output.Z = br.ReadSingle();
            }
            return output;
        }

        public void Save(Stream stream)
        {
            using (var bw = new BinaryWriter(stream, Encoding.Unicode, true))
            {
                bw.Write(m_X);
                bw.Write(m_Y);
                bw.Write(m_Z);
            }
        }

        public static Vec3 operator +(Vec3 a, Vec3 b)
        {
            return new Vec3(
                a.X + b.X,
                a.Y + b.Y,
                a.Z + b.Z
                );
        }

        public static Vec3 operator -(Vec3 a)
        {
            return new Vec3(
                -a.X,
                -a.Y,
                -a.Z
                );
        }

        public static Vec3 operator -(Vec3 a, Vec3 b)
        {
            return new Vec3(
                a.X - b.X,
                a.Y - b.Y,
                a.Z - b.Z
                );
        }

        public static Vec3 operator *(Vec3 a, float b)
        {
            return new Vec3(
                a.X * b,
                a.Y * b,
                a.Z * b
                );
        }

        public static Vec3 operator *(float a, Vec3 b)
        {
            return b * a;
        }

        public static Vec3 operator /(Vec3 a, float b)
        {
            return new Vec3(
                a.X / b,
                a.Y / b,
                a.Z / b
                );
        }

        public override string ToString()
        {
            return FormattableString.Invariant($"{X},{Y},{Z}");
        }

        public static Vec3 Parse(string value)
        {
            var numbers =
                value.Trim('(', ')').Split(',').Select(f => float.Parse(f, CultureInfo.InvariantCulture)).ToArray();
            return new Vec3(numbers[0], numbers[1], numbers[2]);
        }
    }
}