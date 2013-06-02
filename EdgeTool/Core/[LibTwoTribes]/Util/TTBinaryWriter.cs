using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace LibTwoTribes.Util
{
    class TTBinaryWriter : IDisposable
    {
        private Stream m_BaseStream;
        private bool m_CloseOnDispose;

        public Stream BaseStream { get { return m_BaseStream; } set { m_BaseStream = value; } }

        public TTBinaryWriter(Stream stream, bool close_on_dispose = false)
        {
            m_BaseStream = stream;
            m_CloseOnDispose = close_on_dispose;
        }

        public void Write(byte value)
        {
            m_BaseStream.WriteByte(value);
        }

        public void Write(Int16 value)
        {
            byte[] buffer = BitConverter.GetBytes(value);
            m_BaseStream.Write(buffer, 0, buffer.Length);
        }

        public void Write(Int32 value)
        {
            byte[] buffer = BitConverter.GetBytes(value);
            m_BaseStream.Write(buffer, 0, buffer.Length);
        }

        public void Write(Int64 value)
        {
            byte[] buffer = BitConverter.GetBytes(value);
            m_BaseStream.Write(buffer, 0, buffer.Length);
        }

        public void Write(Single value)
        {
            byte[] buffer = BitConverter.GetBytes(value);
            m_BaseStream.Write(buffer, 0, buffer.Length);
        }

        public void Write(UInt16 value)
        {
            byte[] buffer = BitConverter.GetBytes(value);
            m_BaseStream.Write(buffer, 0, buffer.Length);
        }

        public void Write(UInt32 value)
        {
            byte[] buffer = BitConverter.GetBytes(value);
            m_BaseStream.Write(buffer, 0, buffer.Length);
        }

        public void Write(UInt64 value)
        {
            byte[] buffer = BitConverter.GetBytes(value);
            m_BaseStream.Write(buffer, 0, buffer.Length);
        }

        public void Write(byte[] buffer)
        {
            m_BaseStream.Write(buffer, 0, buffer.Length);
        }

        public void Write(byte[] buffer, int offset, int count)
        {
            m_BaseStream.Write(buffer, offset, count);
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