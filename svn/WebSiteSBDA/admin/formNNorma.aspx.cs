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

public partial class admin_formNNorma : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie objCookie2 = Request.Cookies.Get("flag");
        String flag = objCookie2.Value;
        if (objCookie2.Value.Equals("0"))
            Response.Redirect("~/login.aspx");

        this.CargarCombos();
    }

    protected void SubirDoc_Click(object sender, EventArgs e)
    {
        FileUpload doc = (FileUpload)FormView1.FindControl("fullDoc");
        if (doc.FileName.Equals(""))
            return;
        //String ruta = "\\WebSiteSBDA\\doc\\" + doc.FileName;
        String ruta = "\\doc\\" + doc.FileName;
        doc.SaveAs(Server.MapPath(ruta));
        this.txtRuta.Text = "~/doc/" + doc.FileName;
    }
    protected void btnInsertar_Click(object sender, EventArgs e)
    {
        clsNorma objNorma = new clsNorma();

        clsPNorma ti = new clsPNorma();
        DataSet d = ti.ConsultarPorNombre(cbTipoNorma.SelectedValue);
        objNorma.TIPO = d.Tables[0].Rows[0].ItemArray[0] + "";
        objNorma.URL = this.txtRuta.Text;

        if ((objNorma.URL.Contains(".")) && (!this.txtNombre.Text.Equals("")) && (!this.txtNumero.Text.Equals("")) && (!this.txtFecha.Text.Equals("")) && (!this.txtRuta.Text.Equals("")) && (ValidarNumero(this.txtNumero.Text)))
        {
            //aqui inserto un registro
            objNorma.NOMBRE = this.txtNombre.Text;
            objNorma.NUMERO = this.txtNumero.Text;
            String str = DateTime.Today.Month + "";
            if (str.Length == 1)
                str = "0" + str;
            objNorma.FECHAACT = DateTime.Today.Year + "" + str + "" + DateTime.Today.Day;

            if (!this.txtFecha.Text.Equals(""))
                objNorma.FECHA = this.txtFecha.Text;
            else
                objNorma.FECHA = objNorma.FECHAACT;

            String year = objNorma.FECHA.Substring(6, 4);
            String month = objNorma.FECHA.Substring(3, 2);
            String day = objNorma.FECHA.Substring(0, 2);
            objNorma.FECHA = year + "" + month + "" + day;
            HttpCookie objCookie1 = Request.Cookies.Get("idUsuario");
            String idUsuario = objCookie1.Value;
            objNorma.USUARIO = idUsuario;
            if (rbtnSi.Checked)
                objNorma.ESTADO = "si";
            else
                objNorma.ESTADO = "no";

            if (rbtnInfor.Checked)
                objNorma.NORMA = "1";
            else
            {
                if (rbtnCumpli.Checked)
                    objNorma.NORMA = "2";
                else
                    objNorma.NORMA = "3";
            }

            int identificador = objNorma.Insertar();
            InsertarPalabrasClaves(identificador);
            this.EnviarAlertas();
            Response.Redirect("listaNorma.aspx");
        }
        else
        {
            this.lblMensaje.Text = "Faltan campos por llenar, intente nuevamente.";
        }
    }

    public void InsertarPalabrasClaves(int identificador)
    {
        int cant = this.lstPalClaves.Items.Count;
        clsNormaClave objNorCla = new clsNormaClave();
        for (int i = 0; i < cant; i++)
        {
            string idPalClave = this.lstPalClaves.Items[i].Value;
            objNorCla.NORMA = "" + identificador;
            objNorCla.PALABRACLAVE = idPalClave;
            objNorCla.Insertar();
        }
    }

    private void CargarCombos()
    {
        clsPNorma objPNorma = new clsPNorma();
        DataSet d = objPNorma.ConsultarTodosLosRegistros();
        int n = d.Tables[0].Rows.Count;
        for (int i = 0; i < n; i++)
        {
            cbTipoNorma.Items.Add((String)d.Tables[0].Rows[i].ItemArray[2]);
        }
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        if (lstParametros.SelectedItem == null)
            return;

        ListItem obj = this.lstParametros.SelectedItem;
        if (!lstPalClaves.Items.Contains(obj))
        {
            this.lstPalClaves.Items.Add(obj);
        }
    }

    protected void btnRemoverTodo_Click(object sender, EventArgs e)
    {
        this.lstPalClaves.Items.Clear();
    }

    public void EnviarAlertas()
    {
        clsCliente objCliente = new clsCliente();
        DataSet dt = objCliente.ConsultarCorreos();
        int n = dt.Tables[0].Rows.Count;
        if (n > 0)
        {
            String cadenaCorreos = dt.Tables[0].Rows[0].ItemArray[0] + "";
            for (int i = 1; i < n; i++)
            {
                cadenaCorreos = cadenaCorreos + ", " + dt.Tables[0].Rows[i].ItemArray[0];
            }
            System.Net.Mail.MailMessage correo = new System.Net.Mail.MailMessage();
            correo.From = new System.Net.Mail.MailAddress("info@sbda.org.bo");
            correo.To.Add(cadenaCorreos);
            correo.Subject = "Nueva Norma publicada por SBDA";
            correo.Body = "SBDA acaba de publicar la norma " + this.txtNombre.Text + " en la plataforma de busqueda.";
            correo.IsBodyHtml = false;
            correo.Priority = System.Net.Mail.MailPriority.Normal;
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
            smtp.Host = "mail.sbda.org.bo";
            //smtp.Port = 25;
            //smtp.Host = "servidor de correo";
            smtp.Credentials = new System.Net.NetworkCredential("info@sbda.org.bo", "abc123ABC");
            //smtp.EnableSsl = false;
            try
            {
                smtp.Send(correo);
            }
            catch (Exception ex)
            {
                //ex.Message;
            }
        }
    }

    protected void PopCalendar_SelectionChanged(object sender, EventArgs e)
    {
        this.Validate("RJS.PopCalendars");
    }

    public bool ValidarNumero(String num)
    {
        int i = 0;
        while (i < num.Length)
        {
            String c = num[i] + "";
            if (c != "0" && c != "1" && c != "2" && c != "3" && c != "4" && c != "5" && c != "6" && c != "7" && c != "8" && c != "9")
                break;
            i++;
        }
        if (i == num.Length)
            return true;
        else
            return false;
    }
}
