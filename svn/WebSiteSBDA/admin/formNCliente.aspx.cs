﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class admin_formNCliente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie objCookie2 = Request.Cookies.Get("flag");
        String flag = objCookie2.Value;
        if (objCookie2.Value.Equals("0"))
            Response.Redirect("~/login.aspx");
    }

    protected void SubirDoc_Click(object sender, EventArgs e)
    {
        FileUpload doc = (FileUpload)FormView1.FindControl("fullDoc");
        if (doc.FileName.Equals(""))
            return;
        //String ruta = "\\WebSiteSBDA\\listas\\" + doc.FileName;
        //String ruta = "\\sbda.org.bo\\listas\\" + doc.FileName;
        String ruta = "\\listas\\" + doc.FileName;
        doc.SaveAs(Server.MapPath(ruta));
        this.txtLista.Text = "~/listas/" + doc.FileName;
    }

    protected void btnInsertar_Click(object sender, EventArgs e)
    {
        //CLIENTE 2
        clsUsuario objUsuario = new clsUsuario();
        objUsuario.TIPOUSUARIO = "2";
        int n = objUsuario.Insertar();

        clsCliente objCliente = new clsCliente();
        if ((!this.txtNombre.Text.Equals("")) && (!this.txtApellido.Text.Equals("")) && (!this.txtCuenta.Text.Equals("")) && (!this.txtClave.Text.Equals("")) && (!this.txtCorreo.Text.Equals("")) && (!this.txtEmpresa.Text.Equals("")) && (!this.txtLista.Text.Equals("")) && ((this.rbtnSi.Checked) || (this.rbtnNo.Checked)))
        {
            //aqui inserto un registro
            objCliente.ID = n +"";
            objCliente.NOMBRE = this.txtNombre.Text;
            objCliente.APELLIDO = this.txtApellido.Text;
            objCliente.CUENTA = this.txtCuenta.Text;
            objCliente.CLAVE = this.txtClave.Text;
            objCliente.CORREO = this.txtCorreo.Text;
            objCliente.EMPRESA = this.txtEmpresa.Text;
            objCliente.URL = this.txtLista.Text;
            if (this.rbtnSi.Checked)
                objCliente.ESTADO = "si";
            else
                objCliente.ESTADO = "no";
            objCliente.Insertar();            
            Response.Redirect("listaCliente.aspx");
        }
        else
        {
            this.lblMensaje.Text = "Faltan campos por llenar, intente nuevamente.";
        }
    }
}
