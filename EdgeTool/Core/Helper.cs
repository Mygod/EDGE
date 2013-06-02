using System;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using ExcelLibrary.SpreadSheet;
using LibTwoTribes;
using LibTwoTribes.Util;
using Mygod.Xml.Linq;
using SevenZip;

namespace Mygod.Edge.Tool
{
    public static class Helper
    {
        public static string ExtractString(this SevenZipExtractor extractor, int index)
        {
            using (var stream = new MemoryStream())
            {
                extractor.ExtractFile(index, stream);
                return stream.GetString().TrimStart((char)65279);
            }
        }
        public static string GetString(this Stream stream)
        {
            stream.Position = 0;
            var buffer = new byte[stream.Length];
            stream.Read(buffer, 0, (int)stream.Length);
            return Encoding.UTF8.GetString(buffer);
        }

        public static void SetElementWithDefault(this XElement element, XName name, IXElementWithDefault child)
        {
            if (!child.IsDefault()) element.Add(child.GetXElement(name));
        }

        public static string GetRelativePath(this string path, string root)
        {
            return Uri.UnescapeDataString(new Uri(root + '\\').MakeRelativeUri(new Uri(path)).ToString());
        }

        public static string RemoveExtension(this string value)
        {
            return Path.Combine(Path.GetDirectoryName(value), Path.GetFileNameWithoutExtension(value));
        }

        public static string ToCorrectPath(this string value)
        {
            return value.Replace('\\', '/').Trim('/');
        }
    }

    public static class LocHelper
    {
        public static void SaveXsl(this LOC loc, string path)
        {
            var workbook = new Workbook();
            var worksheet = new Worksheet("localization");
            worksheet.Cells[0, 0] = new Cell("id");
            for (var i = 0; i < loc.Languages.Length; i++) worksheet.Cells[0, i + 1] = new Cell(loc.Languages[i]);
            for (var i = 0; i < loc.StringKeys.Length; i++)
            {
                worksheet.Cells[i + 1, 0] = new Cell(loc.StringKeys[i].ToString(CultureInfo.InvariantCulture));
                for (var j = 0; j < loc.Languages.Length; j++)
                    worksheet.Cells[i + 1, j + 1] = new Cell(loc.GetString(loc.Languages[j], loc.StringKeys[i]));
            }
            workbook.Worksheets.Add(worksheet);
            workbook.Save(path);
        }

        public static LOC FromXsl(string path)
        {
            var loc = new LOC();
            var cells = Workbook.Load(path).Worksheets[0].Cells;
            if (cells[0, 0].StringValue.ToLowerInvariant() != "id")
                throw new NotSupportedException("第一行第一列必须为 id！");
            loc.Languages = new string[cells.GetRow(0).LastColIndex];
            for (var i = 0; i < loc.Languages.Length; i++) loc.Languages[i] = cells[0, i + 1].StringValue;
            loc.StringKeys = new uint[cells.Rows.Count - 1];
            loc.StringData = new string[loc.Languages.Length, loc.StringKeys.Length];
            for (var i = 0; i < loc.StringKeys.Length; i++)
            {
                var row = cells.GetRow(i + 1);
                loc.StringKeys[i] = uint.Parse(row.GetCell(0).StringValue);
                for (var j = 0; j < Math.Min(row.LastColIndex, loc.Languages.Length); j++)  // ignore extra data
                    loc.StringData[j, i] = row.GetCell(j + 1).StringValue;
            }
            return loc;
        }
    }

