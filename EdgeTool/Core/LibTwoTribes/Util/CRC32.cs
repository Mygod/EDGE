namespace Mygod.Edge.Tool.LibTwoTribes.Util
{
    public class CRC32
    {
        public const uint DEFAULT_POLYNOMIAL = 0xEDB88320;

        private readonly uint[] m_CRCTable = new uint[256];
        private uint m_Polynomial;

        public CRC32(uint polynomial = DEFAULT_POLYNOMIAL)
        {
            m_Polynomial = polynomial;
            CalculateCRCTable();
        }

        public uint Polynomial
        {
            get { return m_Polynomial; }
            set
            {
                m_Polynomial = value;
                CalculateCRCTable();
            }
        }

        private void CalculateCRCTable()
        {
            uint c, n;

            for (n = 0; n < 256; n++)
            {
                c = n;
                for (int k = 0; k < 8; k++)
                    if ((c & 1) != 0)
                        c = m_Polynomial ^ (c >> 1);
                    else
                        c = c >> 1;
                m_CRCTable[n] = c;
            }
        }

        private uint UpdateCRC(uint crc, byte[] data)
        {
            uint c = crc;

            for (int n = 0; n < data.Length; n++)
                c = m_CRCTable[(c ^ data[n]) & 0xff] ^ (c >> 8);
            return c;
        }

        public uint CalculateCRC(byte[] data)
        {
            return UpdateCRC(0x00000000, data);
        }
    }
}