<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listaPalabraClave.aspx.cs" Inherits="admin_listaPalabraClave" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
   <link href="../common/css/sbda.css" type="text/css" rel="stylesheet" />
    <title>Buscador SBDA</title>
</head>
<body>
<div class="center3" >
    <form id="form1" runat="server">
    <div  class="right">
        <table cellpadding="0" cellspacing="0" border="0" class="mainTable2">
            <tr class="cyan">
                <td>
                    <asp:HyperLink ID="lnkGestionNor" runat="server" NavigateUrl="~/admin/listaNorma.aspx">Gestion de Normas</asp:HyperLink></td>
                <td>
                    <asp:HyperLink ID="lnkGestionAdmin" runat="server" NavigateUrl="~/admin/listaAdministrador.aspx">Gestion de Administradores</asp:HyperLink></td>
                <td>
                    <asp:HyperLink ID="lnkGestionCli" runat="server" NavigateUrl="~/admin/listaCliente.aspx">Gestion de Clientes</asp:HyperLink></td>
                <td>
                    <asp:HyperLink ID="lnkGestionTiposNor" runat="server" NavigateUrl="~/admin/listaPNorma.aspx">Gestion de Tipos de Normas</asp:HyperLink></td>
                <td>
                    <asp:HyperLink ID="lnkPalClave" runat="server" NavigateUrl="~/admin/listaPalabraClave.aspx">Gestion de Palabras Clave</asp:HyperLink></td>
                <td style="width: 3px">
                    <asp:HyperLink ID="lnkSalir" runat="server" NavigateUrl="~/index.aspx">Salir</asp:HyperLink></td>
            </tr>
        </table>
        </div>
        <table cellpadding="0" cellspacing="0" border="0" class="mainTable " style="margin-left:443px">
        <tr class="left"><td colspan="3" style="width: 143px" class="label1 title3"><br />
        <img src="../common/image/logo sbda.png" alt="SBDA" style=" margin-top:0px" />
            </td></tr></table>
         <br />
          <br />
        <table cellpadding="0" cellspacing="0" border="0" class="mainTable" style="width: 332px">
            <tr class="left">
                <td colspan="3" style="width: 143px" class="label1 title3">  <asp:Label ID="lblTitulo" runat="server" Text="Lista de Palabras Clave" Width="133px"></asp:Label>
                    </td>
                <td class="cyan" style="width: 40px"><asp:HyperLink ID="lnkNuevo" runat="server" NavigateUrl="~/admin/formNPalabraClave.aspx"
                        Width="47px">Nuevo</asp:HyperLink>
                </td>
                <td style="width: 270px"><asp:Label ID="lblMensaje" runat="server" ForeColor="#990000"></asp:Label>
                </td>
            </tr>
           
              </table>
        <table  cellpadding="0" cellspacing="0" border="0" class="mainTable " style="width: 332px">
            <tr  style="text-align:left; background:#b9e85c;  height:19px;
padding-top:5px">
                <td style="width: 35px">
                    <asp:Label ID="lblTitNro" runat="server" Font-Bold="True" Text="N°"></asp:Label></td>
                <td style="width: 157px">
                    <asp:Label ID="lblTitNombre" runat="server" Font-Bold="True" Text="Nombre"></asp:Label></td>
                <td style="width: 687px">
                </td>
                <td style="width: 180px">
                </td>
            </tr>
            <tr>
                <td colspan="3" rowspan="2">
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource1">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0"  class="mainTable3 ">
                                <tr>
                                    <td style="width: 22px">
                                        <asp:Label ID="lblNro" runat="server" Text='<%# Eval("NRO") %>'></asp:Label></td>
                                    <td style="width: 165px">
                                        <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("NOMBRE") %>'></asp:Label></td>
                                    <td class="cyan" style="width: 60px">
                                        <asp:HyperLink ID="lnkEditar" runat="server" NavigateUrl='<%# "~/admin/formPalabraClave.aspx?id=" + Eval("ID") %>'
                                            Width="85px">Editar</asp:HyperLink></td>
                                    <td class="cyan" style="width: 60px">
                                        <asp:HyperLink ID="lnkEliminar" runat="server" NavigateUrl='<%# "~/admin/listaPalabraClave.aspx?id=" + Eval("ID") %>'>Eliminar</asp:HyperLink></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ConsultarTodosLosRegistros"
                        TypeName="clsPPalClave"></asp:ObjectDataSource>
                </td>
            </tr>
        </table>
   
    </form>
     <div class="footer" style=" display:block">
        <p class="foot"> &copy; 2010 <img class="nofoot" alt="SBDA"  src="../common/image/footer_logo.jpg"/><a rel="nofollow" href="http://www.sbda.org.bo/" >www.sbda.org.bo</a></p>
        </div>
    </div>
</body>
</html>
