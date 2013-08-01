using System;
using System.Collections.Generic;
using System.IO;
using System.Windows;
using System.Windows.Controls.Primitives;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using Microsoft.Win32;

namespace Mygod.Edge.Tool
{
    public sealed partial class MinimapWindow
    {
        public MinimapWindow(Level level)
        {
            InitializeComponent();
            Title = "小地图 - " + (this.level = level).Name;
            initialized = true;
            Redraw();
        }

        private readonly bool initialized;

        private void Redraw(object sender = null, EventArgs e = null)
        {
            if (!initialized) return;
            var array = new byte[level.Size.Length * level.Size.Width << 2];
            var pos = 0;
            for (var y = 0; y < level.Size.Length; y++) for (var x = 0; x < level.Size.Width; x++)
            {
                var z = level.Size.Height - 1;
                while (z >= 0)
                {
                    if (level.CollisionMap[x, y, z]) break;
                    z--;
                }
                array[pos] = array[pos + 1] = array[pos + 2] = (byte)(255.0 * (z + 1) / (level.Size.Height + 1));
                array[pos + 3] = 255;
                pos += 4;
            }
            foreach (var resizer in level.Resizers)
                SetColor(array, resizer.Position, resizer.Direction == ResizeDirection.Grow ? ResizerGrow : ResizerShrink);
            foreach (var bumper in level.Bumpers) SetColor(array, bumper.Position, Bumper);
            foreach (var platform in level.FallingPlatforms) SetColor(array, platform.Position, FallingPlatform);
            foreach (var prism in level.Prisms) SetColor(array, prism.Position, Prism);
            SetColor(array, level.SpawnPoint, SpawnPoint);
            SetColor(array, level.ExitPoint, ExitPoint);
            Picture.Source = BitmapSource.Create(level.Size.Width, level.Size.Length, 96, 96,
                                                 PixelFormats.Bgra32, null, array, level.Size.Width << 2);
        }

        private void SetColor(IList<byte> array, Point3D16 point, ToggleButton box)
        {
            if (box.IsChecked != true || !level.Size.IsBlockInArea(point.X, point.Y, 0)) return;
            var color = ((SolidColorBrush) box.Foreground).Color;
            var pos = (point.Y * level.Size.Width + point.X) << 2;
            array[pos++] = color.B;
            array[pos++] = color.G;
            array[pos++] = color.R;
            array[pos] = 255;
        }

        private readonly Level level;

        private readonly SaveFileDialog fileSaver = new SaveFileDialog {Title = "保存小地图", Filter = "PNG 文件 (*.png)|*.png"};

        private void Save(object sender, RoutedEventArgs e)
        {
            fileSaver.FileName = Path.GetFileNameWithoutExtension(level.FilePath) + ".png";
            if (fileSaver.ShowDialog() != true) return;
            var encoder = new PngBitmapEncoder();
            encoder.Frames.Add(BitmapFrame.Create((BitmapSource)Picture.Source));
            using (var stream = new FileStream(fileSaver.FileName, FileMode.Create, FileAccess.Write, FileShare.Read))
                encoder.Save(stream);
        }
    }
}
