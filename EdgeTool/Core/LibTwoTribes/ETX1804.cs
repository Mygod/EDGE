using System;
using System.Drawing;
using System.IO;
using System.Text;
using Mygod.Edge.Tool.LibTwoTribes.Util;

namespace Mygod.Edge.Tool.LibTwoTribes
{
    public class ETX1804 : ETX
    {
        private Bitmap m_Bitmap;

        private ETX1804()
        {
        }

        internal ETX1804(string path)
        {
            using (var fs = new FileStream(path, FileMode.Open, FileAccess.Read))
                _CreateFromStream(fs);
        }

        internal ETX1804(Stream stream)
        {
            _CreateFromStream(stream);
        }

        public static ETX1804 CreateFromImage(string imagePath, string name = null, string nameSpace = "textures")
        {
            return CreateFromImage(new Bitmap(imagePath), name ?? Path.GetFileNameWithoutExtension(imagePath), nameSpace);
        }

        public static ETX1804 CreateFromImage(Bitmap bitmap, string name, string nameSpace = "textures")
        {
            return CreateFromImage(bitmap, new AssetHeader(AssetUtil.EngineVersion.Version1804Edge, name, nameSpace));
        }

        public static ETX1804 CreateFromImage(Bitmap bitmap, AssetHeader header)
        {
            return new ETX1804 { m_Bitmap = bitmap, AssetHeader = header };
        }

        protected override void _CreateFromStream(Stream stream)
        {
            base._CreateFromStream(stream);

            using (var br = new BinaryReader(stream, Encoding.Unicode, true))
            {
                short width = br.ReadInt16(), height = br.ReadInt16();
                int unknown2 = br.ReadInt32();
                if (unknown2 != 2) throw new NotSupportedException();
                int data_length = br.ReadInt32();

                byte[] data = br.ReadBytes(data_length);

                m_Bitmap = _RenderBGRA8888(data, width, height, 1);
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

            using (var bw = new BinaryWriter(stream, Encoding.Unicode, true))
            {
                bw.Write(m_Bitmap.Width);
                bw.Write(m_Bitmap.Height);
                bw.Write(2);
                byte[] data = _Serialize(m_Bitmap);
                bw.Write(data.Length);
                bw.Write(data);
            }
        }
    }
}