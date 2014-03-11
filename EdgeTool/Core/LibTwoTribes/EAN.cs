using System.IO;

namespace Mygod.Edge.Tool.LibTwoTribes
{
    public class EAN : Asset
    {
        private KeyframeBlock m_BlockRotateX;
        private KeyframeBlock m_BlockRotateY;
        private KeyframeBlock m_BlockRotateZ;
        private KeyframeBlock m_BlockScaleX;
        private KeyframeBlock m_BlockScaleY;
        private KeyframeBlock m_BlockScaleZ;
        private KeyframeBlock m_BlockTranslateX;
        private KeyframeBlock m_BlockTranslateY;
        private KeyframeBlock m_BlockTranslateZ;
        private EANHeader m_Header;

        private EAN(Stream stream)
        {
            _CreateFromStream(stream);
        }

        public EAN()
        {
        }

        public EANHeader Header { get { return m_Header; } set { m_Header = value; } }
        public KeyframeBlock BlockTranslateX { get { return m_BlockTranslateX; } set { m_BlockTranslateX = value; } }
        public KeyframeBlock BlockTranslateY { get { return m_BlockTranslateY; } set { m_BlockTranslateY = value; } }
        public KeyframeBlock BlockTranslateZ { get { return m_BlockTranslateZ; } set { m_BlockTranslateZ = value; } }
        public KeyframeBlock BlockRotateX { get { return m_BlockRotateX; } set { m_BlockRotateX = value; } }
        public KeyframeBlock BlockRotateY { get { return m_BlockRotateY; } set { m_BlockRotateY = value; } }
        public KeyframeBlock BlockRotateZ { get { return m_BlockRotateZ; } set { m_BlockRotateZ = value; } }
        public KeyframeBlock BlockScaleX { get { return m_BlockScaleX; } set { m_BlockScaleX = value; } }
        public KeyframeBlock BlockScaleY { get { return m_BlockScaleY; } set { m_BlockScaleY = value; } }
        public KeyframeBlock BlockScaleZ { get { return m_BlockScaleZ; } set { m_BlockScaleZ = value; } }

        public static EAN FromFile(string path)
        {
            using (var fs = new FileStream(path, FileMode.Open, FileAccess.Read))
                return FromStream(fs);
        }

        public static EAN FromStream(Stream stream)
        {
            return new EAN(stream);
        }

        protected override void _CreateFromStream(Stream stream)
        {
            base._CreateFromStream(stream);

            m_Header = EANHeader.FromStream(stream);
            m_BlockTranslateX = new KeyframeBlock(stream);
            m_BlockTranslateY = new KeyframeBlock(stream);
            m_BlockTranslateZ = new KeyframeBlock(stream);
            m_BlockRotateX = new KeyframeBlock(stream);
            m_BlockRotateY = new KeyframeBlock(stream);
            m_BlockRotateZ = new KeyframeBlock(stream);
            m_BlockScaleX = new KeyframeBlock(stream);
            m_BlockScaleY = new KeyframeBlock(stream);
            m_BlockScaleZ = new KeyframeBlock(stream);
        }

        public void Save(string path)
        {
            using (var fs = new FileStream(path, FileMode.Create, FileAccess.Write))
                Save(fs);
        }

        public override void Save(Stream stream)
        {
            base.Save(stream);

            m_Header.Save(stream);
            m_BlockTranslateX.Save(stream);
            m_BlockTranslateY.Save(stream);
            m_BlockTranslateZ.Save(stream);
            m_BlockRotateX.Save(stream);
            m_BlockRotateY.Save(stream);
            m_BlockRotateZ.Save(stream);
            m_BlockScaleX.Save(stream);
            m_BlockScaleY.Save(stream);
            m_BlockScaleZ.Save(stream);
        }
    }
}