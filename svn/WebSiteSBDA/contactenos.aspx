<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contactenos.aspx.cs" Inherits="contactenos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <link href="common/css/sbda.css" type="text/css" rel="stylesheet" />
    <title>Buscador SBDA</title>
</head>
<body>
<div class="center2" >
    <form id="form1" runat="server">
    <div class="right">
        <table cellpadding="0" cellspacing="0" border="0" class="mainTable">
            <tr class="cyan">
                <td>
                    <asp:LinkButton ID="lnkLimpiar" runat="server" OnClick="lnkLimpiar_Click">Limpiar</asp:LinkButton></td>
                <td>
                    <asp:LinkButton ID="lnkBusqueda" runat="server" PostBackUrl="~/index.aspx">Busqueda</asp:LinkButton></td>
                <td>
                    <asp:LinkButton ID="lnkContactenos" runat="server" PostBackUrl="~/contactenos.aspx">Contactenos</asp:LinkButton></td>
                <td>
                    <asp:LinkButton ID="lnkSalir" runat="server" OnClick="lnkSalir_Click">Salir</asp:LinkButton></td>
                <td>
                    <asp:LinkButton ID="lnkAdministracion" runat="server" OnClick="lnkAdministracion_Click">Administracion</asp:LinkButton></td>
            </tr>
        </table>
     </div>
          <br />
          <img src="common/image/logo sbda.png" alt="SBDA" />
     <div class="contac">
        <asp:Label ID="lblMensaje1" runat="server"></asp:Label><br />
        <br />
        <table cellpadding="0" cellspacing="0" border="0" class="mainTable ">
            <tr >
                <td class="textAlignLeft" style="height: 237px">
                    <table cellpadding="0" cellspacing="0" border="0" class="mainTable4 ">
                        <tr class="label">
                            <td>
                                
                            </td>
                            <td class="leftdate">
                            <p>
                                    <label class="required"></label>
                                    <asp:Label ID="lblCampoRequerido" runat="server" Text="(*)Campos Requeridos"></asp:Label></p>
                            </td>
                        </tr>
                        <tr class="label">
                            <td class="textAlignLeft" style="height: 24px">
                                <p>
                                    <asp:Label ID="lblNombre" runat="server" Text="Nombres:"></asp:Label>&nbsp;</p>
                            </td>
                            <td class="controlContac left label" style="height: 24px">
                                <p>
                                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox><label class="required">*</label>
                                </p>
                            </td>
                        </tr>
                        <tr class="label">
                            <td class="textAlignLeft">
                                <p>
                                    <asp:Label ID="lblCorreo" runat="server" Text="Correo:"></asp:Label>&nbsp;</p>
                            </td>
                            <td class="controlContac left label">
                                <p>
                                    <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox><label class="required">*</label>
                                </p>
                            </td>
                        </tr>
                        <tr class="label">
                            <td class="textAlignLeft">
                                <p>
                                    <asp:Label ID="lblAsunto" runat="server" Text="Asunto:"></asp:Label>&nbsp;</p>
                            </td>
                            <td class="controlContac left">
                                <p>
                                    <asp:TextBox ID="txtAsunto" runat="server"></asp:TextBox><label class="required">*</label></p>
                            </td>
                        </tr>
                        <tr class="label">
                            <td class="textAlignLeft" style="height: 41px">
                                <p>
                                    <asp:Label ID="lblMensaje" runat="server" Text="Mensaje:"></asp:Label>&nbsp;</p>
                            </td>
                            <td class="controlContacLarge left" style="height: 41px">
                                <p>
                                    <asp:TextBox ID="txtMensaje" runat="server" TextMode="MultiLine"></asp:TextBox><label
                                        class="required">*</label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                           
                            <td >
                            
                                </td>
                            <td >
                              <p class="enviar1"> <asp:Button ID="btnEnviar" runat="server" OnClick="btnEnviar_Click" Text="" /></p>
                               <p class="cancelar1"><asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="" /></p>
                                    
                                
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="btnFloatRigth" colspan="2" style="height: 19px">
                                <p><asp:Label ID="lblInfo" runat="server" Text="El mensaje sera enviado al correo info@sbda.org.bo"></asp:Label></p></td>
                        </tr>
                    </table>
                    <asp:Label ID="lblError" runat="server" CssClass="messageError" ForeColor="#990000"></asp:Label></td>
            </tr>
        </table>
    
    </div>
    </form>
    <div class="footer">
        <p>&copy; 2010 SBDA <a  rel="nofollow" href="http://www.sbda.org.bo/" >www.sbda.org.bo</a></p>
        </div>
      </div>
</body>
</html>
