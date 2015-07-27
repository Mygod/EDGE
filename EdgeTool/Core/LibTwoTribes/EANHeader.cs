using System.Diagnostics;
using System.IO;
using System.Text;

namespace Mygod.Edge.Tool.LibTwoTribes
{
    public class EANHeader
    {
        private float m_Duration;
        private AssetHash m_NodeChild;
        private AssetHash m_NodeSibling;
        private float m_Unknown1;
        private uint m_Zero1;
        private uint m_Zero2;

        private EANHeader(Stream stream)
        {
            using (var br = new BinaryReader(stream, Encoding.Unicode, true))
            {
                m_Unknown1 = br.ReadSingle();
                m_Duration = br.ReadSingle();
                m_Zero1 = br.ReadUInt32();
                if (m_Zero1 != 0) Warning.WriteLine("ean_file_t::zero1 not 0!");
                m_Zero2 = br.ReadUInt32();
                if (m_Zero2 != 0) Warning.WriteLine("ean_file_t::zero2 not 0!");
                m_NodeChild = AssetHash.FromStream(stream);
                m_NodeSibling = AssetHash.FromStream(stream);
            }
        }

        public EANHeader()
        {
        }

        public float Unknown1 { get { return m_Unknown1; } set { m_Unknown1 = value; } }
        public float Duration { get { return m_Duration; } set { m_Duration = value; } }
        public uint Zero1 { get { return m_Zero1; } set { m_Zero1 = value; } }
        public uint Zero2 { get { return m_Zero2; } set { m_Zero2 = value; } }
        public AssetHash NodeChild { get { return m_NodeChild; } set { m_NodeChild = value; } }
        public AssetHash NodeSibling { get { return m_NodeSibling; } set { m_NodeSibling = value; } }

        public static EANHeader FromStream(Stream stream)
        {
            return new EANHeader(stream);
        }

        public void Save(Stream stream)
        {
            using (var bw = new BinaryWriter(stream, Encoding.Unicode, true))
            {
                bw.Write(m_Unknown1);
                bw.Write(m_Duration);
                bw.Write(m_Zero1);
                bw.Write(m_Zero2);
                m_NodeChild.Save(stream);
                m_NodeSibling.Save(stream);
            }
        }
    }
}