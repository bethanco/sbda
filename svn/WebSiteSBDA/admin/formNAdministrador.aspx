<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formNAdministrador.aspx.cs" Inherits="admin_formNAdministrador" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link href="../common/css/sbda.css" type="text/css" rel="stylesheet" />
    <title>Buscador SBDA</title>
</head>
<body>
<div class="center" >
    <form id="form1" runat="server">
    <br />
          <img src="../common/image/logo sbda.png" alt="SBDA" />
    <div style=" text-align:center; padding-left:32%">
        <table cellpadding="0" cellspacing="0" border="0" class="mainTable " style="width: 652px">
            <tr class="label">
                <td style="width: 95px">&nbsp;&nbsp;
                </td>
                <td class="leftdate" style="width: 204px; float:right"><p>
                    <asp:Label ID="lblTitulo"  CssClass="required" runat="server" Text="Nuevo Registro"></asp:Label></p></td>
            </tr>
            <tr class="label">
                
                <td  style="width: 95px; height: 24px" class="textAlignLeft">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label></td>
                <td class="controlContac left label" style="height: 24px; width:204px">
                    <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("NOMBRE") %>' MaxLength="50"></asp:TextBox>
                    </td>
            </tr>
            <tr class="label">
                
                <td  class="textAlignLeft" style="height: 24px; width: 95px;">
                    <asp:Label ID="lblApellido" runat="server" Text="Apellido:"></asp:Label></td>
                <td class="controlContac left label" style="height: 24px; width:204px">
                    <asp:TextBox ID="txtApellido" runat="server" MaxLength="50"></asp:TextBox>
                    </td>
            </tr>
            <tr class="label">
                
                <td class="textAlignLeft" style="height: 24px; width: 95px;">
                    <asp:Label ID="lblCuenta" runat="server" Text="Nombre Usuario:"></asp:Label></td>
                <td class="controlContac left label" style="height: 24px; width:204px">
                    <asp:TextBox ID="txtCuenta" runat="server" MaxLength="50"></asp:TextBox>
                    </td>
            </tr>
            <tr class="label">
                
                <td class="textAlignLeft" style="height: 24px; width: 95px;">
                    <asp:Label ID="lblClave" runat="server" Text="Clave:"></asp:Label></td>
                <td class="controlContac left label" style="height: 24px; width:204px">
                    <asp:TextBox ID="txtClave" runat="server" MaxLength="20"></asp:TextBox>
                    </td>
            </tr>
            <tr >
               
                <td style="width: 95px">
                        </td>
                 <td style="width:204px">
                    <p class="insertar">   <asp:Button ID="btnInsertar" runat="server" OnClick="btnInsertar_Click" Text="" /></p>
                   <p class="cancelar1"> <asp:Button ID="btnCancelar" runat="server" PostBackUrl="~/admin/listaAdministrador.aspx"
                        Text="" /></p></td>
            </tr>
            <tr>
                <td style="width: 95px">
                </td>
                <td style="width: 204px">
                </td>
                <td>
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
