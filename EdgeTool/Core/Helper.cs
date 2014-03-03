using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Imaging;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Xml.Linq;
using ExcelLibrary.SpreadSheet;
using LibTwoTribes;
using LibTwoTribes.Util;
using Mygod.Windows;
using Mygod.Xml.Linq;
using SevenZip;
using XACT.Interop;

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
            return value.Replace('\\', '/').Trim('/');
        }

        private static readonly ILookup<int, Color> Lookup =
            typeof(Color).GetProperties(BindingFlags.Public | BindingFlags.Static)
                .Select(f => (Color)f.GetValue(null, null)).Where(c => c.IsNamedColor).ToLookup(c => c.ToArgb());
        public static string GetString(this Color color)
        {
            // it will only return the first if there is one or more
            foreach (var first in Lookup[color.ToArgb()]) return first.Name;
            var result = string.Format("{0:X2}{1:X2}{2:X2}", color.R, color.G, color.B);
            if (color.A == 255) return '#' + result;
            return string.Format("#{0:X2}{1}", color.A, result);
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
            if (correctHash == AssetUtil.CRCName(asset.AssetHeader.Name).ToString("X8"))
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
            if (ean.Header.Zero1 != 0)
                Warning.WriteLine(string.Format("EANHeader.Zero1: {0} => 0", ean.Header.Zero1));
            if (ean.Header.Zero2 != 0)
                Warning.WriteLine(string.Format("EANHeader.Zero1: {0} => 0", ean.Header.Zero2));
            result.SetAttributeValueWithDefault("NodeChild", ean.Header.NodeChild);
            result.SetAttributeValueWithDefault("NodeSibling", ean.Header.NodeSibling);
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
                    NodeChild = element.GetAttributeValueWithDefault<AssetHash>("NodeChild"),
                    NodeSibling = element.GetAttributeValueWithDefault<AssetHash>("NodeSibling")
                },
                BlockRotateX = ParseKeyframeBlock(element, "RotateX"),
                BlockRotateY = ParseKeyframeBlock(element, "RotateY"),
                BlockRotateZ = ParseKeyframeBlock(element, "RotateZ"),
                BlockScaleX = ParseKeyframeBlock(element, "ScaleX"),
                BlockScaleY = ParseKeyframeBlock(element, "ScaleY"),
                BlockScaleZ = ParseKeyframeBlock(element, "ScaleZ"),
                BlockTranslateX = ParseKeyframeBlock(element, "TranslateX"),
                BlockTranslateY = ParseKeyframeBlock(element, "TranslateY"),
                BlockTranslateZ = ParseKeyframeBlock(element, "TranslateZ")
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
                element.SetAttributeValueWithDefault("Value",
                    isRotate ? keyframe.Value * 180 / Math.PI : keyframe.Value, isScale ? 1 : 0);
                element.SetAttributeValueWithDefault("Delta",
                    isRotate ? keyframe.Delta * 180 / Math.PI : keyframe.Delta);
                result.Add(element);
            }
            return result;
        }

        private static KeyframeBlock ParseKeyframeBlock(XElement root, string name)
        {
            var result = new KeyframeBlock();
            var isScale = name.StartsWith("Scale", true, CultureInfo.InvariantCulture);
            var element = root.ElementCaseInsensitive(name);
            if (element != null)
            {
                var isRotate = name.StartsWith("Rotate", true, CultureInfo.InvariantCulture);
                result.DefaultValue = element.GetAttributeValueWithDefault<float>("Value", isScale ? 1 : 0);
                result.Keyframes = element.ElementsCaseInsensitive("Keyframe")
                    .Select(e => new Keyframe(e.GetAttributeValueWithDefault<float>("Time"),
                            isRotate ? (float)
                                    (e.GetAttributeValueWithDefault<double>("Value", isScale ? 1 : 0) * Math.PI / 180)
                                : e.GetAttributeValueWithDefault<float>("Value", isScale ? 1 : 0),
                            isRotate ? (float)
                                    (e.GetAttributeValueWithDefault<double>("Delta") * Math.PI / 180)
                                : e.GetAttributeValueWithDefault<float>("Delta"))).ToArray();
            }
            else if (isScale) result.DefaultValue = 1;
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
                        ScaleU = e.GetAttributeValueWithDefault("ScaleU", 1F),
                        ScaleV = e.GetAttributeValueWithDefault("ScaleV", 1F),
                        Rotation = e.GetAttributeValueWithDefault<float>("Rotation"),
                        TranslationU = e.GetAttributeValueWithDefault<float>("TranslationU"),
                        TranslationV = e.GetAttributeValueWithDefault<float>("TranslationV")
                    });
                    break;
                case "animationblock":
                    blocks.Add(new EMAAnimationBlock
                    {
                        ScaleU = ParseKeyframeBlock(e, "ScaleU"), ScaleV = ParseKeyframeBlock(e, "ScaleV"),
                        Rotation = ParseKeyframeBlock(e, "Rotation"),
                        TranslationU = ParseKeyframeBlock(e, "TranslationU"),
                        TranslationV = ParseKeyframeBlock(e, "TranslationV")
                    });
                    break;
            }
            return new EMA
            {
                AssetHeader = new AssetHeader(AssetUtil.EngineVersion.Version1804_Edge, name, nameSpace),
                Color1 = Helper.Parse(element.GetAttributeValue("Color1")),
                Color2 = Helper.Parse(element.GetAttributeValue("Color2")),
                Color3 = Helper.Parse(element.GetAttributeValue("Color3")),
                Color4 = Helper.Parse(element.GetAttributeValue("Color4")), 
                Float1 = element.GetAttributeValueWithDefault<float>("Float1"),
                Int1 = element.GetAttributeValueWithDefault<int>("Int1"),
                Int2 = element.GetAttributeValueWithDefault<int>("Int2"), DefaultTransforms = transforms.ToArray(),
                Int3 = element.GetAttributeValueWithDefault<int>("Int3"), Textures = textures.ToArray(),
                Footer4 = element.GetAttributeValueWithDefault<int>("Footer4"),
                Footer5 = element.GetAttributeValueWithDefault<int>("Footer5"),
                AnimationBlocks = blocks.ToArray(), Name = element.GetAttributeValue("Name")
            };
        }

        public const float ToDegree = (float)(180 / Math.PI);
        private const float ToRadian = (float)(Math.PI / 180);

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
            result.SetAttributeValueWithDefault("Rotate", eso.Header.Rotate * ToDegree);
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
        
        private static XElement GetVertexElement(ESOModel model, int index)
        {
            var element = new XElement("Vertex");
            element.SetAttributeValueWithDefault("Position", model.Vertices[index]);
            if (model.TypeFlags.HasFlag(ESOModel.Flags.Normals))
                element.SetAttributeValueWithDefault("Normal", model.Normals[index]);
            if (model.TypeFlags.HasFlag(ESOModel.Flags.Colors))
                element.SetAttributeValueWithDefault("Color", model.Colors[index].GetString(), "Transparent");
            if (model.TypeFlags.HasFlag(ESOModel.Flags.TexCoords))
                element.SetAttributeValueWithDefault("TexCoord", model.TexCoords[index]);
            if (model.TypeFlags.HasFlag(ESOModel.Flags.Wat))
                element.SetAttributeValueWithDefault("Unknown", model.Wat[index]);
            return element;
        }

        public static ESO ParseEso(XElement element, string name, string nameSpace = "models")
        {
            var scaleXYZ = element.GetAttributeValueWithDefault<float>("ScaleXYZ", 1);
            Vec3 translate = element.GetAttributeValueWithDefault<Vec3>("Translate"),
                 rotate = element.GetAttributeValueWithDefault<Vec3>("Rotate") * ToRadian,
                 scale = element.GetAttributeValueWithDefault("Scale", new Vec3(1, 1, 1));
            var mode = element.GetAttributeValueWithDefault<ApplyTransformMode>("ApplyTransform");
            var matrix = new Matrix3D();
            if (mode.HasFlag(ApplyTransformMode.MultiplicationOnly) || mode.HasFlag(ApplyTransformMode.DivisionOnly))
            {
                matrix.Scale(ConvertVector(scale));
                matrix.Scale(new Vector3D(scaleXYZ, scaleXYZ, scaleXYZ));
                matrix.Rotate(new Quaternion(new Vector3D(1, 0, 0), rotate.X * ToDegree));
                matrix.Rotate(new Quaternion(new Vector3D(0, 1, 0), rotate.Y * ToDegree));
                matrix.Rotate(new Quaternion(new Vector3D(0, 0, 1), rotate.Z * ToDegree));
                matrix.Translate(ConvertVector(translate));
                if (mode.HasFlag(ApplyTransformMode.DivisionOnly)) matrix.Invert();
            }
            if (mode.HasFlag(ApplyTransformMode.Remove))
            {
                scaleXYZ = 1;
                rotate = translate = default(Vec3);
                scale = new Vec3(1, 1, 1);
            }
            var modelsAutoNormals = element.GetAttributeValueWithDefault<bool>("AutoNormals");
            var models = new List<ESOModel>();
            foreach (var e in element.ElementsCaseInsensitive("Model"))
            {
                var modelAutoNormals = e.GetAttributeValueWithDefault("AutoNormals", modelsAutoNormals);
                var triangles = e.ElementsCaseInsensitive("Triangle").ToArray();
                var vertexCount = triangles.Length * 3;
                var model = new ESOModel
                {
                    MaterialAsset = e.GetAttributeValueWithDefault<AssetHash>("MaterialAsset"),
                    Normals = new Vec3[vertexCount], TexCoords = new Vec2[vertexCount],
                    Vertices = new Vec3[vertexCount], Colors = new Color[vertexCount], Wat = new Vec2[vertexCount]
                };
                var j = 0;
                foreach (var triangle in triangles)
                {
                    var autoNormals = triangle.GetAttributeValueWithDefault("AutoNormals", modelAutoNormals);
                    var normals = new bool[3];
                    var i = j;
                    var vertices = triangle.ElementsCaseInsensitive("Vertex").ToArray();
                    if (vertices.Length != 3) throw new FormatException("一个 Triangle 元素必须要有三个 Vertex 元素！");
                    foreach (var vertex in vertices)
                    {
                        vertex.GetAttributeValueWithDefault(out model.Vertices[j], "Position");
                        model.Vertices[j] = ConvertFromVertex(matrix.Transform(ConvertVertex(model.Vertices[j])));
                        if (vertex.AttributeCaseInsensitive("Normal") != null)
                        {
                            vertex.GetAttributeValueWithDefault(out model.Normals[j], "Normal");
                            model.Normals[j] = ConvertFromVector(matrix.Transform(ConvertVector(model.Normals[j])));
                            model.TypeFlags |= ESOModel.Flags.Normals;
                            normals[j - i] = true;
                        }
                        if (vertex.AttributeCaseInsensitive("Color") != null)
                        {
                            model.Colors[j] =
                                Helper.Parse(vertex.GetAttributeValueWithDefault("Color", "Transparent"));
                            model.TypeFlags |= ESOModel.Flags.Colors;
                        }
                        if (vertex.AttributeCaseInsensitive("TexCoord") != null)
                        {
                            vertex.GetAttributeValueWithDefault(out model.TexCoords[j], "TexCoord");
                            model.TypeFlags |= ESOModel.Flags.TexCoords;
                        }
                        if (vertex.AttributeCaseInsensitive("Unknown") != null)
                        {
                            vertex.GetAttributeValueWithDefault(out model.Wat[j], "Unknown");
                            model.TypeFlags |= ESOModel.Flags.Wat;
                        }
                        j++;
                    }
                    if (!autoNormals) continue;
                    var p0 = ConvertVertex(model.Vertices[i]);
                    var normal = Vector3D.CrossProduct(ConvertVertex(model.Vertices[i + 2]) - p0,
                                                       ConvertVertex(model.Vertices[i + 1]) - p0);
                    var vec3 = new Vec3((float) normal.X, (float) normal.Y, (float) normal.Z);
                    for (var k = i; k < j; k++) if (!normals[k - i]) model.Normals[k] = vec3;
                    model.TypeFlags |= ESOModel.Flags.Normals;
                }
                models.Add(model);
            }
            var result = new ESO
            {
                AssetHeader = new AssetHeader(AssetUtil.EngineVersion.Version1804_Edge, name, nameSpace),
                Models = models.ToArray(), Header = new ESOHeader
                {
                    V01 = element.GetAttributeValueWithDefault<int>("V01"), V02 = element.GetAttributeValueWithDefault<int>("V02"),
                    NodeChild = element.GetAttributeValueWithDefault<AssetHash>("NodeChild"),
                    NodeSibling = element.GetAttributeValueWithDefault<AssetHash>("NodeSibling"),
                    V07 = element.GetAttributeValueWithDefault<int>("V07"), V08 = element.GetAttributeValueWithDefault<int>("V08"),
                    V09 = element.GetAttributeValueWithDefault<int>("V09"), V21 = element.GetAttributeValueWithDefault<int>("V21"),
                    ScaleXYZ = scaleXYZ, Scale = scale, Translate = translate, Rotate = rotate, NumModels = models.Count, 
                    V20 = element.GetAttributeValueWithDefault<float>("V20")
                }
            };
            if (models.Count > 0)
            {
                result.Header.BoundingMin = ConvertFromVertex(matrix.Transform(
                    ConvertVertex(element.GetAttributeValueWithDefault<Vec3>("BoundingMin"))));
                result.Header.BoundingMax = ConvertFromVertex(matrix.Transform(
                    ConvertVertex(element.GetAttributeValueWithDefault<Vec3>("BoundingMax"))));
                result.Footer = new ESOFooter(element.GetAttributeValueWithDefault<float>("FooterV01"), 
                                              element.GetAttributeValueWithDefault<float>("FooterV02"),
                                              element.GetAttributeValueWithDefault<int>("FooterV03"), 
                                              element.GetAttributeValueWithDefault<int>("FooterV04"));
                if (Math.Abs(result.Footer.V01) > 1e-4 || Math.Abs(result.Footer.V02) > 1e-4 || result.Footer.V03 != 0
                                                       || result.Footer.V04 != 0) result.HasFooter = true;
            }
            return result;
        }

        public static Point3D ConvertVertex(Vec3 vec)
        {
            return new Point3D(vec.X, vec.Y, vec.Z);
        }
        public static Vector3D ConvertVector(Vec3 vec)
        {
            return new Vector3D(vec.X, vec.Y, vec.Z);
        }
        public static Vec3 ConvertFromVertex(Point3D point)
        {
            return new Vec3((float) point.X, (float) point.Y, (float) point.Z);
        }
        public static Vec3 ConvertFromVector(Vector3D vector)
        {
            return new Vec3((float) vector.X, (float) vector.Y, (float) vector.Z);
        }
    }
    
    public enum ApplyTransformMode
    {
        Copy = 0x000, Remove = 0x001, MultiplicationOnly = 0x010, Multiplication = 0x011,
        DivisionOnly = 0x100, Division = 0x101
    }

    public static class Compiler
    {
        public static Tuple<Exception, string> Compile(bool exFormat, string file, string directory = null)
        {
            var fileName = Path.GetFileNameWithoutExtension(file);
            if (string.IsNullOrWhiteSpace(directory)) directory = Path.GetDirectoryName(file);
            string inputPath = Path.Combine(Path.GetDirectoryName(file), fileName),
                   outputPath = Path.Combine(directory, fileName);
            Warning.Start();
            try
            {
                switch ((Path.GetExtension(file) ?? string.Empty).ToLowerInvariant())
                {
                    case ".bin":
                        switch (fileName.ToLowerInvariant())
                        {
                            case "cos":
                                var array = new short[181];
                                using (var stream = File.OpenRead(file))
                                using (var reader = new BinaryReader(stream))
                                    for (var i = 0; i <= 180; i++) array[i] = reader.ReadInt16();
                                File.WriteAllText(outputPath + ".txt", string.Join(Environment.NewLine,
                                    array.Select(value => value / 256.0)));
                                break;
                            case "font":
                                using (var stream = File.OpenRead(file))
                                    File.WriteAllText(outputPath + ".xml", GetFontElement(stream).ToString());
                                break;
                            default:
                                Level.CreateFromCompiled(file).Decompile(outputPath);
                                break;
                        }
                        break;
                    case ".xml":
                        var root = XHelper.Load(file).Elements().First();
                        switch (root.Name.LocalName.ToLowerInvariant())
                        {
                            case "level":
                                Level.CreateFromDecompiled(inputPath).Compile(outputPath + ".bin");
                                break;
                            case "animation":
                                AssetHelper.ParseEan(root, fileName).Save(Path.Combine(directory,
                                    AssetUtil.CRCFullName(fileName, "models") + ".ean"));
                                break;
                            case "material":
                            {
                                string name, compiledFileName;
                                Helper.AnalyzeFileName(out name, out compiledFileName, fileName);
                                var ema = AssetHelper.ParseEma(root, name);
                                ema.Save(Path.Combine(directory, compiledFileName + ".ema"));
                                break;
                            }
                            case "models":
                            {
                                string name, compiledFileName;
                                Helper.AnalyzeFileName(out name, out compiledFileName, fileName);
                                var eso = AssetHelper.ParseEso(root, name);
                                eso.Save(Path.Combine(directory, compiledFileName + ".eso"));
                                break;
                            }
                            case "font":
                            {
                                using (var stream = File.Create(inputPath + ".bin")) WriteFontElement(stream, root);
                                break;
                            }
                        }
                        break;
                    case ".loc":
                        LOC.FromFile(file).SaveXsl(outputPath + ".xls");
                        break;
                    case ".xls":
                        LocHelper.FromXsl(file).Save(outputPath + ".loc");
                        break;
                    case ".etx":
                        var etx = ETX.FromFile(file);
                        etx.GetBitmap().Save(Path.Combine(directory, etx.AssetHeader.Name + ".png"));
                        break;
                    case ".png":
                        using (var bitmap = new Bitmap(file))
                        {
                            var name = AssetUtil.CRCFullName(fileName, "textures") + ".etx";
                            (exFormat ? (ETX) ETX1804.CreateFromImage(bitmap, fileName)
                                : ETX1803.CreateFromImage(bitmap, fileName)).Save(Path.Combine(directory, name));
                        }
                        break;
                    case ".ean":
                        var ean = EAN.FromFile(file);
                        File.WriteAllText(Path.Combine(directory,
                                                       Helper.GetDecompiledFileName(fileName, ean) + ".xml"),
                                          AssetHelper.GetEanElement(ean).ToString());
                        break;
                    case ".ema":
                    {
                        var ema = EMA.FromFile(file);
                        File.WriteAllText(Path.Combine(directory,
                                                       Helper.GetDecompiledFileName(fileName, ema) + ".xml"),
                                          AssetHelper.GetEmaElement(ema).ToString());
                        break;
                    }
                    case ".eso":
                    {
                        var eso = ESO.FromFile(file);
                        File.WriteAllText(Path.Combine(directory,
                                                       Helper.GetDecompiledFileName(fileName, eso) + ".xml"),
                                          AssetHelper.GetEsoElement(eso).ToString());
                        break;
                    }
                    case ".txt":
                        using (var stream = new FileStream(outputPath + ".bin", FileMode.Create, FileAccess.Write, FileShare.Read))
                        using (var writer = new BinaryWriter(stream))
                            foreach (var num in File.ReadAllText(file)
                                .Split(new[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries)
                                .Select(double.Parse)) writer.Write((short) Math.Round(num * 256));
                        break;
                    default:
                        switch (Path.GetFileName(file))
                        {
                            case "audio":
                                outputPath = Path.Combine(directory, "sfx");
                                if (Directory.Exists(outputPath)) Directory.Delete(outputPath, true);
                                Directory.CreateDirectory(outputPath);
                                string xsb = Path.Combine(file, "sfx.xsb"), xwb = Path.Combine(file, "sfx.xwb");
                                int offset;
                                using (var stream = new FileStream(xsb, FileMode.Open))
                                {
                                    stream.Position = 0x2A;
                                    using (var reader = new BinaryReader(stream)) offset = reader.ReadInt32();
                                }
                                var unxwb = new Process { StartInfo = new ProcessStartInfo(
                                    Path.Combine(CurrentApp.Directory, "Resources/Tools/unxwb.exe"),
                                    string.Format("-d \"{0}\" -b \"{1}\" {2} \"{3}\"", outputPath, xsb, offset, xwb))
                                        { UseShellExecute = false, CreateNoWindow = true } };
                                unxwb.Start();
                                unxwb.WaitForExit();
                                break;
                            case "sfx":
                                outputPath = Path.Combine(directory, "audio");
                                Directory.CreateDirectory(outputPath);
                                var tempOutputPath = Helper.GetRandomDirectory();
                                Directory.CreateDirectory(tempOutputPath);
                                var projectPath = GenerateXactProject(file);
                                using (var project = new CXACTMasterProject())
                                {
                                    project.Create();
                                    project.Load(projectPath, new CXACTMasterProjectCallback(), 0);
                                    project.Build(new CXACTMasterProjectCallback(), tempOutputPath, false, false);
                                }
                                foreach (var stuff in Directory.EnumerateFiles(tempOutputPath))
                                    File.Move(stuff, Path.Combine(outputPath, Path.GetFileName(stuff)));
                                File.Delete(projectPath);
                                try
                                {
                                    Directory.Delete(tempOutputPath, true);
                                }
                                catch { }   // ignore any error that may have caused
                                break;
                            default:
                                throw new NotSupportedException("对不起，无法识别您要(反)编译的文件！");
                        }
                        break;
                }
                return new Tuple<Exception, string>(null, Warning.Fetch());
            }
            catch (Exception exc)
            {
                return new Tuple<Exception, string>(exc, Warning.Fetch());
            }
            finally
            {
                Warning.Clear();
            }
        }

        private static XElement GetFontElement(Stream stream)
        {
            var result = new XElement("Font");
            using (var reader = new BinaryReader(stream))
            {
                result.SetAttributeValueWithDefault("SpaceWidth", reader.ReadByte());
                result.SetAttributeValueWithDefault("LineSpacing", reader.ReadByte());
                var count = reader.ReadUInt16();
                for (var i = 0; i < count; i++)
                {
                    var ch = new XElement("Char");
                    if (i < CharLookup.Length) ch.SetAttributeValue("Character", CharLookup[i]);
                    var rects = reader.ReadByte();
                    ch.SetAttributeValueWithDefault("Width", reader.ReadByte());
                    for (var j = 0; j < rects; j++)
                    {
                        var rect = new XElement("Rect");
                        rect.SetAttributeValue("Point", new Point2D8(reader));
                        rect.SetAttributeValue("Size", new Point2D8(reader));
                        ch.Add(rect);
                    }
                    result.Add(ch);
                }
            }
            return result;
        }

        private static void WriteFontElement(Stream stream, XElement element)
        {
            using (var writer = new BinaryWriter(stream))
            {
                writer.Write(element.GetAttributeValueWithDefault<byte>("SpaceWidth"));
                writer.Write(element.GetAttributeValueWithDefault<byte>("LineSpacing"));
                var chars = element.ElementsCaseInsensitive("Char").ToArray();
                writer.Write((ushort) chars.Length);
                var charsLookup = chars.ToLookup(e => e.GetAttributeValue("Character"));
                foreach (var ch in CharLookup.Select(ch => ch.ToString(CultureInfo.InvariantCulture)))
                    if (charsLookup.Contains(ch)) WriteCharElement(writer, charsLookup[ch].First());
                    else    // write an empty char here!
                    {
                        writer.Write((byte)0);
                        writer.Write((byte)1);
                    }
                foreach (var pair in charsLookup)
                {
                    if (pair.Key != null && pair.Key.Length == 1)   // is a valid char
                    {
                        var i = 0;
                        foreach (var ch in pair.Where(ch => i++ > 0 || !CharSet.Contains(pair.Key[0])))
                            WriteCharElement(writer, ch);
                    }
                    else foreach (var ch in pair) WriteCharElement(writer, ch);
                }
            }
        }
        private static void WriteCharElement(BinaryWriter writer, XElement ch)
        {
            var rects = ch.ElementsCaseInsensitive("Rect").ToArray();
            writer.Write((byte)rects.Length);
            writer.Write(ch.GetAttributeValueWithDefault<byte>("Width"));
            foreach (var rect in rects)
            {
                rect.GetAttributeValueWithDefault<Point2D8>("Point").Write(writer);
                rect.GetAttributeValueWithDefault<Point2D8>("Size").Write(writer);
            }
        }

        private static readonly string CharLookup = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789%１２３４５６７８９,.?!:'()_-=+@/\"çβāäēëīíōöūü><[]ñ¡À$ÉȇÜ|şğÇĕčřýňšžŮďĎŐȁÚâćęźɫąśńżŚ";
        private static readonly HashSet<char> CharSet = new HashSet<char>(CharLookup);

        #region GenerateXactProject
        private static string GenerateXactProject(string outputPath)
        {
            StringBuilder waves = new StringBuilder(), sounds = new StringBuilder(), cues = new StringBuilder();
            var i = 0;
            foreach (var info in new DirectoryInfo(outputPath).EnumerateFiles("*.wav"))
            {
                var id = Path.GetFileNameWithoutExtension(info.Name);
                waves.AppendFormat(Wave, id, info.Name);
                sounds.AppendFormat(Sound, id, i);
                cues.AppendFormat(Cue, id, i++);
            }
            var path = Path.Combine(outputPath, "edge.xap");
            File.WriteAllText(path, string.Format(Template, waves, sounds, cues));
            return path;
        }

        private static readonly string Template = @"Signature = XACT3;
Version = 18;
Content Version = 46;
Release = February 2010;

Options
{{
    Verbose Report = 0;
    Generate C/C++ Headers = 1;
}}

Global Settings
{{
    Xbox File = edge.xgs;
    Windows File = edge.xgs;
    Exclude Category Names = 0;
    Exclude Variable Names = 0;
    Last Modified Low = 2341759291;
    Last Modified High = 30318330;

    Category
    {{
        Name = Global;
        Public = 1;
        Background Music = 0;
        Volume = 0;

        Category Entry
        {{
        }}

        Instance Limit
        {{
            Max Instances = 255;
            Behavior = 0;

            Crossfade
            {{
                Fade In = 0;
                Fade Out = 0;
                Crossfade Type = 0;
            }}
        }}
    }}

    Category
    {{
        Name = Default;
        Public = 1;
        Background Music = 0;
        Volume = 0;

        Category Entry
        {{
            Name = Global;
        }}

        Instance Limit
        {{
            Max Instances = 255;
            Behavior = 0;

            Crossfade
            {{
                Fade In = 0;
                Fade Out = 0;
                Crossfade Type = 0;
            }}
        }}
    }}

    Category
    {{
        Name = Music;
        Public = 1;
        Background Music = 1;
        Volume = 0;

        Category Entry
        {{
            Name = Global;
        }}

        Instance Limit
        {{
            Max Instances = 255;
            Behavior = 0;

            Crossfade
            {{
                Fade In = 0;
                Fade Out = 0;
                Crossfade Type = 0;
            }}
        }}
    }}

    Variable
    {{
        Name = OrientationAngle;
        Public = 1;
        Global = 0;
        Internal = 0;
        External = 0;
        Monitored = 1;
        Reserved = 1;
        Read Only = 0;
        Time = 0;
        Value = 0.000000;
        Initial Value = 0.000000;
        Min = -180.000000;
        Max = 180.000000;
    }}

    Variable
    {{
        Name = DopplerPitchScalar;
        Public = 1;
        Global = 0;
        Internal = 0;
        External = 0;
        Monitored = 1;
        Reserved = 1;
        Read Only = 0;
        Time = 0;
        Value = 1.000000;
        Initial Value = 1.000000;
        Min = 0.000000;
        Max = 4.000000;
    }}

    Variable
    {{
        Name = SpeedOfSound;
        Public = 1;
        Global = 1;
        Internal = 0;
        External = 0;
        Monitored = 1;
        Reserved = 1;
        Read Only = 0;
        Time = 0;
        Value = 343.500000;
        Initial Value = 343.500000;
        Min = 0.000000;
        Max = 1000000.000000;
    }}

    Variable
    {{
        Name = ReleaseTime;
        Public = 1;
        Global = 0;
        Internal = 1;
        External = 1;
        Monitored = 1;
        Reserved = 1;
        Read Only = 1;
        Time = 1;
        Value = 0.000000;
        Initial Value = 0.000000;
        Min = 0.000000;
        Max = 15000.000000;
    }}

    Variable
    {{
        Name = AttackTime;
        Public = 1;
        Global = 0;
        Internal = 1;
        External = 1;
        Monitored = 1;
        Reserved = 1;
        Read Only = 1;
        Time = 1;
        Value = 0.000000;
        Initial Value = 0.000000;
        Min = 0.000000;
        Max = 15000.000000;
    }}

    Variable
    {{
        Name = NumCueInstances;
        Public = 1;
        Global = 0;
        Internal = 1;
        External = 1;
        Monitored = 1;
        Reserved = 1;
        Read Only = 1;
        Time = 0;
        Value = 0.000000;
        Initial Value = 0.000000;
        Min = 0.000000;
        Max = 1024.000000;
    }}

    Variable
    {{
        Name = Distance;
        Public = 1;
        Global = 0;
        Internal = 0;
        External = 0;
        Monitored = 1;
        Reserved = 1;
        Read Only = 0;
        Time = 0;
        Value = 0.000000;
        Initial Value = 0.000000;
        Min = 0.000000;
        Max = 1000000.000000;
    }}
}}

Wave Bank
{{
    Name = sfx;
    Xbox File = sfx.xwb;
    Windows File = sfx.xwb;
    Xbox Bank Path Edited = 0;
    Windows Bank Path Edited = 0;
    Seek Tables = 1;
    Compression Preset Name = <none>;
    Xbox Bank Last Modified Low = 0;
    Xbox Bank Last Modified High = 0;
    PC Bank Last Modified Low = 3627906690;
    PC Bank Last Modified High = 30318334;
    Bank Last Revised Low = 3533221792;
    Bank Last Revised High = 30318334;

{0}}}

Sound Bank
{{
    Name = sfx;
    Xbox File = sfx.xsb;
    Windows File = sfx.xsb;
    Xbox Bank Path Edited = 0;
    Windows Bank Path Edited = 0;
    Bank Last Modified Low = 3631559941;
    Bank Last Modified High = 30318334;
    Header Last Modified High = 0;
    Header Last Modified Low = 0;

{1}{2}}}", Wave = @"    Wave
    {{
        Name = {0};
        File = {1};
    }}

", Sound = @"    Sound
    {{
        Name = {0};
        Volume = -1200;
        Pitch = 0;
        Priority = 0;

        Category Entry
        {{
            Name = Default;
        }}

        Track
        {{
            Volume = 0;
            Use Filter = 0;

            Play Wave Event
            {{
                Break Loop = 0;
                Use Speaker Position = 0;
                Use Center Speaker = 1;
                New Speaker Position On Loop = 1;
                Speaker Position Angle = 0;
                Speaker Position Arc = 0;

                Event Header
                {{
                    Timestamp = 0;
                    Relative = 0;
                    Random Recurrence = 0;
                    Random Offset = 0;
                }}

                Wave Entry
                {{
                    Bank Name = sfx;
                    Bank Index = 0;
                    Entry Name = {0};
                    Entry Index = {1};
                    Weight = 255;
                    Weight Min = 0;
                }}
            }}
        }}
    }}

", Cue = @"    Cue
    {{
        Name = {0};

        Variation
        {{
            Variation Type = 3;
            Variation Table Type = 1;
            New Variation on Loop = 0;
        }}

        Sound Entry
        {{
            Name = {0};
            Index = {1};
            Weight Min = 0;
            Weight Max = 255;
        }}
    }}

";
        #endregion
    }
}
