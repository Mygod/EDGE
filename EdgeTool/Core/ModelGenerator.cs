using System;
using System.Drawing;
using System.IO;
using System.Linq;
using Mygod.Edge.Tool.LibTwoTribes;
using Mygod.Edge.Tool.LibTwoTribes.Util;

namespace Mygod.Edge.Tool
{
    public sealed class ModelGenerator
    {
        static ModelGenerator()
        {
            Vec3 x = new Vec3(1, 0, 0), y = new Vec3(0, 1, 0), z = new Vec3(0, 0, 1);
            XNormals = new[] { x, x, x, x, x, x };
            YNormals = new[] { y, y, y, y, y, y };
            ZNormals = new[] { z, z, z, z, z, z };
        }
        private const string ModelsNamespace = "050DB82A";
        private static readonly string[] ChildModels = { "67228D77", "1DE2AE87", "8A7DBFAE", "451F8839" },
                                         Materials = { "2F2CC05D", "55ECE3AD", "C273F284", "0D11C513" };
        private static readonly Vec3[] Translates = { new Vec3(53.5F, 2.25F, -46F), new Vec3(89.5F, 2.25F, -90),
                                                      new Vec3(43F, 2.25F, -32.5F), new Vec3(30F, 2.25F, -74.5F) };
        private static readonly Vec3[] XNormals, YNormals, ZNormals;    // normals for two triangles

        public ModelGenerator(Level level, byte defaultTheme)
        {
            this.level = level;
            themes = new int[4];
            themes[0] = defaultTheme;
            var temp = new bool[4];
            temp[themes[0]] = true;
            var j = 0;
            for (var i = 1; i <= 3; ++i)
            {
                while (temp[j]) ++j;
                temp[themes[i] = j] = true;
            }
        }

        private readonly Level level;
        private readonly int[] themes;

        private struct ColorInformation
        {
            public ColorInformation(Color color)
            {
                Theme = 3 - (color.G >> 6);
                Height = (color.B - 1) / 254F;
            }

            public readonly float Height;
            public readonly int Theme;
        }
        private Vec3 Transform(Vec3 value)
        {
            return (value - Translates[themes[0]] - new Vec3(0, 0, level.Size.Length)) * 10;
        }
        private ColorInformation GetInformation(short x, short y, short z)
        {
            return new ColorInformation(level.CollisionMap.GetColor(x, y, z));
        }

