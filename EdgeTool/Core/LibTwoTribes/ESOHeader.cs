using System.IO;
using System.Text;
using Mygod.Edge.Tool.LibTwoTribes.Util;

namespace Mygod.Edge.Tool.LibTwoTribes
{
    public class ESOHeader
    {
        private Vec3 m_BoundingMax;
        private Vec3 m_BoundingMin;
        private AssetHash m_NodeChild;
        private AssetHash m_NodeSibling;
        private int m_NumModels;
        private Vec3 m_Rotate;
        private Vec3 m_Scale;
        private float m_ScaleXYZ;
        private Vec3 m_Translate;
        private int m_V01;
        private int m_V02;
        private int m_V07;
        private int m_V08;
        private int m_V09;
        private float m_V20;
        private int m_V21;

        public ESOHeader()
        {
        }

        private ESOHeader(Stream stream)
        {
            using (var br = new BinaryReader(stream, Encoding.Unicode, true))
            {
                m_V01 = br.ReadInt32();
                m_V02 = br.ReadInt32();
                m_NodeChild = AssetHash.FromStream(stream);
                m_NodeSibling = AssetHash.FromStream(stream);
                m_V07 = br.ReadInt32();
                m_V08 = br.ReadInt32();
                m_V09 = br.ReadInt32();
                m_ScaleXYZ = br.ReadSingle();
                m_Translate = Vec3.FromStream(stream);
                m_Rotate = Vec3.FromStream(stream);
                m_Scale = Vec3.FromStream(stream);
                m_V20 = br.ReadSingle();
                m_V21 = br.ReadInt32();
                m_NumModels = br.ReadInt32();
                if (m_NumModels > 0)
                {
                    m_BoundingMin = Vec3.FromStream(stream);
                    m_BoundingMax = Vec3.FromStream(stream);
                }
                else
                {
                    m_BoundingMin = new Vec3();
                    m_BoundingMax = new Vec3();
                }
            }
        }

        public int V01 { get { return m_V01; } set { m_V01 = value; } }
        public int V02 { get { return m_V02; } set { m_V02 = value; } }
        public AssetHash NodeChild { get { return m_NodeChild; } set { m_NodeChild = value; } }
        public AssetHash NodeSibling { get { return m_NodeSibling; } set { m_NodeSibling = value; } }
        public int V07 { get { return m_V07; } set { m_V07 = value; } }
        public int V08 { get { return m_V08; } set { m_V08 = value; } }
        public int V09 { get { return m_V09; } set { m_V09 = value; } }
        public float ScaleXYZ { get { return m_ScaleXYZ; } set { m_ScaleXYZ = value; } }
        public Vec3 Translate { get { return m_Translate; } set { m_Translate = value; } }
        public Vec3 Rotate { get { return m_Rotate; } set { m_Rotate = value; } }
        public Vec3 Scale { get { return m_Scale; } set { m_Scale = value; } }
        public float V20 { get { return m_V20; } set { m_V20 = value; } }
        public int V21 { get { return m_V21; } set { m_V21 = value; } }
        public int NumModels { get { return m_NumModels; } set { m_NumModels = value; } }
        public Vec3 BoundingMin { get { return m_BoundingMin; } set { m_BoundingMin = value; } }
        public Vec3 BoundingMax { get { return m_BoundingMax; } set { m_BoundingMax = value; } }

        public static ESOHeader FromStream(Stream stream)
        {
            return new ESOHeader(stream);
        }

        public void Save(Stream stream)
        {
            using (var bw = new BinaryWriter(stream, Encoding.Unicode, true))
            {
                bw.Write(m_V01);
                bw.Write(m_V02);
                m_NodeChild.Save(stream);
                m_NodeSibling.Save(stream);
                bw.Write(m_V07);
                bw.Write(m_V08);
                bw.Write(m_V09);
                bw.Write(m_ScaleXYZ);
                m_Translate.Save(stream);
                m_Rotate.Save(stream);
                m_Scale.Save(stream);
                bw.Write(m_V20);
                bw.Write(m_V21);
                bw.Write(m_NumModels);
                if (m_NumModels > 0)
                {
                    m_BoundingMin.Save(stream);
                    m_BoundingMax.Save(stream);
                }
            }
        }
    }
}