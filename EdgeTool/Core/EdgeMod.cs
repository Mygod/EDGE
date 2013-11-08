﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Xsl;
using LibTwoTribes;
using Mygod.IO;
using Mygod.Xml.Linq;
using SevenZip;

namespace Mygod.Edge.Tool
{
    public sealed class EdgeMod
    {
        public EdgeMod(Edge parent, string path)
        {
            this.parent = parent;
            FilePath = path;
            bool initialized = false, containXml = false, containAudio = false, containSfx = false;
            IEnumerable<MappingLevel> mappings = null;
            var i = 0;
            using (var extractor = new SevenZipExtractor(path))
            {
                FilesCount = extractor.FilesCount;
                foreach (var fileName in extractor.ArchiveFileNames)
                {
                    switch (fileName.ToLowerInvariant())
                    {
                        case "mod.xml":
                            var root = XDocument.Parse(extractor.ExtractString(i)).GetElement("Mod");
                            ID = root.GetAttributeValue("ID").Trim();
                            if (ID.Any(c => !char.IsLetterOrDigit(c) && c != '_' && c != '-' && c != '.'))
                                throw new FormatException("ID 只能包含字母、数字以及“._-”中的符号！");
                            Name = root.GetAttributeValue("Name");
                            Version = Version.Parse(root.GetAttributeValue("Version"));
                            root.GetAttributeValueWithDefault(out Type, "Type");
                            Set(out Conflicts, root.GetAttributeValue("Conflicts"));
                            Set(out Dependency, root.GetAttributeValue("Dependency"));
                            Set(out InstallAfter, root.GetAttributeValue("InstallAfter"));
                            Set(out InstallBefore, root.GetAttributeValue("InstallBefore"));
                            Author = root.GetAttributeValue("Author");
                            var engineVersion = root.GetAttributeValue("EngineVersion");
                            if (!string.IsNullOrWhiteSpace(engineVersion))
                            {
                                var versions = engineVersion.Split(',');
                                switch (versions.Length)
                                {
                                    case 1:
                                        MinEngineVersion = MaxEngineVersion = Version.Parse(engineVersion);
                                        break;
                                    case 2:
                                        if (!string.IsNullOrEmpty(versions[0])) MinEngineVersion = Version.Parse(versions[0]);
                                        if (!string.IsNullOrEmpty(versions[1])) MaxEngineVersion = Version.Parse(versions[1]);
                                        break;
                                }
                            }
                            if (root.HasElements)
                                mappings = root.ElementsCaseInsensitive("level").Select(e => new MappingLevel(LevelType.Extended, 0, e));
                            initialized = true;
                            break;
                        case "description.txt":
                            Description = extractor.ExtractString(i);
                            break;
                        case "levels\\mapping.xml":
                            containXml = true;
                            break;
                        case "levels\\mapping.xsl":
                            Xsl = XslCracked = extractor.ExtractString(i);
                            break;
                        case "audio":
                            containAudio = true;
                            break;
                        case "sfx":
                            containSfx = true;
                            break;
                        case "config\\settings_readme.txt":
                            throw new FormatException("EdgeMod 不允许修改 config\\settings_readme.txt！");
                        case "config\\settings_template_do_not_modify.ini":
                            throw new FormatException("EdgeMod 不允许修改 config\\settings_template_do_not_modify.ini！");
                        default:
                            if (fileName.StartsWith("mods\\", true, CultureInfo.InvariantCulture)
                                || "mods".Equals(fileName, StringComparison.InvariantCultureIgnoreCase))
                                throw new FormatException("EdgeMod 不允许修改 mods 文件夹内的内容！");
                            if (fileName.EndsWith(".bak", true, CultureInfo.InvariantCulture))
                                throw new FormatException("EdgeMod 不允许有以 .bak 为扩展名的文件！");
                            if (fileName.StartsWith("audio\\", true, CultureInfo.InvariantCulture)) containAudio = true;
                            if (fileName.StartsWith("sfx\\", true, CultureInfo.InvariantCulture)) containSfx = true;
                            break;
                    }
                    i++;
                }
            }
            if (!initialized) throw new FormatException("mod.xml 未找到！");
            if (Type != EdgeModType.Game)
            {
                if (containXml)
                    throw new FormatException("不允许非 Game 类型的 EdgeMod 重写 mapping.xml。请改用 mod.xml 或 mapping.xsl。");
                if (containAudio)
                    throw new FormatException("不允许非 Game 类型的 EdgeMod 重写 audio 文件夹以及之下的内容。请改用 sfx 文件夹。");
            }
            if (containAudio && containSfx) throw new FormatException("不允许在写入 audio 文件夹的同时使用 sfx 文件夹！请选择其中一个。");
            if (mappings != null)
            {
                if (Xsl != null) throw new FormatException("不允许同时使用 mapping.xsl 与 mod.xml 对 mapping.xml 进行修改！" +
                                                           "请将 mod.xml 中添加的关卡合并至 mapping.xsl 中！");
                var xslBuilder = new StringBuilder();
                foreach (var item in mappings) xslBuilder.AppendLine("      " + item.GetXElement());
                xslBuilder.AppendLine("    </xsl:element>\r\n  </xsl:template>\r\n</xsl:transform>");
                Xsl = XslHead.Replace("extended", "bonus") + xslBuilder;
                XslCracked = XslHead + xslBuilder;
            }
            if (Xsl != null && containXml) throw new FormatException("不允许在使用 mapping.xml 的情况下再使用 mapping.xsl 和/或 " +
                                                                     "mod.xml 进行修改。请将修改合并到 mapping.xml 中。");
        }

