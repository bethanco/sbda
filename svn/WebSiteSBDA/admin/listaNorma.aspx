<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listaNorma.aspx.cs" Inherits="admin_listaNorma" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar.Ajax.Net" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
    <%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
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
        <br />
        <img src="../common/image/logosbda2.jpg"  alt="SBDA" />
        <br />
          <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
        </asp:ScriptManager>
        <table cellpadding="0" cellspacing="0" border="0" class="mainTable ">
            <tr class="label">
                <td style="width: 15px">
                </td>
                <td colspan="1" >
                    <asp:Label ID="lblBuscar" runat="server" Text="Busqueda"></asp:Label></td>
                <td colspan="3">
                <asp:TextBox ID="txtBuscar" runat="server" Width="219px" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="buscar">
                <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="" CommandName="Alternating" />
                </td>
                <td style="width: 472px">
                </td>
                <td style="width: 409px">
                </td>
                <td style="width: 461px">
                </td>
            </tr>
             </table>
            <table cellpadding="0" cellspacing="0" border="0" class="mainTable5 " >
            <tr class="enlinea">
            <td style="width: 172px">&nbsp;
                </td>
                <td class="label1 busca" style="width: 90px">
                    <asp:Label ID="lblBusquedaPor" runat="server" Text="Busqueda Por:"></asp:Label></td>
                    
                <td class="left1 clave" style="width: 104px">
                    <asp:RadioButton ID="rbtnPalClave" runat="server" GroupName="buscar" Text="Palabra Clave" Checked="True" AutoPostBack="True" OnCheckedChanged="rbtnPalClave_CheckedChanged" /></td>
                <td class="left1 nombre" style="width: 70px">
                    <asp:RadioButton ID="rbtnNombre" runat="server" GroupName="buscar" Text="Nombre" AutoPostBack="True" OnCheckedChanged="rbtnNombre_CheckedChanged" /></td>
                <td class="left1 numero" style="width: 90px">
                    <asp:RadioButton ID="rbtnNumero" runat="server" GroupName="buscar" Text="Numero" AutoPostBack="True" OnCheckedChanged="rbtnNumero_CheckedChanged" /></td>
                <td class="left1 fecha" style="width: 180px">
                    <asp:RadioButton ID="rbtnFecha" runat="server" GroupName="buscar" Text="Fecha" AutoPostBack="True" OnCheckedChanged="rbtnFecha_CheckedChanged" /></td>
            
                 
            </tr>
            <tr>
            <td >
                </td>
                <td style="width: 104px; top:309px" class="ambiente2">
                    <asp:DropDownList ID="cbPalClave" runat="server" Width="104px" DataSourceID="ObjectDataSource2" DataTextField="NOMBRE" DataValueField="ID" AutoPostBack="True">
                    </asp:DropDownList></td>
                <td style="width: 70px">
                </td>
                <td style="width: 70px">
                </td>
                <td style="width: 160px" class="calendario2">
                    &nbsp;<asp:TextBox ID="txtFecha" runat="server" Width="89px" ReadOnly="True" AutoPostBack="True"></asp:TextBox>
                    <rjs:PopCalendar ID="PopCalendar1" runat="server" AutoPostBack="false" Control="txtFecha"
                        OnSelectionChanged="PopCalendar_SelectionChanged" ValidationGroup="RJS.PopCalendars" /><br /><span style="color: rgb(153, 0, 0)">Haga click en el icono ^ </span>
                </td>
                  <td style="width: 50px">
                    </td>
            </tr>
            <tr>
                <td style="width: 172px; height: 58px;">
                    &nbsp;<asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="ConsultarTodosLosRegistros"
                        TypeName="clsPPalClave"></asp:ObjectDataSource>
                </td>
                <td style="width: 134px; height: 58px;">
                </td>
                <td style="width: 111px; height: 58px;">
                </td>
            </tr>
           
        </table>
        <br />
        <table style=" width:762px" cellpadding="0" cellspacing="0" border="0" class="mainTable2 ">
           
            <tr class="left">
                <td colspan="3" style="width: 143px"  class="label1 title3">
                    <asp:Label ID="lblTitulo" runat="server" Text="Lista de Normas"></asp:Label></td>
                  <td class="cyan" style="width: 40px">
                    <asp:HyperLink ID="lnkNuevo" runat="server" NavigateUrl="~/admin/formNNorma.aspx"
                        >Nuevo</asp:HyperLink></td>
                      
                <td style="width: 103px">
                </td>
            </tr>
            </table>
        <br />
        <table  style=" width:762px" cellpadding="0" cellspacing="0" border="0" class="mainTable2 ">
            <tr style="text-align:left; background:#b9e85c; width:762px; height:30px">
                <td style="width: 22px">
                </td>
                <td style="width: 42px">
                    <asp:Label ID="lblTitNro" runat="server" Font-Bold="True" Text="N°"></asp:Label></td>
                <td style="width: 186px">
                    <asp:Label ID="lblTitNombre" runat="server" Font-Bold="True" Text="Nombre"></asp:Label></td>
                <td style="width: 90px">
                    <asp:Label ID="lblTitNorma" runat="server" Font-Bold="True" Text="Norma"></asp:Label></td>
                <td  style="width: 80px">
                    <asp:Label ID="lblTitTipo" runat="server" Font-Bold="True" Text="Tipo"></asp:Label></td>
                <td style="width:153px">
                    <asp:Label ID="lblTitActualizacion" runat="server" Font-Bold="True" Text="Actualizacion"></asp:Label></td>
                <td style="width: 177px">
                    <asp:Label ID="lblTitDisponible" runat="server" Font-Bold="True" Text="Disponible"></asp:Label></td>
                <td style="width: 60px">
                </td>
                <td style="width: 60px">
                </td>
            </tr>
            <tr>
                <td colspan="9" rowspan="1">
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource3">
                        <ItemTemplate>
                            <table  cellpadding="0" cellspacing="0" border="0"  class="mainTable3 ">
                                <tr>
                                    
                                    <td style="width: 22px">
                                        <asp:Label ID="lblNro" runat="server" Text='<%# Eval("NRO") %>'></asp:Label></td>
                                    <td style="width: 42px">
                                        <asp:Label ID="lblNumero" runat="server" Text='<%# Eval("NUMERO") %>'></asp:Label></td>
                                    <td style="width:186px">
                                        <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("NOMBRE") %>'></asp:Label></td>
                                    <td style="width: 90px">
                                        <asp:Label ID="lblNorma" runat="server" Text='<%# Eval("NORMA") %>'></asp:Label></td>
                                    <td style="width: 80px">
                                        <asp:Label ID="lblTipo" runat="server" Text='<%# Eval("TIPO") %>'></asp:Label></td>
                                    <td style="width:153px">
                                        <asp:Label ID="lblActualizacion" runat="server" Text='<%# Eval("FECHA") %>'></asp:Label></td>
                                    <td style="width: 177px">
                                        <asp:Label ID="lblDisponible" runat="server" Text='<%# Eval("ESTADO") %>'></asp:Label></td>
                                    <td class="cyan" style="width: 60px">
                                        <asp:HyperLink ID="lnkEditar" runat="server" NavigateUrl='<%# "~/admin/formNorma.aspx?id=" + Eval("ID") %>'
                                            Width="51px">Editar</asp:HyperLink></td>
                                    <td class="cyan" style="width: 60px">
                                        <asp:HyperLink ID="lnkEliminar" runat="server" NavigateUrl='<%# "~/admin/listaNorma.aspx?id=" + Eval("ID") %>'>Eliminar</asp:HyperLink></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList><asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="ConsultarTodosLosRegistros"
                        TypeName="clsNorma"></asp:ObjectDataSource>
                    &nbsp; &nbsp;&nbsp;&nbsp;
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ConsultarBusquedaAvanzada"
                        TypeName="clsNorma" OldValuesParameterFormatString="original_{0}">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="rbtnPalClave" Name="bool_palabra" PropertyName="Checked"
                                Type="String" />
                            <asp:ControlParameter ControlID="cbPalClave" Name="idPalabra" PropertyName="SelectedValue"
                                Type="String" />
                            <asp:ControlParameter ControlID="rbtnNombre" Name="bool_nombre" PropertyName="Checked"
                                Type="String" />
                            <asp:ControlParameter ControlID="rbtnNumero" Name="bool_numero" PropertyName="Checked"
                                Type="String" />
                            <asp:ControlParameter ControlID="rbtnFecha" Name="bool_fecha" PropertyName="Checked"
                                Type="String" />
                            <asp:ControlParameter ControlID="txtFecha" Name="fecha" PropertyName="Text"
                                Type="String" DefaultValue="&quot;1/1/0&quot;" />
                            <asp:ControlParameter ControlID="txtBuscar" Name="texto" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        &nbsp;
      
        <asp:LinkButton ID="LinkButton1" runat="server" BackColor="White" BorderColor="White"
            CssClass="required1" OnClick="LinkButton1_Click" Width="151px">Generar Reporte</asp:LinkButton>
        <asp:CheckBox ID="chkTodos" runat="server" Text="Todos los Registros" />
         
    </form>
     <div class="footer" style=" display:block">
        <p class="foot"> &copy; 2010 <img class="nofoot" alt="SBDA"  src="../common/image/footer_logo.jpg"/><a rel="nofollow" href="http://www.sbda.org.bo/" >www.sbda.org.bo</a></p>
        </div>
   </div>
</body>
</html>
