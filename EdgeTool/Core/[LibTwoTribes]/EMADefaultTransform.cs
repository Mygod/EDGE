using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using LibTwoTribes.Util;

namespace LibTwoTribes
{
    public class EMADefaultTransform
    {
        private float m_ScaleU;
        private float m_ScaleV;
        private float m_Rotation;
        private float m_TranslationU;
        private float m_TranslationV;

        public float ScaleU { get { return m_ScaleU; } set { m_ScaleU = value; } }
        public float ScaleV { get { return m_ScaleV; } set { m_ScaleV = value; } }
        public float Rotation { get { return m_Rotation; } set { m_Rotation = value; } }
        public float TranslationU { get { return m_TranslationU; } set { m_TranslationU = value; } }
        public float TranslationV { get { return m_TranslationV; } set { m_TranslationV = value; } }

        private EMADefaultTransform(Stream stream)
        {
            using (TTBinaryReader br = new TTBinaryReader(stream))
            {
                m_ScaleU = br.ReadSingle();
                m_ScaleV = br.ReadSingle();
                m_Rotation = br.ReadSingle();
                m_TranslationU = br.ReadSingle();
                m_TranslationV = br.ReadSingle();
            }
        }

        public EMADefaultTransform()
        {
            m_ScaleU = 1;
            m_ScaleV = 1;
            m_Rotation = 0;
            m_TranslationU = 0;
            m_TranslationV = 0;
        }
        
        public static EMADefaultTransform FromStream(Stream stream)
        {
            return new EMADefaultTransform(stream);
        }

        public void Save(Stream stream)
        {
            using (TTBinaryWriter bw = new TTBinaryWriter(stream))
            {
                bw.Write(m_ScaleU);
                bw.Write(m_ScaleV);
                bw.Write(m_Rotation);
                bw.Write(m_TranslationU);
                bw.Write(m_TranslationV);
            }
        }
    }
}
