using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using LibTwoTribes.Util;

namespace LibTwoTribes
{
    public class EMATexture
    {
        private const int INT_ARRAY_1_LENGTH = 4;
        private const int INT_ARRAY_2_LENGTH = 3;

        private AssetHash m_Asset;
        private int[] m_IntArray1;
        private int[] m_IntArray2;

        public AssetHash Asset { get { return m_Asset; } set { m_Asset = value; } }
        public int[] IntArray1
        {
            get { return m_IntArray1; }
            set
            {
                if (value.Length != INT_ARRAY_1_LENGTH)
                {
                    throw new Exception("IntArray1 must have a length of " + INT_ARRAY_1_LENGTH);
                }
                m_IntArray1 = value;
            }
        }
        public int[] IntArray2
        {
            get { return m_IntArray2; }
            set
            {
                if (value.Length != INT_ARRAY_2_LENGTH)
                {
                    throw new Exception("IntArray2 must have a length of " + INT_ARRAY_2_LENGTH);
                }
                m_IntArray1 = value;
            }
        }

        private EMATexture(Stream stream)
        {
            using (TTBinaryReader br = new TTBinaryReader(stream))
            {
                m_Asset = AssetHash.FromStream(stream);

                m_IntArray1 = new int[INT_ARRAY_1_LENGTH];
                for (int i = 0; i < INT_ARRAY_1_LENGTH; i++)
                {
                    m_IntArray1[i] = br.ReadInt32();
                }

                m_IntArray2 = new int[INT_ARRAY_2_LENGTH];
                for (int i = 0; i < INT_ARRAY_2_LENGTH; i++)
                {
                    m_IntArray2[i] = br.ReadInt32();
                }
            }
        }

        public EMATexture()
        {
            m_Asset = AssetHash.Zero;
            m_IntArray1 = new int[INT_ARRAY_1_LENGTH];
            m_IntArray2 = new int[INT_ARRAY_2_LENGTH];
        }

        public static EMATexture FromStream(Stream stream)
        {
            return new EMATexture(stream);
        }

        public void Save(Stream stream)
        {
            using (TTBinaryWriter bw = new TTBinaryWriter(stream))
            {
                m_Asset.Save(stream);
                for (int i = 0; i < INT_ARRAY_1_LENGTH; i++)
                {
                    bw.Write(m_IntArray1[i]);
                }
                for (int i = 0; i < INT_ARRAY_2_LENGTH; i++)
                {
                    bw.Write(m_IntArray2[i]);
                }
            }
        }
    }
}
