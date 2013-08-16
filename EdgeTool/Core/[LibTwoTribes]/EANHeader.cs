using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LibTwoTribes.Util;

namespace LibTwoTribes
{
    public class EANHeader
    {
        private float m_Unknown1;
        private float m_Duration;
        private uint m_Zero1;
        private uint m_Zero2;
        private AssetHash m_NodeChild;
        private AssetHash m_NodeSibling;

        public float Unknown1 { get { return m_Unknown1; } set { m_Unknown1 = value; } }
        public float Duration { get { return m_Duration; } set { m_Duration = value; } }
        public uint Zero1 { get { return m_Zero1; } set { m_Zero1 = value; } }
        public uint Zero2 { get { return m_Zero2; } set { m_Zero2 = value; } }
        public AssetHash NodeChild { get { return m_NodeChild; } set { m_NodeChild = value; } }
        public AssetHash NodeSibling { get { return m_NodeSibling; } set { m_NodeSibling = value; } }

        private EANHeader(Stream stream)
        {
            using (TTBinaryReader br = new TTBinaryReader(stream))
            {
                m_Unknown1 = br.ReadSingle();
                m_Duration = br.ReadSingle();
                m_Zero1 = br.ReadUInt32();
                m_Zero2 = br.ReadUInt32();
                m_NodeChild = AssetHash.FromStream(stream);
                m_NodeSibling = AssetHash.FromStream(stream);
            }
        }
        public EANHeader()
        {
        }

        public static EANHeader FromStream(Stream stream)
        {
            return new EANHeader(stream);
        }

        public void Save(Stream stream)
        {
            using (TTBinaryWriter bw = new TTBinaryWriter(stream))
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