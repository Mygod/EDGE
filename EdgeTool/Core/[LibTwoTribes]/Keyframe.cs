using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using LibTwoTribes.Util;

namespace LibTwoTribes
{
    public class Keyframe
    {
        private float m_Time;
        private float m_Value;
        private float m_Delta;

        public float Time { get { return m_Time; } set { m_Time = value; } }
        public float Value { get { return m_Value; } set { m_Value = value; } }
        public float Delta { get { return m_Delta; } set { m_Delta = value; } }

        public Keyframe(float time, float value, float delta)
        {
            m_Time = time;
            m_Value = value;
            m_Delta = delta;
        }

        private Keyframe(Stream stream)
        {
            using (TTBinaryReader br = new TTBinaryReader(stream))
            {
                m_Time = br.ReadSingle();
                m_Value = br.ReadSingle();
                m_Delta = br.ReadSingle();
            }
        }

        public static Keyframe FromStream(Stream stream)
        {
            return new Keyframe(stream);
        }

        public void Save(Stream stream)
        {
            using (TTBinaryWriter bw = new TTBinaryWriter(stream))
            {
                bw.Write(m_Time);
                bw.Write(m_Value);
                bw.Write(m_Delta);
            }
        }
    }
}