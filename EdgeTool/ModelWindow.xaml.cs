using System;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using LibTwoTribes;
using LibTwoTribes.Util;
using Mygod.Windows.Dialogs;
using _3DTools;

namespace Mygod.Edge.Tool
{
    public sealed partial class ModelWindow
    {
        public ModelWindow()
        {
            InitializeComponent();
        }

        public void Draw(string path, bool debug = false, Matrix3D? parentMatrix = null)
        {
            var eso = ESO.FromFile(path);
            var matrix = GetMatrix(eso);
            if (parentMatrix.HasValue) matrix *= parentMatrix.Value;
            foreach (var model in eso.Models)
            {
                BitmapImage image;
                var material = new DiffuseMaterial(Brushes.White);
                var geom = new MeshGeometry3D
                {
                    Positions = new Point3DCollection(model.Vertices.Select(AssetHelper.ConvertVertex)),
                    Normals = new Vector3DCollection(model.Normals.Select(ConvertNormal))
                };
                var ema = EMA.FromFile(Path.Combine(MainWindow.Edge.ModelsDirectory, model.MaterialAsset.ToString() + ".ema"));
                if (ema.Textures.Length > 0 && model.TypeFlags.HasFlag(ESOModel.Flags.TexCoords))
                {
                    geom.TextureCoordinates = new PointCollection(model.TexCoords.Select(ConvertTexCoord));
                    var etx = ETX.FromFile(Path.Combine(MainWindow.Edge.TexturesDirectory, ema.Textures[0].Asset.ToString() + ".etx"));
                    image = etx.GetBitmap().GetBitmapImage();
                    Viewport2DVisual3D.SetIsVisualHostMaterial(material, true);
                }
                else image = new BitmapImage();
                if (model.TypeFlags.HasFlag(ESOModel.Flags.Colors)) TaskDialog.Show(this, "对不起，EdgeTool 无法完全支持此模型。",
                    "EdgeTool 当前暂时不支持 Models/Model/Triangle/Vertex/@Color 属性，模型将使用白色渲染。", TaskDialogType.Warning);
                for (var i = model.Vertices.Length - 1; i >= 0; i--) geom.TriangleIndices.Add(i);
                var transform = new MatrixTransform3D(matrix);
                Model.Children.Add(new Viewport2DVisual3D
                    { Geometry = geom, Material = material, Visual = new Image { Source = image }, Transform = transform });
                if (!debug) continue;
                var lines = new ScreenSpaceLines3D { Color = Colors.Red, Transform = transform };
                Model.Children.Add(lines);
                var k = 0;
                while (k < model.Vertices.Length)
                {
                    lines.Points.Add(AssetHelper.ConvertVertex(model.Vertices[k]));
                    lines.Points.Add(AssetHelper.ConvertVertex(model.Vertices[k + 1]));
                    lines.Points.Add(AssetHelper.ConvertVertex(model.Vertices[k + 1]));
                    lines.Points.Add(AssetHelper.ConvertVertex(model.Vertices[k + 2]));
                    lines.Points.Add(AssetHelper.ConvertVertex(model.Vertices[k + 2]));
                    lines.Points.Add(AssetHelper.ConvertVertex(model.Vertices[k]));
                    k += 3;
                }
            }
            if (!eso.Header.NodeChild.IsZero())
                Draw(Path.Combine(Path.GetDirectoryName(path), eso.Header.NodeChild.ToString() + ".eso"), debug, matrix);
            if (!eso.Header.NodeSibling.IsZero())
                Draw(Path.Combine(Path.GetDirectoryName(path), eso.Header.NodeSibling.ToString() + ".eso"), debug, parentMatrix);
        }

        private static Matrix3D GetMatrix(ESO eso)
        {
            var matrix = new Matrix3D();
            matrix.Scale(new Vector3D(eso.Header.Scale.X, eso.Header.Scale.Y, eso.Header.Scale.Z));
            matrix.Scale(new Vector3D(eso.Header.ScaleXYZ, eso.Header.ScaleXYZ, eso.Header.ScaleXYZ));
            matrix.Rotate(new Quaternion(new Vector3D(1, 0, 0), eso.Header.Rotate.X * AssetHelper.ToDegree));
            matrix.Rotate(new Quaternion(new Vector3D(0, 1, 0), eso.Header.Rotate.Y * AssetHelper.ToDegree));
            matrix.Rotate(new Quaternion(new Vector3D(0, 0, 1), eso.Header.Rotate.Z * AssetHelper.ToDegree));
            matrix.Translate(new Vector3D(eso.Header.Translate.X, eso.Header.Translate.Y, eso.Header.Translate.Z));
            return matrix;
        }

