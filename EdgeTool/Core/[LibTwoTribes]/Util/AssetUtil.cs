using System.Text;

namespace LibTwoTribes.Util
{
    public static class AssetUtil
    {
        public enum EngineVersion : ulong
        {
            Version1803_Rush = 0x0018000000000003,
            Version1804_Edge = 0x0018000000000004,
            VersionD003_EdgeOld = 0x00D0000000000003,
            VersionD103_EdgeOld = 0x00D1000000000003,
            VersionD603_EdgeOld = 0x00D6000000000003,
            VersionDB03_EdgeOld = 0x00DB000000000003,
            VersionDF03_EdgeOld = 0x00DF000000000003,
            Version0004_TT2 = 0x0000000000000004,
        };

        private static CRC32 s_CRC32_Name = new CRC32(CRC32.DEFAULT_POLYNOMIAL);
        private static CRC32 s_CRC32_NameSpace = new CRC32(~CRC32.DEFAULT_POLYNOMIAL);

        public static string GetEngineVersionName(AssetUtil.EngineVersion version)
        {
            switch ((EngineVersion)version)
            {
                case EngineVersion.Version1803_Rush: return "18-03 [RUSH]";
                case EngineVersion.Version1804_Edge: return "18-04 [EDGE]";
                case EngineVersion.VersionD003_EdgeOld: return "D0-03 [EDGE OLD]";
                case EngineVersion.VersionD103_EdgeOld: return "D1-03 [EDGE OLD]";
                case EngineVersion.VersionD603_EdgeOld: return "D6-03 [EDGE OLD]";
                case EngineVersion.VersionDB03_EdgeOld: return "DB-03 [EDGE OLD]";
                case EngineVersion.VersionDF03_EdgeOld: return "DF-03 [EDGE OLD]";
                case EngineVersion.Version0004_TT2: return "00-04 [TOKI TORI 2]";
            }
            return "[0x" + ((ulong)version).ToString("X16") + "]";
        }

        public static string CRCFullName(string name, string name_space, bool strip_extension = true)
        {
            return CRCName(name, strip_extension).ToString("X8") + CRCNamespace(name_space).ToString("X8");
        }

        public static uint CRCName(string name, bool strip_extension = true)
        {
            if (strip_extension && name.Contains(".")) name = name.Substring(0, name.LastIndexOf('.'));
            return s_CRC32_Name.CalculateCRC(BinaryUtil.Reverse(Encoding.ASCII.GetBytes(name)));
        }

        public static uint CRCNamespace(string name_space)
        {
            return s_CRC32_NameSpace.CalculateCRC(BinaryUtil.Reverse(Encoding.ASCII.GetBytes(name_space)));
        }
    }
}