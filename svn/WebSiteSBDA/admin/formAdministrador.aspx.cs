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

public partial class admin_formAdministrador : System.Web.UI.Page
{
    private String IDEN;

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie objCookie2 = Request.Cookies.Get("flag");
        String flag = objCookie2.Value;
        if (objCookie2.Value.Equals("0"))
            Response.Redirect("~/login.aspx");

        this.IDEN = Request.Params.Get("id");
    }
    protected void btnInsertar_Click(object sender, EventArgs e)
    {
        TextBox txtNombre = (TextBox)FormView1.FindControl("txtNombre");
        TextBox txtApellido = (TextBox)FormView1.FindControl("txtApellido");
        TextBox txtCuenta = (TextBox)FormView1.FindControl("txtCuenta");
        TextBox txtClave = (TextBox)FormView1.FindControl("txtClave");

        clsAdministrador objAdministrador = new clsAdministrador();
        objAdministrador.NOMBRE = txtNombre.Text;
        objAdministrador.APELLIDO = txtApellido.Text;
        objAdministrador.CUENTA = txtCuenta.Text;
        objAdministrador.CLAVE = txtClave.Text;
        
        if ((this.IDEN != null) && (!objAdministrador.NOMBRE.Equals("")) && (!txtApellido.Text.Equals("")) && (!txtCuenta.Text.Equals("")) && (!txtClave.Text.Equals("")))
        {
            //aqui modifico el registro
            objAdministrador.ID = this.IDEN;
            objAdministrador.Modificar();
            Response.Redirect("listaAdministrador.aspx");
        }
        else
        {
            Label lblMensaje = (Label)FormView1.FindControl("lblMensaje");
            lblMensaje.Text = "Faltan campos por llenar, intente nuevamente.";
        }
    }
}
