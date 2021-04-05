using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
namespace Base_Datos
{
    
    
    public class Base_Datos
    {

        SqlConnection conexion;
        SqlCommand comando;
        SqlParameter Parametro;
        Object[] resultados;
        private String query;

        public String getQuery()
        {
            return this.query;
        }
        public void setQuery(String query_string)
        {
            this.query = query_string;
        }

            public Base_Datos()
            {
                //System.Configuration.ConfigurationSettings.AppSettings["Conex"]
                this.resultados = new Object[2];
                string cadena_conex = ConfigurationManager.AppSettings["Conex"];
                this.conexion = new SqlConnection(cadena_conex);

                if (this.conexion.State == System.Data.ConnectionState.Open) this.conexion.Close();
                this.conexion.Open();
 
            }


            public Object[] getLista(List<SqlParameter> lista_parametros=null)
            {
                try
                {
                    comando = new SqlCommand();
                    comando.Connection = this.conexion;
                    comando.CommandText = this.getQuery();
                    if (lista_parametros!=null && lista_parametros.Count > 0)
                    {
                        foreach (SqlParameter p in lista_parametros)
                        {
                            comando.Parameters.Add(p);

                        }
                    }
                    resultados[0] = comando.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    resultados[1] = "1";

                }

            catch(Exception ex)
                {
                    resultados[0] = null;
                    resultados[1] = ex.Message + "-" + ex.StackTrace;

                }
                return resultados;
            }

        public Object[] affectedRow(List<SqlParameter> lista_parametros)
        {
            try
            {
                comando = new SqlCommand();
                comando.Connection = this.conexion;
                comando.CommandText = this.getQuery();
                if (lista_parametros != null && lista_parametros.Count > 0)
                {
                    foreach (SqlParameter p in lista_parametros)
                    {
                        comando.Parameters.Add(p);

                    }
                }
                resultados[0] = comando.ExecuteNonQuery();
                resultados[1] = "1";

               //cerramos conexion;
            }

            catch(Exception ex)
            {
                resultados[0] = null;
                resultados[1] = ex.Message + "-" + ex.StackTrace;

            }

            return resultados;
        }

    }
}
