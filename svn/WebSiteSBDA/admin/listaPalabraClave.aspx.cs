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

public partial class admin_listaPalabraClave : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie objCookie2 = Request.Cookies.Get("flag");
        String flag = objCookie2.Value;
        if (objCookie2.Value.Equals("0"))
            Response.Redirect("~/login.aspx");

        String id = Request.Params.Get("id");
        if (id != null)
        {
            this.EliminarRegistro(id);
        }
    }

    private void EliminarRegistro(String id)
    {
        clsNormaClave objNorCla = new clsNormaClave();
        DataSet dt = objNorCla.ConsultarPalClave(id);
        int n = dt.Tables[0].Rows.Count;
        if (n == 0)
        {
            clsPPalClave objPalClave = new clsPPalClave();
            objPalClave.ID = id;
            objPalClave.Eliminar();
        }
        else
            lblMensaje.Text = "No es posible eliminarlo, ya que esta siendo utilizado.";        
    }
}
