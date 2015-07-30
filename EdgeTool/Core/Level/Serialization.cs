using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Xml.Linq;

namespace Mygod.Edge.Tool
{
    public interface IXSerializable
    {
        void Write(BinaryWriter writer);
    }
    public interface IXElement : IXSerializable
    {
        XElement GetXElement();
    }
    public interface IXElementWithDefault : IXElement
    {
        XElement GetXElement(XName name);
        bool IsDefault();
    }
    public interface IXElements : IXSerializable
    {
        IEnumerable<XElement> GetXElements();
    }
    public interface IWithID
    {
        string ID { get; set; }
        bool IDGenerated { get; }
    }

    public class XSerializableList<T> : List<T> where T : IXSerializable
    {
        public virtual void Write(BinaryWriter writer)
        {
            writer.Write((ushort)Count);
            WriteCore(writer);
        }
        public void WriteCore(BinaryWriter writer)
        {
            foreach (var obj in this) obj.Write(writer);
        }
    }
    public class XElementObjectList<T> : XSerializableList<T>, IXElements where T : IXElement
    {
        public virtual IEnumerable<XElement> GetXElements()
        {
            return this.Select(obj => obj.GetXElement());
        }
    }
    public class XElementObjectListWithID<T> : XElementObjectList<T> where T : IXElement, IWithID
    {
        private int currentID;
        private readonly Dictionary<string, int> dictionary = new Dictionary<string, int>();

        public string RequestID()
        {
            string result;
            do result = RequestIDCore();
            while (dictionary.ContainsKey(result));
            return result;
        }
        protected virtual string RequestIDCore()
        {
            return (++currentID).ToString(CultureInfo.InvariantCulture);
        }

        public new void Add(T value)
        {
            if (value.IDGenerated) dictionary.Add(value.ID, Count);
            base.Add(value);
        }
        public new void AddRange(IEnumerable<T> values)
        {
            foreach (var value in values) Add(value);
        }
        public new void Clear()
        {
            dictionary.Clear();
            base.Clear();
        }
        public bool Contains(string id)
        {
            return dictionary.ContainsKey(id);
        }
        public int IndexOf(string id)
        {
            return dictionary[id];
        }
        public new void Insert(int index, T value)
        {
            foreach (var pair in dictionary.ToArray().Where(pair => pair.Value >= index))
            {
                dictionary.Remove(pair.Key);
                dictionary.Add(pair.Key, pair.Value + 1);
            }
            if (value.IDGenerated) dictionary.Add(value.ID, index);
            base.Insert(index, value);
        }
        public new void InsertRange(int index, IEnumerable<T> value)
        {
            var values = value.ToArray();
            foreach (var pair in dictionary.ToArray().Where(pair => pair.Value >= index))
            {
                dictionary.Remove(pair.Key);
                dictionary.Add(pair.Key, pair.Value + index);
            }
            var i = 0;
            foreach (var v in values.Where(v => v.IDGenerated)) dictionary.Add(v.ID, index + i++);
            base.InsertRange(index, values);
        }
        public new void Remove(T value)
        {
            if (value.IDGenerated && dictionary.ContainsKey(value.ID)) dictionary.Remove(value.ID);
            base.Remove(value);
        }
        public new void RemoveAt(int index)
        {
            Remove(this[index]);
        }
        public new void RemoveRange(int index, int count)
        {
            for (var i = 0; i < count; i++) RemoveAt(index + i);
        }
        public T this[string id] { get { return this[IndexOf(id)]; } set { this[IndexOf(id)] = value; } }

        public void UpdateID(T value, string newValue)
        {
            if (dictionary.ContainsKey(newValue)) throw new DuplicateNameException(Localization.IDDuplicated);
            var index = dictionary[value.ID];
            dictionary.Remove(value.ID);
            dictionary.Add(newValue, index);
        }
    }
}
