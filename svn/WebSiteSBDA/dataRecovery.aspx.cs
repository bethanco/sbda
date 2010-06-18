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

public partial class dataRecovery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        clsCliente objCliente = new clsCliente();
        DataSet dt = objCliente.ConsultarDatos(this.txtCorreo.Text);
        int n = dt.Tables[0].Rows.Count;
        if (n > 0)
        {
            String nombre = dt.Tables[0].Rows[0].ItemArray[0] + "";
            String apellido = dt.Tables[0].Rows[0].ItemArray[1] + "";
            String cuenta = dt.Tables[0].Rows[0].ItemArray[2] + "";
            String clave = dt.Tables[0].Rows[0].ItemArray[3] + "";

            System.Net.Mail.MailMessage correo = new System.Net.Mail.MailMessage();
            correo.From = new System.Net.Mail.MailAddress("info@sbda.org.bo");
            correo.To.Add(this.txtCorreo.Text);
            correo.Subject = "Datos de acceso para SBDA";
            correo.Body = nombre + " " + apellido + ", Cuenta: " + cuenta + ", Clave: " + clave;
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
                Response.Redirect("login.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = "ERROR: " + ex.Message;
            }
        }
        else
        {
            this.lblError.Text = "Inserte los datos nuevamente.";
        }
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}
