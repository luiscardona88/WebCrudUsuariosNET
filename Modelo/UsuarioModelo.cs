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
    public class UsuarioModelo
    {
        Base_Datos.Base_Datos base_datos;
        List<Usuario> lista_regresa;
        public UsuarioModelo()
        {
            this.base_datos = new Base_Datos.Base_Datos();
            this.lista_regresa = new List<Usuario>();
        }


       public List<Usuario> Listar()
        {
            

            base_datos.setQuery("SELECT * FROM USUARIO");





            SqlDataReader lector = (base_datos.getLista())[0] as SqlDataReader;

           
            while (lector.Read())
            {

                int id_usuario = 0;
                String nombre = "";
                int edad = 0;
                string estados_civil = "";
                string telefono = "";
                int id_pais_fk = 0;
                String ciudad = "";
                int id_telefono_fk = 0;
                string fecha_registro = "";


                Usuario usuario = new Usuario(id_usuario, nombre, edad, estados_civil, telefono, id_pais_fk, ciudad, id_telefono_fk, fecha_registro);
                
                lista_regresa.Add(usuario);

            }
           
            return lista_regresa;
        }

         List<Usuario> verificaExistencia(int id)
        {
            List<SqlParameter> lista_parametros = new List<SqlParameter>();
            SqlParameter p1 = new SqlParameter("@id_usuario", id);
            lista_parametros.Add(p1);

            base_datos.setQuery("SELECT * FROM USUARIOS WHERE id_usuario=@id_usuario");
            SqlDataReader lector=  ( base_datos.getLista(lista_parametros)[0]) as SqlDataReader;
            while(lector.Read())
            {

                int id_usuario=0;
                String nombre="";
                int edad=0;
                string estados_civil="";
                string telefono="";
                int id_pais_fk=0;
                String ciudad="";
                int id_telefono_fk=0;
                string fecha_registro = "";


                Usuario usuario = new Usuario(id_usuario, nombre, edad, estados_civil, telefono, id_pais_fk, ciudad, id_telefono_fk, fecha_registro);
                /*falta definir las propiedades*/
                lista_regresa.Add(usuario);

            }

            return lista_regresa;
        }

        public Object[] actualizar(String nombre,String apellido,String edad,String estados_civil, String telefono,String ciudad)
        {
            List<SqlParameter> lista_parametros = new List<SqlParameter>();
            SqlParameter p1 = new SqlParameter("@nombre", nombre);
            SqlParameter p2 = new SqlParameter("@apellido", apellido);
            SqlParameter p3 = new SqlParameter("@edad", edad);
            SqlParameter p4 = new SqlParameter("@estados_civil", estados_civil);
            SqlParameter p5 = new SqlParameter("@telefono", telefono);
            SqlParameter p6 = new SqlParameter("@ciudad", ciudad);


            base_datos.setQuery("UPDATE USUARIOS SET nombre=@nombre, apellido=@apellido, edad=@edad, estados_civil=@estados_civil, telefono=@telefono,ciudad=@ciudad");
            return base_datos.affectedRow(lista_parametros);
        }

        public Object[] nuevo(String nombre, String apellido, int edad, int estados_civil, String telefono, String ciudad)
        {
            List<SqlParameter> lista_parametros = new List<SqlParameter>();
            SqlParameter p1 = new SqlParameter("@id_usuario", 10);
            SqlParameter p2 = new SqlParameter("@nombre", nombre);
            SqlParameter p3 = new SqlParameter("@apellido", apellido);
            SqlParameter p4 = new SqlParameter("@edad", edad);
            SqlParameter p5 = new SqlParameter("@estados_civil", estados_civil);
            SqlParameter p6 = new SqlParameter("@telefono", telefono);
            SqlParameter p7 = new SqlParameter("@ciudad", ciudad);


            base_datos.setQuery("INSERT USUARIOS(id_usuario,nombre, apellido, edad, estados_civil, telefono,ciudad) VALUES(@id_usuario,@nombre, @apellido, @edad, @estados_civil, @telefono,@ciudad)");
            return base_datos.affectedRow(lista_parametros);
        }



    }
      
    }

