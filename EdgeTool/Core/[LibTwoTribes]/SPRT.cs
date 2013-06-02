using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LibTwoTribes.Util;

namespace LibTwoTribes
{
    public class SPRT
    {
        private static readonly byte[] MAGIC = { (byte)'S', (byte)'P', (byte)'R', (byte)'T', 0x00 };
            // static readonly is basically "const for non-string reference types"

        private uint m_Unknown1;
        private float m_Width;
        private float m_Height;
        private uint m_FrameCount;

        public uint Unknown1 { get { return m_Unknown1; } set { m_Unknown1 = value; } }
        public float Width { get { return m_Width; } set { m_Width = value; } }
        public float Height { get { return m_Height; } set { m_Height = value; } }
        public uint FrameCount { get { return m_FrameCount; } set { m_FrameCount = value; } }

        private SPRT(Stream stream)
        {
            _CreateFromStream(stream);
        }

        public static SPRT FromFile(string path)
        {
            using (FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read))
            {
                return FromStream(fs);
            }
        }

        public static SPRT FromStream(Stream stream)
        {
            return new SPRT(stream);
        }

        private void _CreateFromStream(Stream stream)
        {
            using (TTBinaryReader br = new TTBinaryReader(stream))
            {
                byte[] magic = new byte[MAGIC.Length];
                br.Read(magic, 0, magic.Length);
                for (int i = 0; i < magic.Length; i++)        // there's gotta be a better way of comparing byte arrays....
                {
                    if (magic[i] != MAGIC[i])
                    {
                        throw new Exception("Magic header does not match.");
                    }
                }
                m_Unknown1 = br.ReadUInt32();
                m_Width = br.ReadSingle();
                m_Height = br.ReadSingle();
                m_FrameCount = br.ReadUInt32();
            }
        }

        public void Save(string path)
        {
            using (FileStream fs = new FileStream(path, FileMode.Create, FileAccess.Write))
            {
                Save(fs);
            }
        }

        public void Save(Stream stream)
        {
            using (TTBinaryWriter bw = new TTBinaryWriter(stream))
            {
                bw.Write(MAGIC);
                bw.Write(m_Unknown1);
                bw.Write(m_Width);
                bw.Write(m_Height);
                bw.Write(m_FrameCount);
            }
        }
    }
}