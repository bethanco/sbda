<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dataRecovery.aspx.cs" Inherits="dataRecovery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link href="common/css/sbda.css"  type="text/css" rel="stylesheet" />
    <title>Buscador SBDA</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="center">
    <img src="common/image/logosbda2.jpg" alt="SBDA" />
    
        <table cellpadding="0" cellspacing="0" border="0" class="mainTable tabla">
            <tr class="title">
                <td>
                    <span>RECUPERAR DATOS</span>
                 </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr class="cyan1">
               <td></td>
                <td >
                    <asp:Label ID="lblInfo" runat="server" Text="Ingrese su cuenta de correo electronico."></asp:Label></td>
           <td></td>
            </tr>
            <tr class="label1">
                
                <td style="width: 160px;">
                    <asp:Label ID="lblCorreo" runat="server" Text="Correo:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox></td>
                    <td></td>
            </tr>
            <tr>
               <td class="enviar"> <asp:Button ID="btnEnviar" runat="server" Text="" OnClick="btnEnviar_Click" /></td>
                <td class="cancelar">
                    
                    <asp:Button ID="btnCancelar" runat="server" Text="" OnClick="btnCancelar_Click" /></td>
           <td></td>
            </tr>
            <tr>
             
                <td >
                    <asp:Label ID="lblError" runat="server" CssClass="messageError" ForeColor="#990000"></asp:Label></td>
            </tr>
        </table>
         <div class="footer" style=" display:block">
        <p class="foot"> &copy; 2010 <img class="nofoot" alt="SBDA"  src="common/image/footer_logo.jpg"/><a rel="nofollow" href="http://www.sbda.org.bo/" >www.sbda.org.bo</a></p>
        </div>
    </div>
    </form>
</body>
</html>
