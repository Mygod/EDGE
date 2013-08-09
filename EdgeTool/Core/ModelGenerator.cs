using System;
using System.Collections.Generic;
using System.IO;
using System.Xml.Linq;
using LibTwoTribes;
using LibTwoTribes.Util;
using Mygod.Xml.Linq;

namespace Mygod.Edge.Tool
{
    public class ModelGenerator
    {
        static ModelGenerator()
        {
            Vec3 x = new Vec3(1, 0, 0), y = new Vec3(0, 1, 0), z = new Vec3(0, 0, 1);
            XNormals = new[] { x, x, x, x, x, x };
            YNormals = new[] { y, y, y, y, y, y };
            ZNormals = new[] { z, z, z, z, z, z };
        }
        private const string ModelsNamespace = "050DB82A";
        private static readonly string[] ChildModels = new[] { "4B2B74E0", "A261604B", "DCB465C9", "04166BFF" },
                                         Materials = new[] { "F7501547", "1E1A01EC", "60CF046E", "B86D0A58" };
        private static readonly Vec3[] XNormals, YNormals, ZNormals;    // normals for two triangles

        public ModelGenerator(Level level, XElement element)
        {
            this.level = level;
            currentTheme = element.GetAttributeValueWithDefault("Theme", level.Theme);
            if (currentTheme > 3) currentTheme = 0;
            heights = new Dictionary<Point3D16, float>();
            for (short x = 0; x < level.Size.Width; x++)
                for (short y = 0; y < level.Size.Length; y++) heights.Add(new Point3D16(x, y, 0), 0.5F);
            foreach (var e in element.ElementsCaseInsensitive("SetBlocks"))
            {
                Point3D16 min = e.GetAttributeValue<Point3D16>("Min"), max = e.GetAttributeValueWithDefault("Max", min);
                var height = e.GetAttributeValueWithDefault("Height", -1F);
                for (var x = min.X; x <= max.X; x++) for (var y = min.Y; y <= max.Y; y++) for (var z = min.Z; z <= max.Z; z++)
                {
                    var point = new Point3D16(x, y, z);
                    if (Math.Abs(height - 1) < 1e-4) heights.Remove(point); else heights[point] = height;
                }
            }
        }

        private readonly Level level;
        private readonly int currentTheme;
        private readonly Dictionary<Point3D16, float> heights;

        private float GetHeight(short x, short y, short z)
        {
            var point = new Point3D16(x, y, z);
            if (!level.CollisionMap[x, y, z]) return 0;
            if (!heights.ContainsKey(point)) return 1;
            var result = heights[point];
            return result > 1 ? 1 : result;
        }

