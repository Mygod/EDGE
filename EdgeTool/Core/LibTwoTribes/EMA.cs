using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Text;

namespace Mygod.Edge.Tool.LibTwoTribes
{
    public class EMA : Asset
    {
        private EMAAnimationBlock[] m_AnimationBlocks;
        private Color m_Color1;
        private Color m_Color2;
        private Color m_Color3;
        private Color m_Color4;
        private EMADefaultTransform[] m_DefaultTransforms;
        private float m_Float1;
        private int m_Footer4 = 4;
        private int m_Footer5 = 5;
        private int m_Int1;
        private int m_Int2;
        private int m_Int3;
        private string m_Name;
        private EMATexture[] m_Textures;

        public EMA()
        {
        }

        private EMA(Stream stream)
        {
            _CreateFromStream(stream);
        }

        public string Name { get { return m_Name; } set { m_Name = value; } }
        public EMATexture[] Textures { get { return m_Textures; } set { m_Textures = value; } }
        public Color Color1 { get { return m_Color1; } set { m_Color1 = value; } }
        public Color Color2 { get { return m_Color2; } set { m_Color2 = value; } }
        public Color Color3 { get { return m_Color3; } set { m_Color3 = value; } }
        public Color Color4 { get { return m_Color4; } set { m_Color4 = value; } }
        public float Float1 { get { return m_Float1; } set { m_Float1 = value; } }
        public int Int1 { get { return m_Int1; } set { m_Int1 = value; } }
        public int Int2 { get { return m_Int2; } set { m_Int2 = value; } }
        public int Int3 { get { return m_Int3; } set { m_Int3 = value; } }

        public EMADefaultTransform[] DefaultTransforms
        {
            get { return m_DefaultTransforms; }
            set { m_DefaultTransforms = value; }
        }

        public EMAAnimationBlock[] AnimationBlocks
        {
            get { return m_AnimationBlocks; }
            set { m_AnimationBlocks = value; }
        }

        public int Footer4 { get { return m_Footer4; } set { m_Footer4 = value; } }
        public int Footer5 { get { return m_Footer5; } set { m_Footer5 = value; } }

        public static EMA FromFile(string path)
        {
            using (var fs = new FileStream(path, FileMode.Open, FileAccess.Read))
                return FromStream(fs);
        }

        public static EMA FromStream(Stream stream)
        {
            return new EMA(stream);
        }

        protected override void _CreateFromStream(Stream stream)
        {
            base._CreateFromStream(stream);

            using (var br = new BinaryReader(stream, Encoding.Unicode, true))
            {
                short name_len = br.ReadInt16();
                m_Name = Encoding.ASCII.GetString(br.ReadBytes(name_len - 1));
                br.ReadByte(); // null terminator

                int num_textures = br.ReadInt32();
                m_Textures = new EMATexture[num_textures];
                for (int i = 0; i < num_textures; i++)
                    m_Textures[i] = EMATexture.FromStream(stream);

                m_Color1 = Color.FromArgb(br.ReadInt32());
                m_Color2 = Color.FromArgb(br.ReadInt32());
                m_Color3 = Color.FromArgb(br.ReadInt32());
                m_Color4 = Color.FromArgb(br.ReadInt32());
                m_Float1 = br.ReadSingle();
                m_Int1 = br.ReadInt32();
                m_Int2 = br.ReadInt32();
                m_Int3 = br.ReadInt32();

                int num_default_transforms = br.ReadInt32(); // always(?) the same as the number of textures.
                if (num_textures != num_default_transforms)
                    Warning.WriteLine("ema_file_t::num_textures != ema_file_t::num_default_transforms");
                m_DefaultTransforms = new EMADefaultTransform[num_default_transforms];
                for (int i = 0; i < num_default_transforms; i++)
                    m_DefaultTransforms[i] = EMADefaultTransform.FromStream(stream);

                int num_animation_blocks = br.ReadInt32();
                m_AnimationBlocks = new EMAAnimationBlock[num_animation_blocks];
                for (int i = 0; i < num_animation_blocks; i++)
                    m_AnimationBlocks[i] = EMAAnimationBlock.FromStream(stream);

                m_Footer4 = br.ReadInt32();
                if (m_Footer4 != 4) Warning.WriteLine("ema_file_t::unknown5 != 4");
                m_Footer5 = br.ReadInt32();
                if (m_Footer5 != 5) Warning.WriteLine("ema_file_t::unknown6 != 5");
            }
        }

        public void Save(string path)
        {
            using (var fs = new FileStream(path, FileMode.Create, FileAccess.Write))
                Save(fs);
        }

        public override void Save(Stream stream)
        {
            base.Save(stream);

            using (var bw = new BinaryWriter(stream, Encoding.Unicode, true))
            {
                bw.Write((short) (m_Name.Length + 1));
                bw.Write(Encoding.ASCII.GetBytes(m_Name));
                bw.Write((byte) 0); // null terminator

                bw.Write(m_Textures.Length);
                for (int i = 0; i < m_Textures.Length; i++)
                    m_Textures[i].Save(stream);

                bw.Write(m_Color1.ToArgb());
                bw.Write(m_Color2.ToArgb());
                bw.Write(m_Color3.ToArgb());
                bw.Write(m_Color4.ToArgb());
                bw.Write(m_Float1);
                bw.Write(m_Int1);
                bw.Write(m_Int2);
                bw.Write(m_Int3);

                bw.Write(m_DefaultTransforms.Length);
                for (int i = 0; i < m_DefaultTransforms.Length; i++)
                    m_DefaultTransforms[i].Save(stream);

                bw.Write(m_AnimationBlocks.Length);
                for (int i = 0; i < m_AnimationBlocks.Length; i++)
                    m_AnimationBlocks[i].Save(stream);

                bw.Write(m_Footer4);
                bw.Write(m_Footer5);
            }
        }
    }
}