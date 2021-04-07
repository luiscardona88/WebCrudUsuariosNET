using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Office.Interop.Excel;
using System.Data;

namespace WebApplication11.Reportes
{
    public class Reporte
    {
        private Microsoft.Office.Interop.Excel.Application apExcel = new Microsoft.Office.Interop.Excel.Application();
        Microsoft.Office.Interop.Excel.Workbook libro;
       public  Reporte()
        {
          
           this.libro = apExcel.Workbooks.Add(Type.Missing);
           
        }

        public void fill_Report(System.Data.DataTable table_param)
       {
           Worksheet hoja = new Worksheet();
           hoja = (Worksheet)this.libro.Sheets.Add();
           hoja.Activate();
           hoja.Select();

            /*HEADER*/
          
           int counter_rows = 1;
           Microsoft.Office.Interop.Excel.Range rango = (Microsoft.Office.Interop.Excel.Range)hoja.Rows[counter_rows];
           rango.EntireRow.Font.Bold = true;
           rango.NumberFormat = 0;
           rango.ColumnWidth = 14;
           rango.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignLeft;

           hoja.Cells[counter_rows, 1] = "id_usuario";
           hoja.Cells[counter_rows, 2] = "nombre";
           hoja.Cells[counter_rows, 3] = "apellido";
           hoja.Cells[counter_rows, 4] = "edad";
           hoja.Cells[counter_rows, 5] = "estados_civil";
           hoja.Cells[counter_rows, 6] = "telefono";
           hoja.Cells[counter_rows, 7] = "ciudad";
           counter_rows++;

           /*RELLENA EXCEL DATOS DB*/
            foreach(DataRow row in table_param.Rows)
            {
                hoja.Cells[counter_rows,1] = row[0];
                hoja.Cells[counter_rows, 2] = row[1];
                hoja.Cells[counter_rows, 3] = row[2];
                hoja.Cells[counter_rows, 4] = row[3];
                hoja.Cells[counter_rows, 5] = row[4];
                hoja.Cells[counter_rows, 6] = row[5];
                hoja.Cells[counter_rows, 7] = row[6];

                counter_rows++;

            }
            
            apExcel.Visible = true;
            
       }
    }
}