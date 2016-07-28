using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using Mygod.Edge.Tool.LibTwoTribes;
using Mygod.Edge.Tool.LibTwoTribes.Util;
using Mygod.Windows;
using Mygod.Xml.Linq;
using XACT.Interop;

namespace Mygod.Edge.Tool
{
    public struct FileEntry
    {
        public FileEntry(string fileName, string type)
        {
            FileName = fileName;
            Type = type;
        }

        public readonly string FileName, Type;
    }

    public static class Compiler
    {
        public static Tuple<Exception, string, List<FileEntry>> Compile(bool exFormat, string file,
            string directory = null)
        {
            var list = new List<FileEntry>();
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
                                File.WriteAllText(outputPath += ".txt",
                                    string.Join(Environment.NewLine, array.Select(value => value / 256.0)));
                                list.Add(new FileEntry(outputPath, "cos.txt"));
                                break;
                            case "font":
                                DecompileFont(file, ref outputPath);
                                list.Add(new FileEntry(outputPath, "font.xml"));
                                break;
                            default:
                            {
                                var index = 0;
                                foreach (var path in Level.CreateFromCompiled(file).Decompile(outputPath))
                                {
                                    list.Add(new FileEntry(path, index == 0 ? "level.xml"
                                        : index == 1 ? "level.png" : "level.z.png"));
                                    index++;
                                }
                                break;
                            }
                        }
                        break;
                    case ".xml":
                        var root = XHelper.Load(file).Elements().First();
                        switch (root.Name.LocalName.ToLowerInvariant())
                        {
                            case "level":
                            {
                                var index = 0;
                                foreach (var path in Level.CreateFromDecompiled(inputPath)
                                    .Compile(outputPath + ".bin"))
                                {
                                    list.Add(new FileEntry(path, index == 0 ? "level.bin" : "model.eso"));
                                    index++;
                                }
                                break;
                            }
                            case "animation":
                                AssetHelper.ParseEan(root, fileName).Save(outputPath = Path.Combine(directory,
                                    AssetUtil.CrcFullName(fileName, "models") + ".ean"));
                                list.Add(new FileEntry(outputPath, "animation.ean"));
                                break;
                            case "material":
                            {
                                string name;
                                Helper.AnalyzeFileName(out name, out outputPath, fileName);
                                var ema = AssetHelper.ParseEma(root, name);
                                ema.Save(Path.Combine(directory, outputPath += ".ema"));
                                list.Add(new FileEntry(outputPath, "material.ema"));
                                break;
                            }
                            case "models":
                            {
                                string name;
                                Helper.AnalyzeFileName(out name, out outputPath, fileName);
                                var eso = AssetHelper.ParseEso(root, name);
                                eso.Save(Path.Combine(directory, outputPath += ".eso"));
                                list.Add(new FileEntry(outputPath, "model.eso"));
                                break;
                            }
                            case "font":
                            {
                                CompileFont(inputPath, out outputPath, root);
                                list.Add(new FileEntry(outputPath, "font.bin"));
                                break;
                            }
                        }
                        break;
                    case ".loc":
                        LOC.FromFile(file).SaveXls(outputPath += ".xls");
                        list.Add(new FileEntry(outputPath, "text.xls"));
                        break;
                    case ".xls":
                        LocHelper.FromXls(file).Save(outputPath += ".loc");
                        list.Add(new FileEntry(outputPath, "text.loc"));
                        break;
                    case ".etx":
                        var etx = ETX.FromFile(file);
                        etx.GetBitmap().Save(outputPath = Path.Combine(directory, etx.AssetHeader.Name + ".png"));
                        list.Add(new FileEntry(outputPath, "texture.png"));
                        break;
                    case ".png":
                    {
                        var name = AssetUtil.CrcFullName(fileName, "textures") + ".etx";
                        (exFormat ? (ETX)ETX1804.CreateFromImage(file) : ETX1803.CreateFromImage(file))
                            .Save(outputPath = Path.Combine(directory, name));
                        list.Add(new FileEntry(outputPath, "texture.etx"));
                        break;
                    }
                    case ".ean":
                        var ean = EAN.FromFile(file);
                        File.WriteAllText(outputPath = Path.Combine(directory,
                            Helper.GetDecompiledFileName(fileName, ean) + ".xml"),
                            AssetHelper.GetEanElement(ean).ToString());
                        list.Add(new FileEntry(outputPath, "animation.xml"));
                        break;
                    case ".ema":
                    {
                        var ema = EMA.FromFile(file);
                        File.WriteAllText(outputPath = Path.Combine(directory,
                            Helper.GetDecompiledFileName(fileName, ema) + ".xml"),
                            AssetHelper.GetEmaElement(ema).ToString());
                        list.Add(new FileEntry(outputPath, "material.xml"));
                        break;
                    }
                    case ".eso":
                    {
                        var eso = ESO.FromFile(file);
                        File.WriteAllText(outputPath = Path.Combine(directory,
                            Helper.GetDecompiledFileName(fileName, eso) + ".xml"),
                            AssetHelper.GetEsoElement(eso).ToString());
                        list.Add(new FileEntry(outputPath, "model.xml"));
                        break;
                    }
                    case ".txt":
                        using (var stream = new FileStream(outputPath += ".bin", FileMode.Create,
                            FileAccess.Write, FileShare.Read))
                        {
                            var writer = new BinaryWriter(stream);
                            foreach (var num in File.ReadAllText(file)
                                .Split(new[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries)
                                .Select(double.Parse)) writer.Write((short) Math.Round(num * 256));
                        }
                        list.Add(new FileEntry(outputPath, "cos.bin"));
                        break;
                    default:
                        switch (Path.GetFileName(file))
                        {
                            case "audio":
                                if (Directory.Exists(outputPath = Path.Combine(directory, "sfx")))
                                    Directory.Delete(outputPath, true);
                                Directory.CreateDirectory(outputPath);
                                string xsb = Path.Combine(file, "sfx.xsb"), xwb = Path.Combine(file, "sfx.xwb");
                                int offset;
                                using (var stream = new FileStream(xsb, FileMode.Open))
                                {
                                    stream.Position = 0x2A;
                                    using (var reader = new BinaryReader(stream)) offset = reader.ReadInt32();
                                }
                                var unxwb = new Process { StartInfo = new ProcessStartInfo(
                                    Path.Combine(CurrentApp.Directory, "Resources/Libraries/unxwb.exe"),
                                    FormattableString.Invariant($"-d \"{outputPath}\" -b \"{xsb}\" {offset} \"{xwb}\""))
                                { UseShellExecute = false, CreateNoWindow = true } };
                                unxwb.Start();
                                unxwb.WaitForExit();
                                list.Add(new FileEntry(outputPath, "sfx"));
                                break;
                            case "sfx":
                                Directory.CreateDirectory(outputPath = Path.Combine(directory, "audio"));
                                string tempPath = Helper.GetRandomDirectory(),
                                    tempInputPath = Path.Combine(tempPath, "sfx"),
                                    tempOutputPath = Path.Combine(tempPath, "audio");
                                /************************************************************************************
                                 *     create temp input dir because it's still occupied for unknown reason;        *
                                 *     create temp output dir because COMException will be thrown if output dir and *
                                 * temp input dir is not under the same drive.                                      *
                                 ************************************************************************************/
                                Directory.CreateDirectory(tempInputPath);
                                var projectPath = GenerateXactProject(file, tempInputPath);
                                using (var project = new CXACTMasterProject())
                                {
                                    project.Create();
                                    project.Load(projectPath, new CXACTMasterProjectCallback(), 0);
                                    project.Build(new CXACTMasterProjectCallback(), tempOutputPath, false, false);
                                }
                                foreach (var path in Directory.EnumerateFiles(tempOutputPath))
                                {
                                    var target = Path.Combine(outputPath, Path.GetFileName(path));
                                    File.Delete(target);
                                    File.Move(path, target);
                                }
                                try
                                {
                                    Directory.Delete(tempPath, true);
                                }
                                catch
                                {
                                    Trace.WriteLine(tempPath, "Delete tempPath failed");
                                }
                                list.Add(new FileEntry(outputPath, "audio"));
                                break;
                            default:
                                throw new NotSupportedException(Localization.DecompileUnrecognizedFile);
                        }
                        break;
                }
                return new Tuple<Exception, string, List<FileEntry>>(null, Warning.Fetch(), list);
            }
            catch (Exception exc)
            {
                return new Tuple<Exception, string, List<FileEntry>>(exc, Warning.Fetch(), list);
            }
            finally
            {
                Warning.Clear();
            }
        }
        
        private static readonly string
            CharLookup = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789%１２３４５６７８９,.？!：'()_" +
                         "-=+@／＂çβāäēëīíōöūü＞＜[]ñ¡À$ÉȇÜ｜şğÇĕčřýňšžŮďĎŐȁÚâćęźɫąśńżŚ",
            DuplicateChars = "abcdefghijklmnopqrstuvwxyzÜÇĎŚ";  // fix for stupid windows FS
        private static readonly HashSet<char> CharSet = new HashSet<char>(CharLookup),
            DuplicateCharSet = new HashSet<char>(DuplicateChars);
        private static string GetCharPath(string prefix, char ch)
        {
            return prefix + '.' + ch + (DuplicateCharSet.Contains(ch) ? "_" : string.Empty) + ".png";
        }

        private static void DecompileFont(string file, ref string outputPath)
        {
            var result = new XElement("Font");
            using (var stream = File.OpenRead(file))
            using (var reader = new BinaryReader(stream))
            {
                result.SetAttributeValueWithDefault("SpaceWidth", reader.ReadByte(), 9);
                var line = reader.ReadByte();
                result.SetAttributeValueWithDefault("LineSpacing", line, 9);
                var count = reader.ReadUInt16();
                for (var i = 0; i < count; i++)
                {
                    var ch = i < CharLookup.Length ? CharLookup[i] : '\0';
                    var rects = new Rect8[reader.ReadByte()];
                    byte specifiedWidth = reader.ReadByte(), width = 0, height = line;
                    for (var j = 0; j < rects.Length; j++)
                    {
                        var rect = rects[j] = new Rect8(reader);
                        if (rect.Size.X == 0 || rect.Size.Y == 0) continue;
                        var t = (byte) (rect.Point.X + rect.Size.X);
                        if (t > width) width = t;
                        if ((t = (byte) (rect.Point.Y + rect.Size.Y)) > height) height = t;
                    }
                    if (width > 0)
                    {
                        if (width < specifiedWidth) width = specifiedWidth;
                        using (var bitmap = new Bitmap(width, height))
                        {
                            using (var graphics = Graphics.FromImage(bitmap)) foreach (var rect in rects) graphics
                                .FillRectangle(Brushes.Black, rect.Point.X, rect.Point.Y, rect.Size.X, rect.Size.Y);
                            bitmap.Save(GetCharPath(outputPath, ch));
                        }
                    }
                    if (width == specifiedWidth) continue;
                    var element = new XElement("Char");
                    element.SetAttributeValueWithDefault("Character", ch);
                    element.SetAttributeValue("Width", specifiedWidth);
                    result.Add(element);
                }
            }
            File.WriteAllText(outputPath += ".xml", result.ToString());
        }

        private static void CompileFont(string filePrefix, out string outputPath, XElement element)
        {
            using (var stream = File.Create(outputPath = filePrefix + ".bin"))
            using (var writer = new BinaryWriter(stream))
            {
                writer.Write(element.GetAttributeValueWithDefault<byte>("SpaceWidth", 9));
                writer.Write(element.GetAttributeValueWithDefault<byte>("LineSpacing", 9));
                var lookup = element.ElementsCaseInsensitive("Char")
                    .ToLookup(e => e.GetAttributeValueWithDefault("Character", "\0")[0]);
                var reserved = lookup.Where(pair => !CharSet.Contains(pair.Key)).ToList();
                writer.Write((ushort) (CharSet.Count + reserved.SelectMany(_ => _).Count()));
                foreach (var ch in CharLookup) CompileChar(writer, filePrefix, ch, lookup[ch].SingleOrDefault());
                foreach (var pair in reserved) foreach (var e in pair)
                    CompileChar(writer, filePrefix, pair.Key, e);   // write unknown chars
            }
        }
        private static void CompileChar(BinaryWriter writer, string filePrefix, char ch, XElement element)
        {
            byte width = 0;
            var rects = (RectilinearPolygonSolver.Solve(GetCharPath(filePrefix, ch), ref width) ??
                         Enumerable.Empty<Rect8>()).ToArray();
            writer.Write((byte)rects.Length);
            writer.Write(element?.GetAttributeValueWithDefault("Width", width) ?? width);
            foreach (var rect in rects) rect.Write(writer);
        }

        #region GenerateXactProject
        private static string GenerateXactProject(string inputPath, string outputPath)
        {
            StringBuilder waves = new StringBuilder(), sounds = new StringBuilder(), cues = new StringBuilder();
            var i = 0;
            foreach (var wavPath in Directory.EnumerateFiles(inputPath, "*.wav"))
            {
                string name = Path.GetFileName(wavPath), id = Path.GetFileNameWithoutExtension(wavPath);
                File.Copy(wavPath, Path.Combine(outputPath, name), true);
                waves.AppendFormat(Wave, id, name);
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