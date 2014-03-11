using System;
using System.Drawing;
using System.IO;
using System.Text;
using Mygod.Edge.Tool.LibTwoTribes.Util;

namespace Mygod.Edge.Tool.LibTwoTribes
{
    public class ESOModel
    {
        [Flags]
        public enum Flags : uint
        {
            Normals = 0x00000001,
            Colors = 0x00000002,
            TexCoords = 0x00000004,
            Wat = 0x00000008
        }

        private Color[] m_Colors;

        private AssetHash m_MaterialAsset;
        private Vec3[] m_Normals;
        private Vec2[] m_TexCoords;
        private Flags m_TypeFlags;
        private Vec3[] m_Vertices;
        private Vec2[] m_Wat;

        public ESOModel()
        {
        }

        private ESOModel(Stream stream)
        {
            using (var br = new BinaryReader(stream, Encoding.Unicode, true))
            {
                m_MaterialAsset = AssetHash.FromStream(stream);

                m_TypeFlags = (Flags) br.ReadUInt32();
                int numVerts = br.ReadInt32();
                if (br.ReadInt32() * 3 != numVerts)
                    Warning.WriteLine("Polygon count is not correct! It will be ignored.");
                int unknown = br.ReadInt32(); // not a clue. seems to be always zero.
                if (unknown != 0) Warning.WriteLine("Unknown1 != 0!");

                m_Vertices = new Vec3[numVerts];
                for (int i = 0; i < numVerts; i++)
                    m_Vertices[i] = Vec3.FromStream(stream);

                if (m_TypeFlags.HasFlag(Flags.Normals))
                {
                    m_Normals = new Vec3[numVerts];
                    for (int i = 0; i < numVerts; i++)
                        m_Normals[i] = Vec3.FromStream(stream);
                }
                else
                    m_Normals = new Vec3[0];

                if (m_TypeFlags.HasFlag(Flags.Colors))
                {
                    m_Colors = new Color[numVerts];
                    for (int i = 0; i < numVerts; i++)
                        m_Colors[i] = Color.FromArgb(br.ReadInt32());
                }
                else
                    m_Colors = new Color[0];

                if (m_TypeFlags.HasFlag(Flags.TexCoords))
                {
                    m_TexCoords = new Vec2[numVerts];
                    for (int i = 0; i < numVerts; i++)
                        m_TexCoords[i] = Vec2.FromStream(stream);
                }
                else
                    m_TexCoords = new Vec2[0];

                if (m_TypeFlags.HasFlag(Flags.Wat))
                {
                    m_Wat = new Vec2[numVerts];
                    for (int i = 0; i < numVerts; i++)
                        m_Wat[i] = Vec2.FromStream(stream);
                }
                else
                    m_Wat = new Vec2[0];

                br.BaseStream.Position += numVerts << 1;
                /*
                m_Indices = new ushort[m_NumPolys * 3];
                for (int i = 0; i < m_NumPolys * 3; i++)
                {
                    m_Indices[i] = br.ReadUInt16();
                }
                */
            }
        }

        //private ushort[] m_Indices;

        public AssetHash MaterialAsset { get { return m_MaterialAsset; } set { m_MaterialAsset = value; } }
        public Flags TypeFlags { get { return m_TypeFlags; } set { m_TypeFlags = value; } }
        public Vec3[] Vertices { get { return m_Vertices; } set { m_Vertices = value; } }
        public Vec3[] Normals { get { return m_Normals; } set { m_Normals = value; } }
        public Color[] Colors { get { return m_Colors; } set { m_Colors = value; } }
        public Vec2[] TexCoords { get { return m_TexCoords; } set { m_TexCoords = value; } }
        public Vec2[] Wat { get { return m_Wat; } set { m_Wat = value; } }
        //public ushort[] Indices { get { return m_Indices; } set { m_Indices = value; } }

        public static ESOModel FromStream(Stream stream)
        {
            return new ESOModel(stream);
        }

        public void Save(Stream stream)
        {
            using (var bw = new BinaryWriter(stream, Encoding.Unicode, true))
            {
                m_MaterialAsset.Save(stream);

                bw.Write((uint) m_TypeFlags);
                bw.Write(m_Vertices.Length);
                bw.Write(m_Vertices.Length / 3);
                bw.Write(0);

                for (int i = 0; i < m_Vertices.Length; i++)
                    m_Vertices[i].Save(stream);

                if (m_TypeFlags.HasFlag(Flags.Normals))
                    for (int i = 0; i < m_Vertices.Length; i++)
                        m_Normals[i].Save(stream);
                else
                    m_Normals = new Vec3[0];

                if (m_TypeFlags.HasFlag(Flags.Colors))
                    for (int i = 0; i < m_Vertices.Length; i++)
                        bw.Write(m_Colors[i].ToArgb());
                else
                    m_Colors = new Color[0];

                if (m_TypeFlags.HasFlag(Flags.TexCoords))
                    for (int i = 0; i < m_Vertices.Length; i++)
                        m_TexCoords[i].Save(stream);
                else
                    m_TexCoords = new Vec2[0];

                if (m_TypeFlags.HasFlag(Flags.Wat))
                    for (int i = 0; i < m_Vertices.Length; i++)
                        m_Wat[i].Save(stream);
                else
                    m_Wat = new Vec2[0];

                for (ushort i = 0; i < m_Vertices.Length; i++)
                    //bw.Write(m_Indices[i]);
                    bw.Write(i);
            }
        }
    }
}