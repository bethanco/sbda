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

public partial class contactenos : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie objCookie2 = Request.Cookies.Get("flag");
        String flag = objCookie2.Value;
        if (objCookie2.Value.Equals("0"))
            Response.Redirect("login.aspx");
    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        String nom = this.txtNombre.Text;
        String mail = this.txtCorreo.Text;
        String asu = this.txtAsunto.Text;
        String des = this.txtMensaje.Text;
        if ((nom != "") && (mail.Contains("@") && mail.Contains(".")) && (asu != "") && (des != ""))
        {
            System.Net.Mail.MailMessage correo = new System.Net.Mail.MailMessage();
            correo.From = new System.Net.Mail.MailAddress(mail);
            correo.To.Add("info@sbda.org.bo");
            correo.Subject = asu;
            correo.Body = "Nombre: "+nom+", "+des;
            correo.IsBodyHtml = false;
            correo.Priority = System.Net.Mail.MailPriority.Normal;
            //
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
            smtp.Host = "mail.sbda.org.bo";
            //smtp.Port = 25;
            //smtp.Host = "servidor de correo";
            smtp.Credentials = new System.Net.NetworkCredential("info@sbda.org.bo", "abc123ABC");
            //smtp.EnableSsl = false;
            try
            {
                smtp.Send(correo);
                Response.Redirect("contactenos.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = "ERROR: " + ex.Message;
            }
        }
        else
        {
            lblError.Text = "Ingrese nuevamente los datos.";
        }
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
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
            this.lblMensaje1.Text = "Usted no tiene permiso para acceder";
        }
    }
    protected void lnkLimpiar_Click(object sender, EventArgs e)
    {
        Response.Redirect("contactenos.aspx");
    }
    protected void lnkSalir_Click(object sender, EventArgs e)
    {
        //FormsAuthentication.SignOut();
        Response.Redirect("login.aspx");
    }
}
