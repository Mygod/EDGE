using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using LibTwoTribes.Util;

namespace LibTwoTribes
{
    public class GlyphEntry
    {

        private char m_CharValue;
        private short m_Width, m_Height;
        private short m_VerticalOffset;
        private short m_Unknown1;
        private byte[] m_RawData;

        public char CharValue { get { return m_CharValue; } set { m_CharValue = value; } }
        public short Width { get { return m_Width; } }
        public short Height { get { return m_Height; } }
        public short VerticalOffset { get { return m_VerticalOffset; } set { m_VerticalOffset = value; } }
        public short Unknown1 { get { return m_Unknown1; } set { m_Unknown1 = value; } }    //  well this can't go wrong at all....
        public byte[] RawData { get { return m_RawData; } }

        private GlyphEntry(Stream stream)
        {
            using (TTBinaryReader br = new TTBinaryReader(stream))
            {
                m_CharValue = (char)br.ReadInt16();
                m_Width = br.ReadInt16();
                m_Height = br.ReadInt16();
                m_VerticalOffset = br.ReadInt16();
                m_Unknown1 = br.ReadInt16();
                m_RawData = new byte[m_Width * m_Height];
                br.Read(m_RawData, 0, m_RawData.Length);
            }
        }

        public static GlyphEntry FromStream(Stream stream)
        {
            return new GlyphEntry(stream);
        }

        public void SetData(short width, short height, byte[] data)
        {
            if (data.Length != width * height)
            {
                throw new Exception("Supplied data doesn't match the given dimensions.");
            }
            m_Width = width;
            m_Height = height;
            m_RawData = data;
        }

        public unsafe Bitmap Render()
        {
            Bitmap bmp = new Bitmap(m_Width, m_Height);
            BitmapData bitsBmp = bmp.LockBits(new Rectangle(new Point(0, 0), bmp.Size), ImageLockMode.WriteOnly, PixelFormat.Format32bppArgb);
            byte* ptrBmp = (byte*)bitsBmp.Scan0;
            for (int y = 0; y < m_Height; y++)
            {
                for (int x = 0; x < m_Width; x++)
                {
                    for (int i = 0; i < 3; i++)
                    {
                        ptrBmp[(y * bitsBmp.Stride) + (x * 4) + i] = 0x00;
                    }
                    ptrBmp[(y * bitsBmp.Stride) + (x * 4) + 3] = m_RawData[y * m_Width + x];
                }
            }
            bmp.UnlockBits(bitsBmp);
            return bmp;
        }

        public void Save(Stream stream)
        {
            using (TTBinaryWriter bw = new TTBinaryWriter(stream))
            {
                bw.Write((short)m_CharValue);
                bw.Write(m_Width);
                bw.Write(m_Height);
                bw.Write(m_VerticalOffset);
                bw.Write(m_Unknown1);
                bw.Write(m_RawData);
            }
        }
    }
}