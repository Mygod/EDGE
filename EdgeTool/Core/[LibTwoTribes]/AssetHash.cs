using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using LibTwoTribes.Util;

namespace LibTwoTribes
{
    public struct AssetHash
    {
        private uint m_Name;
        private uint m_Namespace;

        public uint Name { get { return m_Name; } set { m_Namespace = value; } }
        public uint Namespace { get { return m_Namespace; } set { m_Namespace = value; } }

        public AssetHash(uint name, uint name_space)
        {
            m_Name = name;
            m_Namespace = name_space;
        }
        public AssetHash(string name, string name_space, bool strip_extension = true)
            : this(AssetUtil.CRCName(name, strip_extension), AssetUtil.CRCNamespace(name_space))
        {
        }

        public static AssetHash FromStream(Stream stream)
        {
            using (TTBinaryReader br = new TTBinaryReader(stream))
            {
                uint name = br.ReadUInt32();
                uint name_space = br.ReadUInt32();
                return new AssetHash(name, name_space);
            }
        }

        public void Save(Stream stream)
        {
            using (TTBinaryWriter bw = new TTBinaryWriter(stream))
            {
                bw.Write(m_Name);
                bw.Write(m_Namespace);
            }
        }

        public static AssetHash Zero { get { return new AssetHash(0, 0); } }

        public bool IsZero()
        {
            return (m_Name == 0) && (m_Namespace == 0);
        }

        public static AssetHash Parse(string value)
        {
            return new AssetHash(uint.Parse(value.Substring(0, 8), NumberStyles.HexNumber),
                                 uint.Parse(value.Substring(8, 8), NumberStyles.HexNumber));
        }

        public override string ToString()
        {
            return m_Name.ToString("X8") + m_Namespace.ToString("X8");
        }
    }
}