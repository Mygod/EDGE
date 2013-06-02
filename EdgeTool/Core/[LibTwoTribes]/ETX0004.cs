using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Text;
using LibTwoTribes.Util;

namespace LibTwoTribes
{
    public class ETX0004 : ETX
    {
        private const bool STRIP_FILE_EXTENSION = true;

        private ETX0004Header m_Header;
        private byte[][] m_BitmapData;

        public ETX0004Header Header { get { return m_Header; } set { m_Header = value; } }
        public byte[][] BitmapData { get { return m_BitmapData; } set { m_BitmapData = value; } }

        public enum Format : ushort
        {
            CompressedBGRA8888 = 0x0006,
            CompressedA8 = 0x0206,
        }

        internal ETX0004(string path)
        {
            using (FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read))
            {
                _CreateFromStream(fs);
            }
        }

        internal ETX0004(Stream stream)
        {
            _CreateFromStream(stream);
        }

        protected override void _CreateFromStream(Stream stream)
        {
            base._CreateFromStream(stream);

            m_Header = new ETX0004Header(stream);
            switch (m_Header.Format)
            {
                case Format.CompressedBGRA8888:
                case Format.CompressedA8:
                    {
                        _LoadMipMaps(_LoadCompressedBlock(stream));
                    }
                    break;
                default:
                    throw new Exception("Unrecognised image format `0x" + ((ushort)m_Header.Format).ToString("X4") + "`." + Environment.NewLine + "Tell Will to fix this.");
            }
        }

        private byte[] _LoadCompressedBlock(Stream stream)
        {
            using (TTBinaryReader br = new TTBinaryReader(stream))
            {
                int length_out = br.ReadInt32();
                int length_in = br.ReadInt32();
                byte[] data_in = new byte[length_in];
                stream.Read(data_in, 0, length_in);
                byte[] data_out = new byte[length_out];
                FastLZ.Decompress(data_in, data_out);
                return data_out;
            }
        }

        private void _LoadBGRA8888(Stream stream)
        {
            byte[] texture_data = new byte[stream.Length - stream.Position];
            stream.Read(texture_data, 0, texture_data.Length);
            _LoadMipMaps(texture_data);
        }

        private void _LoadMipMaps(byte[] texture_data)
        {
            int offset = 0;
            List<byte[]> mipmaps = new List<byte[]>();

            for (int i = 0; i <= m_Header.MipmapLevels; i++)
            {
                int mip_w = this.Header.Width >> i;
                int mip_h = this.Header.Height >> i;
                int mip_d = this.Header.Depth >> i;

                if (mip_h == 0) mip_h = 1;
                if (mip_w == 0) mip_w = 1;
                if (mip_d == 0) mip_d = 1;

                byte[] mip;
                int mip_length = -1;
                switch ((ETX0004.Format)this.Header.Format)
                {
                    case Format.CompressedBGRA8888:
                        mip_length = mip_w * mip_h * mip_d * 4;
                        break;
                    case Format.CompressedA8:
                        mip_length = mip_w * mip_h * mip_d;
                        break;
                }

                if (mip_length < 0)
                {
                    // should never happen.
                    return;
                }

                mip = new byte[mip_length];
                BinaryUtil.Memcpy(mip, texture_data, 0, offset, mip_length);
                offset += mip_length;
                mipmaps.Add(mip);
            }
            m_BitmapData = mipmaps.ToArray();
        }

        public Bitmap GetMipmap(int level)
        {
            if (level < 0 || level > m_Header.MipmapLevels)
                throw new Exception("Mipmap level " + level + " not available.");
            int mip_w = m_Header.Width >> level;
            int mip_h = m_Header.Height >> level;
            int mip_d = m_Header.Depth >> level;
            switch ((Format)m_Header.Format)
            {
                case Format.CompressedBGRA8888:
                    return _RenderBGRA8888(m_BitmapData[level], mip_w, mip_h, mip_d);
                case Format.CompressedA8:
                    return _RenderA8(m_BitmapData[level], mip_w, mip_h, mip_d);
            }
            return null;    //  we shouldn't ever get here, since _CreateFromStream is supposed to handle invalid formats.
        }

        private unsafe Bitmap _RenderA8(byte[] texture_data, int width, int height, int depth)
        {
            Bitmap bmp = new Bitmap(width * depth, height);
            BitmapData bitsBmp = bmp.LockBits(new Rectangle(new Point(0, 0), bmp.Size), ImageLockMode.WriteOnly, PixelFormat.Format24bppRgb);   // no need for alpha
            byte* ptrBmp = (byte*)bitsBmp.Scan0;
            for (int ix = 0; ix < width; ix++)
            {
                for (int iy = 0; iy < height; iy++)
                {
                    for (int iz = 0; iz < depth; iz++)
                    {
                        int x = ix + (width * iz);
                        int y = iy;

                        int w_index = ix + (iy * width) + (iz * width * height);
                        int s_index = (y * bitsBmp.Stride) + (x * 3);
                        for (int j = 0; j < 3; j++)
                        {
                            ptrBmp[s_index + j] = texture_data[w_index];  //  BGR
                        }
                    }
                }
            }
            bmp.UnlockBits(bitsBmp);
            return bmp;
        }

        public override Bitmap GetBitmap()
        {
            return GetMipmap(0);
        }

        public override void Save(string path)
        {
            using (FileStream fsOut = new FileStream(path, FileMode.Create, FileAccess.Write))
            {
                throw new NotImplementedException();
                //Save(fsOut);
            }
        }

        // These will be enabled once I've actually ported FastLZ.Compress :)

        /*public void SaveToDir(string dir) {
            using (FileStream fs = new FileStream(Path.Combine(dir, m_AssetHeader.GenerateFilename(STRIP_FILE_EXTENSION) + ".etx"), FileMode.Create, FileAccess.Write))
                Save(fs);
        }

        public void Save(string path) {
            using (FileStream fs = new FileStream(path, FileMode.Create, FileAccess.Write))
                Save(fs);
        }

        public override void Save(Stream stream) {
            base.Save(stream);
            
            int total_data_len = 0;
            for (int i = 0; i < m_BitmapData.Length; i++)
                total_data_len += m_BitmapData[i].Length;
            byte[] total_data = new byte[total_data_len];
            int offset = 0;
            for (int i = 0; i < m_BitmapData.Length; i++) {
                BinaryUtil.Memcpy(total_data, m_BitmapData[i], offset, 0, m_BitmapData[i].Length);
                offset += m_BitmapData[i].Length;
            }
            
            total_data = FastLZ.Compress(total_data);

            m_Header.Save(stream);
            stream.Write(total_data, 0, total_data.Length);
        }*/

        // meanwhile, let's display an unfriendly error.
        public override void Save(Stream stream)
        {
            throw new NotImplementedException("Yeah.... Will needs to port the Compression part of FastLZ before you can do that.");
        }
    }
}