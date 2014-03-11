using System.IO;

namespace Mygod.Edge.Tool.LibTwoTribes
{
    public abstract class Asset
    {
        private AssetHeader m_AssetHeader;

        public AssetHeader AssetHeader { get { return m_AssetHeader; } set { m_AssetHeader = value; } }

        protected virtual void _CreateFromStream(Stream stream)
        {
            m_AssetHeader = new AssetHeader(stream);
        }

        public virtual void Save(Stream stream)
        {
            m_AssetHeader.Save(stream);
        }
    }
}