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

public partial class admin_formCliente : System.Web.UI.Page
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
        TextBox txtApellido = (TextBox)FormView1.FindControl("txtApellido");
        TextBox txtCuenta = (TextBox)FormView1.FindControl("txtCuenta");
        TextBox txtClave = (TextBox)FormView1.FindControl("txtClave");
        TextBox txtCorreo = (TextBox)FormView1.FindControl("txtCorreo");
        RadioButtonList rbtnList = (RadioButtonList)FormView1.FindControl("rbtnList");
        
        clsCliente objCliente = new clsCliente();
        objCliente.NOMBRE = txtNombre.Text;
        objCliente.APELLIDO = txtApellido.Text;
        objCliente.CUENTA = txtCuenta.Text;
        objCliente.CLAVE = txtClave.Text;
        objCliente.CORREO = txtCorreo.Text;
        if (rbtnList.SelectedValue.Equals("si"))
            objCliente.ESTADO = "si";
        else
            objCliente.ESTADO = "no";

        if ((this.IDEN != null) && (!objCliente.NOMBRE.Equals("")) && (!txtApellido.Text.Equals("")) && (!txtCuenta.Text.Equals("")) && (!txtClave.Text.Equals("")) && (!txtCorreo.Text.Equals("")) && (!rbtnList.SelectedValue.Equals("")) && (txtCorreo.Text.Contains(".") && (txtCorreo.Text.Contains("@"))))
        {
            //aqui modifico el registro
            objCliente.ID = this.IDEN;
            objCliente.Modificar();
            Response.Redirect("listaCliente.aspx");
        }
        else
        {
            Label lblMensaje = (Label)FormView1.FindControl("lblMensaje");
            lblMensaje.Text = "Faltan campos por llenar, intente nuevamente.";
        }
    }
}
