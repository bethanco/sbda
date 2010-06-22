<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formNCliente.aspx.cs" Inherits="admin_formNCliente" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
   <link href="../common/css/sbda.css" type="text/css" rel="stylesheet" />
    <title>Buscador SBDA</title>
</head>
<body>
<div class="center" >
    <form id="form1" runat="server"><br />
          <img src="../common/image/logosbda2.jpg" s alt="SBDA" />
    <div  style=" text-align:center; padding-left:32%">
        <table cellpadding="0" cellspacing="0" border="0" class="mainTable " style="margin-left:100px; width: 694px;">
            <tr class="label">
               <td style="width: 69px">
                        </td>
                <td class="leftdate" style="width: 216px" >
                    <p>  <asp:Label ID="lblTitulo" runat="server" Text="Nuevo Registro"></asp:Label></p></td>
            </tr>
            <tr class="label">
                
                <td style="width: 69px; height: 24px" class="textAlignLeft">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label></td>
                <td class="controlContac left label" style="height: 24px; width: 216px;">
                    <asp:TextBox ID="txtNombre" runat="server" MaxLength="50"></asp:TextBox></td>
            </tr>
            <tr class="label">
                <td class="textAlignLeft" style="height: 24px; width: 69px;">
                    <asp:Label ID="lblApellido" runat="server" Text="Apellido:"></asp:Label></td>
                <td class="controlContac left label" style="height: 24px; width: 216px;">
                    <asp:TextBox ID="txtApellido" runat="server" MaxLength="50"></asp:TextBox></td>
            </tr>
            <tr class="label">
                <td class="textAlignLeft" style="height: 24px; width: 69px;">
                    <asp:Label ID="lblCuenta" runat="server" Text="Nombre Usuario:"></asp:Label></td>
                <td class="controlContac left label" style="height: 24px; width: 216px;">
                    <asp:TextBox ID="txtCuenta" runat="server" MaxLength="50"></asp:TextBox></td>
            </tr>
            <tr class="label">
                <td class="textAlignLeft" style="height: 24px; width: 69px;">
                    <asp:Label ID="lblClave" runat="server" Text="Clave:"></asp:Label></td>
                <td class="controlContac left label" style="height: 24px; width: 216px;">
                    <asp:TextBox ID="txtClave" runat="server" Width="149px" MaxLength="20"></asp:TextBox></td>
            </tr>
            <tr class="label">
                <td class="textAlignLeft" style="height: 24px; width: 69px;">
                    <asp:Label ID="lblCorreo" runat="server" Text="Correo:"></asp:Label></td>
                <td class="controlContac left label" style="height: 24px; width: 216px;">
                    <asp:TextBox ID="txtCorreo" runat="server" MaxLength="50"></asp:TextBox></td>
            </tr>
            <tr class="label">
                <td class="textAlignLeft" style="width: 69px; height: 24px">
                    <asp:Label ID="lblEmpresa" runat="server" Text="Empresa:"></asp:Label></td>
                <td class="controlContac left label" style="width: 216px; height: 24px">
                    <asp:TextBox ID="txtEmpresa" runat="server" MaxLength="50"></asp:TextBox></td>
            </tr>
            <tr class="label">
                <td class="textAlignLeft" style="width: 69px; height: 65px">
                    <asp:Label ID="lblUrl" runat="server" Text="Lista Normas:"></asp:Label></td>
                <td class="controlContac left label" style="width: 216px; height: 65px">
                    <asp:TextBox ID="txtLista" runat="server" MaxLength="100" ReadOnly="True"></asp:TextBox></td>
                    <td style="height: 65px">
                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="galId" DefaultMode="Insert">
                            <InsertItemTemplate>
                                <asp:FileUpload ID="fullDoc" runat="server" Height="23px" Width="270px" />
                                <br />
                            </InsertItemTemplate>
                        </asp:FormView>
                        <asp:LinkButton ID="SubirDoc" runat="server" CssClass="cyan" OnClick="SubirDoc_Click">Subir Documento</asp:LinkButton></td>
            </tr>
            <tr class="label">
                <td class="textAlignLeft" style="height: 24px; width: 69px;">
                    <asp:Label ID="lblActivo" runat="server" Text="Activo:"></asp:Label></td>
                <td style="height: 24px; width: 216px;" class="aux" >
                    &nbsp;<asp:RadioButton ID="rbtnSi" runat="server" GroupName="activo" Text="Si" Checked="True" />
                    <asp:RadioButton ID="rbtnNo" runat="server" GroupName="activo" Text="No" /></td>
            </tr>
            <tr>
                <td style="width: 69px">
                </td>
                <td style="width: 216px">
                   <p class="insertar"> <asp:Button ID="btnInsertar" runat="server" OnClick="btnInsertar_Click" Text="" /></p>
                    <p class="cancelar1"><asp:Button ID="btnCancelar" runat="server" PostBackUrl="~/admin/listaCliente.aspx"
                        Text="" /></p></td>
            </tr>
            <tr>
                <td style="width: 69px; height: 19px;">
                </td>
                <td style="height: 19px; width: 216px;">
                </td>
                <td style="height: 19px">
                    <asp:Label ID="lblMensaje" runat="server" Width="392px" ForeColor="#990000"></asp:Label></td>
            </tr>
        </table>
    
    </div>
    </form>
    <div class="footer" style=" display:block">
        <p class="foot"> &copy; 2010 <img class="nofoot" alt="SBDA"  src="../common/image/footer_logo.jpg"/><a rel="nofollow" href="http://www.sbda.org.bo/" >www.sbda.org.bo</a></p>
        </div>
      </div>
</body>
</html>
