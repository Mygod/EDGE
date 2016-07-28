using System;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;

namespace Mygod.Edge.Tool.LibTwoTribes.Util
{
    public struct Vec2 : IEquatable<Vec2>
    {
        private float m_X, m_Y;

        public Vec2(float x, float y)
        {
            m_X = x;
            m_Y = y;
        }

        public float X { get { return m_X; } set { m_X = value; } }
        public float Y { get { return m_Y; } set { m_Y = value; } }

        public bool Equals(Vec2 other)
        {
            return Math.Abs(X - other.X) < 1e-4 && Math.Abs(Y - other.Y) < 1e-4;
        }

        public static Vec2 FromStream(Stream stream)
        {
            var output = new Vec2();
            using (var br = new BinaryReader(stream, Encoding.Unicode, true))
            {
                output.X = br.ReadSingle();
                output.Y = br.ReadSingle();
            }
            return output;
        }

        public void Save(Stream stream)
        {
            using (var bw = new BinaryWriter(stream, Encoding.Unicode, true))
            {
                bw.Write(m_X);
                bw.Write(m_Y);
            }
        }

        public static Vec2 operator +(Vec2 a, Vec2 b)
        {
            return new Vec2(
                a.X + b.X,
                a.Y + b.Y
                );
        }

        public static Vec2 operator -(Vec2 a)
        {
            return new Vec2(
                -a.X,
                -a.Y
                );
        }

        public static Vec2 operator -(Vec2 a, Vec2 b)
        {
            return new Vec2(
                a.X - b.X,
                a.Y - b.Y
                );
        }

        public static Vec2 operator *(Vec2 a, float b)
        {
            return new Vec2(
                a.X * b,
                a.Y * b
                );
        }

        public static Vec2 operator *(float a, Vec2 b)
        {
            return b * a;
        }

        public static Vec2 operator /(Vec2 a, float b)
        {
            return new Vec2(
                a.X / b,
                a.Y / b
                );
        }

        public override string ToString()
        {
            return FormattableString.Invariant($"{X},{Y}");
        }

        public static Vec2 Parse(string value)
        {
            var numbers =
                value.Trim('(', ')').Split(',').Select(f => float.Parse(f, CultureInfo.InvariantCulture)).ToArray();
            return new Vec2(numbers[0], numbers[1]);
        }
    }
}