using System.IO;
using System.Text;

namespace Mygod.Edge.Tool.LibTwoTribes
{
    public class Keyframe
    {
        private float m_Delta;
        private float m_Time;
        private float m_Value;

        public Keyframe(float time, float value, float delta)
        {
            m_Time = time;
            m_Value = value;
            m_Delta = delta;
        }

        private Keyframe(Stream stream)
        {
            using (var br = new BinaryReader(stream, Encoding.Unicode, true))
            {
                m_Time = br.ReadSingle();
                m_Value = br.ReadSingle();
                m_Delta = br.ReadSingle();
            }
        }

        public float Time { get { return m_Time; } set { m_Time = value; } }
        public float Value { get { return m_Value; } set { m_Value = value; } }
        public float Delta { get { return m_Delta; } set { m_Delta = value; } }

        public static Keyframe FromStream(Stream stream)
        {
            return new Keyframe(stream);
        }

        public void Save(Stream stream)
        {
            using (var bw = new BinaryWriter(stream, Encoding.Unicode, true))
            {
                bw.Write(m_Time);
                bw.Write(m_Value);
                bw.Write(m_Delta);
            }
        }
    }
}