using System;
using System.Collections.Generic;
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
            TexCoords2 = 0x00000008 // only seen in RUSH for the checkerboard pattern
        }

        private List<Color> m_Colors;

        private AssetHash m_MaterialAsset;
        private List<Vec3> m_Normals;
        private List<Vec2> m_TexCoords;
        private Flags m_TypeFlags;
        private List<Vec3> m_Vertices;
        private List<Vec2> mTexCoords2;

        private void Initialize(Flags typeFlags, int numVerts)
        {
            m_TypeFlags = typeFlags;
            m_Vertices = new List<Vec3>(numVerts);
            m_Colors = new List<Color>(HasColors ? numVerts : 0);
            m_Normals = new List<Vec3>(HasNormals ? numVerts : 0);
            m_TexCoords = new List<Vec2>(HasTexCoords ? numVerts : 0);
            mTexCoords2 = new List<Vec2>(HasTexCoords2 ? numVerts : 0);
        }

        /// <summary>
        /// Initialize ESOModel with the number of vertices.
        /// </summary>
        /// <param name="typeFlags">Initial value for type flags.</param>
        /// <param name="numVerts">Number of vertices there will be. This is only used for reserving storage. You can
        /// have other number of vertices too if you'd like to.</param>
        public ESOModel(Flags typeFlags = 0, int numVerts = 0)
        {
            Initialize(typeFlags, numVerts);
        }

        private ESOModel(Stream stream)
        {
            using (var br = new BinaryReader(stream, Encoding.Unicode, true))
            {
                m_MaterialAsset = AssetHash.FromStream(stream);

                m_TypeFlags = (Flags) br.ReadUInt32();
                int numVerts = br.ReadInt32();
                Initialize(m_TypeFlags, numVerts);
                if (br.ReadInt32() * 3 != numVerts)
                    Warning.WriteLine("Polygon count is not correct! It will be ignored.");
                int unknown = br.ReadInt32(); // not a clue. seems to be always zero.
                if (unknown != 0) Warning.WriteLine("eso_model_t::unknown1 != 0");

                for (var i = 0; i < numVerts; i++)
                    m_Vertices.Add(Vec3.FromStream(stream));

                if (HasNormals)
                {
                    for (var i = 0; i < numVerts; i++)
                        m_Normals.Add(Vec3.FromStream(stream));
                }

                if (HasColors)
                {
                    for (int i = 0; i < numVerts; i++)
                        m_Colors.Add(Color.FromArgb(br.ReadInt32()));
                }

                if (HasTexCoords)
                {
                    for (int i = 0; i < numVerts; i++)
                        m_TexCoords.Add(Vec2.FromStream(stream));
                }

                if (HasTexCoords2)
                {
                    for (int i = 0; i < numVerts; i++)
                        mTexCoords2.Add(Vec2.FromStream(stream));
                }
                
                // m_Indices = new ushort[m_NumPolys * 3];
                for (int i = 0; i < numVerts; i++)
                {
                    if (br.ReadUInt16() != i) Warning.WriteLine("eso_model_t::indices not supported!");
                }
            }
        }

        //private ushort[] m_Indices;

        public AssetHash MaterialAsset { get { return m_MaterialAsset; } set { m_MaterialAsset = value; } }
        public Flags TypeFlags { get { return m_TypeFlags; } set { m_TypeFlags = value; } }
        public List<Vec3> Vertices { get { return m_Vertices; } set { m_Vertices = value; } }
        public List<Vec3> Normals { get { return m_Normals; } set { m_Normals = value; } }
        public List<Color> Colors { get { return m_Colors; } set { m_Colors = value; } }
        public List<Vec2> TexCoords { get { return m_TexCoords; } set { m_TexCoords = value; } }
        public List<Vec2> TexCoords2 { get { return mTexCoords2; } set { mTexCoords2 = value; } }
        // public ushort[] Indices { get { return m_Indices; } set { m_Indices = value; } }

        public bool HasNormals
        {
            get { return TypeFlags.HasFlag(Flags.Normals); }
            set { if (value) TypeFlags |= Flags.Normals; else TypeFlags &= ~Flags.Normals; }
        }
        public bool HasColors
        {
            get { return TypeFlags.HasFlag(Flags.Colors); }
            set { if (value) TypeFlags |= Flags.Colors; else TypeFlags &= ~Flags.Colors; }
        }
        public bool HasTexCoords
        {
            get { return TypeFlags.HasFlag(Flags.TexCoords); }
            set { if (value) TypeFlags |= Flags.TexCoords; else TypeFlags &= ~Flags.TexCoords; }
        }
        public bool HasTexCoords2
        {
            get { return TypeFlags.HasFlag(Flags.TexCoords2); }
            set { if (value) TypeFlags |= Flags.TexCoords2; else TypeFlags &= ~Flags.TexCoords2; }
        }

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
                bw.Write(m_Vertices.Count);
                bw.Write(m_Vertices.Count / 3);
                bw.Write(0);

                for (var i = 0; i < m_Vertices.Count; i++)
                    m_Vertices[i].Save(stream);

                if (m_TypeFlags.HasFlag(Flags.Normals))
                    for (int i = 0; i < m_Vertices.Count; i++)
                        m_Normals[i].Save(stream);

                if (m_TypeFlags.HasFlag(Flags.Colors))
                    for (int i = 0; i < m_Vertices.Count; i++)
                        bw.Write(m_Colors[i].ToArgb());

                if (m_TypeFlags.HasFlag(Flags.TexCoords))
                    for (int i = 0; i < m_Vertices.Count; i++)
                        m_TexCoords[i].Save(stream);

                if (m_TypeFlags.HasFlag(Flags.TexCoords2))
                    for (int i = 0; i < m_Vertices.Count; i++)
                        mTexCoords2[i].Save(stream);

                for (ushort i = 0; i < m_Vertices.Count; i++)
                    //bw.Write(m_Indices[i]);
                    bw.Write(i);
            }
        }
    }
}