        private static void Set(out HashSet<string> set, string value)
        {
            set = string.IsNullOrWhiteSpace(value) ? new HashSet<string>() : new HashSet<string>(value.Split(','));
        }

        private const string XslHead = "<xsl:transform version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n  <xsl:template match=\"* | comment()\">\r\n    <xsl:copy>\r\n      <xsl:copy-of select=\"@*\" />\r\n      <xsl:apply-templates />\r\n    </xsl:copy>\r\n  </xsl:template>\r\n  <xsl:template match=\"/levels/extended\">\r\n    <xsl:element name=\"{name()}\">\r\n      <xsl:for-each select=\"/levels/extended/@*\">\r\n        <xsl:attribute name=\"{name()}\">\r\n          <xsl:value-of select=\".\" />\r\n        </xsl:attribute>\r\n      </xsl:for-each>\r\n      <xsl:attribute name=\"special_locked_level_count\">0</xsl:attribute>\r\n      <xsl:apply-templates />\r\n";

        private readonly Edge parent;
        public readonly uint FilesCount;
        public readonly string FilePath, ID, Description;
        public readonly Version MinEngineVersion, MaxEngineVersion;
        public readonly EdgeModType Type;
        public readonly HashSet<string> Conflicts, Dependency, InstallAfter, InstallBefore;
        public readonly string Xsl, XslCracked;

        public string Name { get; set; }
        public Version Version { get; set; }
        public string Author { get; set; }
        public bool Enabled { get { return !parent.GetIsDisabled(this); } set { parent.SetIsDisabled(this, !value); } }

