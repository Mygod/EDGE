using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Media.Imaging;
using System.Xml.Linq;
using Mygod.Edge.Tool.LibTwoTribes;
using Mygod.Edge.Tool.LibTwoTribes.Util;
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
        private static string GetString(this Stream stream)
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
            return value?.Replace('\\', '/').Trim('/');
        }

        private static readonly ILookup<int, Color> Lookup =
            typeof(Color).GetProperties(BindingFlags.Public | BindingFlags.Static)
                .Select(f => (Color)f.GetValue(null, null)).Where(c => c.IsNamedColor).ToLookup(c => c.ToArgb());
        public static string GetString(this Color color)
        {
            // it will only return the first if there is one or more
            foreach (var first in Lookup[color.ToArgb()]) return first.Name;
            var result = FormattableString.Invariant($"{color.R:X2}{color.G:X2}{color.B:X2}");
            if (color.A == 255) return '#' + result;
            return FormattableString.Invariant($"#{color.A:X2}{result}");
        }

        public static Color Parse(string value)
        {
            return string.IsNullOrWhiteSpace(value) ? Color.Transparent : ColorTranslator.FromHtml(value);
        }

        private static readonly Regex CompiledFileNameAnalyzer = new Regex(@"^(.+)\.([0-9A-Fa-f]{8})$",
                                                                           RegexOptions.Compiled);

        public static void AnalyzeFileName(out string name, out string compiledFileName, string fileName,
                                           string nameSpace = "models")
        {
            var match = CompiledFileNameAnalyzer.Match(fileName);
            if (match.Success)
            {
                name = match.Groups[1].Value;
                compiledFileName = match.Groups[2].Value +
                                   AssetUtil.CrcNamespace(nameSpace).ToString("X8", CultureInfo.InvariantCulture);
            }
            else
            {
                name = fileName;
                compiledFileName = AssetUtil.CrcFullName(fileName, nameSpace);
            }
        }

        public static string GetDecompiledFileName(string fileName, Asset asset)
        {
            var correctHash = fileName.Substring(0, 8);
            if (correctHash == AssetUtil.CrcName(asset.AssetHeader.Name).ToString("X8", CultureInfo.InvariantCulture))
                return asset.AssetHeader.Name;
            return asset.AssetHeader.Name + '.' + correctHash;
        }

        public static BitmapImage GetBitmapImage(this Bitmap bitmap)
        {
            using (var memory = new MemoryStream())
            {
                bitmap.Save(memory, ImageFormat.Png);
                memory.Position = 0;
                var bitmapImage = new BitmapImage();
                bitmapImage.BeginInit();
                bitmapImage.StreamSource = memory;
                bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
                bitmapImage.EndInit();
                return bitmapImage;
            }
        }

        public static string GetRandomDirectory()
        {
            var result = Path.Combine(Path.GetTempPath(), Path.GetRandomFileName());
            Directory.CreateDirectory(result);
            return result;
        }
    }
}