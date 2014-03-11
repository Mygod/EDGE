using System.IO;
using System.Text;

namespace Mygod.Edge.Tool.LibTwoTribes
{
    public class KeyframeBlock
    {
        private float m_DefaultValue;
        private Keyframe[] m_Keyframes;

        public KeyframeBlock()
        {
            m_Keyframes = new Keyframe[0];
        }

        public KeyframeBlock(float default_value)
        {
            m_DefaultValue = default_value;
            m_Keyframes = new Keyframe[0];
        }

        public KeyframeBlock(Stream stream)
        {
            using (var br = new BinaryReader(stream, Encoding.Unicode, true))
            {
                br.BaseStream.Position += 4;
                m_DefaultValue = br.ReadSingle();
                int num_keyframes = br.ReadInt32();
                m_Keyframes = new Keyframe[num_keyframes];
                for (int i = 0; i < num_keyframes; i++)
                    m_Keyframes[i] = Keyframe.FromStream(stream);
            }
        }

        public float DefaultValue { get { return m_DefaultValue; } set { m_DefaultValue = value; } }
        public Keyframe[] Keyframes { get { return m_Keyframes; } set { m_Keyframes = value; } }

        public void Save(Stream stream)
        {
            using (var bw = new BinaryWriter(stream, Encoding.Unicode, true))
            {
                bw.Write(0f); // 4 bytes pad.
                bw.Write(m_DefaultValue);
                bw.Write(m_Keyframes.Length);
                for (int i = 0; i < m_Keyframes.Length; i++)
                    m_Keyframes[i].Save(stream);
            }
        }
    }
}