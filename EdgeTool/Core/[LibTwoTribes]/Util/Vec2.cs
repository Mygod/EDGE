using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibTwoTribes.Util
{
    public struct Vec2 : IEquatable<Vec2>
    {
        private float m_X, m_Y;

        public float X { get { return m_X; } set { m_X = value; } }
        public float Y { get { return m_Y; } set { m_Y = value; } }

        public Vec2(float x, float y)
        {
            m_X = x;
            m_Y = y;
        }

        public static Vec2 FromStream(Stream stream)
        {
            Vec2 output = new Vec2();
            using (TTBinaryReader br = new TTBinaryReader(stream))
            {
                output.X = br.ReadSingle();
                output.Y = br.ReadSingle();
            }
            return output;
        }

        public void Save(Stream stream)
        {
            using (TTBinaryWriter bw = new TTBinaryWriter(stream))
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

        public bool Equals(Vec2 other)
        {
            return Math.Abs(X - other.X) < 1e-4 && Math.Abs(Y - other.Y) < 1e-4;
        }

        public override string ToString()
        {
            return string.Format("{0},{1}", X, Y);
        }
        public static Vec2 Parse(string value)
        {
            var numbers = value.Trim('(', ')').Split(',').Select(float.Parse).ToArray();
            return new Vec2(numbers[0], numbers[1]);
        }
    }
}