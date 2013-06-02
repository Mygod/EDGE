using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibTwoTribes
{
    public abstract class Asset
    {
        protected AssetHeader m_AssetHeader;

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