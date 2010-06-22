<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
    <%@ Register Assembly="RJS.Web.WebControl.PopCalendar.Ajax.Net" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
     <link href="common/css/sbda.css" type="text/css" rel="stylesheet" />
    <title>Buscador SBDA</title>
    <style type="text/css">
    img, div { behavior: url(common/image/iepngfix.htc) }
</style> 

</head>
<body>
<table align="center" width="1200px">
<tbody>
<tr>
<td>
<div class="center" style="display:block" >
    <form id="form1" runat="server" style="display:block">
    
    <div class="rightIndex">
        <table cellpadding="0" cellspacing="0" border="0" class="mainTable">
            <tr class="cyan">
                <td style="height: 19px" >
                    <asp:LinkButton ID="lnkLimpiar" runat="server" OnClick="lnkLimpiar_Click">Limpiar</asp:LinkButton></td>
                <td style="height: 19px">
                    <asp:LinkButton ID="lnkBusqueda" runat="server" PostBackUrl="~/index.aspx">Busqueda</asp:LinkButton></td>
                <td style="height: 19px" >
                    <asp:LinkButton ID="lnkContactenos" runat="server" PostBackUrl="~/contactenos.aspx">Contactenos</asp:LinkButton></td>
                <td style="height: 19px" >
                    <asp:LinkButton ID="lnkSalir" runat="server" OnClick="lnkSalir_Click">Salir</asp:LinkButton></td>
                <td style="height: 19px" >
                    <asp:LinkButton ID="lnkAdministracion" runat="server" OnClick="lnkAdministracion_Click">Administracion</asp:LinkButton></td>
            </tr>
        </table>
    
    </div>
    <div class="leftdate">        
        <table ><tr><td colspan="2"><asp:Label ID="lblMensaje" runat="server" ForeColor="#990000"></asp:Label></td></tr>
            <tr>
                <td >
                    <asp:Label ID="lblActualizacion" runat="server" Text="Ultima Actualizacion:"></asp:Label></td>
                <td>
                    <asp:Label ID="lblDate" runat="server" ></asp:Label></td>
            </tr>            
        </table>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Su lista de normas aplicables puede descargarlas   "></asp:Label><asp:HyperLink ID="lnkLista" CssClass="aqui" runat="server">Aqui</asp:HyperLink></td></tr>
        </table>
        </div>
         <br />
          <img src="common/image/logosbda2.jpg" alt="SBDA" />&nbsp;<br />
        <div align="center" >
        <table style="width: 918px; height: 55px; margin-top:20px" class="fondoform">
            <tr>
                <td style="width: 100px; height: 18px">
                </td>
                <td style="width: 134px; height: 18px">
                </td>
                <td colspan="4" style="height: 18px">
                </td>
                <td style="width: 126px; height: 18px">
                </td>
                <td style="width: 111px; height: 18px">
                </td>
            </tr>
            <tr class="label">
                <td style="width: 100px; height: 27px">
                </td>
                <td style="width: 134px; height: 27px">
                <asp:Label ID="lblBuscar" runat="server" Text="Busqueda"></asp:Label></td>
                <td colspan="4" style="height: 27px; margin-top:5px" >
                    <asp:TextBox ID="txtBuscar" runat="server" Width="219px" AutoPostBack="True"></asp:TextBox>
                    <asp:Button ID="btnBuscar" runat="server"   CssClass="buscar2" OnClick="btnBuscar_Click"
                        Text=""/></td>
                <td style="width: 126px; height: 27px">
                
                </td>
                <td style="width: 111px; height: 27px">
                </td>
            </tr>
            <tr >
                <td style="width: 115px; height: 19px" class="label">
                    <asp:Label ID="lblBusquedaPor" runat="server" Text="Busqueda Por:"></asp:Label></td>
                <td style="width: 134px; height: 31px" class="left1">
                    <asp:RadioButton ID="rbtnPalClave" runat="server" Checked="True" GroupName="buscar"
                        Text="Palabra Clave" BackColor="Transparent" BorderColor="DarkOliveGreen" ForeColor="#404000" OnCheckedChanged="rbtnPalClave_CheckedChanged" AutoPostBack="True" /></td>
                <td style="width: 92px; height: 19px" class="left1">
                    <asp:RadioButton ID="rbtnNombre" runat="server" GroupName="buscar" Text="Nombre" AutoPostBack="True" OnCheckedChanged="rbtnNombre_CheckedChanged" /></td>
                <td style="width: 91px; height: 19px" class="left1">
                    <asp:RadioButton ID="rbtnNumero" runat="server" GroupName="buscar" Text="Numero" AutoPostBack="True" OnCheckedChanged="rbtnNumero_CheckedChanged" /></td>
                <td style="width: 205px; height: 19px" class="left1">
                    <asp:RadioButton ID="rbtnFecha" runat="server" GroupName="buscar" Text="Fecha" AutoPostBack="True" OnCheckedChanged="rbtnFecha_CheckedChanged" /></td>
                <td style="width: 56px; height: 19px" class="label">
                    <asp:Label ID="lblFiltros" runat="server" Text="Filtros:"></asp:Label></td>
                <td style="width: 126px; height: 19px" class="left1"> 
                    <asp:Label ID="lblComboNorma" runat="server" Text="Norma:"></asp:Label></td>
                <td style="width: 111px; height: 19px" class="left1">
                    <asp:Label ID="lblComboTipo" runat="server" Text="Tipo:"></asp:Label>
                    <asp:CheckBox ID="chkTodos" runat="server" Checked="True" Text="Todos" /></td>
            </tr>
            <tr>
                <td style="width: 100px;">
                </td>
                <td style="width: 134px;"  >
                    <asp:DropDownList ID="cbPalClave" runat="server" DataSourceID="ObjectDataSource2"
                        DataTextField="NOMBRE" DataValueField="ID" Width="104px" BackColor="Transparent" ForeColor="Black" AutoPostBack="True" ValidationGroup="comboPal">
                    </asp:DropDownList></td>
                <td style="width: 92px;">
                </td>
                <td style="width: 91px;">
                </td>
                <td style="width: 205px;" class="calendario">
                    <asp:TextBox ID="txtFecha" runat="server" Width="89px" ReadOnly="True"></asp:TextBox><rjs:PopCalendar
                        ID="PopCalendar1" runat="server" AutoPostBack="false" Control="txtFecha" OnSelectionChanged="PopCalendar_SelectionChanged"
                        ValidationGroup="RJS.PopCalendars" /><br /><span style="color: rgb(153, 0, 0)">Haga click en el icono ^ </span>
                </td>
                <td style="width: 56px;">
                </td>
                <td style="width: 126px;">
                    <asp:DropDownList ID="cbNorma" runat="server">
                        <asp:ListItem Selected="True" Value="0">Todos</asp:ListItem>
                        <asp:ListItem Value="1">Informativo</asp:ListItem>
                        <asp:ListItem Value="2">Cumplimiento</asp:ListItem>
                        <asp:ListItem Value="3">Ambos</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 111px;">
                    <asp:DropDownList ID="cbTipo" runat="server" DataSourceID="ObjectDataSource4" DataTextField="NOMBRE" DataValueField="ID">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 17px">
                </td>
                <td style="width: 134px; height: 17px">
                </td>
                <td style="width: 92px; height: 17px">
                </td>
                <td style="width: 91px; height: 17px">
                </td>
                <td style="width: 205px; height: 17px">
                </td>
                <td style="width: 56px; height: 17px">
                </td>
                <td style="width: 126px; height: 17px">
                </td>
                <td style="width: 111px; height: 17px">
                </td>
            </tr>
        </table>
        </div>
        <br />
        <br />
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="ConsultarTodosLosRegistros"
                        TypeName="clsPPalClave"></asp:ObjectDataSource>
                   <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
                    </asp:ScriptManager>
                    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="ConsultarTodosLosRegistros"
                        TypeName="clsPNorma"></asp:ObjectDataSource>
        &nbsp;
        <br />
        <br />
        
        <table cellpadding="0" cellspacing="0" border="0" class="mainTableIndex " style="display:block">
         
            <tr class="auxiliar">
                <td colspan="3" style="height: 6px" class="label1">
                    <asp:Label ID="lblTitulo" runat="server" Text="Resultados"></asp:Label></td>
                <td style="width: 90px; height: 6px;">
                    <asp:DropDownList ID="cbTop" runat="server">
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>35</asp:ListItem>
                        <asp:ListItem>40</asp:ListItem>
                        <asp:ListItem>45</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 103px; height: 6px;">
                </td>
                <td style="width: 65px; height: 6px;">
                </td>
                <td style="width: 114px; height: 6px;">
                </td>
                <td style="width: 81px; height: 6px;">
                </td>
                <td style="width: 78px; height: 6px;">
                </td>
            </tr>
            <tr class="auxiliar2" style="text-align:left; background:#b9e85c; width:581px; height:19px;
