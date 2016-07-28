using System;
using System.Globalization;
using ExcelLibrary.SpreadSheet;
using Mygod.Edge.Tool.LibTwoTribes;

namespace Mygod.Edge.Tool
{
    public static class LocHelper
    {
        public static void SaveXls(this LOC loc, string path)
        {
            var workbook = new Workbook();
            var worksheet = new Worksheet("localization") { Cells = { [0, 0] = new Cell("id") } };
            for (var i = 0; i < loc.Languages.Length; i++) worksheet.Cells[0, i + 1] = new Cell(loc.Languages[i]);
            for (var i = 0; i < loc.StringKeys.Length; i++)
            {
                worksheet.Cells[i + 1, 0] = new Cell(loc.StringKeys[i].ToStringInvariant());
                for (var j = 0; j < loc.Languages.Length; j++)
                    worksheet.Cells[i + 1, j + 1] = new Cell(loc.GetString(loc.Languages[j], loc.StringKeys[i]));
            }
            workbook.Worksheets.Add(worksheet);
            workbook.Save(path);
        }

        public static LOC FromXls(string path)
        {
            var loc = new LOC();
            var cells = Workbook.Load(path).Worksheets[0].Cells;
            if (cells[0, 0].StringValue.ToLowerInvariant() != "id")
                throw new NotSupportedException(Localization.XlsFormatIDError);
            loc.Languages = new string[cells.GetRow(0).LastColIndex];
            for (var i = 0; i < loc.Languages.Length; i++) loc.Languages[i] = cells[0, i + 1].StringValue;
            loc.StringKeys = new uint[cells.Rows.Count - 1];
            loc.StringData = new string[loc.Languages.Length, loc.StringKeys.Length];
            for (var i = 0; i < loc.StringKeys.Length; i++)
            {
                var row = cells.GetRow(i + 1);
                loc.StringKeys[i] = uint.Parse(row.GetCell(0).StringValue);
                for (var j = 0; j < Math.Min(row.LastColIndex, loc.Languages.Length); j++)  // ignore extra data
                    loc.StringData[j, i] = row.GetCell(j + 1).StringValue;
            }
            return loc;
        }
    }
}