using Microsoft.Office.Interop.Excel;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace WebApplication11
{
    public partial class WebFormPeliculas : System.Web.UI.Page
    {
        WebApplication11.Service1 s= new Service1();
        protected void Page_Load(object sender, EventArgs e)
        {

            String datos = s.listarPeliculas();
            System.Data.DataTable tabla = JsonConvert.DeserializeObject<System.Data.DataTable>(datos);
            tabla.TableName = "peliculas";
            this.GridView1.DataSource = tabla;
            this.GridView1.DataMember = "peliculas";
            this.GridView1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String buscar = this.TextBox1.Text;
            String datos = s.listarUsuarios();
          var busca_en = from u in datos
                              where datos.Contains(buscar) || datos==buscar
                              select u;
          Response.Write(busca_en);

            
        }
    }
}