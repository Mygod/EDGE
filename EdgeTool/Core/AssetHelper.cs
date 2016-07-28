using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Windows.Media.Media3D;
using System.Xml.Linq;
using Mygod.Edge.Tool.LibTwoTribes;
using Mygod.Edge.Tool.LibTwoTribes.Util;
using Mygod.Xml.Linq;

namespace Mygod.Edge.Tool
{
    public static class AssetHelper
    {
        public static XElement GetEanElement(EAN ean)
        {
            var result = new XElement("Animation");
            result.SetAttributeValueWithDefault("Unknown", ean.Header.Unknown1);
            result.SetAttributeValueWithDefault("Duration", ean.Header.Duration);
            if (ean.Header.Zero1 != 0) Warning.WriteLine($"EANHeader.Zero1: {ean.Header.Zero1} => 0");
            if (ean.Header.Zero2 != 0) Warning.WriteLine($"EANHeader.Zero1: {ean.Header.Zero2} => 0");
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
                AssetHeader = new AssetHeader(AssetUtil.EngineVersion.Version1804Edge, name, nameSpace),
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
                element.SetAttributeValueWithDefault("Velocity",
                    isRotate ? keyframe.Velocity * 180 / Math.PI : keyframe.Velocity);
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
                            (e.GetAttributeValueWithDefault<double>("Velocity") * Math.PI / 180)
                            : e.GetAttributeValueWithDefault<float>("Velocity"))).ToArray();
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
                AssetHeader = new AssetHeader(AssetUtil.EngineVersion.Version1804Edge, name, nameSpace),
                Color1 = Helper.Parse(element.GetAttributeValue("Color1")),
                Color2 = Helper.Parse(element.GetAttributeValue("Color2")),
                Color3 = Helper.Parse(element.GetAttributeValue("Color3")),
                Color4 = Helper.Parse(element.GetAttributeValue("Color4")), 
                Float1 = element.GetAttributeValueWithDefault<float>("Float1"),
                Int1 = element.GetAttributeValueWithDefault<int>("Int1"),
                Int2 = element.GetAttributeValueWithDefault<int>("Int2"), DefaultTransforms = transforms.ToArray(),
                Int3 = element.GetAttributeValueWithDefault<int>("Int3"), Textures = textures.ToArray(),
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
                    var trianglesCount = model.Vertices.Count / 3;
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
            if (model.HasNormals) element.SetAttributeValueWithDefault("Normal", model.Normals[index]);
            if (model.HasColors)
                element.SetAttributeValueWithDefault("Color", model.Colors[index].GetString(), "Transparent");
            if (model.HasTexCoords) element.SetAttributeValueWithDefault("TexCoord", model.TexCoords[index]);
            if (model.HasTexCoords2) element.SetAttributeValueWithDefault("TexCoords2", model.TexCoords2[index]);
            return element;
        }

        public static ESO ParseEso(XElement element, string name, string nameSpace = "models")
        {
            var scaleXyz = element.GetAttributeValueWithDefault<float>("ScaleXYZ", 1);
            Vec3 translate = element.GetAttributeValueWithDefault<Vec3>("Translate"),
                rotate = element.GetAttributeValueWithDefault<Vec3>("Rotate") * ToRadian,
                scale = element.GetAttributeValueWithDefault("Scale", new Vec3(1, 1, 1));
            var mode = element.GetAttributeValueWithDefault<ApplyTransformMode>("ApplyTransform");
            var matrix = new Matrix3D();
            if (mode.HasFlag(ApplyTransformMode.MultiplicationOnly) || mode.HasFlag(ApplyTransformMode.DivisionOnly))
            {
                matrix.Scale(ConvertVector(scale));
                matrix.Scale(new Vector3D(scaleXyz, scaleXyz, scaleXyz));
                matrix.Rotate(new Quaternion(new Vector3D(1, 0, 0), rotate.X * ToDegree));
                matrix.Rotate(new Quaternion(new Vector3D(0, 1, 0), rotate.Y * ToDegree));
                matrix.Rotate(new Quaternion(new Vector3D(0, 0, 1), rotate.Z * ToDegree));
                matrix.Translate(ConvertVector(translate));
                if (mode.HasFlag(ApplyTransformMode.DivisionOnly)) matrix.Invert();
            }
            if (mode.HasFlag(ApplyTransformMode.Remove))
            {
                scaleXyz = 1;
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
                var model = new ESOModel(numVerts: vertexCount)
                {
                    MaterialAsset = e.GetAttributeValueWithDefault<AssetHash>("MaterialAsset")
                };
                foreach (var triangle in triangles)
                {
                    var autoNormals = triangle.GetAttributeValueWithDefault("AutoNormals", modelAutoNormals);
                    var normals = new bool[3];
                    var i = model.Vertices.Count;
                    var vertices = triangle.ElementsCaseInsensitive("Vertex").ToArray();
                    if (vertices.Length != 3) throw new FormatException(Localization.TriangleVertexCountError);
                    foreach (var vertex in vertices)
                    {
                        model.Vertices.Add(ConvertFromVertex(matrix.Transform
                            (ConvertVertex(vertex.GetAttributeValueWithDefault<Vec3>("Position")))));
                        if (vertex.AttributeCaseInsensitive("Normal") != null)
                        {
                            if (!model.HasNormals)
                            {
                                model.HasNormals = true;
                                model.Normals.AddRange(
                                    from j in Enumerable.Range(0, model.Vertices.Count - 1) select default(Vec3));
                            }
                            normals[model.Normals.Count - i] = true;
                        }
                        if (model.HasNormals) model.Normals.Add(ConvertFromVector(matrix.Transform(
                            ConvertVector(vertex.GetAttributeValueWithDefault<Vec3>("Normal")))));
                        if (!model.HasColors && vertex.AttributeCaseInsensitive("Color") != null)
                        {
                            model.HasColors = true;
                            model.Colors.AddRange(
                                from j in Enumerable.Range(0, model.Vertices.Count - 1) select Color.Transparent);
                        }
                        if (model.HasColors)
                            model.Colors.Add(Helper.Parse(vertex.GetAttributeValueWithDefault("Color", "Transparent")));
                        if (!model.HasTexCoords && vertex.AttributeCaseInsensitive("TexCoord") != null)
                        {
                            model.HasTexCoords = true;
                            model.TexCoords.AddRange(
                                from j in Enumerable.Range(0, model.Vertices.Count - 1) select default(Vec2));
                        }
                        if (model.HasTexCoords)
                            model.TexCoords.Add(vertex.GetAttributeValueWithDefault<Vec2>("TexCoord"));
                        if (!model.HasTexCoords2 && vertex.AttributeCaseInsensitive("TexCoord2") != null)
                        {
                            model.HasTexCoords2 = true;
                            model.TexCoords2.AddRange(
                                from j in Enumerable.Range(0, model.Vertices.Count - 1) select default(Vec2));
                        }
                        if (model.HasTexCoords2)
                            model.TexCoords2.Add(vertex.GetAttributeValueWithDefault<Vec2>("TexCoord2"));
                    }
                    if (!autoNormals) continue;
                    model.HasNormals = true;
                    model.Normals.AddRange(from j in Enumerable.Range(0, i - model.Normals.Count) select default(Vec3));
                    var p0 = ConvertVertex(model.Vertices[i]);
                    var normal = Vector3D.CrossProduct(ConvertVertex(model.Vertices[i + 2]) - p0,
                        ConvertVertex(model.Vertices[i + 1]) - p0);
                    var vec3 = new Vec3((float) normal.X, (float) normal.Y, (float) normal.Z);
                    for (var j = i; j < model.Vertices.Count; j++) if (!normals[j - i]) model.Normals[j] = vec3;
                }
                models.Add(model);
            }
            var result = new ESO
            {
                AssetHeader = new AssetHeader(AssetUtil.EngineVersion.Version1804Edge, name, nameSpace),
                Models = models.ToArray(), Header = new ESOHeader
                {
                    V01 = element.GetAttributeValueWithDefault<int>("V01"),
                    V02 = element.GetAttributeValueWithDefault<int>("V02"),
                    NodeChild = element.GetAttributeValueWithDefault<AssetHash>("NodeChild"),
                    NodeSibling = element.GetAttributeValueWithDefault<AssetHash>("NodeSibling"),
                    V07 = element.GetAttributeValueWithDefault<int>("V07"),
                    V08 = element.GetAttributeValueWithDefault<int>("V08"),
                    V09 = element.GetAttributeValueWithDefault<int>("V09"),
                    V21 = element.GetAttributeValueWithDefault<int>("V21"),
                    ScaleXYZ = scaleXyz, Scale = scale, Translate = translate, Rotate = rotate,
                    NumModels = models.Count, V20 = element.GetAttributeValueWithDefault<float>("V20")
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
}