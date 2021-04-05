using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelos;
using Modelos.Entidades;
namespace Facade
{
    public class Facade
    {
        Modelos.UsuarioModelo usuario_model;
        Modelos.LoginModelo login_modelo;
        public Facade()
        {
            usuario_model = new UsuarioModelo();
            login_modelo = new LoginModelo();
        }


        public string existeLogin(String Usuario,String Password)
        {
            string response = Newtonsoft.Json.JsonConvert.SerializeObject(login_modelo.existe(Usuario, Password));
            return response;
        }

        public string listarUsuarios()
    {
        string response = Newtonsoft.Json.JsonConvert.SerializeObject(usuario_model.Listar());
        return response;
    }

        public string actualizarUsuario(String nombre, String apellido, String edad, String estados_civil, String telefono, String ciudad,int id_usuario)
        {

            Object[] response = usuario_model.actualizar(nombre, apellido, edad, estados_civil, telefono, ciudad, id_usuario);
          int respuesta=int.Parse(response[1] as String);
          return respuesta.ToString();
       // ****TOMAR EN CUENTA  ESTO DEBE DE ESTUDIARSE BIEN  23/08/2020 ****return Newtonsoft.Json.JsonConvert.SerializeObject(response);

        }
        public string nuevoUsuario(String nombre, String apellido, int  edad, int  estados_civil, String telefono, String ciudad)
        {
            Object[] response = usuario_model.nuevo(nombre, apellido, edad, estados_civil, telefono, ciudad);
            int respuesta = int.Parse(response[1] as String);
            return Newtonsoft.Json.JsonConvert.SerializeObject(response);
        }

        public Object[] borrarUsuario(int estatus,int usuario)
        {
            Object[] response = usuario_model.deleteUsuario(estatus,usuario);
            return response;

        }


    }
}
