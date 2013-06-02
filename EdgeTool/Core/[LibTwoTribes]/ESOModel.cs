using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LibTwoTribes.Util;

namespace LibTwoTribes
{
    public class ESOModel
    {
        private AssetHash m_MaterialAsset;
        private Flags m_TypeFlags;
        private int m_NumVerts;
        private int m_NumPolys;
        private int m_Unknown1;
        private Vec3[] m_Vertices;
        private Vec3[] m_Normals;
        private uint[] m_Colors;
        private Vec2[] m_TexCoords;
        private Vec2[] m_Wat;
        private ushort[] m_Indices;

        public AssetHash MaterialAsset { get { return m_MaterialAsset; } set { m_MaterialAsset = value; } }
        public Flags TypeFlags { get { return m_TypeFlags; } set { m_TypeFlags = value; } }
        public Vec3[] Vertices { get { return m_Vertices; } set { m_Vertices = value; } }
        public Vec3[] Normals { get { return m_Normals; } set { m_Normals = value; } }
        public uint[] Colors { get { return m_Colors; } set { m_Colors = value; } }
        public Vec2[] TexCoords { get { return m_TexCoords; } set { m_TexCoords = value; } }
        public Vec2[] Wat { get { return m_Wat; } set { m_Wat = value; } }
        public ushort[] Indices { get { return m_Indices; } set { m_Indices = value; } }

        [Flags]
        public enum Flags : uint
        {
            Normals = 0x00000001,
            Colors = 0x00000002,
            TexCoords = 0x00000004,
            Wat = 0x00000008
        }

        private ESOModel(Stream stream)
        {
            using (TTBinaryReader br = new TTBinaryReader(stream))
            {
                m_MaterialAsset = AssetHash.FromStream(stream);

                m_TypeFlags = (Flags)br.ReadUInt32();
                m_NumVerts = br.ReadInt32();
                m_NumPolys = br.ReadInt32();
                m_Unknown1 = br.ReadInt32();    // not a clue. seems to be always zero.

                m_Vertices = new Vec3[m_NumVerts];
                for (int i = 0; i < m_NumVerts; i++)
                {
                    m_Vertices[i] = Vec3.FromStream(stream);
                }

                if (m_TypeFlags.HasFlag(Flags.Normals))
                {
                    m_Normals = new Vec3[m_NumVerts];
                    for (int i = 0; i < m_NumVerts; i++)
                    {
                        m_Normals[i] = Vec3.FromStream(stream);
                    }
                }
                else
                {
                    m_Normals = new Vec3[0];
                }

                if (m_TypeFlags.HasFlag(Flags.Colors))
                {
                    m_Colors = new uint[m_NumVerts];
                    for (int i = 0; i < m_NumVerts; i++)
                    {
                        m_Colors[i] = br.ReadUInt32();
                    }
                }
                else
                {
                    m_Colors = new uint[0];
                }

                if (m_TypeFlags.HasFlag(Flags.TexCoords))
                {
                    m_TexCoords = new Vec2[m_NumVerts];
                    for (int i = 0; i < m_NumVerts; i++)
                    {
                        m_TexCoords[i] = Vec2.FromStream(stream);
                    }
                }
                else
                {
                    m_TexCoords = new Vec2[0];
                }

                if (m_TypeFlags.HasFlag(Flags.Wat))
                {
                    m_Wat = new Vec2[m_NumVerts];
                    for (int i = 0; i < m_NumVerts; i++)
                    {
                        m_Wat[i] = Vec2.FromStream(stream);
                    }
                }
                else
                {
                    m_Wat = new Vec2[0];
                }

                m_Indices = new ushort[m_NumPolys * 3];
                for (int i = 0; i < m_NumPolys * 3; i++)
                {
                    m_Indices[i] = br.ReadUInt16();
                }
            }
        }

        public static ESOModel FromStream(Stream stream)
        {
            return new ESOModel(stream);
        }

        public void Save(Stream stream)
        {
            using (TTBinaryWriter bw = new TTBinaryWriter(stream))
            {
                m_MaterialAsset.Save(stream);

                bw.Write((uint)m_TypeFlags);
                bw.Write(m_NumVerts);
                bw.Write(m_NumPolys);
                bw.Write(m_Unknown1);

                for (int i = 0; i < m_NumVerts; i++)
                {
                    m_Vertices[i].Save(stream);
                }

                if (m_TypeFlags.HasFlag(Flags.Normals))
                {
                    for (int i = 0; i < m_NumVerts; i++)
                    {
                        m_Normals[i].Save(stream);
                    }
                }
                else
                {
                    m_Normals = new Vec3[0];
                }

                if (m_TypeFlags.HasFlag(Flags.Colors))
                {
                    for (int i = 0; i < m_NumVerts; i++)
                    {
                        bw.Write(m_Colors[i]);
                    }
                }
                else
                {
                    m_Colors = new uint[0];
                }

                if (m_TypeFlags.HasFlag(Flags.TexCoords))
                {
                    for (int i = 0; i < m_NumVerts; i++)
                    {
                        m_TexCoords[i].Save(stream);
                    }
                }
                else
                {
                    m_TexCoords = new Vec2[0];
                }

                if (m_TypeFlags.HasFlag(Flags.Wat))
                {
                    for (int i = 0; i < m_NumVerts; i++)
                    {
                        m_Wat[i].Save(stream);
                    }
                }
                else
                {
                    m_Wat = new Vec2[0];
                }

                for (int i = 0; i < m_NumPolys * 3; i++)
                {
                    bw.Write(m_Indices[i]);
                }
            }
        }
    }
}