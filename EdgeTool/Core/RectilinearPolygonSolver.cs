using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;

namespace Mygod.Edge.Tool
{
    public static class RectilinearPolygonSolver
    {
        private static Color[] colors;
        private static bool[,] covered;
        private static Size2D size;
        private static List<Rect8> current, best;

        public static IEnumerable<Rect8> Solve(string path, ref byte width)
        {
            if (!File.Exists(path)) return null;
            colors = ImageConverter.Load(path, out size);
            covered = new bool[width = (byte) size.Width, size.Length];
            current = new List<Rect8>();
            best = null;
            Dfs(0, 0);
            current = null;
            return best;
        }

        private static bool NeedFilling(int x, int y)
        {
            return y < size.Length && !covered[x, y] && colors[y * size.Width + x].A > 0;
        }

        private static int Rightest(int x, int y)
        {
            while (x < size.Width && NeedFilling(x, y)) ++x;
            return x;
        }

        private static void Cover(int x1, int x2, int y)
        {
            while (x1 < x2) covered[x1++, y] = true;
        }

        private static void Dfs(int x1, int y1)
        {
            if (best != null && current.Count() >= best.Count()) return;
            while (y1 < size.Length)
            {
                while (x1 < size.Width) if (NeedFilling(x1, y1)) goto search; else ++x1;
                ++y1;
                x1 = 0;
            }
            best = current;
            current = best.ToList();
            return;
        search:
            var rightest = Rightest(x1, y1);
            Cover(x1, rightest, y1);
            for (var y2 = y1 + 1; rightest > x1 && y2 <= size.Length; ++y2)
            {
                var x2 = Rightest(x1, y2);
                if (x2 >= rightest) Cover(x1, rightest, y2);
                else
                {
                    current.Add(new Rect8(x1, y1, rightest - x1, y2 - y1));
                    Dfs(x1 + 1, y1);
                    current.RemoveAt(current.Count - 1);
                    do
                    {
                        --rightest;
                        for (var y = y1; y < y2; ++y) covered[rightest, y] = false;
                    } while (x2 < rightest);
                }
            }
        }
    }
}