        public void Generate(string path)
        {
            List<Vec3> vertices = new List<Vec3>(), normals = new List<Vec3>();
            var texCoords = new List<Vec2>();
            for (short x = 0; x < level.Size.Width; x++) for (short y = 0; y < level.Size.Length; y++)
                for (short z = 0; z < level.Size.Height; z++) if (level.CollisionMap[x, y, z])
                {
                    var height = GetHeight(x, y, z);
                    if (height < 0) continue;
                    short x1 = (short)(x + 1), y1 = (short)(y + 1), z1 = (short)(z + 1);
                    float texY, texY1;
                    if (z > 3) texY = texY1 = 0;
                    else
                    {
                        texY1 = 1 - (z > 3 ? 3 : z) * 0.25F;
                        texY = texY1 - 0.25F;
                    }
                    if (GetHeight(x, y, z1) < 1F
                        && (Math.Abs(x - level.ExitPoint.X) > 1 || Math.Abs(y - level.ExitPoint.Y) > 1 || z1 != level.ExitPoint.Z))
                    {
                        vertices.Add(new Vec3(x, z1, y));
                        vertices.Add(new Vec3(x1, z1, y));
                        vertices.Add(new Vec3(x, z1, y1));
                        vertices.Add(new Vec3(x, z1, y1));
                        vertices.Add(new Vec3(x1, z1, y));
                        vertices.Add(new Vec3(x1, z1, y1));
                        normals.AddRange(YNormals);
                        float texX = ((x + y) & 1) == 0 ? 0.51F : 0.76F, texX1 = texX + 0.23F;
                        texCoords.Add(new Vec2(texX, texY));
                        texCoords.Add(new Vec2(texX1, texY));
                        texCoords.Add(new Vec2(texX, texY1));
                        texCoords.Add(new Vec2(texX, texY1));
                        texCoords.Add(new Vec2(texX1, texY));
                        texCoords.Add(new Vec2(texX1, texY1));
                    }
                    if (height <= 0) continue;
                    var zB = z1 - height;
                    if (z <= 3) texY1 -= 0.25F * (1 - height);
                    if (GetHeight(x1, y, z) < height)
                    {
                        vertices.Add(new Vec3(x1, zB, y));
                        vertices.Add(new Vec3(x1, zB, y1));
                        vertices.Add(new Vec3(x1, z1, y));
                        vertices.Add(new Vec3(x1, zB, y1));
                        vertices.Add(new Vec3(x1, z1, y1));
                        vertices.Add(new Vec3(x1, z1, y));
                        normals.AddRange(XNormals);
                        texCoords.Add(new Vec2(0.49F, texY1));
                        texCoords.Add(new Vec2(0.26F, texY1));
                        texCoords.Add(new Vec2(0.49F, texY));
                        texCoords.Add(new Vec2(0.26F, texY1));
                        texCoords.Add(new Vec2(0.26F, texY));
                        texCoords.Add(new Vec2(0.49F, texY));
                    }
                    if (GetHeight(x, y1, z) < height)
                    {
                        vertices.Add(new Vec3(x, zB, y1));
                        vertices.Add(new Vec3(x, z1, y1));
                        vertices.Add(new Vec3(x1, zB, y1));
                        vertices.Add(new Vec3(x, z1, y1));
                        vertices.Add(new Vec3(x1, z1, y1));
                        vertices.Add(new Vec3(x1, zB, y1));
                        normals.AddRange(ZNormals);
                        texCoords.Add(new Vec2(0.01F, texY1));
                        texCoords.Add(new Vec2(0.01F, texY));
                        texCoords.Add(new Vec2(0.24F, texY1));
                        texCoords.Add(new Vec2(0.01F, texY));
                        texCoords.Add(new Vec2(0.24F, texY));
                        texCoords.Add(new Vec2(0.24F, texY1));
                    }
                }
            var fileName = Path.GetFileNameWithoutExtension(path) + ".rmdl";
            new ESO
            {
                AssetHeader = new AssetHeader(AssetUtil.EngineVersion.Version1804_Edge, fileName, "models"),
                Header = new ESOHeader
                {
                    V01 = 1, V02 = 4096, V20 = 1, NumModels = 1, ScaleXYZ = 1, Scale = new Vec3(1, 1, 1),
                    NodeChild = AssetHash.Parse(ChildModels[currentTheme] + ModelsNamespace),
                    Translate = new Vec3(0, 0, -level.Size.Length),
                    BoundingMax = new Vec3(level.Size.Width, level.Size.Height, level.Size.Length)
                },
                Models = new[]
                {
                    new ESOModel
                    {
                        TypeFlags = ESOModel.Flags.Normals | ESOModel.Flags.TexCoords, Vertices = vertices.ToArray(),
                        Normals = normals.ToArray(), TexCoords = texCoords.ToArray(),
                        MaterialAsset = AssetHash.Parse(Materials[currentTheme] + ModelsNamespace)
                    }
                }
            }.Save(Path.Combine(Path.GetDirectoryName(path), AssetUtil.CRCFullName(fileName, "models") + ".eso"));
        }
    }
}
