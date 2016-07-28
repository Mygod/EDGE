using System;
using System.Text;

namespace Mygod.Edge.Tool.LibTwoTribes.Util
{
    public static class AssetUtil
    {
        public enum EngineVersion : ulong
        {
            Version1803Rush = 0x0018000000000003,
            Version1804Edge = 0x0018000000000004,
            VersionD003EdgeOld = 0x00D0000000000003,
            VersionD103EdgeOld = 0x00D1000000000003,
            VersionD603EdgeOld = 0x00D6000000000003,
            VersionDb03EdgeOld = 0x00DB000000000003,
            VersionDf03EdgeOld = 0x00DF000000000003,
        };

        private static readonly CRC32 Crc32Name = new CRC32();
        private static readonly CRC32 Crc32NameSpace = new CRC32(~CRC32.DEFAULT_POLYNOMIAL);

        public static string GetEngineVersionName(EngineVersion version)
        {
            switch (version)
            {
                case EngineVersion.Version1803Rush:
                    return "18-03 [RUSH]";
                case EngineVersion.Version1804Edge:
                    return "18-04 [EDGE]";
                case EngineVersion.VersionD003EdgeOld:
                    return "D0-03 [EDGE OLD]";
                case EngineVersion.VersionD103EdgeOld:
                    return "D1-03 [EDGE OLD]";
                case EngineVersion.VersionD603EdgeOld:
                    return "D6-03 [EDGE OLD]";
                case EngineVersion.VersionDb03EdgeOld:
                    return "DB-03 [EDGE OLD]";
                case EngineVersion.VersionDf03EdgeOld:
                    return "DF-03 [EDGE OLD]";
            }
            return FormattableString.Invariant($"[0x{(ulong) version:X16}]");
        }

        public static string CrcFullName(string name, string nameSpace, bool stripExtension = true)
        {
            return FormattableString.Invariant($"{CrcName(name, stripExtension):X8}{CrcNamespace(nameSpace):X8}");
        }

        public static uint CrcName(string name, bool stripExtension = true)
        {
            if (stripExtension && name.Contains(".")) name = name.Substring(0, name.LastIndexOf('.'));
            return Crc32Name.CalculateCRC(BinaryUtil.Reverse(Encoding.ASCII.GetBytes(name)));
        }

        public static uint CrcNamespace(string nameSpace)
        {
            return Crc32NameSpace.CalculateCRC(BinaryUtil.Reverse(Encoding.ASCII.GetBytes(nameSpace)));
        }
    }
}