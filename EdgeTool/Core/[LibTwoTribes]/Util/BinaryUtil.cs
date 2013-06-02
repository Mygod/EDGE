namespace LibTwoTribes.Util
{
    public static class BinaryUtil
    {
        public static byte[] Reverse(byte[] data)
        {
            byte[] data2 = new byte[data.Length];
            for (int i = 0; i < data.Length; i++)
            {
                data2[i] = data[data.Length - i - 1];
            }
            return data2;
        }

        public static void Memcpy(byte[] dst, byte[] src, int offset_dst, int offset_src, int length)
        {
            for (int i = 0; i < length; i++)
            {
                dst[offset_dst + i] = src[offset_src + i];
            }
        }

        public static byte[] PadOrTruncate(byte[] data, int length)
        {
            return PadOrTruncate(data, length, 0x00);
        }

        public static byte[] PadOrTruncate(byte[] data, int length, byte padding_byte)
        {
            byte[] data2 = new byte[length];
            for (int i = 0; i < length; i++)
            {
                if (i < data.Length)
                {
                    data2[i] = data[i];
                }
                else
                {
                    data2[i] = padding_byte;
                }
            }
            return data2;
        }
    }
}