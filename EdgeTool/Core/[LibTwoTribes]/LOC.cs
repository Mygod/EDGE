using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using LibTwoTribes.Util;

namespace LibTwoTribes
{
    public class LOC
    {
        private string[] m_Languages;
        private uint[] m_StringKeys;
        private string[,] m_StringData;

        public string[] Languages { get { return m_Languages; } set { m_Languages = value; } }
        public uint[] StringKeys { get { return m_StringKeys; } set { m_StringKeys = value; } }
        public string[,] StringData { get { return m_StringData; } set { m_StringData = value; } }

        public LOC()
        {
        }
        private LOC(Stream stream)
        {
            using (TTBinaryReader br = new TTBinaryReader(stream))
            {
                short numlangs = br.ReadInt16();

                m_Languages = new string[numlangs];
                for (int i = 0; i < numlangs; i++)
                    m_Languages[i] = br.ReadStringAscii(2);

                short numstrings = br.ReadInt16();

                m_StringKeys = new uint[numstrings];
                m_StringData = new string[numlangs, numstrings];

                for (int i = 0; i < numstrings; i++)
                {
                    m_StringKeys[i] = br.ReadUInt32();

                    for (int j = 0; j < numlangs; j++)
                    {
                        short string_length = br.ReadInt16();
                        string string_value = br.ReadStringUCS2(string_length);

                        m_StringData[j, i] = string_value.TrimEnd('\0');
                    }
                }
            }
        }

        public void Save(Stream stream)
        {
            using (var bw = new TTBinaryWriter(stream))
            {
                bw.Write((short) m_Languages.Length);
                foreach (var lang in m_Languages) bw.Write(Encoding.ASCII.GetBytes(lang));
                bw.Write((short)m_StringKeys.Length);
                for (var i = 0; i < m_StringKeys.Length; i++)
                {
                    bw.Write(m_StringKeys[i]);
                    for (var j = 0; j < m_Languages.Length; j++)
                    {
                        var value = (m_StringData[j, i] ?? string.Empty) + '\0';
                        bw.Write((short)value.Length);
                        foreach (var t in value) bw.Write(t);
                    }
                }
            }
        }
        public void Save(string path)
        {
            using (FileStream fsOut = new FileStream(path, FileMode.Create, FileAccess.Write)) Save(fsOut);
        }

        public static LOC FromFile(string path)
        {
            using (FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read))
            {
                return FromStream(fs);
            }
        }

        public static LOC FromStream(Stream stream)
        {
            return new LOC(stream);
        }

        public bool HasLanguage(string lang)
        {
            return m_Languages.Contains(lang);
        }

        public bool HasString(uint key)
        {
            return m_StringKeys.Contains(key);
        }

        public string GetString(string lang, uint key)
        {
            int lang_id = -1;
            for (int i = 0; i < m_Languages.Length; i++)
            {
                if (m_Languages[i] == lang)
                {
                    lang_id = i;
                    break;
                }
            }

            int key_id = -1;
            for (int i = 0; i < m_StringKeys.Length; i++)
            {
                if (m_StringKeys[i] == key)
                {
                    key_id = i;
                    break;
                }
            }

            if (lang_id < 0)
                throw new Exception(string.Format("Requested language {0} was not found.", lang));

            if (key_id < 0)
                throw new Exception(string.Format("Requested key {0} was not found.", key.ToString("X8")));

            return m_StringData[lang_id, key_id];
        }
    }
}
