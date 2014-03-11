using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Text;
using Mygod.Edge.Tool.LibTwoTribes.Util;

namespace Mygod.Edge.Tool.LibTwoTribes
{
    public class ETX1803 : ETX
    {
        private Bitmap m_Bitmap;

/*
        internal ETX1803(string path)
        {
            using (var fs = new FileStream(path, FileMode.Open, FileAccess.Read))
                _CreateFromStream(fs);
        }
*/

        internal ETX1803(Stream stream)
        {
            _CreateFromStream(stream);
        }

        private ETX1803()
        {
        }

        public static ETX1803 CreateFromImage(string imagePath, string name = null, string nameSpace = "textures")
        {
            return CreateFromImage(new Bitmap(imagePath), name ?? Path.GetFileNameWithoutExtension(imagePath), nameSpace);
        }

        public static ETX1803 CreateFromImage(Bitmap bitmap, string name, string nameSpace = "textures")
        {
            return CreateFromImage(bitmap, new AssetHeader(AssetUtil.EngineVersion.Version1803Rush, name, nameSpace));
        }

        public static ETX1803 CreateFromImage(Bitmap bitmap, AssetHeader header)
        {
            return new ETX1803 { m_Bitmap = bitmap, AssetHeader = header };
        }

        protected override void _CreateFromStream(Stream stream)
        {
            base._CreateFromStream(stream);

            using (var br = new BinaryReader(stream, Encoding.Unicode, true))
            {
                byte[] buffer = br.ReadBytes((int) (stream.Length - stream.Position));

                using (var ms = new MemoryStream(buffer))
                {
                    ms.Position = 0;
                    m_Bitmap = (Bitmap) Image.FromStream(ms);
                }
            }
        }

        public override Bitmap GetBitmap()
        {
            return m_Bitmap;
        }

        public override void Save(string path)
        {
            using (var fsOut = new FileStream(path, FileMode.Create, FileAccess.Write))
                Save(fsOut);
        }

        public override void Save(Stream stream)
        {
            base.Save(stream);

            m_Bitmap.Save(stream, ImageFormat.Png);
        }
    }
}