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

public partial class formNPalabraClave : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie objCookie2 = Request.Cookies.Get("flag");
        String flag = objCookie2.Value;
        if (objCookie2.Value.Equals("0"))
            Response.Redirect("~/default.aspx");        
    }
    protected void btnInsertar_Click(object sender, EventArgs e)
    {
        clsPPalClave objPalClave = new clsPPalClave();
        if ((!this.txtNombre.Text.Equals("")))
        {
            //aqui inserto un registro
            objPalClave.NOMBRE = this.txtNombre.Text;
            objPalClave.Insertar();
            Response.Redirect("listaPalabraClave.aspx");
        }
        else
        {
            this.lblMensaje.Text = "Faltan campos por llenar, intente nuevamente.";
        }
    }
}
