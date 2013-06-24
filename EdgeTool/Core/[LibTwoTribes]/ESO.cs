using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LibTwoTribes.Util;

namespace LibTwoTribes
{
    public class ESO : Asset
    {
        private ESOHeader m_Header;
        private ESOModel[] m_Models;
        private bool m_HasFooter;
        private ESOFooter m_Footer;

        public ESOHeader Header { get { return m_Header; } set { m_Header = value; } }
        public ESOModel[] Models { get { return m_Models; } set { m_Models = value; } }
        public bool HasFooter { get { return m_HasFooter; } set { m_HasFooter = value; } }
        public ESOFooter Footer { get { return m_Footer; } set { m_Footer = value; } }

        public ESO()
        {
        }

        private ESO(Stream stream)
        {
            _CreateFromStream(stream);
        }

        public static ESO FromFile(string path)
        {
            using (FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read))
            {
                return FromStream(fs);
            }
        }

        public static ESO FromStream(Stream stream)
        {
            return new ESO(stream);
        }

        protected override void _CreateFromStream(Stream stream)
        {
            base._CreateFromStream(stream);

            m_Header = ESOHeader.FromStream(stream);
            m_Models = new ESOModel[m_Header.NumModels];
            for (int i = 0; i < m_Header.NumModels; i++)
            {
                m_Models[i] = ESOModel.FromStream(stream);
            }

            using (TTBinaryReader br = new TTBinaryReader(stream))
            {
                if (m_Header.NumModels > 0)
                {
                    m_HasFooter = (br.ReadInt32() == 1);
                    if (m_HasFooter)
                    {
                        m_Footer = ESOFooter.FromStream(stream);
                    }
                    else
                    {
                        m_Footer = new ESOFooter();
                    }
                }
                else
                {
                    m_HasFooter = false;
                    m_Footer = new ESOFooter();
                }
            }
        }

        public void Save(string path)
        {
            using (FileStream fs = new FileStream(path, FileMode.Create, FileAccess.Write))
            {
                Save(fs);
            }
        }

        public override void Save(Stream stream)
        {
            base.Save(stream);

            m_Header.Save(stream);
            for (int i = 0; i < m_Models.Length; i++)
                m_Models[i].Save(stream);

            if (m_Models.Length > 0)
            {
                using (TTBinaryWriter bw = new TTBinaryWriter(stream))
                {
                    if (m_HasFooter)
                    {
                        bw.Write(1);
                        m_Footer.Save(stream);
                    }
                    else
                    {
                        bw.Write(0);
                    }
                }
            }
        }
    }
}