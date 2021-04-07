using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

 namespace Modelos
{
   public class EmailModelo
    {
        public int enviarCorreo()
        {
            try
            {

                const String fromAddress = "N/A";
                const String fromPassword="N/A";
                 
                System.Net.Mail.SmtpClient cliente = new   System.Net.Mail.SmtpClient();
                 cliente.DeliveryMethod = SmtpDeliveryMethod.Network;
                 cliente.Credentials = new NetworkCredential(fromAddress, fromPassword);
                 cliente.Host = "smtp.gmail.com";
                cliente.Port = 587;
                cliente.EnableSsl = true;

                MailMessage msg= new MailMessage(fromAddress,fromAddress,"Pruebas","Mensaje de Pruebas");
                cliente.Send(msg);
                return 1;

            }
            catch(Exception ex)
            {
                return 0;
            }
          
        }
    }
}
