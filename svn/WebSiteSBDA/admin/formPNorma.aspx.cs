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

public partial class admin_formPNorma : System.Web.UI.Page
{
    private String IDEN;

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie objCookie2 = Request.Cookies.Get("flag");
        String flag = objCookie2.Value;
        if (objCookie2.Value.Equals("0"))
            Response.Redirect("~/default.aspx");

        this.IDEN = Request.Params.Get("id");
    }
    protected void btnInsertar_Click(object sender, EventArgs e)
    {
        TextBox txtNombre = (TextBox)FormView1.FindControl("txtNombre");
        clsPNorma objPNorma = new clsPNorma();
        objPNorma.NOMBRE = txtNombre.Text;
        if ((this.IDEN != null) && (!objPNorma.NOMBRE.Equals("")))
        {
            //aqui modifico el registro
            objPNorma.ID = this.IDEN;
            objPNorma.Modificar();
            Response.Redirect("listaPNorma.aspx");
        }
        else
        {
            Label lblMensaje = (Label)FormView1.FindControl("lblMensaje");
            lblMensaje.Text = "Faltan campos por llenar, intente nuevamente.";
        }        
    }
}
