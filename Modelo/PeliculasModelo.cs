using Modelo.Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.Generic;
namespace Modelos
{
    public class PeliculasModelo
    {
          Base_Datos.Base_Datos base_datos;
        public List<Pelicula> lista_regresa;
        public List<Total_Pagar> lista_pagar;
        public PeliculasModelo()
        {
            this.base_datos = new Base_Datos.Base_Datos();
            this.lista_regresa = new List<Pelicula>();
            this.lista_pagar = new List<Total_Pagar>();
        }

        public List<Total_Pagar> lista_total_pagar(System.Collections.Generic.List<String[]> lista)
        {

            try
            {
                String[] parametros = lista[0] as String[];
                    List<SqlParameter> lista_parametros = new List<SqlParameter>();
                    SqlParameter p1 = new SqlParameter("@id_usuario", parametros[0]);            
                    lista_parametros.Add(p1);                  
                    base_datos.setQuery("sp_total_by_usuario");

                    SqlDataReader datos_reader = base_datos.getLista(lista_parametros, "store")[0] as SqlDataReader;

                    while (datos_reader.Read())
                   {
                       var id_usuario = Convert.ToInt16(datos_reader[0]);
                       var nombre = datos_reader[1].ToString();
                        var total = datos_reader[2].ToString();
                        var tipo = (datos_reader[3].ToString())=="R" ?"RENTA":"COMPRA";

                          lista_pagar.Add(new Total_Pagar { id_usuario = id_usuario, nombre = nombre, total = total, tipo=tipo});
                   }

                    return lista_pagar;
                    //return base_datos.getLista(lista_parametros,"store");
                  
            }

            catch (Exception ex)
            {
                return null;
            }

        }
        

        public System.Collections.Generic.List<Object[]> confirmarRenta_Compra(System.Collections.Generic.List<String[]> lista)
        {

            System.Collections.Generic.List<Object[]> respuesta= new List<Object[]>();

            try
            {
            foreach(var l in lista)
            {
              String []row=(l as String[]);

             List<SqlParameter> lista_parametros = new List<SqlParameter>();
             SqlParameter p1 = new SqlParameter("@id_usuario", row[0]);
             SqlParameter p2 = new SqlParameter("@id_pelicula",  row[1]);
             SqlParameter p3 = new SqlParameter("@cantidad", row[2]);


             lista_parametros.Add(p1);
             lista_parametros.Add(p2);
              lista_parametros.Add(p3);

             base_datos.setQuery("reservaPelicula");
            respuesta.Add(base_datos.affectedRow(lista_parametros,1));

            }

                return respuesta;
            }

            catch(Exception ex)
            {
                return null;
            }
             
         }
        

        public List<Pelicula> Listar()
        {

            base_datos.setQuery("SELECT *  FROM peliculas WHERE ESTATUS=0");

            SqlDataReader lector = (base_datos.getLista())[0] as SqlDataReader;

            while (lector.Read())
            {

                 int id_usuario=int.Parse(lector[0].ToString());
                string nombre=lector[1].ToString();
                string fecha_registro=lector[2].ToString();
                int cantidad=int.Parse(lector[3].ToString());
                string ruta_pelicula=lector[4].ToString();
                string estatus=lector[5].ToString();
                Pelicula p = new Pelicula(id_usuario,nombre,fecha_registro,cantidad,ruta_pelicula,estatus);   
                lista_regresa.Add(p);

            }

            return lista_regresa;
        }

    }
}
