using System;
using System.IO;
using System.Text;
using Mygod.Edge.Tool.LibTwoTribes.Util;

namespace Mygod.Edge.Tool.LibTwoTribes
{
    public class AssetHeader
    {
        private const int NAME_LENGTH = 0x40;

        private AssetUtil.EngineVersion m_EngineVersion;
        private string m_Name;
        private string m_Namespace;

        public AssetHeader(AssetUtil.EngineVersion engineVersion, string name, string nameSpace)
        {
            EngineVersion = engineVersion;
            Name = name;
            Namespace = nameSpace;
        }

        public AssetHeader(Stream stream)
        {
            using (var br = new BinaryReader(stream, Encoding.Unicode, true))
            {
                m_EngineVersion = (AssetUtil.EngineVersion) br.ReadUInt64();

                var b_name = new byte[NAME_LENGTH];
                var b_namespace = new byte[NAME_LENGTH];

                br.Read(b_name, 0, b_name.Length);
                br.Read(b_namespace, 0, b_namespace.Length);

                m_Name = Encoding.ASCII.GetString(b_name).Replace("\0", "");
                m_Namespace = Encoding.ASCII.GetString(b_namespace).Replace("\0", "");
            }
        }

        public AssetUtil.EngineVersion EngineVersion
        {
            get { return m_EngineVersion; }
            set { m_EngineVersion = value; }
        }

        public string Name { get { return m_Name; } set { m_Name = value; } }
        public string Namespace { get { return m_Namespace; } set { m_Namespace = value; } }

/*
        public string GenerateFilename()
        {
            return AssetUtil.CrcFullName(m_Name, m_Namespace);
        }
*/

        public void Save(Stream stream)
        {
            using (var bw = new BinaryWriter(stream, Encoding.Unicode, true))
            {
                byte[] b_name = BinaryUtil.PadOrTruncate(Encoding.ASCII.GetBytes(m_Name), NAME_LENGTH);
                byte[] b_namespace = BinaryUtil.PadOrTruncate(Encoding.ASCII.GetBytes(m_Namespace), NAME_LENGTH);

                bw.Write((UInt64) m_EngineVersion);
                bw.Write(b_name);
                bw.Write(b_namespace);
            }
        }
    }
}