padding-top:5px">
                <td style="width: 22px"></td>
                <td style="width: 54px">
                    <asp:Label ID="lblTitNro" runat="server" Font-Bold="True" Text="N°"></asp:Label></td>
                <td style="width: 177px">
                    <asp:Label ID="lblTitNombre" runat="server" Font-Bold="True" Text="Nombre"></asp:Label></td>
                <td style="width: 112px">
                    <asp:Label ID="lblTitNorma" runat="server" Font-Bold="True" Text="Norma"></asp:Label></td>
                <td style="width: 50px">
                    <asp:Label ID="lblTitTipo" runat="server" Font-Bold="True" Text="Tipo"></asp:Label></td>
                <td style="width: 86px">
                    <asp:Label ID="lblTitActualizacion" runat="server" Font-Bold="True" Text="Actualizacion"></asp:Label></td>
                <td style="width: 60px">
                </td>
               
            </tr>
        </table>
                    <asp:DataList ID="DataList1" runat="server" align="center"  DataSourceID="ObjectDataSource3" CssClass="mainTable7"  >
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="display:block"   width="581"class="mainTable3 ">
                                <tr>
                                    <td style="width: 22px">
                                        <asp:Label ID="lblNro" runat="server" Text='<%# Eval("NRO") %>'></asp:Label></td>
                                    <td style="width: 42px">
                                        <asp:Label ID="lblNumero" runat="server" Text='<%# Eval("NUMERO") %>'></asp:Label></td>
                                    <td style="width: 177px">
                                        <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("NOMBRE") %>'></asp:Label></td>
                                    <td style="width: 112px">
                                        <asp:Label ID="lblNorma" runat="server" Text='<%# Eval("NORMA") %>'></asp:Label></td>
                                    <td style="width: 50px">
                                        <asp:Label ID="lblTipo" runat="server" Text='<%# Eval("TIPO") %>'></asp:Label></td>
                                    <td style="width: 86px">
                                        <asp:Label ID="lblActualizacion" runat="server" Text='<%# Eval("FECHA") %>'></asp:Label></td>
                                    <td  class="cyan" style="width: 60px">
                                        <asp:HyperLink ID="lnkDescargar" runat="server" NavigateUrl='<%# Eval("URL") %>'
                                          >Descargar</asp:HyperLink></td>
                                   
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
              
                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="ConsultarPNorma"
                        TypeName="clsNorma" OldValuesParameterFormatString="original_{0}">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="id" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ConsultarBusquedaAvanzadaPrincipal"
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
                            <asp:ControlParameter ControlID="cbNorma" Name="norma" PropertyName="SelectedValue"
                                Type="String" />
                            <asp:ControlParameter ControlID="cbTipo" Name="tipo" PropertyName="SelectedValue"
                                Type="String" />
                            <asp:ControlParameter ControlID="chkTodos" Name="tipo_todos" PropertyName="Checked"
                                Type="String" />
                            <asp:ControlParameter ControlID="cbTop" DefaultValue="5" Name="top" PropertyName="SelectedValue"
                                Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
        <br /> 
    </form>
    
   </div>
   <div></div>
        </td>
</tr>
<tr>
<td><div class="footer" style=" display:block">
        <p class="foot"> &copy; 2010 <img class="nofoot" alt="SBDA"  src="common/image/footer_logo.jpg"/><a rel="nofollow" href="http://www.sbda.org.bo/" >www.sbda.org.bo</a></p>
        </div>
</td>
</tr>
</tbody>
</table>
   
   
</body>
</html>