        public void Install(HashSet<string> allModifiedFiles, StringBuilder error, Dictionary<string, EdgeMod> conflicts,
                            ProgressCallback callback = null)
        {
            if (MinEngineVersion != null && parent.EngineVersion < MinEngineVersion
                || MaxEngineVersion != null && parent.EngineVersion > MaxEngineVersion)
            {
                error.AppendLine(string.Format("{0} 不支持版本为 {1} 的游戏引擎！该 EdgeMod 将不会被安装。", ID, parent.EngineVersion));
                return;
            }
            if (!Dependency.IsSubsetOf(parent.EdgeMods.Where(edgeMod => edgeMod.Enabled).Select(edgeMod => edgeMod.ID)))
            {
                error.AppendLine(string.Format("{0} 的依赖项没有全部被安装！", ID));
                return;
            }
            if (conflicts.ContainsKey(ID))
            {
                error.AppendLine(string.Format("{0} 与 {1} 冲突！{1} 将不会被安装。", conflicts[ID].ID, ID));
                return;
            }
            conflicts.Add(ID, this);    // self conflict
            foreach (var conflict in Conflicts.Where(conflict => !conflicts.ContainsKey(conflict))) conflicts.Add(conflict, this);
            using (var extractor = new SevenZipExtractor(FilePath))
            {
                try
                {
                    extractor.ExtractFiles(e =>
                    {
                        if (e.Reason == ExtractFileCallbackReason.Start && callback != null)
                            callback(ID + '\\' + e.ArchiveFileInfo.FileName);
                        var path = Path.Combine(parent.GameDirectory, e.ArchiveFileInfo.FileName);
                        try
                        {
                            if (e.ArchiveFileInfo.IsDirectory) return;          // ignore directories
                            var lowered = e.ArchiveFileInfo.FileName.ToLower(); // ignore files that has been processed
                            if (lowered == "mod.xml" || lowered == "description.txt" || lowered == "levels\\mapping.xsl") return;
                            var isSfx = lowered.StartsWith("sfx\\", true, CultureInfo.InvariantCulture);
                            if (isSfx) path = Path.Combine(parent.BeginSfx(), e.ArchiveFileInfo.FileName);
                            Directory.CreateDirectory(Path.GetDirectoryName(path));
                            var fileInfo = new FileInfo(path);
                            switch (e.Reason)
                            {
                                case ExtractFileCallbackReason.Start:
                                    if (isSfx)
                                    {
                                        File.Delete(path);
                                        e.ExtractToFile = path;
                                    }
                                    else
                                    {
                                        if (Type == EdgeModType.Level && fileInfo.Exists
                                        && !allModifiedFiles.Contains(e.ArchiveFileInfo.FileName.ToLower())) throw new IOException(
                                            "不允许 Level 类的 EdgeMod 修改游戏自带的文件！请改用 Theme 或 Game 类。");
                                        if (!fileInfo.Exists || (ulong)fileInfo.Length != e.ArchiveFileInfo.Size
                                            || Math.Abs(fileInfo.LastWriteTime.Ticks - e.ArchiveFileInfo.LastWriteTime.Ticks)
                                            > new TimeSpan(0, 0, 1).Ticks)  // 快速检测
                                        {
                                            parent.CreateCopy(allModifiedFiles, lowered);
                                            File.Delete(path);
                                            e.ExtractToFile = path;
                                        }
                                        parent.ModifiedFiles.Add(lowered);
                                        allModifiedFiles.Add(lowered);
                                    }
                                    break;
                                case ExtractFileCallbackReason.Done:
                                    if (e.ExtractToFile != null)
                                    {
                                        fileInfo.LastWriteTime = e.ArchiveFileInfo.LastWriteTime;
                                        if (!e.ExtractToFile.EndsWith(".etx", StringComparison.Ordinal)) return;
                                        try
                                        {
                                            var etx = ETX.FromFile(e.ExtractToFile);
                                            if (parent.ExFormat && etx is ETX1803)
                                                ETX1804.CreateFromImage(etx.GetBitmap(), etx.AssetHeader).Save(e.ExtractToFile);
                                            else if (!parent.ExFormat && etx is ETX1804)
                                                ETX1803.CreateFromImage(etx.GetBitmap(), etx.AssetHeader).Save(e.ExtractToFile);
                                        }
                                        catch { }
                                    }
                                    break;
                                case ExtractFileCallbackReason.Failure:
                                    throw e.Exception;
                            }
                        }
                        catch (Exception exc)
                        {
                            error.AppendFormat("应用 {0} 的 {1} 时发生了错误：{2}{3}", ID, path, exc.Message, Environment.NewLine);
                        }
                    });
                }
                catch (Exception exc)
                {
                    error.AppendFormat("应用 {0} 时发生了错误：{1}{2}", ID, exc.Message, Environment.NewLine);
                }
            }
            try
            {
                if (Xsl == null) return;
                var mappingPath = Path.Combine(parent.GameDirectory, "levels\\mapping.xml");
                parent.CreateCopy(allModifiedFiles, "levels\\mapping.xml");
                var transform = new XslCompiledTransform(true);
                transform.Load(XmlReader.Create(new StringReader(parent.IsCracked ? XslCracked : Xsl)),
                                                new XsltSettings(true, true), new XmlUrlResolver());
                var writer = new StringWriter();
                transform.Transform(XmlReader.Create(new StringReader(File.ReadAllText(File.Exists(mappingPath) ? mappingPath
                                                                                           : (mappingPath + ".bak")))), null,
                                    XmlWriter.Create(writer, new XmlWriterSettings { Indent = true }), new XmlUrlResolver());
                File.WriteAllText(mappingPath, writer.ToString());
                parent.ModifiedFiles.Add("levels\\mapping.xml");
                allModifiedFiles.Add("levels\\mapping.xml");
            }
            catch (Exception exc)
            {
                error.AppendFormat("更新关卡列表时发生了错误：{0}{1}", exc.Message, Environment.NewLine);
            }
        }
    }

