<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formNPNorma.aspx.cs" Inherits="admin_formNPNorma" %>

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
    <div  style=" text-align:center; padding-left:32%">
        <table cellpadding="0" cellspacing="0" border="0" class="mainTable " style="margin-left:100px; width: 658px;">
            <tr class="label">
                 <td style="width: 128px">
                        </td>
                        <td class="leftdate" style="width: 230px" >
                    <p> <asp:Label ID="lblTitulo" runat="server" Text="Nuevo Registro"></asp:Label></p></td>
            </tr>
            <tr class="label">
                <td style="width: 128px; height: 24px" class="textAlignLeft">
                    <asp:Label ID="Label1" runat="server" Text="Nombre:"></asp:Label></td>
                <td class="controlContac left label" style="height: 24px; width:230px">
                    <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("NOMBRE") %>' MaxLength="49"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 128px">
                </td>
                <td style="width:230px">
                   <p class="insertar"> <asp:Button ID="btnInsertar" runat="server" OnClick="btnInsertar_Click" Text="" /></p>
                   <p class="cancelar1"> <asp:Button ID="btnCancelar" runat="server" PostBackUrl="~/admin/listaPNorma.aspx"
                        Text="" /></p></td>
            </tr>
            <tr>
                <td style="width: 128px">
                </td>
                <td style="width: 230px">
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
