using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace WebApplication11
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class Service1
    {
        Facade.Facade f;
        public Service1()
        {
            this.f = new Facade.Facade();

        }
        // Para usar HTTP GET, agregue el atributo [WebGet]. (El valor predeterminado de ResponseFormat es WebMessageFormat.Json)
        // Para crear una operación que devuelva XML,
        //     agregue [WebGet(ResponseFormat=WebMessageFormat.Xml)]
        //     e incluya la siguiente línea en el cuerpo de la operación:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        [OperationContract]
        public void DoWork()
        {
            // Agregue aquí la implementación de la operación
            return;
        }

        [OperationContract]
        [WebGet]
        public string saludo()
        {
            // Agregue aquí la implementación de la operación
            return "HOLA";
        }


        [OperationContract]
        [WebGet]
        public String listarUsuarios()
        {
            return this.f.listarUsuarios();

        }

        [OperationContract]
        [WebGet]
        public String existeLogin(String usuario, String pass)
        {
            return this.f.existeLogin(usuario, pass);

        }

        [OperationContract]
        [WebGet]
        public String actualizarUsuario(String nombre, String apellido, String edad, String estados_civil, String telefono, String ciudad)
        {
            return this.f.actualizarUsuario(nombre, apellido, edad, estados_civil, telefono, ciudad);
        }


        [OperationContract]
        [WebGet]
        public string nuevoUsuario(String nombre, String apellido, int edad, int estados_civil, String telefono, String ciudad)
        {
          return f.nuevoUsuario(nombre,apellido, edad, estados_civil, telefono, ciudad);



        }

        // Agregue aquí más operaciones y márquelas con [OperationContract]
    }
}
