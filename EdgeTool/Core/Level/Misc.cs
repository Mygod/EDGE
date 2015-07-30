using System;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Xml.Linq;

namespace Mygod.Edge.Tool
{
    public enum NullableBoolean
    {
        False, True, Null
    }

    public static class Warning
    {
        private static StringBuilder builder;
        public static void Start()
        {
            if (builder != null) throw new Exception("Warning is already in use.");
            builder = new StringBuilder();
        }
        public static void Clear()
        {
            builder = null;
        }
        public static void WriteLine(string message)
        {
            if (builder == null) Trace.WriteLine(message);
            else builder.AppendLine(message);
        }
        public static string Fetch()
        {
            return builder.ToString();
        }
    }
    
    [Obsolete]
    public sealed class Fan : IXElement
    {
        [Obsolete]
        public Fan()
        {
        }
        [Obsolete]
        public Fan(BinaryReader reader)
        {
        }
        [Obsolete]
        public Fan(XElement element)
        {
        }

        [Obsolete]
        public void Write(BinaryWriter writer)
        {
        }
        [Obsolete]
        public XElement GetXElement()
        {
            return new XElement("Fan");
        }
    }
    [Obsolete]
    public sealed class MiniBlock : IXElement
    {
        [Obsolete]
        public MiniBlock()
        {
        }
        [Obsolete]
        public MiniBlock(BinaryReader reader)
        {
        }
        [Obsolete]
        public MiniBlock(XElement element)
        {
        }

        [Obsolete]
        public void Write(BinaryWriter writer)
        {
        }
        [Obsolete]
        public XElement GetXElement()
        {
            return new XElement("MiniBlock");
        }
    }
}