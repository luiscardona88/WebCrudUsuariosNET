<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication11.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
    <p>
        <input id="Button1" type="button" value="button" onclick="mandaPeticion()" /></p>

    <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>

    <script>

        function mandaPeticion()
        {

            var nombre="Luis";
            var apellido = "Cardona29";
            var edad = "Cardona29";
            var estados_civil = "1";
            var telefono = "Cardona2";
            var ciudad = "Cardona2";

            $.ajax({
                type: "GET",
                url: "http://localhost:2575/Service1.svc/nuevoUsuario",
                data: { nombre: "luis", apellido: "luis" ,edad:30,estados_civil:1,telefono:"8313815",ciudad:"Monterrey"},
                success: function (xml) {
                    console.log(xml);

                },
                error: function () {

                }


            })

            /*
            alert("OK");
            $.ajax({
                type: "GET",
                url: "http://localhost:2575/Service1.svc/listarUsuarios",
                success: function (xml)
                {
                    console.log(xml);

                },
                error: function ()
                {

                }


            })
            */

            /*
            $.ajax({
                type: "GET",
                url: "http://localhost:2575/Service1.svc/existeLogin",
                data:{usuario:"luis",pass:"luis"},
                success: function (xml)
                {
                    console.log(xml);

                },
                error: function ()
                {

                }

            })
            */
        }
    </script>
</body>
</html>
