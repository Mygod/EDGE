using System.Collections;
using System.Drawing;
using System.Drawing.Imaging;

namespace Mygod.Edge.Tool
{
    public static class ImageConverter
    {
        public static unsafe void Save(BitArray greyPixels, int width, int height, string path, bool half = false)
        {
            using (var bitmap = new Bitmap(width, height, PixelFormat.Format32bppArgb))
            {
                var data = bitmap.LockBits(new Rectangle(0, 0, width, height), ImageLockMode.WriteOnly,
                                           PixelFormat.Format32bppArgb);
                var pointer = (byte*)data.Scan0;
                var n = half ? 205 : 255;
                for (var i = 0; i < greyPixels.Length; i++)
                {
                    pointer[0] = (byte)(greyPixels[i] ? n : 0);
                    pointer[1] = pointer[2] = (byte) (greyPixels[i] ? 255 : 0);
                    pointer[3] = 255;
                    pointer += 4;
                }
                bitmap.UnlockBits(data);
                bitmap.Save(path);
            }
        }
        public static unsafe void Save(Color[] pixels, int width, int height, string path)
        {
            using (var bitmap = new Bitmap(width, height, PixelFormat.Format32bppArgb))
            {
                var data = bitmap.LockBits(new Rectangle(0, 0, width, height), ImageLockMode.WriteOnly,
                                           PixelFormat.Format32bppArgb);
                var pointer = (int*)data.Scan0;
                for (var i = 0; i < pixels.Length; i++) *pointer++ = pixels[i].ToArgb();
                bitmap.UnlockBits(data);
                bitmap.Save(path);
            }
        }
        public static unsafe Color[] Load(string path, out Size2D size)
        {
            Bitmap clone = null;
            try
            {
                using (var org = new Bitmap(path))  // convert the pixel format
                {
                    size = new Size2D((ushort)org.Width, (ushort)org.Height);
                    clone = new Bitmap(org.Width, org.Height, PixelFormat.Format32bppArgb);
                    using (var g = Graphics.FromImage(clone))
                        g.DrawImage(org, new Rectangle(0, 0, clone.Width, clone.Height));
                }
                var result = new Color[clone.Width * clone.Height];
                var data = clone.LockBits(new Rectangle(0, 0, clone.Width, clone.Height), 
                                          ImageLockMode.ReadOnly, PixelFormat.Format32bppArgb);
                var pointer = (int*)data.Scan0;
                for (var i = 0; i < result.Length; i++) result[i] = Color.FromArgb(*pointer++);
                clone.UnlockBits(data);
                return result;
            }
            finally
            {
                if (clone != null) clone.Dispose();
            }
        }
        public static Color[] Load(string path)
        {
            Size2D temp;
            return Load(path, out temp);
        }
    }
}
