<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link href="common/css/sbda.css" type="text/css" rel="stylesheet" />
    <title>Buscador SBDA</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="center">
        <img src="common/image/logosbda2.jpg" alt="SBDA" />
        
        <table cellpadding="0" cellspacing="0" border="0" class="mainTable tabla">
            <tr class="title">
                <td style="width: 160px" >
                  <span>IDENTIFICACION  DE</span>
                </td>
                <td class="left">
                  <span>USUARIO</span>
                </td>
                <td><span></span>
                </td>
            </tr>
            
            <tr class="label">
                <td style="width: 160px;">
                    <asp:Label ID="lblCuenta" runat="server" Text="Usuario:"></asp:Label></td>
                <td style="width: 150px;">
                    <asp:TextBox ID="txtCuenta" runat="server"></asp:TextBox></td>
                    <td><span></span>
                </td>
            </tr>
            <tr class="label">
               
                <td style="width: 160px;">
                    <asp:Label ID="lblContrasena" runat="server" Text="Contraseña:"></asp:Label></td>
                <td style="width: 170px;">
                    <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password"></asp:TextBox></td>
                      <td><span></span>
                </td>
            </tr>
            <tr class="butom">
                
               <td style="width: 160px; height: 25px;"></td>
                <td style="height: 25px">
                    <asp:Button ID="btnIngresar" runat="server" OnClick="btnIngresar_Click" Text="" />
                </td><td style="height: 25px"><span></span></td>
            </tr>
            <tr class="butom">
                <td style="width: 160px">
                    <asp:Label ID="lblError" runat="server" CssClass="messageError" ForeColor="#990000"></asp:Label></td>
                <td>
                <span></span>
                </td>
            </tr>
            
            <tr class="recovery">
                <td style="width: 160px"></td>
                <td class="cyan">
                <asp:Label ID="Label1" runat="server" Text="Olvido Alguno de sus datos?."></asp:Label> <br />
                    <asp:LinkButton ID="lnkRecuperarDatos" runat="server" OnClick="lnkRecuperarDatos_Click"> pulse aqui.</asp:LinkButton></td><td>
                </td>
            </tr>
        </table>
         <div class="footer" style=" display:block">
        <p class="foot"> &copy; 2010 <img class="nofoot" alt="SBDA"  src="common/image/footer_logo.jpg"/><a rel="nofollow" href="http://www.sbda.org.bo/" >www.sbda.org.bo</a></p>
        </div>
    </div>
    </form>
</body>
</html>
