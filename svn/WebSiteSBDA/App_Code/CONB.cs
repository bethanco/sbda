using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;


/// <summary>
/// Clase de acceso a datos
/// </summary>
public class CONB
{
    /// <summary>
    /// cadena de conexion
    /// </summary>
    //const string CNX = "data source=localhost;integrated security=SSPI;initial catalog=w1100905_sbdaDB";
    //const string CNX = "Data Source=JAIME_GASPA;Initial Catalog=sbdaDB;Integrated Security=True";
    string CNX = ConfigurationManager.ConnectionStrings["SQLSERVER"].ConnectionString;
    public SqlConnection AbrirConexion()
    {
        SqlConnection con = new SqlConnection(CNX);
        con.Open();
        return con;
    }
    public DataSet EjecutarConsulta(string sql)
    {
        DataSet ds = new DataSet();
        using (SqlConnection con = this.AbrirConexion())
        {
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            da.Fill(ds);
            con.Dispose();
        }
        return ds;
    }
    public int EjecutarDML(string sql)
    {
        using (SqlConnection con = this.AbrirConexion())
        {
            SqlCommand cmd = new SqlCommand(sql, con);
            int aux = cmd.ExecuteNonQuery();
            con.Dispose();
            return aux;
        }
    }

    public int EjecutarDMLNEW(string sql)
    {   
        using (SqlConnection con = this.AbrirConexion())
        {
            SqlCommand cmd = new SqlCommand(sql, con);
            int aux = (int)cmd.ExecuteScalar();
            con.Dispose();
            return aux;
        }
    }
}