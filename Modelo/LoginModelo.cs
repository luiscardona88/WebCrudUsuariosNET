using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelos.Entidades;
using Base_Datos;
using System.Data.SqlClient;
namespace Modelos
{
    public class LoginModelo
    {

        Base_Datos.Base_Datos base_datos;
       List<Login> lista_regresa;
        public LoginModelo()
        {
            this.base_datos = new Base_Datos.Base_Datos();
            this.lista_regresa = new List<Login>();
        }

         List<Login> Listar(String nombre,String pass)
        {
            List<SqlParameter> lista_parametros = new List<SqlParameter>();


            base_datos.setQuery("SELECT * FROM LOGIN");
            SqlDataReader lector=  ( base_datos.getLista(lista_parametros)[0]) as SqlDataReader;
            while(lector.Read())
            {
                Login login_entidad= new Login();
                /*falta definir las propiedades*/
                lista_regresa.Add(login_entidad);

            }

            return lista_regresa;
        }


        public Object[] existe(String nombre, String pass)
        {
            List<SqlParameter> lista_parametros = new List<SqlParameter>();
            SqlParameter p1 = new SqlParameter("@nombre", nombre);
            SqlParameter p2 = new SqlParameter("@pass", pass);

            lista_parametros.Add(p1);
            lista_parametros.Add(p2);

            base_datos.setQuery("SELECT COUNT(*) FROM LOGIN WHERE nombre=@nombre AND pass=@pass");
            Object[] respuesta = base_datos.getLista(lista_parametros);
            SqlDataReader lector = respuesta[0] as SqlDataReader;
            String msg = respuesta[1] as String;
            int counter = 0;
            while (lector.Read())counter = lector.GetInt32(0);           
            object[] resultados= new object[2];
            resultados[0] = counter;
            resultados[1] = msg;
            return resultados;
            
        }

        public Object[] actualizar(String nombre,String pass)
        {
            List<SqlParameter> lista_parametros = new List<SqlParameter>();
            lista_parametros.Add(new SqlParameter("@nombre", nombre));
            lista_parametros.Add(new SqlParameter("@pass", pass));
            base_datos.setQuery("UPDATE LOGIN SET nombre=@nombre,pass=@pass");
            return base_datos.affectedRow(lista_parametros);
        }

    }
}