        public void ApplyAnimation(string path, bool loop = true)
        {
            var ean = EAN.FromFile(path);
            var transforms = new Transform3DGroup();
            AxisAngleRotation3D x, y, z;
            transforms.Children.Add(new ScaleTransform3D(ean.BlockScaleX.DefaultValue, ean.BlockScaleY.DefaultValue,
                                                         ean.BlockScaleZ.DefaultValue));
            transforms.Children.Add(new RotateTransform3D(z = new AxisAngleRotation3D(new Vector3D(0, 0, 1),
                                                                                      ean.BlockRotateZ.DefaultValue * ToDegree)));
            transforms.Children.Add(new RotateTransform3D(y = new AxisAngleRotation3D(new Vector3D(0, 1, 0),
                                                                                      ean.BlockRotateY.DefaultValue * ToDegree)));
            transforms.Children.Add(new RotateTransform3D(x = new AxisAngleRotation3D(new Vector3D(1, 0, 0),
                                                                                      ean.BlockRotateX.DefaultValue * ToDegree)));
            transforms.Children.Add(new TranslateTransform3D(ean.BlockTranslateX.DefaultValue, ean.BlockTranslateY.DefaultValue,
                                                             ean.BlockTranslateZ.DefaultValue));
            foreach (var child in Model.Children) child.Transform = transforms;
            var repeatBehavior = loop ? RepeatBehavior.Forever : new RepeatBehavior(1);
            transforms.Children[0].BeginAnimation(ScaleTransform3D.ScaleZProperty,
                                                  GetAnimation(repeatBehavior, ean.Header.Duration, ean.BlockScaleZ));
            transforms.Children[0].BeginAnimation(ScaleTransform3D.ScaleYProperty,
                                                  GetAnimation(repeatBehavior, ean.Header.Duration, ean.BlockScaleY));
            transforms.Children[0].BeginAnimation(ScaleTransform3D.ScaleXProperty,
                                                  GetAnimation(repeatBehavior, ean.Header.Duration, ean.BlockScaleX));
            z.BeginAnimation(AxisAngleRotation3D.AngleProperty,
                             GetAnimation(repeatBehavior, ean.Header.Duration, ean.BlockRotateZ, ToDegree));
            y.BeginAnimation(AxisAngleRotation3D.AngleProperty,
                             GetAnimation(repeatBehavior, ean.Header.Duration, ean.BlockRotateY, ToDegree));
            x.BeginAnimation(AxisAngleRotation3D.AngleProperty,
                             GetAnimation(repeatBehavior, ean.Header.Duration, ean.BlockRotateX, ToDegree));
            transforms.Children[4].BeginAnimation(TranslateTransform3D.OffsetZProperty,
                                                  GetAnimation(repeatBehavior, ean.Header.Duration, ean.BlockTranslateZ));
            transforms.Children[4].BeginAnimation(TranslateTransform3D.OffsetYProperty,
                                                  GetAnimation(repeatBehavior, ean.Header.Duration, ean.BlockTranslateY));
            transforms.Children[4].BeginAnimation(TranslateTransform3D.OffsetXProperty,
                                                  GetAnimation(repeatBehavior, ean.Header.Duration, ean.BlockTranslateX));
        }

        private static DoubleAnimationUsingKeyFrames GetAnimation(RepeatBehavior repeatBehavior, float duration, KeyframeBlock block,
                                                                  double k = 1)
        {
            var animation = new DoubleAnimationUsingKeyFrames
                { RepeatBehavior = repeatBehavior, Duration = new Duration(TimeSpan.FromSeconds(duration / 30.0)) };
            animation.KeyFrames.Add(new DiscreteDoubleKeyFrame(block.DefaultValue * k, TimeSpan.Zero));
            foreach (var keyframe in block.Keyframes)
                animation.KeyFrames.Add(new LinearDoubleKeyFrame(keyframe.Value * k, TimeSpan.FromSeconds(keyframe.Time / 30.0)));
            return animation;
        }

        private const double ToDegree = 180 / Math.PI;

        private static Vector3D ConvertNormal(Vec3 vec)
        {
            return new Vector3D(vec.X, vec.Y, vec.Z);
        }
        private static Point ConvertTexCoord(Vec2 vec)
        {
            return new Point(Math.Abs(vec.X - 1) > 1e-4 ? (vec.X % 1 + 1) % 1 : 1, Math.Abs(vec.Y - 1) > 1e-4 ? (vec.Y % 1 + 1) % 1 : 1);
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
