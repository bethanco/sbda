using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        HttpCookie objCookie2 = Request.Cookies.Get("flag");
        HttpCookie objCookie1 = Request.Cookies.Get("idUsuario");
        HttpCookie objCookie3 = Request.Cookies.Get("url");
        if (objCookie1 != null)
        {
            objCookie1.Value = "0";
            objCookie2.Value = "0";
            objCookie3.Value = "0";
            Response.Cookies.Add(objCookie1);
            Response.Cookies.Add(objCookie2);
            Response.Cookies.Add(objCookie3);
        }
    }
    protected void btnIngresar_Click(object sender, EventArgs e)
    {
        clsUsuario objUsuario = new clsUsuario();
        DataSet dt = objUsuario.ConsultarUsuario(this.txtCuenta.Text, this.txtContrasena.Text);
        int n = dt.Tables[0].Rows.Count;
        if (n > 0)
        {
            String idUsuario = dt.Tables[0].Rows[0].ItemArray[0] + "";
            String flag = dt.Tables[0].Rows[0].ItemArray[1]+"";
            String url =  "";
            if (!flag.Equals("1")) 
            {
                clsCliente objCliente = new clsCliente();
                DataSet dts = objCliente.ConsultarUrlClientePorID(idUsuario);
                url = dts.Tables[0].Rows[0].ItemArray[0] + "";
            }
            HttpCookie objCookie1 = new HttpCookie("idUsuario", idUsuario);            
            HttpCookie objCookie2 = new HttpCookie("flag", flag);
            HttpCookie objCookie3 = new HttpCookie("url", url);
            Response.Cookies.Add(objCookie1);
            Response.Cookies.Add(objCookie2);
            Response.Cookies.Add(objCookie3);
            Response.Redirect("index.aspx");
        }
        else
        {
            this.lblError.Text = "Datos incorrectos, intente nuevamente."+"n: "+n+" "+this.txtCuenta.Text+","+ this.txtContrasena.Text;
        }
    }
    protected void lnkRecuperarDatos_Click(object sender, EventArgs e)
    {        
        Response.Redirect("dataRecovery.aspx");
    }
}
