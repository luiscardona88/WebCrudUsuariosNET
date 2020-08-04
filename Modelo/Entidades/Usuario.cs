using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelos.Entidades
{
    public class Usuario
    {
        public int id_usuario;
        public string nombre;
        public string apellido;
        public int edad;
        public string estados_civil;
        public string telefono;
        public int id_pais_fk;
        public string ciudad;
        public int id_telefono_fk;
        public String fecha_registro;
        public Usuario(int id_usuario,String nombre,int edad,string estados_civil,string telefono, int id_pais_fk,String ciudad,int id_telefono_fk,string fecha_registro)
        {
            this.id_usuario = id_usuario;
            this.nombre = nombre;
            this.edad = edad;
            this.estados_civil = estados_civil;
            this.telefono = telefono;
            this.id_pais_fk = id_pais_fk;
            this.ciudad = ciudad;
            this.id_telefono_fk = id_telefono_fk;
            this.fecha_registro = fecha_registro;

        }
   


    }
}
