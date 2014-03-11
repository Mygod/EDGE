using System.IO;
using System.Text;

namespace Mygod.Edge.Tool.LibTwoTribes
{
    public class ESOFooter
    {
        private float m_V01;
        private float m_V02;
        private int m_V03;
        private int m_V04;

        public ESOFooter()
            : this(0, 0, 0, 0)
        {
        }

        public ESOFooter(float v01, float v02, int v03, int v04)
        {
            m_V01 = v01;
            m_V02 = v02;
            m_V03 = v03;
            m_V04 = v04;
        }

        private ESOFooter(Stream stream)
        {
            using (var br = new BinaryReader(stream, Encoding.Unicode, true))
            {
                m_V01 = br.ReadSingle();
                m_V02 = br.ReadSingle();
                m_V03 = br.ReadInt32();
                m_V04 = br.ReadInt32();
            }
        }

        public float V01 { get { return m_V01; } set { m_V01 = value; } }
        public float V02 { get { return m_V02; } set { m_V02 = value; } }
        public int V03 { get { return m_V03; } set { m_V03 = value; } }
        public int V04 { get { return m_V04; } set { m_V04 = value; } }

        public static ESOFooter FromStream(Stream stream)
        {
            return new ESOFooter(stream);
        }

        public void Save(Stream stream)
        {
            using (var bw = new BinaryWriter(stream, Encoding.Unicode, true))
            {
                bw.Write(m_V01);
                bw.Write(m_V02);
                bw.Write(m_V03);
                bw.Write(m_V04);
            }
        }
    }
}