    public enum EdgeModType
    {
        Level, Theme, Game
    }

    public sealed class Edge
    {
        public Edge(string gamePath)
        {
            var versionInfo = FileVersionInfo.GetVersionInfo(GamePath = gamePath);
            EngineVersion = Version.Parse(String.Join(".", new[] { versionInfo.ProductMajorPart, versionInfo.ProductMinorPart, 
                versionInfo.ProductBuildPart, versionInfo.ProductPrivatePart }));
            GameDirectory = Path.GetDirectoryName(GamePath);
            Directory.CreateDirectory(ModsDirectory = Path.Combine(GameDirectory, "mods"));
            AudioDirectory = Path.Combine(GameDirectory, "audio");
            LevelsDirectory = Path.Combine(GameDirectory, "levels");
            ModelsDirectory = Path.Combine(GameDirectory, "models");
            TexturesDirectory = Path.Combine(GameDirectory, "textures");
            disabledEdgeMods = new StringSetFile(Path.Combine(ModsDirectory, "disabledEdgeMods.txt"));
            ModifiedFiles = new StringSetFile(Path.Combine(ModsDirectory, "modifiedFiles.txt"));
            if (IsCracked) SteamOtl = new SteamOtl(Path.Combine(GameDirectory, "steam_otl.ini"));
            RefreshEdgeMods();
            foreach (var file in Directory.EnumerateFiles(TexturesDirectory, "*.etx"))
                try
                {
                    ExFormat = ETX.FromFile(file) is ETX1804;
                    break;
                }
                catch { }
        }

        private static readonly Version CrackedEngineVersion = new Version(1, 0, 2483, 7086);
        public readonly bool ExFormat;

        public readonly string GamePath, GameDirectory, ModsDirectory, 
                               AudioDirectory, LevelsDirectory, ModelsDirectory, TexturesDirectory;
        public readonly ObservableCollection<EdgeMod> EdgeMods = new ObservableCollection<EdgeMod>();
        private readonly StringSetFile disabledEdgeMods;
        public readonly StringSetFile ModifiedFiles;
        public readonly Version EngineVersion;
        public SteamOtl SteamOtl { get; private set; }
        public bool IsCracked { get { return EngineVersion == CrackedEngineVersion; } }
        public EventHandler DisabledEdgeModsChanged;

        public bool GetIsDisabled(EdgeMod edgeMod)
        {
            return disabledEdgeMods.Contains(edgeMod.ID);
        }
        public void SetIsDisabled(EdgeMod edgeMod, bool value)
        {
            if (value ? !disabledEdgeMods.Add(edgeMod.ID) : !disabledEdgeMods.Remove(edgeMod.ID)) return;
            if (DisabledEdgeModsChanged != null) DisabledEdgeModsChanged(this, EventArgs.Empty);
            disabledEdgeMods.Save();
        }

        public string RefreshEdgeMods()
        {
            disabledEdgeMods.Refresh();
            EdgeMods.Clear();
            var errors = new StringBuilder();
            foreach (var edgeMod in Directory.EnumerateFiles(ModsDirectory, "*.edgemod"))
                try
                {
                    EdgeMods.Add(new EdgeMod(this, edgeMod));
                }
                catch (Exception exc)
                {
                    errors.AppendFormat("加载 {0} 失败：{1}{2}", Path.GetFileNameWithoutExtension(edgeMod), exc.Message, Environment.NewLine);
                }
            return errors.ToString();
        }

