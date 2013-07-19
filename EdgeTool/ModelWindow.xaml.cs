using System;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using LibTwoTribes;
using LibTwoTribes.Util;
using Mygod.Windows.Dialogs;
using _3DTools;

namespace Mygod.Edge.Tool
{
    public partial class ModelWindow
    {
        public ModelWindow()
        {
            InitializeComponent();
        }

        public void Draw(string path, bool debug = false)
        {
            var eso = ESO.FromFile(path);
            foreach (var model in eso.Models)
            {
                BitmapImage image;
                var material = new DiffuseMaterial(Brushes.White);
                var geom = new MeshGeometry3D
                {
                    Positions = new Point3DCollection(model.Vertices.Select(vec => ConvertVertex(eso, vec))),
                    Normals = new Vector3DCollection(model.Normals.Select(vec => ConvertNormal(eso, vec)))
                };
                var ema = EMA.FromFile(Path.Combine(MainWindow.Edge.ModelsDirectory, model.MaterialAsset.ToString() + ".ema"));
                if (ema.Textures.Length > 0 && model.TypeFlags.HasFlag(ESOModel.Flags.TexCoords))
                {
                    geom.TextureCoordinates = new PointCollection(model.TexCoords.Select(ConvertTexCoord));
                    var etx = ETX.FromFile(Path.Combine(MainWindow.Edge.TexturesDirectory, ema.Textures[0].Asset.ToString() + ".etx"));
                    image = etx.GetBitmap().GetBitmapImage();
                    Viewport2DVisual3D.SetIsVisualHostMaterial(material, true);
                }
                else
                {
                    TaskDialog.Show(this, "对不起，EdgeTool 无法完全支持此模型。",
                                    "EdgeTool 当前暂时不支持 Models/Model/Triangle/Vertex/@Color 等属性，模型将使用白色渲染。",
                                    TaskDialogType.Warning);
                    image = new BitmapImage();
                }
                for (var i = model.Vertices.Length - 1; i >= 0; i--) geom.TriangleIndices.Add(i);
                Model.Children.Add(new Viewport2DVisual3D { Geometry = geom, Material = material, Visual = new Image { Source = image } });
                if (!debug) continue;
                var lines = new ScreenSpaceLines3D { Color = Colors.Red };
                Model.Children.Add(lines);
                var k = 0;
                while (k < model.Vertices.Length)
                {
                    lines.Points.Add(ConvertVertex(eso, model.Vertices[k]));
                    lines.Points.Add(ConvertVertex(eso, model.Vertices[k + 1]));
                    lines.Points.Add(ConvertVertex(eso, model.Vertices[k + 1]));
                    lines.Points.Add(ConvertVertex(eso, model.Vertices[k + 2]));
                    lines.Points.Add(ConvertVertex(eso, model.Vertices[k + 2]));
                    lines.Points.Add(ConvertVertex(eso, model.Vertices[k]));
                    k += 3;
                }
            }
        }

        private static Point3D ConvertVertex(ESO eso, Vec3 vec)
        {
            var matrix = new Matrix3D();
            matrix.Scale(new Vector3D(eso.Header.Scale.X, eso.Header.Scale.Y, eso.Header.Scale.Z));
            matrix.Scale(new Vector3D(eso.Header.ScaleXYZ, eso.Header.ScaleXYZ, eso.Header.ScaleXYZ));
            matrix.Translate(new Vector3D(eso.Header.Translate.X, eso.Header.Translate.Y, eso.Header.Translate.Z));
            matrix.Rotate(new Quaternion(new Vector3D(1, 0, 0), eso.Header.Rotate.X * AssetHelper.ToDegree));
            matrix.Rotate(new Quaternion(new Vector3D(0, 1, 0), eso.Header.Rotate.Y * AssetHelper.ToDegree));
            matrix.Rotate(new Quaternion(new Vector3D(0, 0, 1), eso.Header.Rotate.Z * AssetHelper.ToDegree));
            return matrix.Transform(new Point3D(vec.X, vec.Y, vec.Z));
        }
        private static Vector3D ConvertNormal(ESO eso, Vec3 vec)
        {
            var matrix = new Matrix3D();
            matrix.Rotate(new Quaternion(new Vector3D(1, 0, 0), eso.Header.Rotate.X * AssetHelper.ToDegree));
            matrix.Rotate(new Quaternion(new Vector3D(0, 1, 0), eso.Header.Rotate.Y * AssetHelper.ToDegree));
            matrix.Rotate(new Quaternion(new Vector3D(0, 0, 1), eso.Header.Rotate.Z * AssetHelper.ToDegree));
            return matrix.Transform(new Vector3D(vec.X, vec.Y, vec.Z));
        }
        private static Point ConvertTexCoord(Vec2 vec)
        {
            return new Point((vec.X % 1 + 1) % 1, (vec.Y % 1 + 1) % 1);
        }

        private bool dragging;
        private Point mouseDown;
        private Point3D mouseDownPosition;

        private void StartDragging(object sender, MouseButtonEventArgs e)
        {
            Grid.CaptureMouse();
            dragging = true;
            mouseDown = e.GetPosition(Grid);
            mouseDownPosition = Camera.Position;
        }

        private void Dragging(object sender, MouseEventArgs e)
        {
            if (!dragging) return;
            var position = e.GetPosition(Grid);
            double deltaX = mouseDown.X - position.X, deltaY = mouseDown.Y - position.Y;
            if (e.LeftButton == MouseButtonState.Pressed)
                Camera.Position = new Point3D(mouseDownPosition.X + (deltaX + deltaY) * Camera.FieldOfView / 450, mouseDownPosition.Y,
                                              mouseDownPosition.Z + (deltaY - deltaX) * Camera.FieldOfView / 450);
            else if (e.RightButton == MouseButtonState.Pressed) Camera.Position =
                new Point3D(mouseDownPosition.X, mouseDownPosition.Y - deltaY * Camera.FieldOfView / 450, mouseDownPosition.Z);
        }

        private void StopDragging(object sender, MouseButtonEventArgs e)
        {
            Grid.ReleaseMouseCapture();
            Dragging(sender, e);
            dragging = false;
        }

        private void Zoom(object sender, MouseWheelEventArgs e)
        {
            Camera.FieldOfView -= (double) e.Delta / Mouse.MouseWheelDeltaForOneLine;
        }

        private void ModelWindowClosed(object sender, EventArgs e)
        {
            MainWindow.ModelWindow = null;
        }
    }
}
