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

public partial class admin_listaNorma : System.Web.UI.Page
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

        cbPalClave.BorderColor = System.Drawing.Color.FromArgb(153, 0, 0);
    }

    private void EliminarRegistro(String id)
    {
        clsNormaClave objNorCla = new clsNormaClave();
        objNorCla.NORMA = id;
        objNorCla.Eliminar();

        clsNorma objNorma = new clsNorma();
        objNorma.ID = id;
        objNorma.Eliminar();
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        if (!txtBuscar.Text.Equals("") || rbtnPalClave.Checked || (rbtnFecha.Checked && !txtFecha.Text.Equals("")))
            DataList1.DataSourceID = "ObjectDataSource1";
        else
            DataList1.DataSourceID = "ObjectDataSource3";
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        String fecha = this.txtFecha.Text;
        fecha = fecha.Replace('-', '/');        
        if (!txtBuscar.Text.Equals("") || rbtnPalClave.Checked || rbtnFecha.Checked)
        {
            bool bool_palabra = this.rbtnPalClave.Checked;
            bool bool_nombre = this.rbtnNombre.Checked;
            bool bool_numero = this.rbtnNumero.Checked;
            bool bool_fecha = this.rbtnFecha.Checked;
            String texto = this.txtBuscar.Text;
            String idPalabra = this.cbPalClave.SelectedValue;

            String pal = "0";
            String nom = "";
            String num = "";
            String fec = "1/1/0";
            if (bool_palabra)
            {
                if (idPalabra != null)
                {
                    pal = idPalabra;
                }
            }

            if (bool_nombre)
                nom = "%" + texto + "%";
            
            if (bool_numero)
                num = texto + "%";

            if (bool_fecha)
            {
                fecha = fecha.Substring(0, 10);
                fec = fecha;
            }
            if (this.chkTodos.Checked)
                nom = "%";
            
            Response.Redirect("reporte.aspx?nombre="+nom+"&idPalabra="+pal+"&fecha="+fec+"&numero="+num);
        }
        
    }
    protected void PopCalendar_SelectionChanged(object sender, EventArgs e)
    {
        this.Validate("RJS.PopCalendars");
    }

    protected void rbtnPalClave_CheckedChanged(object sender, EventArgs e)
    {
        cbPalClave.BorderColor = System.Drawing.Color.FromArgb(153, 0, 0);
        txtBuscar.BorderColor = System.Drawing.Color.White;
        txtFecha.BorderColor = System.Drawing.Color.White;
    }

    protected void rbtnNombre_CheckedChanged(object sender, EventArgs e)
    {
        cbPalClave.BorderColor = System.Drawing.Color.White;
        txtBuscar.BorderColor = System.Drawing.Color.FromArgb(153, 0, 0);
        txtFecha.BorderColor = System.Drawing.Color.White;
    }
    protected void rbtnNumero_CheckedChanged(object sender, EventArgs e)
    {
        cbPalClave.BorderColor = System.Drawing.Color.White;
        txtBuscar.BorderColor = System.Drawing.Color.FromArgb(153, 0, 0);
        txtFecha.BorderColor = System.Drawing.Color.White;

    }
    protected void rbtnFecha_CheckedChanged(object sender, EventArgs e)
    {
        cbPalClave.BorderColor = System.Drawing.Color.White;
        txtBuscar.BorderColor = System.Drawing.Color.White;
        txtFecha.BorderColor = System.Drawing.Color.FromArgb(153, 0, 0);
    }
}
