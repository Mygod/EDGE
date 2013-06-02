using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using LibTwoTribes.Util;

namespace LibTwoTribes
{
    public class ETX1803 : ETX
    {
        private Bitmap m_Bitmap;

        internal ETX1803(string path)
        {
            using (FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read))
            {
                _CreateFromStream(fs);
            }
        }

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
            return new ETX1803 { m_Bitmap = bitmap, 
                m_AssetHeader = new AssetHeader(AssetUtil.EngineVersion.Version1803_Rush, name, nameSpace) };
        }

        protected override void _CreateFromStream(Stream stream)
        {
            base._CreateFromStream(stream);

            using (TTBinaryReader br = new TTBinaryReader(stream))
            {
                byte[] buffer = br.ReadBytes((int)(stream.Length - stream.Position));

                using (MemoryStream ms = new MemoryStream(buffer))
                {
                    ms.Position = 0;
                    m_Bitmap = (Bitmap)Bitmap.FromStream(ms);
                }
            }
        }
        
        public override Bitmap GetBitmap()
        {
            return m_Bitmap;
        }

        public override void Save(string path)
        {
            using (FileStream fsOut = new FileStream(path, FileMode.Create, FileAccess.Write))
            {
                Save(fsOut);
            }
        }

        public override void Save(Stream stream)
        {
            base.Save(stream);

            m_Bitmap.Save(stream, ImageFormat.Png);
        }
    }
}
