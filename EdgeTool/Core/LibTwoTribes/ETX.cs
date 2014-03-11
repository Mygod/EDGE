using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using Mygod.Edge.Tool.LibTwoTribes.Util;

/*
 * 
 * The ETX format has shown up in 3 Two Tribes games, to my knowledge. (RUSH, EDGE, and Toki Tori 2)
 * All versions are prefixed by the Two Tribes 136-byte Asset header, followed by the actual data payload.
 * 
 * RUSH (engine version 18/03):
 * The latest build available on Steam has the payload consist of a standard PNG image.
 * Simply read from the end of the Asset Header to the end of the file.
 * 
 * EDGE (engine version 18/04):
 * Older builds used the same format as RUSH.
 * Newer builds have the format consist of an ETX Header, followed by the image data in BGRA8888 format. `Header.Format` contains the data length in bytes.
 * 
 * Toki Tori 2 (engine version 00/04):
 * This is a fun one.
 * After the ETX Header are two 32-bit integers, representing compressed and decompressed data lengths.
 * Following them is the image data, compressed under the FastLZ algorithm.
 * Image format can either be BGRA8888 or A8, depending on the value in Header.Format.
 * 
 * The extension also makes an appearance for two files in Toki Tori 1 (Steam version), but the content is simply a DDS file without a TT Asset header.
 * 
 */

namespace Mygod.Edge.Tool.LibTwoTribes
{
    public abstract class ETX : Asset
    {
        public static ETX FromFile(string path)
        {
            using (var fsIn = new FileStream(path, FileMode.Open, FileAccess.Read))
                return FromStream(fsIn);
        }

        public static ETX FromStream(Stream stream)
        {
            long pos = stream.Position;
            var asset_header = new AssetHeader(stream);
            stream.Position = pos;

            if (asset_header.EngineVersion == AssetUtil.EngineVersion.Version1804Edge) return new ETX1804(stream);
            if (((long) asset_header.EngineVersion & 0xFF) == 0x03) return new ETX1803(stream);
            throw new InvalidDataException("Unrecognised engine version "
                                           + AssetUtil.GetEngineVersionName(asset_header.EngineVersion));
        }

        protected static unsafe byte[] _Serialize(Bitmap bmp)
        {
            var buffer = new byte[bmp.Width * bmp.Height * 4];
            BitmapData bitsBmp = bmp.LockBits(new Rectangle(new Point(0, 0), bmp.Size), ImageLockMode.ReadOnly,
                PixelFormat.Format32bppArgb);
            var ptrBmp = (byte*) bitsBmp.Scan0;

            for (int i = 0; i < bmp.Width * bmp.Height * 4; i++)
                buffer[i] = ptrBmp[i];
            bmp.UnlockBits(bitsBmp);
            return buffer;
        }

        protected static unsafe Bitmap _RenderBGRA8888(byte[] texture_data, int width, int height, int depth)
        {
            var bmp = new Bitmap(width * depth, height);
            BitmapData bitsBmp = bmp.LockBits(new Rectangle(new Point(0, 0), bmp.Size), ImageLockMode.WriteOnly,
                PixelFormat.Format32bppArgb);
            var ptrBmp = (byte*) bitsBmp.Scan0;
            // the raw data is BGRA, and ptrBmp takes BGRA, so we can copy the data straight across.
            /*for (int i = 0; i < width * height * 4; i++)
            {
                ptrBmp[i] = texture_data[i];
            }*/
            for (int ix = 0; ix < width; ix++)
                for (int iy = 0; iy < height; iy++)
                    for (int iz = 0; iz < depth; iz++)
                    {
                        int x = ix + (width * iz);
                        int y = iy;

                        int w_index = ix + (iy * width) + (iz * width * height);
                        int s_index = (y * bitsBmp.Stride) + (x * 4);
                        for (int j = 0; j < 4; j++)
                            ptrBmp[s_index + j] = texture_data[w_index * 4 + j]; //  BGRA
                    }
            bmp.UnlockBits(bitsBmp);
            return bmp;
        }

        public abstract Bitmap GetBitmap();
        public abstract void Save(string path);
    }
}