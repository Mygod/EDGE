/*
 I fully accept that the below code is probably a complete nightmare. Please don't hate me.
 */

namespace LibTwoTribes.Util
{
    public static class FastLZ
    {

        const int MAX_COPY = 32;
        const int MAX_LEN = 264;  /* 256 + 8 */
        const int MAX_DISTANCE = 8191;

        const bool FASTLZ_SAFE = true;
        const bool FASTLZ_STRICT_ALIGN = false;

        public unsafe static byte[] Decompress(byte[] input, int out_length)
        {
            byte[] output = new byte[out_length];
            fixed (byte* ptrInput = input)
            {
                fixed (byte* ptrOutput = output)
                {
                    int actual_out_length = Decompress(ptrInput, input.Length, ptrOutput, out_length);
                    if (actual_out_length == out_length)
                    {
                        return output;
                    }
                    else
                    {
                        byte[] output2 = new byte[actual_out_length];
                        for (int i = 0; i < actual_out_length; i++)
                            output2[i] = ptrOutput[i];
                        return output2;
                    }
                }
            }
        }

        public unsafe static int Decompress(byte[] input, byte[] output)
        {
            fixed (byte* ptrInput = input)
            {
                fixed (byte* ptrOutput = output)
                {
                    return Decompress(ptrInput, input.Length, ptrOutput, output.Length);
                }
            }
        }

        public unsafe static int Decompress(byte* input, int length, byte* output, int maxout)
        {
            int level = ((*input) >> 5) + 1;

            if (level != 1 && level != 2)
                return 0;

            byte* ip = (byte*)input;
            byte* ip_limit = ip + length;
            byte* op = (byte*)output;
            byte* op_limit = op + maxout;
            uint ctrl = (uint)((*ip++) & 31);
            bool loop = true;

            do
            {
                byte* _ref = op;
                uint len = ctrl >> 5;
                uint ofs = (uint)((ctrl & 31) << 8);

                if (ctrl >= 32)
                {
                    byte code;  // level == 2
                    len--;
                    _ref -= ofs;
                    if (level == 1)
                    {
                        if (len == 7 - 1)
                            len += *ip++;
                        _ref -= *ip++;
                    }
                    else
                    {      // level == 2
                        if (len == 7 - 1)
                        {
                            do
                            {
                                code = *ip++;
                                len += code;
                            } while (code == 255);
                        }
                        code = *ip++;
                        _ref -= code;

                        /* match from 16-bit distance */
                        if (code == 255)
                        {
                            if (ofs == (31 << 8))
                            {
                                ofs = (uint)((*ip++) << 8);
                                ofs += *ip++;
                                _ref = op - ofs - MAX_DISTANCE;
                            }
                        }
                    }

                    if (FASTLZ_SAFE)
                    {
                        if (op + len + 3 > op_limit)
                        {
                            return 0;
                        }

                        if (_ref - 1 < (byte*)output)
                        {
                            return 0;
                        }
                    }

                    if (ip < ip_limit)
                    {
                        ctrl = *ip++;
                    }
                    else
                    {
                        loop = false;
                    }

                    if (_ref == op)
                    {
                        /* optimize copy for a run */
                        byte b = _ref[-1];
                        *op++ = b;
                        *op++ = b;
                        *op++ = b;
                        for (; len != 0; --len)
                        {
                            *op++ = b;
                        }
                    }
                    else
                    {
                        /* copy from reference */
                        _ref--;
                        *op++ = *_ref++;
                        *op++ = *_ref++;
                        *op++ = *_ref++;

                        if (!FASTLZ_STRICT_ALIGN)
                        {
                            ushort* p;
                            ushort* q;

                            // copy a byte, so that now it's word aligned
                            if ((len & 1) != 0)
                            {
                                *op++ = *_ref++;
                                len--;
                            }

                            // copy 16-bit at once
                            q = (ushort*)op;
                            op += len;
                            p = (ushort*)_ref;
                            for (len >>= 1; len > 4; len -= 4)
                            {
                                *q++ = *p++;
                                *q++ = *p++;
                                *q++ = *p++;
                                *q++ = *p++;
                            }
                            for (; len != 0; --len)
                            {
                                *q++ = *p++;
                            }
                        }
                        else
                        {
                            for (; len != 0; --len)
                            {
                                *op++ = *_ref++;
                            }
                        }
                    }
                }
                else
                {
                    ctrl++;
                    if (FASTLZ_SAFE)
                    {
                        if (op + ctrl > op_limit)
                        {
                            return 0;
                        }
                        if (ip + ctrl > ip_limit)
                        {
                            return 0;
                        }
                    }

                    *op++ = *ip++;
                    for (--ctrl; ctrl != 0; ctrl--)
                    {
                        *op++ = *ip++;
                    }

                    loop = ip < ip_limit;
                    if (loop)
                    {
                        ctrl = *ip++;
                    }
                }
            }
            while (loop);

            return (int)(op - (byte*)output);
        }
    }
}