        private static readonly string[] SpecialFiles = 
            { "audio\\edge.xgs", "audio\\sfx.xsb", "audio\\sfx.xwb", "levels\\mapping.xml" };

        public void CreateCopy(ICollection<string> allModifiedFiles, string relativePath)
        {
            var path = Path.Combine(GameDirectory, relativePath);
            if (!File.Exists(path) || allModifiedFiles.Contains(relativePath)) return;  // does not exists or new file overrided
            var bakPath = path + ".bak";
            if (!File.Exists(bakPath)) File.Move(path, path + ".bak");
        }
        private void RestoreCopy(string filePath)
        {
            string path = Path.Combine(GameDirectory, filePath), bakPath = path + ".bak";
            if (File.Exists(path)) File.Delete(path);
            if (File.Exists(bakPath)) File.Move(bakPath, path);
        }
        public void CleanUp()
        {
            ModifiedFiles.Refresh();
            foreach (var file in ModifiedFiles) RestoreCopy(file);
            ModifiedFiles.Clear();
            ModifiedFiles.Save();
        }
        public string Install(ProgressCallback callback = null, DoWorkEventArgs e = null)
        {
            var allModifiedFiles = new HashSet<string>(ModifiedFiles);
            ModifiedFiles.Clear();
            var error = new StringBuilder();
            var conflicts = new Dictionary<string, EdgeMod>();
            foreach (var file in SpecialFiles.Where(allModifiedFiles.Contains))
            {
                allModifiedFiles.Remove(file);
                RestoreCopy(file);
            }
            var cancelled = false;
            foreach (var group in EdgeMods.Where(edgeMod => edgeMod.Enabled).GroupBy(edgeMod => edgeMod.Type)
                                          .OrderByDescending(group => group.Key).Select(group => group.ToList()))
            {
                var sorter = new TopologicalSorter(group.Count);
                var lookup = new Dictionary<string, int>();
                for (var i = 0; i < group.Count; i++)
                {
                    sorter.AddVertex(i);
                    lookup[group[i].ID] = i;
                }
                for (var i = 0; i < group.Count; i++)
                {
                    foreach (var id in group[i].InstallAfter.Where(lookup.ContainsKey)) sorter.AddEdge(lookup[id], i);
                    foreach (var id in group[i].InstallBefore.Where(lookup.ContainsKey)) sorter.AddEdge(i, lookup[id]);
                }
                var result = sorter.Sort();
                for (var i = 0; i < group.Count; i++)
                {
                    if (e != null && e.Cancel)
                    {
                        cancelled = true;
                        break;
                    }
                    if (result[i] < 0) error.AppendLine(string.Format("{0} 的安装链中含有环！该 EdgeMod 将不会被安装。", group[i].ID));
                    else group[i].Install(allModifiedFiles, error, conflicts, callback);
                }
                if (cancelled) break;
            }
            if (callback != null) callback("即将完成……");
            EndSfx(allModifiedFiles);
            allModifiedFiles.ExceptWith(ModifiedFiles);
            foreach (var oldFile in allModifiedFiles) RestoreCopy(oldFile);
            ModifiedFiles.Save();
            if (callback != null) callback("已完成。");
            return error.ToString();
        }

        private string sfxPath;
        public string BeginSfx()
        {
            if (sfxPath != null) return sfxPath;
            sfxPath = Helper.GetRandomDirectory();
            Compiler.Compile(false, AudioDirectory, sfxPath);
            return sfxPath;
        }
        private void EndSfx(ICollection<string> allModifiedFiles)
        {
            if (sfxPath == null) return;
            for (var i = 0; i < 3; i++)
            {
                CreateCopy(allModifiedFiles, SpecialFiles[i]);
                ModifiedFiles.Add(SpecialFiles[i]);
                allModifiedFiles.Add(SpecialFiles[i]);
            }
            Compiler.Compile(false, Path.Combine(sfxPath, "sfx"), GameDirectory);
            try
            {
                Directory.Delete(sfxPath, true);
            }
            catch   // ignore if failed
            {
            }
            finally
            {
                sfxPath = null;
            }
        }
    }

