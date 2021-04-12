using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo.Entidades
{
    public class Pelicula
    {
        public int id_usuario;
        public string nombre;
        public string fecha_registro;
        public int cantidad;
        public string ruta_pelicula;
        public string estatus;
      
        public Pelicula( int id_usuario,string nombre,string fecha_registro,int cantidad,string ruta_pelicula,string estatus)
        {
            this.id_usuario = id_usuario;
            this.nombre = nombre;
            this.cantidad = cantidad;
            this.ruta_pelicula = ruta_pelicula;
            this.estatus = estatus;
            this.fecha_registro = fecha_registro;

        }

    }
}
