using System;
using System.Globalization;

namespace Mygod.Edge.Tool
{
    public interface IIDReference
    {
        string Name { get; set; }
        short Index { get; set; }
    }
    public sealed class NormalID : IIDReference
    {
        public NormalID(short id)
        {
            Index = id;
        }
        public NormalID(IDReference reference)
        {
            if (reference.IsName) Name = reference.Name;
            else Index = reference.Index;
        }

        public string Name
        {
            get { return Index.ToString(CultureInfo.InvariantCulture); }
            set { Index = short.Parse(value); }
        }
        public short Index { get; set; }
    }
    public sealed class IDReference : IIDReference
    {
        public IDReference(string name)
        {
            Name = name;
        }
        public IDReference(short index)
        {
            Index = index;
        }

        public bool IsName;
        private string name;
        private short index;
        public string Name
        {
            get { if (IsName) return name; throw new NotSupportedException(); }
            set
            {
                if (value.Contains("(") || value.Contains(")") || value.Contains(","))
                    throw new FormatException(Localization.IDInvalidCharacter);
                IsName = true;
                name = value.Trim();
            }
        }
        public short Index
        {
            get { if (IsName) throw new NotSupportedException(); return index; }
            set { IsName = false; index = value; }
        }
    }
    public sealed class IDReference<T> : IIDReference where T : IXElement, IWithID
    {
        public IDReference(XElementObjectListWithID<T> lookup, IDReference parent)
        {
            this.lookup = lookup;
            reference = parent;
        }
        public IDReference(XElementObjectListWithID<T> lookup, string name)
        {
            this.lookup = lookup;
            reference = new IDReference(name);
        }
        public IDReference(XElementObjectListWithID<T> lookup, short index)
        {
            this.lookup = lookup;
            reference = new IDReference(index);
        }

        private readonly IDReference reference;
        private readonly XElementObjectListWithID<T> lookup;
        public string Name
        {
            get { if (reference.IsName) return reference.Name; return Index < 0 ? null : lookup[Index].ID; }
            set { reference.Name = value; }
        }
        public short Index
        {
            get { return reference.IsName ? (short)lookup.IndexOf(lookup[Name]) : reference.Index; }
            set { reference.Index = value; }
        }
    }
}
