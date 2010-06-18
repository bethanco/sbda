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

public partial class admin_formNorma : System.Web.UI.Page
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

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        ListBox lstParametros = (ListBox)FormView1.FindControl("lstParametros");
        ListBox lstPalClaves = (ListBox)FormView1.FindControl("lstPalClaves");

        if (lstParametros.SelectedItem == null)
            return;
        
        ListItem obj = lstParametros.SelectedItem;
        if (!lstPalClaves.Items.Contains(obj))
        {
            lstPalClaves.Items.Add(obj);
        }
    }

    protected void btnRemoverTodo_Click(object sender, EventArgs e)
    {
        ListBox lstPalClaves = (ListBox)FormView1.FindControl("lstPalClaves");
        lstPalClaves.Items.Clear();        
    }

    protected void SubirDoc_Click(object sender, EventArgs e)
    {
        TextBox txtRuta = (TextBox)FormView1.FindControl("txtRuta");
        FileUpload doc = (FileUpload)FormView1.FindControl("fullDoc");
        if (doc.FileName.Equals(""))
            return;
        String ruta = "\\WebSiteSBDA\\doc\\" + doc.FileName;
        //String ruta = "\\sbda.org.bo\\doc\\" + doc.FileName;
        //String ruta = "\\doc\\" + doc.FileName;
        doc.SaveAs(Server.MapPath(ruta));
        txtRuta.Text = "~/doc/" + doc.FileName;
    }

    protected void btnInsertar_Click(object sender, EventArgs e)
    {
        DropDownList cbTipoNorma = (DropDownList)FormView1.FindControl("cbTipoNorma");
        TextBox txtFecha = (TextBox)FormView1.FindControl("txtFecha");
        TextBox txtNombre = (TextBox)FormView1.FindControl("txtNombre");
        TextBox txtNumero = (TextBox)FormView1.FindControl("txtNumero");
        TextBox txtRuta = (TextBox)FormView1.FindControl("txtRuta");
        RadioButtonList rbtnListNorma = (RadioButtonList)FormView1.FindControl("rbtnListNorma");
        RadioButtonList rbtnListEstado = (RadioButtonList)FormView1.FindControl("rbtnListEstado");
        Label lblMensaje = (Label)FormView1.FindControl("lblMensaje");

        clsNorma objNorma = new clsNorma();

        clsPNorma ti = new clsPNorma();
        objNorma.TIPO = cbTipoNorma.SelectedItem.Value + "";
        objNorma.URL = txtRuta.Text;

        if ((objNorma.URL.Contains(".")) && (!txtNombre.Text.Equals("")) && (!txtNumero.Text.Equals("")) && (!txtFecha.Equals("")) && (!txtRuta.Text.Equals("")) && (ValidarNumero(txtNumero.Text)))
        {
            //aqui inserto un registro
            objNorma.ID = this.IDEN;
            objNorma.NOMBRE = txtNombre.Text;
            objNorma.NUMERO = txtNumero.Text;
            
            objNorma.FECHAACT = DateTime.Today.Day + "/" + DateTime.Today.Month + "/" + DateTime.Today.Year;
            if (!txtFecha.Text.Equals(""))
                objNorma.FECHA = txtFecha.Text.Substring(0,10);
            else
                objNorma.FECHA = objNorma.FECHAACT;
            HttpCookie objCookie1 = Request.Cookies.Get("idUsuario");
            String idUsuario = objCookie1.Value;
            objNorma.USUARIO = idUsuario;
            objNorma.NORMA = rbtnListNorma.SelectedValue;
            objNorma.ESTADO = rbtnListEstado.SelectedValue;
            EliminarRegistrosDePalClaves();
            objNorma.Modificar();
            InsertarPalabrasClaves(this.IDEN);
            this.EnviarAlertas();
            Response.Redirect("listaNorma.aspx");
        }
        else
        {
            lblMensaje.Text = "Faltan campos por llenar, intente nuevamente.";
        }   
    }

    public void InsertarPalabrasClaves(String identificador)
    {
        ListBox lstPalClaves = (ListBox)FormView1.FindControl("lstPalClaves");
        int cant = lstPalClaves.Items.Count;
        clsNormaClave objNorCla = new clsNormaClave();
        for (int i = 0; i < cant; i++)
        {
            string idPalClave = lstPalClaves.Items[i].Value;
            objNorCla.NORMA = identificador;
            objNorCla.PALABRACLAVE = idPalClave;
            objNorCla.Insertar();
        }
    }

    public void EliminarRegistrosDePalClaves()
    {        
        clsNormaClave objNorCla = new clsNormaClave();
        objNorCla.NORMA = this.IDEN;
        objNorCla.Eliminar();
    }

    public void EnviarAlertas()
    {
        clsCliente objCliente = new clsCliente();
        DataSet dt = objCliente.ConsultarCorreos();
        int n = dt.Tables[0].Rows.Count;
        if (n > 0)
        {
            TextBox txtNombre = (TextBox)FormView1.FindControl("txtNombre");
            String cadenaCorreos = dt.Tables[0].Rows[0].ItemArray[0] + "";
            for (int i = 1; i < n; i++)
            {
                cadenaCorreos = cadenaCorreos + ", " + dt.Tables[0].Rows[i].ItemArray[0];
            }
            System.Net.Mail.MailMessage correo = new System.Net.Mail.MailMessage();
            correo.From = new System.Net.Mail.MailAddress("info@sbda.org.bo");
            correo.To.Add(cadenaCorreos);
            correo.Subject = "Modificacion de Norma publicada por SBDA";
            correo.Body = "SBDA acaba de modificar y publicar la norma " + txtNombre.Text + " en la plataforma de busqueda.";
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
