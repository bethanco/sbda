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

public partial class admin_formNAdministrador : System.Web.UI.Page
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
        //ADMINISTRADOR 1
        clsUsuario objUsuario = new clsUsuario();
        objUsuario.TIPOUSUARIO = "1";
        int n = objUsuario.Insertar();

        clsAdministrador objAdministrador = new clsAdministrador();
        if ((!this.txtNombre.Text.Equals("")) && (!this.txtApellido.Text.Equals("")) && (!this.txtCuenta.Text.Equals("")) && (!this.txtClave.Text.Equals("")))
        {
            //aqui inserto un registro
            objAdministrador.ID = n + "";
            objAdministrador.NOMBRE = this.txtNombre.Text;
            objAdministrador.APELLIDO = this.txtApellido.Text;
            objAdministrador.CUENTA = this.txtCuenta.Text;
            objAdministrador.CLAVE = this.txtClave.Text;            
            objAdministrador.Insertar();
            Response.Redirect("listaAdministrador.aspx");
        }
        else
        {
            this.lblMensaje.Text = "Faltan campos por llenar, intente nuevamente.";
        }
    }
}