    public static class EanHelper
    {
        public static XElement GetEanElement(EAN ean)
        {
            var result = new XElement("Animation");
            result.SetAttributeValueWithDefault("Unknown", ean.Header.Unknown1);
            result.SetAttributeValueWithDefault("Duration", ean.Header.Duration);
            if (ean.Header.Zero1 != 0) Warning.WriteLine(string.Format("EANHeader.Zero1: {0} => 0", ean.Header.Zero1));
            if (ean.Header.Zero2 != 0) Warning.WriteLine(string.Format("EANHeader.Zero1: {0} => 0", ean.Header.Zero2));
            result.SetAttributeValueWithDefault("AssetChild1", ean.Header.AssetChild1);
            result.SetAttributeValueWithDefault("AssetChild2", ean.Header.AssetChild2);
            result.AddIfNotEmpty(GetKeyframeBlockElement(ean.BlockRotateX, "RotateX"));
            result.AddIfNotEmpty(GetKeyframeBlockElement(ean.BlockRotateY, "RotateY"));
            result.AddIfNotEmpty(GetKeyframeBlockElement(ean.BlockRotateZ, "RotateZ"));
            result.AddIfNotEmpty(GetKeyframeBlockElement(ean.BlockScaleX, "ScaleX"));
            result.AddIfNotEmpty(GetKeyframeBlockElement(ean.BlockScaleY, "ScaleY"));
            result.AddIfNotEmpty(GetKeyframeBlockElement(ean.BlockScaleZ, "ScaleZ"));
            result.AddIfNotEmpty(GetKeyframeBlockElement(ean.BlockTranslateX, "TranslateX"));
            result.AddIfNotEmpty(GetKeyframeBlockElement(ean.BlockTranslateY, "TranslateY"));
            result.AddIfNotEmpty(GetKeyframeBlockElement(ean.BlockTranslateZ, "TranslateZ"));
            return result;
        }

        private static XElement GetKeyframeBlockElement(KeyframeBlock keyframeBlock, string name)
        {
            var result = new XElement(name);
            result.SetAttributeValueWithDefault("Value", keyframeBlock.DefaultValue);
            foreach (var keyframe in keyframeBlock.Keyframes) result.Add(GetKeyframeElement(keyframe));
            return result;
        }

        private static XElement GetKeyframeElement(Keyframe keyframe)
        {
            var result = new XElement("Keyframe");
            result.SetAttributeValueWithDefault("Time", keyframe.Time);
            result.SetAttributeValueWithDefault("Value", keyframe.Value);
            result.SetAttributeValueWithDefault("Delta", keyframe.Delta);
            return result;
        }

        public static EAN Parse(XElement element, string name, string nameSpace = "models")
        {
            return new EAN
            {
                AssetHeader = new AssetHeader(AssetUtil.EngineVersion.Version1804_Edge, name, nameSpace),
                Header = new EANHeader
                {
                    Unknown1 = element.GetAttributeValueWithDefault<float>("Unknown"),
                    Duration = element.GetAttributeValueWithDefault<float>("Duration"),
                    AssetChild1 = element.GetAttributeValueWithDefault<AssetHash>("AssetChild1"),
                    AssetChild2 = element.GetAttributeValueWithDefault<AssetHash>("AssetChild2")
                },
                BlockRotateX = ParseKeyframeBlock(element.ElementCaseInsensitive("RotateX")),
                BlockRotateY = ParseKeyframeBlock(element.ElementCaseInsensitive("RotateY")),
                BlockRotateZ = ParseKeyframeBlock(element.ElementCaseInsensitive("RotateZ")),
                BlockScaleX = ParseKeyframeBlock(element.ElementCaseInsensitive("ScaleX")),
                BlockScaleY = ParseKeyframeBlock(element.ElementCaseInsensitive("ScaleY")),
                BlockScaleZ = ParseKeyframeBlock(element.ElementCaseInsensitive("ScaleZ")),
                BlockTranslateX = ParseKeyframeBlock(element.ElementCaseInsensitive("TranslateX")),
                BlockTranslateY = ParseKeyframeBlock(element.ElementCaseInsensitive("TranslateY")),
                BlockTranslateZ = ParseKeyframeBlock(element.ElementCaseInsensitive("TranslateZ"))
            };
        }

        private static KeyframeBlock ParseKeyframeBlock(XElement element)
        {
            var result = new KeyframeBlock();
            if (element != null)
            {
                result.DefaultValue = element.GetAttributeValueWithDefault<float>("Value");
                result.Keyframes = element.ElementsCaseInsensitive("Keyframe").Select(ParseKeyframe).ToArray();
            }
            return result;
        }

        private static Keyframe ParseKeyframe(XElement element)
        {
            return new Keyframe(element.GetAttributeValueWithDefault<float>("Time"), element.GetAttributeValueWithDefault<float>("Value"),
                                element.GetAttributeValueWithDefault<float>("Delta"));
        }
    }
}
