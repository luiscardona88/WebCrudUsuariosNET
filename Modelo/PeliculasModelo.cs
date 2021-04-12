using Modelo.Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelos
{
    public class PeliculasModelo
    {
          Base_Datos.Base_Datos base_datos;
        public List<Pelicula> lista_regresa;
        public PeliculasModelo()
        {
            this.base_datos = new Base_Datos.Base_Datos();
            this.lista_regresa = new List<Pelicula>();
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
