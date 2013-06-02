using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LibTwoTribes.Util;

namespace LibTwoTribes
{
    public class ETX0004Header
    {
        private short m_Width, m_Height, m_Depth, m_MipmapLevels, m_Unknown1;
        private ETX0004.Format m_Format;

        public short Width { get { return m_Width; } set { m_Width = value; } }
        public short Height { get { return m_Height; } set { m_Height = value; } }
        public short Depth { get { return m_Depth; } set { m_Depth = value; } }
        public short MipmapLevels { get { return m_MipmapLevels; } set { m_MipmapLevels = value; } }
        public short Unknown1 { get { return m_Unknown1; } set { m_Unknown1 = value; } }
        public ETX0004.Format Format { get { return m_Format; } set { m_Format = value; } }

        public ETX0004Header(Stream stream)
        {
            using (TTBinaryReader br = new TTBinaryReader(stream))
            {
                m_Width = br.ReadInt16();
                m_Height = br.ReadInt16();
                m_Depth = br.ReadInt16();
                m_MipmapLevels = br.ReadInt16();
                m_Format = (ETX0004.Format)br.ReadUInt16();
                m_Unknown1 = br.ReadInt16();
            }
        }

        // Not really of use yet.
        public void Save(Stream stream)
        {
            using (TTBinaryWriter bw = new TTBinaryWriter(stream))
            {
                bw.Write(m_Width);
                bw.Write(m_Height);
                bw.Write(m_Depth);
                bw.Write(m_MipmapLevels);
                bw.Write(m_Unknown1);
                bw.Write((uint)m_Format);
            }
        }
    }
}