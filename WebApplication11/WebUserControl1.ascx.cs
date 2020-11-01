using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
namespace WebApplication11
{


    public partial class WebUserControl1 : System.Web.UI.UserControl
    {
        public bool counter_eliminate = false;
        public bool counter_update = false;

           public    String txt_6{get;set;}
          public String  txt_7{get;set;}
           public String txt_8{get;set;}
           public String txt_9{get;set;} 
           public String txt_10{get;set;}
           public String txt_11 { get; set; }

           public int txt_5 { get; set; }

           Service1 s;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

           
           
            string resultado = this.s.actualizarUsuario(this.txt_6, this.txt_7, this.txt_8, this.txt_9, this.txt_10, this.txt_11, this.txt_5);// 6 parametros;

            if (resultado == "1")
            {
                Response.Write("Actualizado con exito!!!");

            }


        }

        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }

        protected void Panel2_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }
    }
}