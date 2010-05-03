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

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie objCookie2 = Request.Cookies.Get("flag");        
        String flag = objCookie2.Value;
        if(objCookie2.Value.Equals("0"))
            Response.Redirect("default.aspx");

        clsNorma objNorma = new clsNorma();
        DataSet dt = objNorma.ConsultarUltimaActualizacion();
        String str = dt.Tables[0].Rows[0].ItemArray[0] + "";
        if(!str.Equals(""))
            this.lblDate.Text = str.Substring(0,10);        
    }

    protected void lnkLimpiar_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
    protected void lnkAdministracion_Click(object sender, EventArgs e)
    {
        HttpCookie objCookie2 = Request.Cookies.Get("flag");        
        String flag = objCookie2.Value;
        if (flag.Equals("1"))
        {
            Response.Redirect("~/admin/listaNorma.aspx");
        }
        else
        {
            this.lblMensaje.Text = "Usted no tiene permiso para acceder";
        }
    }
    protected void lnkSalir_Click(object sender, EventArgs e)
    {        
        Response.Redirect("default.aspx");
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        if (!txtBuscar.Text.Equals("") || rbtnPalClave.Checked || (rbtnFecha.Checked && !txtFecha.Text.Equals("")))
            DataList1.DataSourceID = "ObjectDataSource1";
        else
            DataList1.DataSourceID = "ObjectDataSource3";//DataList1.DataSourceID = "ObjectDataSource3";
    }
    protected void PopCalendar_SelectionChanged(object sender, EventArgs e)
    {
        this.Validate("RJS.PopCalendars");
    }
}