        public string Generate(string path)
        {
            var models = new ESOModel[4];
            for (short x = 0; x < level.Size.Width; x++) for (short y = 0; y < level.Size.Length; y++)
                for (short z = 0; z < level.Size.Height; z++)
                {
                    var info = GetInformation(x, y, z);
                    if (info.Height < 0) continue;
                    var theme = themes[info.Theme];
                    if (models[theme] == null)
                        models[theme] = new ESOModel(ESOModel.Flags.Normals | ESOModel.Flags.TexCoords)
                        {
                            MaterialAsset = AssetHash.Parse(Materials[theme] + ModelsNamespace)
                        };
                    var model = models[theme];
                    short x1 = (short)(x + 1), y1 = (short)(y + 1), z1 = (short)(z + 1);
                    float texY1 = 1 - z * 0.25F, texY = texY1 - 0.25F;
                    if (GetInformation(x, y, z1).Height < 1 && (Math.Abs(x - level.ExitPoint.X) > 1
                        || Math.Abs(y - level.ExitPoint.Y) > 1 || z1 != level.ExitPoint.Z))
                    {
                        model.Vertices.Add(Transform(new Vec3(x, z1, y)));
                        model.Vertices.Add(Transform(new Vec3(x1, z1, y)));
                        model.Vertices.Add(Transform(new Vec3(x, z1, y1)));
                        model.Vertices.Add(Transform(new Vec3(x, z1, y1)));
                        model.Vertices.Add(Transform(new Vec3(x1, z1, y)));
                        model.Vertices.Add(Transform(new Vec3(x1, z1, y1)));
                        model.Normals.AddRange(YNormals);
                        float texX = ((x + y) & 1) == 0 ? 0.51F : 0.76F, texX1 = texX + 0.23F;
                        model.TexCoords.Add(new Vec2(texX, texY));
                        model.TexCoords.Add(new Vec2(texX1, texY));
                        model.TexCoords.Add(new Vec2(texX, texY1));
                        model.TexCoords.Add(new Vec2(texX, texY1));
                        model.TexCoords.Add(new Vec2(texX1, texY));
                        model.TexCoords.Add(new Vec2(texX1, texY1));
                    }
                    if (info.Height <= 0) continue;
                    var zB = z1 - info.Height;
                    texY1 -= 0.25F * (1 - info.Height);
                    if (GetInformation(x1, y, z).Height < info.Height)
                    {
                        model.Vertices.Add(Transform(new Vec3(x1, zB, y)));
                        model.Vertices.Add(Transform(new Vec3(x1, zB, y1)));
                        model.Vertices.Add(Transform(new Vec3(x1, z1, y)));
                        model.Vertices.Add(Transform(new Vec3(x1, zB, y1)));
                        model.Vertices.Add(Transform(new Vec3(x1, z1, y1)));
                        model.Vertices.Add(Transform(new Vec3(x1, z1, y)));
                        model.Normals.AddRange(XNormals);
                        model.TexCoords.Add(new Vec2(0.49F, texY1));
                        model.TexCoords.Add(new Vec2(0.26F, texY1));
                        model.TexCoords.Add(new Vec2(0.49F, texY));
                        model.TexCoords.Add(new Vec2(0.26F, texY1));
                        model.TexCoords.Add(new Vec2(0.26F, texY));
                        model.TexCoords.Add(new Vec2(0.49F, texY));
                    }
                    if (GetInformation(x, y1, z).Height < info.Height)
                    {
                        model.Vertices.Add(Transform(new Vec3(x, zB, y1)));
                        model.Vertices.Add(Transform(new Vec3(x, z1, y1)));
                        model.Vertices.Add(Transform(new Vec3(x1, zB, y1)));
                        model.Vertices.Add(Transform(new Vec3(x, z1, y1)));
                        model.Vertices.Add(Transform(new Vec3(x1, z1, y1)));
                        model.Vertices.Add(Transform(new Vec3(x1, zB, y1)));
                        model.Normals.AddRange(ZNormals);
                        model.TexCoords.Add(new Vec2(0.01F, texY1));
                        model.TexCoords.Add(new Vec2(0.01F, texY));
                        model.TexCoords.Add(new Vec2(0.24F, texY1));
                        model.TexCoords.Add(new Vec2(0.01F, texY));
                        model.TexCoords.Add(new Vec2(0.24F, texY));
                        model.TexCoords.Add(new Vec2(0.24F, texY1));
                    }
                }
            string fileName = Path.GetFileNameWithoutExtension(path) + ".rmdl", result;
            models = models.Where(model => model != null).ToArray();
            new ESO
            {
                AssetHeader = new AssetHeader(AssetUtil.EngineVersion.Version1804Edge, fileName, "models"),
                Models = models, Header = new ESOHeader
                {
                    V01 = 1, V02 = 4096, V20 = 1, NumModels = models.Length, ScaleXYZ = 1,
                    Scale = new Vec3(0.1F, 0.1F, 0.1F), Translate = Translates[themes[0]],
                    NodeChild = AssetHash.Parse(ChildModels[themes[0]] + ModelsNamespace),
                    BoundingMin = Transform(new Vec3()), 
                    BoundingMax = Transform(new Vec3(level.Size.Width, level.Size.Height, level.Size.Length))
                }
            }.Save(result = Path.Combine(Path.GetDirectoryName(path),
                                         AssetUtil.CrcFullName(fileName, "models") + ".eso"));
            return result;
        }
    }
}
