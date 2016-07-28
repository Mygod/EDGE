using System;
using System.Globalization;
using System.IO;
using System.Text;

namespace Mygod.Edge.Tool.LibTwoTribes
{
    public struct AssetHash
    {
        private readonly uint m_Name;
        private uint m_Namespace;

        public AssetHash(uint name, uint name_space)
        {
            m_Name = name;
            m_Namespace = name_space;
        }

/*
        public AssetHash(string name, string name_space, bool strip_extension = true)
            : this(AssetUtil.CrcName(name, strip_extension), AssetUtil.CrcNamespace(name_space))
        {
        }
*/

        public uint Name { get { return m_Name; } set { m_Namespace = value; } }
        public uint Namespace { get { return m_Namespace; } set { m_Namespace = value; } }
        public static AssetHash Zero { get { return new AssetHash(0, 0); } }

        public static AssetHash FromStream(Stream stream)
        {
            using (var br = new BinaryReader(stream, Encoding.Unicode, true))
            {
                uint name = br.ReadUInt32();
                uint name_space = br.ReadUInt32();
                return new AssetHash(name, name_space);
            }
        }

        public void Save(Stream stream)
        {
            using (var bw = new BinaryWriter(stream, Encoding.Unicode, true))
            {
                bw.Write(m_Name);
                bw.Write(m_Namespace);
            }
        }

        public bool IsZero()
        {
            return (m_Name == 0) && (m_Namespace == 0);
        }

        public static AssetHash Parse(string value)
        {
            return new AssetHash(
                uint.Parse(value.Substring(0, 8), NumberStyles.HexNumber, CultureInfo.InvariantCulture),
                uint.Parse(value.Substring(8, 8), NumberStyles.HexNumber, CultureInfo.InvariantCulture));
        }

        public override string ToString()
        {
            return FormattableString.Invariant($"{m_Name:X8}{m_Namespace:X8}");
        }
    }
}