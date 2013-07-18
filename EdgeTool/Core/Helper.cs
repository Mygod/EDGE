using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Media.Imaging;
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

        public static string GetString(this Color color)
        {
            if (color.IsKnownColor) return color.ToKnownColor().ToString();
            if (color.IsNamedColor) return color.Name;
            var result = string.Format("{0:X2}{1:X2}{2:X2}", color.R, color.G, color.B);
            if (color.A == 255) return '#' + result;
            return string.Format("#{0:X2}{1}", color.A, result);
        }

        public static Color Parse(string value)
        {
            return string.IsNullOrWhiteSpace(value) ? Color.Transparent : ColorTranslator.FromHtml(value);
        }

        private static readonly Regex CompiledFileNameAnalyzer = new Regex(@"^(.+)\.([0-9A-Fa-f]{8})$", RegexOptions.Compiled);

        public static void AnalyzeFileName(out string name, out string compiledFileName, string fileName, string nameSpace = "models")
        {
            var match = CompiledFileNameAnalyzer.Match(fileName);
            if (match.Success)
            {
                name = match.Groups[1].Value;
                compiledFileName = match.Groups[2].Value + AssetUtil.CRCNamespace(nameSpace).ToString("X8");
            }
            else
            {
                name = fileName;
                compiledFileName = AssetUtil.CRCFullName(fileName, nameSpace);
            }
        }

        public static string GetDecompiledFileName(string fileName, Asset asset)
        {
            var correctHash = fileName.Substring(0, 8);
            if (correctHash == AssetUtil.CRCName(asset.AssetHeader.Name).ToString("X8")) return asset.AssetHeader.Name;
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

        public static Bitmap GetColorTile(IEnumerable<Color> colors)
        {
            var array = colors.ToArray();
            var bitmap = new Bitmap(array.Length, 1);
            for (var x = 0; x < array.Length; x++) bitmap.SetPixel(x, 0, array[x]);
            return bitmap;
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

    public static class AssetHelper
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

        public static EAN ParseEan(XElement element, string name, string nameSpace = "models")
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

        private static XElement GetKeyframeBlockElement(KeyframeBlock keyframeBlock, string name)
        {
            var result = new XElement(name);
            bool isScale = name.StartsWith("Scale", StringComparison.Ordinal),
                 isRotate = name.StartsWith("Rotate", StringComparison.Ordinal);
            result.SetAttributeValueWithDefault("Value", keyframeBlock.DefaultValue, isScale ? 1 : 0);
            foreach (var keyframe in keyframeBlock.Keyframes)
            {
                var element = new XElement("Keyframe");
                element.SetAttributeValueWithDefault("Time", keyframe.Time);
                element.SetAttributeValueWithDefault("Value", isRotate ? keyframe.Value * 180 / Math.PI : keyframe.Value, isScale ? 1 : 0);
                element.SetAttributeValueWithDefault("Delta", isRotate ? keyframe.Delta * 180 / Math.PI : keyframe.Delta);
                result.Add(element);
            }
            return result;
        }

        private static KeyframeBlock ParseKeyframeBlock(XElement element)
        {
            var result = new KeyframeBlock();
            if (element != null)
            {
                bool isScale = element.Name.LocalName.StartsWith("Scale", true, CultureInfo.InvariantCulture),
                     isRotate = element.Name.LocalName.StartsWith("Rotate", true, CultureInfo.InvariantCulture);
                result.DefaultValue = element.GetAttributeValueWithDefault<float>("Value", isScale ? 1 : 0);
                result.Keyframes = element.ElementsCaseInsensitive("Keyframe")
                    .Select(e => new Keyframe(e.GetAttributeValueWithDefault<float>("Time"),
                            isRotate ? (float)(e.GetAttributeValueWithDefault<double>("Value", isScale ? 1 : 0) * Math.PI / 180)
                                : e.GetAttributeValueWithDefault<float>("Value", isScale ? 1 : 0),
                            isRotate ? (float)(e.GetAttributeValueWithDefault<double>("Delta") * Math.PI / 180)
                                : e.GetAttributeValueWithDefault<float>("Delta"))).ToArray();
            }
            return result;
        }

        public static XElement GetEmaElement(EMA ema)
        {
            var result = new XElement("Material");
            result.SetAttributeValueWithDefault("Name", ema.Name);
            result.SetAttributeValueWithDefault("Color1", ema.Color1.GetString(), "Transparent");
            result.SetAttributeValueWithDefault("Color2", ema.Color2.GetString(), "Transparent");
            result.SetAttributeValueWithDefault("Color3", ema.Color3.GetString(), "Transparent");
            result.SetAttributeValueWithDefault("Color4", ema.Color4.GetString(), "Transparent");
            result.SetAttributeValueWithDefault("Float1", ema.Float1);
            result.SetAttributeValueWithDefault("Int1", ema.Int1);
            result.SetAttributeValueWithDefault("Int2", ema.Int2);
            result.SetAttributeValueWithDefault("Int3", ema.Int3);
            result.SetAttributeValueWithDefault("Footer4", ema.Footer4);
            result.SetAttributeValueWithDefault("Footer5", ema.Footer5);
            foreach (var texture in ema.Textures)
            {
                var e = new XElement("Texture");
                e.SetAttributeValueWithDefault("Asset", texture.Asset);
                e.SetAttributeValueWithDefault("IntArray1", string.Join(",", texture.IntArray1), "0,0,0,0");
                e.SetAttributeValueWithDefault("IntArray2", string.Join(",", texture.IntArray2), "0,0,0");
                result.Add(e);
            }
            foreach (var transform in ema.DefaultTransforms)
            {
                var e = new XElement("DefaultTransform");
                e.SetAttributeValueWithDefault("ScaleU", transform.ScaleU, 1);
                e.SetAttributeValueWithDefault("ScaleV", transform.ScaleV, 1);
                e.SetAttributeValueWithDefault("Rotation", transform.Rotation);
                e.SetAttributeValueWithDefault("TranslationU", transform.TranslationU);
                e.SetAttributeValueWithDefault("TranslationV", transform.TranslationV);
                result.Add(e);
            }
            foreach (var block in ema.AnimationBlocks)
            {
                var e = new XElement("AnimationBlock");
                e.AddIfNotEmpty(GetKeyframeBlockElement(block.ScaleU, "ScaleU"));
                e.AddIfNotEmpty(GetKeyframeBlockElement(block.ScaleV, "ScaleV"));
                e.AddIfNotEmpty(GetKeyframeBlockElement(block.Rotation, "Rotation"));
                e.AddIfNotEmpty(GetKeyframeBlockElement(block.TranslationU, "TranslationU"));
                e.AddIfNotEmpty(GetKeyframeBlockElement(block.TranslationV, "TranslationV"));
                result.Add(e);
            }
            return result;
        }

        public static EMA ParseEma(XElement element, string name, string nameSpace = "models")
        {
            var textures = new List<EMATexture>();
            var transforms = new List<EMADefaultTransform>();
            var blocks = new List<EMAAnimationBlock>();
            foreach (var e in element.Elements()) switch (e.Name.LocalName.ToLower())
            {
                case "texture":
                    textures.Add(new EMATexture
                    {
                        Asset = e.GetAttributeValueWithDefault<AssetHash>("Asset"), 
                        IntArray1 = e.GetAttributeValueWithDefault("IntArray1", "0,0,0,0").Split(',')
                            .Select(str => int.Parse(str.Trim())).ToArray(),
                        IntArray2 = e.GetAttributeValueWithDefault("IntArray2", "0,0,0").Split(',')
                            .Select(str => int.Parse(str.Trim())).ToArray()
                    });
                    break;
                case "defaulttransform":
                    transforms.Add(new EMADefaultTransform
                    {
                        ScaleU = e.GetAttributeValueWithDefault("ScaleU", 1F), ScaleV = e.GetAttributeValueWithDefault("ScaleV", 1F),
                        Rotation = e.GetAttributeValueWithDefault<float>("Rotation"),
                        TranslationU = e.GetAttributeValueWithDefault<float>("TranslationU"),
                        TranslationV = e.GetAttributeValueWithDefault<float>("TranslationV")
                    });
                    break;
                case "animationblock":
                    blocks.Add(new EMAAnimationBlock
                    {
                        ScaleU = ParseKeyframeBlock(element.ElementCaseInsensitive("ScaleU")),
                        ScaleV = ParseKeyframeBlock(element.ElementCaseInsensitive("ScaleV")),
                        Rotation = ParseKeyframeBlock(element.ElementCaseInsensitive("Rotation")),
                        TranslationU = ParseKeyframeBlock(element.ElementCaseInsensitive("TranslationU")),
                        TranslationV = ParseKeyframeBlock(element.ElementCaseInsensitive("TranslationV"))
                    });
                    break;
            }
            return new EMA
            {
                AssetHeader = new AssetHeader(AssetUtil.EngineVersion.Version1804_Edge, name, nameSpace),
                Color1 = Helper.Parse(element.GetAttributeValue("Color1")), Color2 = Helper.Parse(element.GetAttributeValue("Color2")),
                Color3 = Helper.Parse(element.GetAttributeValue("Color3")), Color4 = Helper.Parse(element.GetAttributeValue("Color4")), 
                Float1 = element.GetAttributeValueWithDefault<float>("Float1"), Int1 = element.GetAttributeValueWithDefault<int>("Int1"),
                Int2 = element.GetAttributeValueWithDefault<int>("Int2"), Int3 = element.GetAttributeValueWithDefault<int>("Int3"),
                Footer4 = element.GetAttributeValueWithDefault<int>("Footer4"), Textures = textures.ToArray(), 
                Footer5 = element.GetAttributeValueWithDefault<int>("Footer5"), DefaultTransforms = transforms.ToArray(),
                AnimationBlocks = blocks.ToArray(), Name = element.GetAttributeValue("Name")
            };
        }

        public static XElement GetEsoElement(ESO eso)
        {
            var result = new XElement("Models");
            result.SetAttributeValueWithDefault("V01", eso.Header.V01);
            result.SetAttributeValueWithDefault("V02", eso.Header.V02);
            result.SetAttributeValueWithDefault("NodeChild", eso.Header.NodeChild);
            result.SetAttributeValueWithDefault("NodeSibling", eso.Header.NodeSibling);
            result.SetAttributeValueWithDefault("V07", eso.Header.V07);
            result.SetAttributeValueWithDefault("V08", eso.Header.V08);
            result.SetAttributeValueWithDefault("V09", eso.Header.V09);
            result.SetAttributeValueWithDefault("ScaleXYZ", eso.Header.ScaleXYZ, 1);
            result.SetAttributeValueWithDefault("Translate", eso.Header.Translate);
            result.SetAttributeValueWithDefault("Rotate", eso.Header.Rotate);
            result.SetAttributeValueWithDefault("Scale", eso.Header.Scale, new Vec3(1, 1, 1));
            result.SetAttributeValueWithDefault("V20", eso.Header.V20);
            result.SetAttributeValueWithDefault("V21", eso.Header.V21);
            if (eso.Header.NumModels > 0)
            {
                result.SetAttributeValueWithDefault("BoundingMin", eso.Header.BoundingMin);
                result.SetAttributeValueWithDefault("BoundingMax", eso.Header.BoundingMax);
                if (eso.HasFooter)
                {
                    result.SetAttributeValueWithDefault("FooterV01", eso.Footer.V01);
                    result.SetAttributeValueWithDefault("FooterV02", eso.Footer.V02);
                    result.SetAttributeValueWithDefault("FooterV03", eso.Footer.V03);
                    result.SetAttributeValueWithDefault("FooterV04", eso.Footer.V04);
                }
                foreach (var model in eso.Models)
                {
                    var element = new XElement("Model");
                    element.SetAttributeValueWithDefault("MaterialAsset", model.MaterialAsset);
                    var trianglesCount = model.Vertices.Length / 3;
                    var j = 0;
                    for (var i = 0; i < trianglesCount; i++)
                    {
                        var triangle = new XElement("Triangle");
                        triangle.Add(GetVertexElement(model, j++));
                        triangle.Add(GetVertexElement(model, j++));
                        triangle.Add(GetVertexElement(model, j++));
                        element.Add(triangle);
                    }
                    result.Add(element);
                }
            }
            return result;
        }

        public static ESO ParseEso(XElement element, string name, string nameSpace = "models")
        {
            var models = new List<ESOModel>();
            foreach (var e in element.ElementsCaseInsensitive("Model"))
            {
                var vertices =
                    e.ElementsCaseInsensitive("Triangle").SelectMany(triangle => triangle.ElementsCaseInsensitive("Vertex")).ToArray();
                var model = new ESOModel
                {
                    MaterialAsset = e.GetAttributeValueWithDefault<AssetHash>("MaterialAsset"), Colors = new Color[vertices.Length],
                    Normals = new Vec3[vertices.Length], TexCoords = new Vec2[vertices.Length], Vertices = new Vec3[vertices.Length],
                    Wat = new Vec2[vertices.Length]
                };
                for (var i = 0; i < vertices.Length; i++)
                {
                    vertices[i].GetAttributeValueWithDefault(out model.Vertices[i], "Position");
                    if (vertices[i].AttributeCaseInsensitive("Normal") != null)
                    {
                        vertices[i].GetAttributeValueWithDefault(out model.Normals[i], "Normal");
                        model.TypeFlags |= ESOModel.Flags.Normals;
                    }
                    if (vertices[i].AttributeCaseInsensitive("Color") != null)
                    {
                        model.Colors[i] = Helper.Parse(vertices[i].GetAttributeValueWithDefault("Color", "Transparent"));
                        model.TypeFlags |= ESOModel.Flags.Colors;
                    }
                    if (vertices[i].AttributeCaseInsensitive("TexCoord") != null)
                    {
                        vertices[i].GetAttributeValueWithDefault(out model.TexCoords[i], "TexCoord");
                        model.TypeFlags |= ESOModel.Flags.TexCoords;
                    }
                    if (vertices[i].AttributeCaseInsensitive("Unknown") == null) continue;
                    vertices[i].GetAttributeValueWithDefault(out model.Wat[i], "Unknown");
                    model.TypeFlags |= ESOModel.Flags.Wat;
                }
                models.Add(model);
            }
            var result = new ESO
            {
                AssetHeader = new AssetHeader(AssetUtil.EngineVersion.Version1804_Edge, name, nameSpace), Models = models.ToArray(), 
                Header = new ESOHeader
                {
                    V01 = element.GetAttributeValueWithDefault<int>("V01"), V02 = element.GetAttributeValueWithDefault<int>("V02"),
                    NodeChild = element.GetAttributeValueWithDefault<AssetHash>("NodeChild"),
                    NodeSibling = element.GetAttributeValueWithDefault<AssetHash>("NodeSibling"),
                    V07 = element.GetAttributeValueWithDefault<int>("V07"), V08 = element.GetAttributeValueWithDefault<int>("V08"),
                    V09 = element.GetAttributeValueWithDefault<int>("V09"), V21 = element.GetAttributeValueWithDefault<int>("V21"),
                    ScaleXYZ = element.GetAttributeValueWithDefault<float>("ScaleXYZ", 1),
                    Translate = element.GetAttributeValueWithDefault<Vec3>("Translate"),
                    Rotate = element.GetAttributeValueWithDefault<Vec3>("Rotate"), NumModels = models.Count, 
                    Scale = element.GetAttributeValueWithDefault("Scale", new Vec3(1, 1, 1)), 
                    V20 = element.GetAttributeValueWithDefault<float>("V20")
                }
            };
            if (models.Count > 0)
            {
                result.Header.BoundingMin = element.GetAttributeValueWithDefault<Vec3>("BoundingMin");
                result.Header.BoundingMax = element.GetAttributeValueWithDefault<Vec3>("BoundingMax");
                result.Footer = new ESOFooter(element.GetAttributeValueWithDefault<float>("FooterV01"), 
                    element.GetAttributeValueWithDefault<float>("FooterV02"), element.GetAttributeValueWithDefault<int>("FooterV03"), 
                    element.GetAttributeValueWithDefault<int>("FooterV04"));
                if (Math.Abs(result.Footer.V01) > 1e-4 || Math.Abs(result.Footer.V02) > 1e-4 || result.Footer.V03 != 0
                                                       || result.Footer.V04 != 0) result.HasFooter = true;
            }
            return result;
        }

        private static XElement GetVertexElement(ESOModel model, int index)
        {
            var element = new XElement("Vertex");
            element.SetAttributeValueWithDefault("Position", model.Vertices[index]);
            if (model.TypeFlags.HasFlag(ESOModel.Flags.Normals)) element.SetAttributeValueWithDefault("Normal", model.Normals[index]);
            if (model.TypeFlags.HasFlag(ESOModel.Flags.Colors))
                element.SetAttributeValueWithDefault("Color", model.Colors[index].GetString(), "Transparent");
            if (model.TypeFlags.HasFlag(ESOModel.Flags.TexCoords))
                element.SetAttributeValueWithDefault("TexCoord", model.TexCoords[index]);
            if (model.TypeFlags.HasFlag(ESOModel.Flags.Wat)) element.SetAttributeValueWithDefault("Unknown", model.Wat[index]);
            return element;
        }
    }
}
