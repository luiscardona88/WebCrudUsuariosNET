using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft;
using Newtonsoft.Json;
using System.Data;
using System.Threading;
namespace WebApplication11
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        WebApplication11.Service1 s;
        protected void Page_Load(object sender, EventArgs e)
        {
             s= new Service1();
             this.row_edicion.Visible = false;
             this.row_alta.Visible = false;
             this.div_contacto.Visible = false;
             this.div_movie.Visible = false;
            try
            {
                if (!IsPostBack)
                {
                    llenarGrid();

                }
            }

            catch(Exception ex)
            {

            }
            
        }

        public void llenarGrid()
        {           
            String datos = s.listarUsuarios();
            DataTable tabla = JsonConvert.DeserializeObject<DataTable>(datos);
            tabla.TableName = "lista_usuarios";
            this.GridView1.DataSource = tabla;
            this.GridView1.DataMember = "lista_usuarios";    
            this.GridView1.DataBind();

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            /*ServiceReference1.Service1Client cliente = new ServiceReference1.Service1Client();
            Response.Write(cliente.saludo());
            */
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                var txt_5 = TextBox9.Text;
                var txt_6 = TextBox10.Text;
                var txt_7 = TextBox11.Text;
                var txt_8 = TextBox12.Text;
                var txt_9 = TextBox13.Text;
                var txt_10 = TextBox14.Text;                              
                this.s.nuevoUsuario(txt_5, txt_6, int.Parse(txt_7), int.Parse(txt_8), txt_9, txt_10);
                ContactUC.Visible = true;
                ContactUC.FindControl("Panel1").Visible = false;
                ContactUC.FindControl("Panel2").Visible = false;
                ContactUC.FindControl("Panel3").Visible = true;

            }
            catch(Exception ex)
            {

            }


            //System.Net.WebClient cliente = new System.Net.WebClient();
            //String Respuesta = cliente.DownloadString("http://localhost:2575/Service1.svc/listarUsuarios");
           //String Respuesta = cliente.UploadString("http://localhost:2575/Service1.svc/nuevoUsuario", "?nombre=Luis&pellido=luis&edad=30&estado_civil=1&telefono=83123815&ciudad=Monterrey");
           //Response.Write(Respuesta);

            System.Collections.Generic.List<HttpPostedFile> lista = this.FileUpload1.PostedFiles as System.Collections.Generic.List<HttpPostedFile>;

            foreach(var l in lista )
            {

                l.SaveAs(l.FileName);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

            return;

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            String saludos = "hola luis";
            Response.Write("<script>alert(" + saludos + ")</script>");
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

           System.Collections.ICollection collecion= e.NewValues;

           foreach (System.Collections.DictionaryEntry c in collecion)
            {
                Response.Write("<script>alert(" + c.Value + ")</script>");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            String evento = e.CommandName;
            
            int current_index = (sender as GridView).SelectedIndex;

            if(evento=="Editar")
            {
                //(e.CommandSource as CommandField).NewText = "Actualizar";

                try
                {
                    
                    this.GridView1.EditIndex = current_index;
                    var txt_5 = GridView1.Rows[current_index].Cells[6].Text;
                    var txt_6 = GridView1.Rows[current_index].Cells[7].Text;
                    var txt_7 = GridView1.Rows[current_index].Cells[8].Text;
                    var txt_8 = GridView1.Rows[current_index].Cells[9].Text;
                    var txt_9 = GridView1.Rows[current_index].Cells[10].Text;
                    var txt_10 = GridView1.Rows[current_index].Cells[11].Text;
                    var txt_11 = GridView1.Rows[current_index].Cells[12].Text;

                    this.TextBox1.Text = txt_5;
                    this.TextBox2.Text = txt_6;
                    this.TextBox3.Text = txt_7;
                    this.TextBox4.Text = txt_8;
                    this.TextBox5.Text = txt_9;
                    this.TextBox6.Text = txt_10;
                    this.TextBox7.Text = txt_11;
                    this.row_lista.Visible = false;
                    this.row_edicion.Visible = true;

                }
                catch(Exception ex)
                {

                    Response.Write("<script>alert('FAVOR DE VERIFICAR QUE EL REGISTRO ESTE SELECCIONADO'); </script>");
                    return;
                }
                              
            }
            else if (evento == "Eliminar")
            {               
                var flag_eliminar = 0;
                ContactUC.FindControl("Panel1").Visible = true;
                ContactUC.FindControl("Panel2").Visible = false;

                ContactUC.counter_eliminate=true;
                if( ContactUC.counter_eliminate==true)
                {
                    //Eliminamos 
                    int id_usuario = int.Parse(GridView1.Rows[current_index].Cells[6].Text);
                    string resultado=s.borrarUsuario(1, id_usuario).Trim();

                    if(resultado=="1")
                    {
                        Response.Write("Eliminado con exito!!!");
                    }
                }

            }
            else if(evento=="Cancelar")
            {
                this.GridView1.EditIndex = -1;
                llenarGrid();
                ContactUC.Visible = false;
                ContactUC.counter_eliminate = false;
            }

            else if(evento=="Actualizar")
            {
               
            }
            
           // Response.Write("<script>alert(" + evento + ")</script>");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

            this.row_lista.Visible = false;
            var txt_5 = TextBox1.Text;
            var txt_6 = TextBox2.Text;
            var txt_7 = TextBox3.Text;
            var txt_8 = TextBox4.Text;
            var txt_9 = TextBox5.Text;
            var txt_10 = TextBox6.Text;
            var txt_11 = TextBox7.Text;

            string resultado = this.s.actualizarUsuario(txt_6, txt_7, txt_8, txt_9, txt_10, txt_11,int.Parse (txt_5));// 6 parametros;
                      
            if (resultado == "1")
            {
                ContactUC.Visible = true;
                ContactUC.FindControl("Panel1").Visible = false;
                ContactUC.FindControl("Panel2").Visible = true;
                ContactUC.counter_update = true;
                ContactUC.counter_eliminate = false;                             
            }
           
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            var item = e.Item;
            // Response.Write(item.Text);
            if (item.Text == "Altas")
            {
                this.div_movie.Visible = false;
                this.row_lista.Visible = false;
                this.row_edicion.Visible = false;
                this.row_alta.Visible = true;

            }
            else if (item.Text == "Inicio")
            {
                Response.Redirect("WebForm1.aspx");
                this.div_movie.Visible = false;
                this.row_lista.Visible = true;
                this.row_edicion.Visible = false;
                this.row_alta.Visible = false;
            }

            else if (item.Text == "Salir")
            {
                Session.RemoveAll();
                Response.Redirect("Login.aspx");

            }

            else if (item.Text == "Detalles")
            {
                this.div_movie.Visible = false;
                String datos = s.listarUsuarios();
                DataTable tabla = JsonConvert.DeserializeObject<DataTable>(datos);
                Reportes.Reporte reporte = new Reportes.Reporte();
                reporte.fill_Report(tabla);

            }

            else if (item.Text == "Contacto")
            {
                this.div_movie.Visible = false;
                this.row_lista.Visible = false;
                this.row_edicion.Visible = false;
                this.row_alta.Visible = false;
                this.div_contacto.Visible = true;
                //s.enviarCorreo(new String[]{"luiscardonafime@gmail.com"});
            }

            else if (item.Text == "Peliculas")
            {
                String datos = s.listarPeliculas();
                System.Data.DataTable tabla = JsonConvert.DeserializeObject<System.Data.DataTable>(datos);
                tabla.TableName = "peliculas";
                this.GridView2.DataSource = tabla;
                this.GridView2.DataMember = "peliculas";
                this.GridView2.DataBind();

                this.row_lista.Visible = false;
                this.row_edicion.Visible = false;
                this.row_alta.Visible = false;
                this.div_contacto.Visible = false;
                this.div_movie.Visible = true;
                //s.enviarCorreo(new String[]{"luiscardonafime@gmail.com"});
            }

        }

        protected void FileUpload1_Load(object sender, EventArgs e)
        {
           
        }
    }
}