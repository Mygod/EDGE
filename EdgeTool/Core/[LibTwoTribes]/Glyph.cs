using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LibTwoTribes.Util;

/*
 * .glyph files weren't used in EDGE, that used a different font format (copied over from the original iOS version, I believe).
 */

namespace LibTwoTribes
{
    public class Glyph
    {
        private short m_Unknown1;
        private short m_EncodingType;
        private GlyphEntry[] m_Glyphs;

        public short Unknown1 { get { return m_Unknown1; } set { m_Unknown1 = value; } }
        public short EncodingType { get { return m_EncodingType; } set { m_EncodingType = value; } }
        public GlyphEntry[] Glyphs { get { return m_Glyphs; } set { m_Glyphs = value; } }

        private Glyph(Stream stream)
        {
            _CreateFromStream(stream);
        }

        public static Glyph FromFile(string path)
        {
            using (FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read))
            {
                return FromStream(fs);
            }
        }

        public static Glyph FromStream(Stream stream)
        {
            return new Glyph(stream);
        }

        private void _CreateFromStream(Stream stream)
        {
            using (TTBinaryReader br = new TTBinaryReader(stream))
            {
                short length = br.ReadInt16();
                m_Glyphs = new GlyphEntry[length];
                m_Unknown1 = br.ReadInt16();
                m_EncodingType = br.ReadInt16();
                switch (m_EncodingType)
                {
                    case 0x08:
                        for (int i = 0; i < length; i++)
                        {
                            m_Glyphs[i] = GlyphEntry.FromStream(stream);
                        }
                        break;
                    default:
                        throw new NotImplementedException("Will hasn't implemented support for encoding 0x" + m_EncodingType.ToString("X4") + ", and likely never will.");
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

        public void Save(Stream stream)
        {
            using (TTBinaryWriter bw = new TTBinaryWriter(stream))
            {
                bw.Write((short)m_Glyphs.Length);
                bw.Write(m_Unknown1);
                bw.Write(m_EncodingType);
                for (int i = 0; i < m_Glyphs.Length; i++)
                {
                    m_Glyphs[i].Save(stream);
                }
            }
        }

        public Bitmap CreateSheet()
        {
            int tile_w = 0, tile_h0 = 0, tile_h1 = 0;
            for (int i = 0; i < m_Glyphs.Length; i++)
            {
                if (m_Glyphs[i].Width > tile_w)
                {
                    tile_w = m_Glyphs[i].Width;
                }
                if (m_Glyphs[i].Height - m_Glyphs[i].VerticalOffset > tile_h0)
                {
                    tile_h0 = m_Glyphs[i].Height - m_Glyphs[i].VerticalOffset;
                }
                if (m_Glyphs[i].VerticalOffset > tile_h1)
                {
                    tile_h1 = m_Glyphs[i].VerticalOffset;
                }
            }
            int tile_h = tile_h0 + tile_h1;
            int sheet_w = (int)Math.Sqrt(m_Glyphs.Length);
            while ((sheet_w & (sheet_w - 1)) != 0)
            {
                sheet_w++;
            }
            int sheet_h = (int)Math.Ceiling(m_Glyphs.Length / (float)sheet_w);
            Bitmap bmp = new Bitmap(sheet_w * tile_w, sheet_h * tile_h);
            using (Graphics gfx = Graphics.FromImage(bmp))
            {
                Brush[] background_brushes = new SolidBrush[]{
                    new SolidBrush(Color.FromArgb(0xF0, 0xF0, 0xF0)),
                    new SolidBrush(Color.FromArgb(0xE0, 0xE0, 0xE0)),
                };
                Pen line_pen = new Pen(Color.FromArgb(0x7F, 0xFF, 0x00, 0x00));
                Brush glyph_size_brush = new SolidBrush(Color.FromArgb(0x3F, 0x00, 0x00, 0x7F));

                for (int x = 0; x < sheet_w; x++)
                {
                    for (int y = 0; y < sheet_h; y++)
                    {
                        gfx.FillRectangle(background_brushes[(x + y) % 2], new Rectangle(x * tile_w, y * tile_h, tile_w, tile_h));
                        int i = y * sheet_w + x;
                        if (i < m_Glyphs.Length)
                        {
                            Bitmap glyphRender = m_Glyphs[i].Render();
                            gfx.DrawLine(line_pen, new Point(x * tile_w, (y * tile_h) + tile_h0), new Point(((x + 1) * tile_w) - 1, (y * tile_h) + tile_h0));
                            Rectangle glyph_rect = new Rectangle(new Point(x * tile_w, (y * tile_h) + tile_h0 - m_Glyphs[i].Height + m_Glyphs[i].VerticalOffset), glyphRender.Size);
                            gfx.FillRectangle(glyph_size_brush, glyph_rect);
                            gfx.DrawImage(glyphRender, glyph_rect);
                        }
                    }
                }
            }
            return bmp;
        }
    }
}