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

public partial class admin_listaCliente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie objCookie2 = Request.Cookies.Get("flag");
        String flag = objCookie2.Value;
        if (objCookie2.Value.Equals("0"))
            Response.Redirect("~/default.aspx");

        String id = Request.Params.Get("id");
        if (id != null)
        {
            this.EliminarRegistro(id);
        }
    }

    private void EliminarRegistro(String id)
    {
        clsCliente objCliente = new clsCliente();
        objCliente.ID = id;
        objCliente.Eliminar();

        clsUsuario objUsuario = new clsUsuario();
        objUsuario.ID = id;
        objUsuario.Eliminar();
    }
}
