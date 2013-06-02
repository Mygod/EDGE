using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibTwoTribes.Util
{
    class TTBinaryReader : IDisposable
    {
        private Stream m_BaseStream;
        private bool m_CloseOnDispose;

        public Stream BaseStream { get { return m_BaseStream; } set { m_BaseStream = value; } }

        public TTBinaryReader(Stream stream, bool close_on_dispose = false)
        {
            m_BaseStream = stream;
            m_CloseOnDispose = close_on_dispose;
        }

        public void Read(byte[] buffer, int offset, int count)
        {
            m_BaseStream.Read(buffer, offset, count);
        }

        public byte ReadByte()
        {
            return (byte)m_BaseStream.ReadByte();
        }

        public byte[] ReadBytes(int count)
        {
            byte[] buffer = new byte[count];
            Read(buffer, 0, count);
            return buffer;
        }

        public Int16 ReadInt16()
        {
            byte[] buffer = new byte[sizeof(Int16)];
            m_BaseStream.Read(buffer, 0, buffer.Length);
            return BitConverter.ToInt16(buffer, 0);
        }

        public Int32 ReadInt32()
        {
            byte[] buffer = new byte[sizeof(Int32)];
            m_BaseStream.Read(buffer, 0, buffer.Length);
            return BitConverter.ToInt32(buffer, 0);
        }

        public Int64 ReadInt64()
        {
            byte[] buffer = new byte[sizeof(Int64)];
            m_BaseStream.Read(buffer, 0, buffer.Length);
            return BitConverter.ToInt64(buffer, 0);
        }

        public Single ReadSingle()
        {
            byte[] buffer = new byte[sizeof(Single)];
            m_BaseStream.Read(buffer, 0, buffer.Length);
            return BitConverter.ToSingle(buffer, 0);
        }

        public string ReadStringAscii(int length)
        {
            return Encoding.ASCII.GetString(ReadBytes(length));
        }

        public string ReadStringUCS2(int length)
        {
            string buffer = "";
            for (int i = 0; i < length; i++)
                buffer += (char)ReadInt16();
            return buffer;
        }

        public UInt16 ReadUInt16()
        {
            byte[] buffer = new byte[sizeof(UInt16)];
            m_BaseStream.Read(buffer, 0, buffer.Length);
            return BitConverter.ToUInt16(buffer, 0);
        }

        public UInt32 ReadUInt32()
        {
            byte[] buffer = new byte[sizeof(UInt32)];
            m_BaseStream.Read(buffer, 0, buffer.Length);
            return BitConverter.ToUInt32(buffer, 0);
        }

        public UInt64 ReadUInt64()
        {
            byte[] buffer = new byte[sizeof(UInt64)];
            m_BaseStream.Read(buffer, 0, buffer.Length);
            return BitConverter.ToUInt64(buffer, 0);
        }

        void IDisposable.Dispose()
        {
            if (m_CloseOnDispose)
            {
                m_BaseStream.Close();
            }
        }
    }
}