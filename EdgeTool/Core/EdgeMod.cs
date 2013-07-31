using System;
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
            bool initialized = false, containXml = false;
            IEnumerable<MappingLevel> mappings = null;
            var i = 0;
            using (var extractor = new SevenZipExtractor(path))
            {
                FilesCount = extractor.FilesCount;
                foreach (var fileName in extractor.ArchiveFileNames)
                {
                    switch (fileName.ToLower())
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
                        case "levels/mapping.xml":
                            containXml = true;
                            break;
                        case "levels/mapping.xsl":
                            Xsl = XslCracked = extractor.ExtractString(i);
                            break;
                        default:
                            if (fileName.StartsWith("mods/", true, CultureInfo.InvariantCulture))
                                throw new FormatException("EdgeMod 不允许修改 mods 文件夹内的内容！");
                            if (fileName.EndsWith(".bak", true, CultureInfo.InvariantCulture))
                                throw new FormatException("EdgeMod 不允许有以 .bak 为扩展名的文件！");
                            break;
                    }
                    i++;
                }
            }
            if (!initialized) throw new FormatException("mod.xml 未找到！");
            if (Type != ModType.Game && containXml)
                throw new FormatException("不允许非 Game 类型的 EdgeMod 重写 mapping.xml。请改用 mod.xml 或 mapping.xsl");
            if (mappings == null) return;
            if (Xsl != null) throw new FormatException("不允许同时使用 mapping.xsl 与 mod.xml 对 mapping.xml 进行修改！" +
                                                       "请将 mod.xml 中添加的关卡合并至 mapping.xsl 中！");
            var xslBuilder = new StringBuilder();
            foreach (var item in mappings) xslBuilder.AppendLine("      " + item.GetXElement());
            xslBuilder.AppendLine("    </xsl:element>\r\n  </xsl:template>\r\n</xsl:transform>");
            Xsl = XslHead.Replace("extended", "bonus") + xslBuilder;
            XslCracked = XslHead + xslBuilder;
        }

        private static void Set(out HashSet<string> set, string value)
        {
            set = string.IsNullOrWhiteSpace(value) ? new HashSet<string>() : new HashSet<string>(value.Split(','));
        }

        private const string XslHead = "<xsl:transform version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n  <xsl:template match=\"* | comment()\">\r\n    <xsl:copy>\r\n      <xsl:copy-of select=\"@*\" />\r\n      <xsl:apply-templates />\r\n    </xsl:copy>\r\n  </xsl:template>\r\n  <xsl:template match=\"/levels/extended\">\r\n    <xsl:element name=\"{name()}\">\r\n      <xsl:for-each select=\"/levels/extended/@*\">\r\n        <xsl:attribute name=\"{name()}\">\r\n          <xsl:value-of select=\".\" />\r\n        </xsl:attribute>\r\n      </xsl:for-each>\r\n      <xsl:attribute name=\"special_locked_level_count\">0</xsl:attribute>\r\n      <xsl:apply-templates />\r\n";

        private readonly Edge parent;
        public uint FilesCount;
        public string FilePath, ID, Description;
        public Version MinEngineVersion, MaxEngineVersion;
        public ModType Type;
        public HashSet<string> Conflicts, Dependency, InstallAfter, InstallBefore;
        public string Xsl, XslCracked;

        public string Name { get; set; }
        public Version Version { get; set; }
        public string Author { get; set; }
        public bool Enabled { get { return !parent.GetIsDisabled(this); } set { parent.SetIsDisabled(this, !value); } }

        public void Install(HashSet<string> modifiedFiles, StringBuilder error, Dictionary<string, EdgeMod> conflicts,
                            ProgressCallback callback = null)
        {
            if (MinEngineVersion != null && parent.EngineVersion < MinEngineVersion
                || MaxEngineVersion != null && parent.EngineVersion > MaxEngineVersion)
            {
                error.AppendLine(string.Format("{0} 不支持版本为 {1} 的游戏引擎！该 mod 将不会被安装。", ID, parent.EngineVersion));
                return;
            }
            if (!Dependency.IsSubsetOf(parent.Mods.Where(mod => mod.Enabled).Select(mod => mod.ID)))
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
                            if (lowered == "mod.xml" || lowered == "description.txt" || lowered == "levels/mapping.xsl") return;
                            Directory.CreateDirectory(Path.GetDirectoryName(path));
                            var fileInfo = new FileInfo(path);
                            switch (e.Reason)
                            {
                                case ExtractFileCallbackReason.Start:
                                    if (Type == ModType.Level && fileInfo.Exists
                                        && !modifiedFiles.Contains(e.ArchiveFileInfo.FileName.ToLower()))
                                        throw new IOException("不允许 Level 类的 EdgeMod 修改游戏自带的文件！请改用 Theme 或 Game 类。");
                                    if (!fileInfo.Exists || (ulong) fileInfo.Length != e.ArchiveFileInfo.Size
                                        || Math.Abs(fileInfo.LastWriteTime.Ticks - e.ArchiveFileInfo.LastWriteTime.Ticks)
                                        > new TimeSpan(0, 0, 1).Ticks)  // 快速检测
                                    {
                                        CreateCopy(modifiedFiles, path);
                                        File.Delete(path);
                                        e.ExtractToFile = path;
                                    }
                                    parent.ModifiedFiles.Add(lowered);
                                    modifiedFiles.Add(lowered);
                                    break;
                                case ExtractFileCallbackReason.Done:
                                    if (e.ExtractToFile != null) fileInfo.LastWriteTime = e.ArchiveFileInfo.LastWriteTime;
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
                CreateCopy(modifiedFiles, mappingPath);
                var transform = new XslCompiledTransform(true);
                transform.Load(XmlReader.Create(new StringReader(parent.IsCracked ? XslCracked : Xsl)),
                                                new XsltSettings(true, true), new XmlUrlResolver());
                var writer = new StringWriter();
                transform.Transform(XmlReader.Create(new StringReader(File.ReadAllText(File.Exists(mappingPath) ? mappingPath
                                                                                           : (mappingPath + ".bak")))), null,
                                    XmlWriter.Create(writer, new XmlWriterSettings { Indent = true }), new XmlUrlResolver());
                File.WriteAllText(mappingPath, writer.ToString());
                parent.ModifiedFiles.Add("levels\\mapping.xml");
                modifiedFiles.Add("levels\\mapping.xml");
            }
            catch (Exception exc)
            {
                error.AppendFormat("更新关卡列表时发生了错误：{0}{1}", exc.Message, Environment.NewLine);
            }
        }

        private static void CreateCopy(HashSet<string> modifiedFiles, string path)
        {
            if (!File.Exists(path) || modifiedFiles.Contains(path)) return; // does not exists or new file overrided
            var bakPath = path + ".bak";
            if (!File.Exists(bakPath)) File.Move(path, path + ".bak");
        }
    }

    public enum ModType
    {
        Level, Theme, Game
    }

    public sealed class Edge
    {
        public Edge(string gamePath)
        {
            var versionInfo = FileVersionInfo.GetVersionInfo(GamePath = gamePath);
            EngineVersion = Version.Parse(string.Join(".", new[] { versionInfo.ProductMajorPart, versionInfo.ProductMinorPart, 
                versionInfo.ProductBuildPart, versionInfo.ProductPrivatePart }));
            GameDirectory = Path.GetDirectoryName(GamePath);
            Directory.CreateDirectory(ModsDirectory = Path.Combine(GameDirectory, "mods"));
            LevelsDirectory = Path.Combine(GameDirectory, "levels");
            ModelsDirectory = Path.Combine(GameDirectory, "models");
            TexturesDirectory = Path.Combine(GameDirectory, "textures");
            DisabledMods = new StringSetFile(Path.Combine(ModsDirectory, "disabledMods.txt"));
            ModifiedFiles = new StringSetFile(Path.Combine(ModsDirectory, "modifiedFiles.txt"));
            if (IsCracked) SteamOtl = new SteamOtl(Path.Combine(GameDirectory, "steam_otl.ini"));
            RefreshMods();
        }

        private static readonly Version CrackedEngineVersion = new Version(1, 0, 2483, 7086);

        public string GamePath, GameDirectory, ModsDirectory, LevelsDirectory, ModelsDirectory, TexturesDirectory;
        public readonly ObservableCollection<EdgeMod> Mods = new ObservableCollection<EdgeMod>();
        public StringSetFile DisabledMods, ModifiedFiles;
        public Version EngineVersion;
        public SteamOtl SteamOtl { get; private set; }
        public bool IsCracked { get { return EngineVersion == CrackedEngineVersion; } }
        public EventHandler DisabledModsChanged;

        public bool GetIsDisabled(EdgeMod mod)
        {
            return DisabledMods.Contains(mod.ID);
        }
        public void SetIsDisabled(EdgeMod mod, bool value)
        {
            if (value ? !DisabledMods.Add(mod.ID) : !DisabledMods.Remove(mod.ID)) return;
            if (DisabledModsChanged != null) DisabledModsChanged(this, EventArgs.Empty);
            DisabledMods.Save();
        }

        public string RefreshMods()
        {
            DisabledMods.Refresh();
            Mods.Clear();
            var errors = new StringBuilder();
            foreach (var mod in Directory.EnumerateFiles(ModsDirectory, "*.edgemod"))
                try
                {
                    Mods.Add(new EdgeMod(this, mod));
                }
                catch (Exception exc)
                {
                    errors.AppendFormat("加载 {0} 失败：{1}{2}", Path.GetFileNameWithoutExtension(mod), exc.Message, Environment.NewLine);
                }
            return errors.ToString();
        }

        public void RestoreCopy(string filePath)
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
            var oldModifiedFiles = new HashSet<string>(ModifiedFiles);
            ModifiedFiles.Clear();
            var error = new StringBuilder();
            var conflicts = new Dictionary<string, EdgeMod>();
            var cancelled = false;
            if (oldModifiedFiles.Contains("levels/mapping.xml"))
            {
                oldModifiedFiles.Remove("levels/mapping.xml");
                RestoreCopy("levels/mapping.xml");
            }
            foreach (var group in Mods.Where(mod => mod.Enabled).GroupBy(mod => mod.Type).OrderByDescending(group => group.Key)
                                      .Select(group => group.ToList()))
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
                    if (result[i] < 0) error.AppendLine(string.Format("{0} 的安装链中含有环！该 Mod 将不会被安装。", group[i].ID));
                    else group[i].Install(oldModifiedFiles, error, conflicts, callback);
                }
                if (cancelled) break;
            }
            oldModifiedFiles.ExceptWith(ModifiedFiles);
            foreach (var oldFile in oldModifiedFiles) RestoreCopy(oldFile);
            ModifiedFiles.Save();
            return error.ToString();
        }
    }

    public delegate void ProgressCallback(string additionalMessage);

    public class TopologicalSorter
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

    public class StringSetFile : HashSet<string>
    {
        public StringSetFile(string path)
        {
            FilePath = path;
            Refresh();
        }

        public string FilePath;

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

    public class SteamOtl : IniFile
    {
        public SteamOtl(string filePath, uint stringLong = 1024)
            : base(filePath, stringLong)
        {
            Settings = this["Settings"];
            SettingsUserNameData = new StringData(Settings, "UserName");
        }

        private readonly IniSection Settings;
        private readonly StringData SettingsUserNameData;

        public string SettingsUserName { get { return SettingsUserNameData.Get(); } set { SettingsUserNameData.Set(value); } }
    }
}
