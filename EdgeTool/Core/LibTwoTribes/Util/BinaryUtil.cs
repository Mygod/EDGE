namespace Mygod.Edge.Tool.LibTwoTribes.Util
{
    public static class BinaryUtil
    {
        public static byte[] Reverse(byte[] data)
        {
            var data2 = new byte[data.Length];
            for (int i = 0; i < data.Length; i++)
                data2[i] = data[data.Length - i - 1];
            return data2;
        }

        public static void Memcpy(byte[] dst, byte[] src, int offsetDst, int offsetSrc, int length)
        {
            for (int i = 0; i < length; i++)
                dst[offsetDst + i] = src[offsetSrc + i];
        }

        public static byte[] PadOrTruncate(byte[] data, int length)
        {
            return PadOrTruncate(data, length, 0x00);
        }

        public static byte[] PadOrTruncate(byte[] data, int length, byte paddingByte)
        {
            var data2 = new byte[length];
            for (int i = 0; i < length; i++)
                if (i < data.Length)
                    data2[i] = data[i];
                else
                    data2[i] = paddingByte;
            return data2;
        }
    }
}