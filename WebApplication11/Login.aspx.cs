using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication11
{
    public partial class Login : System.Web.UI.Page
    {
        WebApplication11.Service1 s;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.s = new Service1();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String nombre=this.TextBox1.Text;
            String pass=this.TextBox2.Text;
            string respuesta=this.s.existeLogin(nombre,pass);
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            Object[] respuesta_array = (Object[])serializer.DeserializeObject(respuesta);

            if (respuesta_array.Length > 0)
            {
                if ((int)respuesta_array[0] >= 1)
               {
                   Session.Remove("session");
                   Session["sesion"] = Session.SessionID;
                    Response.Redirect("WebForm1.aspx");
               }
                else
                {
                    Response.Write("<script> alert('USUARIO/CONTRASEÑA NO VALIDOS');</script>");
                    return;
                }
            }
                               
        }
    }
}