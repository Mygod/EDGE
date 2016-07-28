using System;
using System.IO;
using System.Linq;
using System.Text;

namespace Mygod.Edge.Tool.LibTwoTribes
{
    public class LOC
    {
        private string[] m_Languages;
        private string[,] m_StringData;
        private uint[] m_StringKeys;

        public LOC()
        {
        }

        private LOC(Stream stream)
        {
            using (var br = new BinaryReader(stream, Encoding.Unicode, true))
            {
                short numlangs = br.ReadInt16();

                m_Languages = new string[numlangs];
                for (int i = 0; i < numlangs; i++)
                    m_Languages[i] = Encoding.ASCII.GetString(br.ReadBytes(2));

                short numstrings = br.ReadInt16();

                m_StringKeys = new uint[numstrings];
                m_StringData = new string[numlangs, numstrings];

                for (int i = 0; i < numstrings; i++)
                {
                    m_StringKeys[i] = br.ReadUInt32();

                    for (int j = 0; j < numlangs; j++)
                    {
                        short string_length = br.ReadInt16();
                        string string_value = Encoding.Unicode.GetString(br.ReadBytes(string_length));

                        m_StringData[j, i] = string_value.TrimEnd('\0');
                    }
                }
            }
        }

        public string[] Languages { get { return m_Languages; } set { m_Languages = value; } }
        public uint[] StringKeys { get { return m_StringKeys; } set { m_StringKeys = value; } }
        public string[,] StringData { get { return m_StringData; } set { m_StringData = value; } }

        public void Save(Stream stream)
        {
            using (var bw = new BinaryWriter(stream, Encoding.Unicode, true))
            {
                bw.Write((short) m_Languages.Length);
                foreach (string lang in m_Languages) bw.Write(Encoding.ASCII.GetBytes(lang));
                bw.Write((short) m_StringKeys.Length);
                for (int i = 0; i < m_StringKeys.Length; i++)
                {
                    bw.Write(m_StringKeys[i]);
                    for (int j = 0; j < m_Languages.Length; j++)
                    {
                        string value = (m_StringData[j, i] ?? string.Empty) + '\0';
                        bw.Write((short) value.Length);
                        foreach (char t in value) bw.Write(t);
                    }
                }
            }
        }

        public void Save(string path)
        {
            using (var fsOut = new FileStream(path, FileMode.Create, FileAccess.Write)) Save(fsOut);
        }

        public static LOC FromFile(string path)
        {
            using (var fs = new FileStream(path, FileMode.Open, FileAccess.Read))
                return FromStream(fs);
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
                if (m_Languages[i] == lang)
                {
                    lang_id = i;
                    break;
                }

            int key_id = -1;
            for (int i = 0; i < m_StringKeys.Length; i++)
                if (m_StringKeys[i] == key)
                {
                    key_id = i;
                    break;
                }

            if (lang_id < 0)
                throw new Exception($"Requested language {lang} was not found.");

            if (key_id < 0)
                throw new Exception(FormattableString.Invariant($"Requested key {key:X8} was not found."));

            return m_StringData[lang_id, key_id];
        }
    }
}