using System.IO;
using System.Text;

namespace Mygod.Edge.Tool.LibTwoTribes
{
    public class EMADefaultTransform
    {
        private float m_Rotation;
        private float m_ScaleU;
        private float m_ScaleV;
        private float m_TranslationU;
        private float m_TranslationV;

        private EMADefaultTransform(Stream stream)
        {
            using (var br = new BinaryReader(stream, Encoding.Unicode, true))
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

        public float ScaleU { get { return m_ScaleU; } set { m_ScaleU = value; } }
        public float ScaleV { get { return m_ScaleV; } set { m_ScaleV = value; } }
        public float Rotation { get { return m_Rotation; } set { m_Rotation = value; } }
        public float TranslationU { get { return m_TranslationU; } set { m_TranslationU = value; } }
        public float TranslationV { get { return m_TranslationV; } set { m_TranslationV = value; } }

        public static EMADefaultTransform FromStream(Stream stream)
        {
            return new EMADefaultTransform(stream);
        }

        public void Save(Stream stream)
        {
            using (var bw = new BinaryWriter(stream, Encoding.Unicode, true))
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