    public delegate void ProgressCallback(string additionalMessage);

    public sealed class TopologicalSorter
    {
        #region - Private Members -

        private readonly int[] vertices; // list of vertices  
        private readonly int[,] matrix; // adjacency matrix  
        private int numVerts; // current number of vertices  
        private readonly int[] sortedArray;

        #endregion

        #region - CTors -

        public TopologicalSorter(int size)
        {
            vertices = new int[size];
            matrix = new int[size, size];
            numVerts = 0;
            for (var i = 0; i < size; i++) for (var j = 0; j < size; j++) matrix[i, j] = 0;
            sortedArray = new int[size]; // sorted vert labels  
        }

        #endregion

        #region - Public Methods -

        public int AddVertex(int vertex)
        {
            vertices[numVerts++] = vertex;
            return numVerts - 1;
        }

        public void AddEdge(int start, int end)
        {
            matrix[start, end] = 1;
        }

        public int[] Sort() // toplogical sort  
        {
            for (var i = 0; i < numVerts; i++) sortedArray[i] = -1;
            while (numVerts > 0) // while vertices remain,  
            {
                // get a vertex with no successors, or -1  
                var currentVertex = NoSuccessors();
                if (currentVertex == -1) return sortedArray;    // cycle found, -1 returned
                // insert vertex label in sorted array (start at end)  
                sortedArray[numVerts - 1] = vertices[currentVertex];
                DeleteVertex(currentVertex); // delete vertex  
            }

            // vertices all gone; return sortedArray  
            return sortedArray;
        }

        #endregion

        #region - Private Helper Methods -

        // returns vert with no successors (or -1 if no such verts)  
        private int NoSuccessors()
        {
            for (var row = 0; row < numVerts; row++)
            {
                var isEdge = false; // edge from row to column in adjMat  
                for (var col = 0; col < numVerts; col++)
                {
                    if (matrix[row, col] <= 0) continue;
                    isEdge = true;
                    break; // this vertex has a successor try another  
                }
                if (!isEdge) return row;    // if no edges, has no successors  
            }
            return -1; // no  
        }

        private void DeleteVertex(int delVert)
        {
            // if not last vertex, delete from vertexList  
            if (delVert != numVerts - 1)
            {
                for (var j = delVert; j < numVerts - 1; j++) vertices[j] = vertices[j + 1];
                for (var row = delVert; row < numVerts - 1; row++) MoveRowUp(row, numVerts);
                for (var col = delVert; col < numVerts - 1; col++) MoveColLeft(col, numVerts - 1);
            }
            numVerts--; // one less vertex  
        }

        private void MoveRowUp(int row, int length)
        {
            for (var col = 0; col < length; col++) matrix[row, col] = matrix[row + 1, col];
        }

        private void MoveColLeft(int col, int length)
        {
            for (var row = 0; row < length; row++) matrix[row, col] = matrix[row, col + 1];
        }

        #endregion
    }

    public sealed class StringSetFile : HashSet<string>
    {
        public StringSetFile(string path)
        {
            FilePath = path;
            Refresh();
        }

        public readonly string FilePath;

        public void Refresh()
        {
            Clear();
            if (File.Exists(FilePath))
                foreach (var item in File.ReadAllText(FilePath).Split(new[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries))
                    Add(item);
        }
        public void Save()
        {
            if (Count == 0) File.Delete(FilePath);
            else File.WriteAllText(FilePath, string.Join(Environment.NewLine, this));
        }
    }

    public sealed class SteamOtl : IniFile
    {
        public SteamOtl(string filePath, uint stringLong = 1024) : base(filePath, stringLong)
        {
            settingsUserNameData = new StringData(this["Settings"], "UserName");
        }

        private readonly StringData settingsUserNameData;

        public string SettingsUserName { get { return settingsUserNameData.Get(); } set { settingsUserNameData.Set(value); } }
    }
}
