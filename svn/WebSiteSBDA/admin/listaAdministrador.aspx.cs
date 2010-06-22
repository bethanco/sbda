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

public partial class admin_listaAdministrador : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie objCookie2 = Request.Cookies.Get("flag");
        String flag = objCookie2.Value;
        if (objCookie2.Value.Equals("0"))
            Response.Redirect("~/login.aspx");

        String id = Request.Params.Get("id");
        if ((id != null) && (!id.Equals("1")))
        {
            HttpCookie objCookie1 = Request.Cookies.Get("idUsuario");
            String idUsuario = objCookie1.Value;
            if(!id.Equals(idUsuario))
                this.EliminarRegistro(id);
            else
                lblMensaje.Text = "No es posible eliminarlo, ya que esta siendo utilizado.";
        }
        else
        {
            if(id != null)
                lblMensaje.Text = "Este es un Super Administrador y no puede ser eliminado.";
        }   
    }

    private void EliminarRegistro(String id)
    {
        clsNorma objNorma = new clsNorma();
        DataSet dt = objNorma.ConsultarUsuario(id);
        int n = dt.Tables[0].Rows.Count;
        if (n == 0)
        {
            clsAdministrador objAdministrador = new clsAdministrador();
            objAdministrador.ID = id;
            objAdministrador.Eliminar();

            clsUsuario objUsuario = new clsUsuario();
            objUsuario.ID = id;
            objUsuario.Eliminar();
        }
        else
            lblMensaje.Text = "No es posible eliminarlo, ya que esta siendo utilizado.";        
    }
}
