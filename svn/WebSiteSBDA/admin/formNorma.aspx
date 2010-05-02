<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formNorma.aspx.cs" Inherits="admin_formNorma" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar.Ajax.Net" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link href="../common/css/sbda.css" type="text/css" rel="stylesheet" />
    <title>Buscador SBDA</title>
</head>
<body>
<div class="center3" >
    <form id="form1" runat="server">
    <br />
          <img src="../common/image/logo sbda.png" alt="SBDA" />
    <div class="center">
        <asp:FormView ID="FormView1" runat="server" CssClass="mainTable2" DataSourceID="ObjectDataSource1">
            <ItemTemplate>
                <table cellpadding="0" cellspacing="0" border="0" class="mainTable ">
                    <tr>
                        
                        <td colspan="2">
                            <asp:Label  style="width: 100px" ID="lblTitulo" CssClass="required" runat="server" Text="Nuevo Registro"></asp:Label></td>
                    <td style="width: 50px">
                        </td>
                        <td style="width: 200px">
                        </td>
                    </tr>
                    </table>
                     <table cellpadding="0" cellspacing="0" border="0" class="mainTable "> 
                    <tr class="label">
                        <td style="width: 5px">
                        </td>
                        <td style="width: 101px">
                            <asp:Label ID="lblNorma" runat="server" Text="Norma:"></asp:Label></td>
                        <td class="clave new" >
                                <asp:RadioButtonList ID="rbtnListNorma" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("NORMA") %>'>
                                <asp:ListItem Value="1">Informativa</asp:ListItem>
                                <asp:ListItem Value="2">Cumplimiento</asp:ListItem>
                            </asp:RadioButtonList></td>
                    </tr>
                    <tr class="label">
                        <td style="width: 5px">
                        </td>
                        <td style="width: 101px">
                            <asp:Label ID="lblTipo" runat="server" Text="Tipo:"></asp:Label></td>
                        <td class="controlContacLarge left" style="height: 35px">
                            <asp:DropDownList ID="cbTipoNorma" runat="server" Width="152px" DataSourceID="ObjectDataSource2" DataTextField="NOMBRE" DataValueField="ID" SelectedValue='<%# Bind("TIPO") %>'>
                            </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="ConsultarTodosLosRegistros"
                                TypeName="clsPNorma"></asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr class="label">
                        <td style="width: 5px">
                        </td>
                        <td style="width: 101px">
                            <asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label></td>
                        <td  class="controlContacLarge left" style="height: 35px">
                            <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("NOMBRE") %>' MaxLength="99"></asp:TextBox>
                            </td>
                    </tr>
                    <tr class="label">
                        <td style="width: 5px">
                        </td>
                        <td style="width: 101px">
                            <asp:Label ID="lblNumero" runat="server" Text="Numero:"></asp:Label></td>
                        <td  class="controlContacLarge left" style="height: 35px">
                            <asp:TextBox ID="txtNumero" runat="server" Text='<%# Bind("NUMERO") %>' MaxLength="999999"></asp:TextBox>
                            </td>
                    </tr>
                    <tr class="label">
                        <td style="width: 5px">
                        </td>
                        <td style="width: 101px">
                            <asp:Label ID="lblFecha" runat="server" Text="Fecha:"></asp:Label></td>
                        <td  class="controlContacLarge left" style="height: 35px">
                            &nbsp;<asp:TextBox ID="txtFecha" runat="server" Text='<%# Bind("FECHA") %>' ReadOnly="True" ></asp:TextBox><rjs:PopCalendar
                                ID="PopCalendar1" runat="server" AutoPostBack="false" Control="txtFecha" OnSelectionChanged="PopCalendar_SelectionChanged"
                                ValidationGroup="RJS.PopCalendars" />
                            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
                            </asp:ScriptManager>
                        </td>
                    </tr>
                    <tr class="label">
                        <td style="width: 5px; height: 22px">
                        </td>
                        <td style="width: 101px; height: 22px">
                            <asp:Label ID="lblDisponible" runat="server" Text="Disponible:"></asp:Label></td>
                        <td style="height: 22px" class="clave new">
                            &nbsp;<asp:RadioButtonList ID="rbtnListEstado" runat="server" RepeatDirection="Horizontal"
                                SelectedValue='<%# Bind("ESTADO") %>'>
                                <asp:ListItem Value="si">Si</asp:ListItem>
                                <asp:ListItem Value="no">No</asp:ListItem>
                            </asp:RadioButtonList></td>
                    </tr>
                    <tr class="label">
                        <td style="width: 5px">
                        </td>
                        <td style="width: 101px">
                            <asp:Label ID="lblPalClave" runat="server" Text="Palabras Clave:"></asp:Label></td>
                        <td>
                            <table style="width: 520px; height: 53px; margin-top:20px">
                                <tr>
                                    <td colspan="2" rowspan="3" style="width: 165px; float:left; padding-top:35px">
                                        <asp:ListBox ID="lstPalClaves" runat="server" Height="76px" SelectionMode="Multiple"
                                            Width="163px" DataSourceID="ObjectDataSource3" DataTextField="NOMBRE" DataValueField="PALABRACLAVEID"></asp:ListBox>
                                            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="ConsultarPorID"
                                            TypeName="clsNormaClave">
                                            <SelectParameters>
                                                <asp:QueryStringParameter DefaultValue="&quot;&quot;" Name="id" QueryStringField="id"
                                                    Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                        &nbsp;
                                    </td>
                                    <td colspan="1" rowspan="3" style="width: 137px">
                                     <p class="agregar">   <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="" /></p>
                                     <p class="remover">   <asp:Button ID="btnRemoverTodo" runat="server" OnClick="btnRemoverTodo_Click" Text=" " /></p></td>
                                    <td rowspan="3" style="width: 165px; padding-top:9px">
                                        &nbsp;<asp:ListBox ID="lstParametros" runat="server" DataSourceID="ObjectDataSource1"
                                            DataTextField="NOMBRE" DataValueField="ID" SelectionMode="Multiple" Height="76px" Width="163px">
                                        </asp:ListBox>
                                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ConsultarTodosLosRegistros"
                                            TypeName="clsPPalClave"></asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr class="label">
                        <td style="width: 5px">
                        </td>
                        <td style="width: 101px">
                            <asp:Label ID="Label1" runat="server" Text="Ruta:"></asp:Label></td>
                        <td>
                            &nbsp;<table style="width: 488px; height: 55px">
                                <tr>
                                    <td colspan="2" rowspan="3" style="float:left; margin-top:10px;">
                                        <asp:TextBox ID="txtRuta" runat="server" Text='<%# Bind("URL") %>' ReadOnly="True" MaxLength="99"></asp:TextBox>
                                        </td>
                                    <td rowspan="3" style="width:270px; float:right" class="controlContacLarge left cyan">
                                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="galId" DefaultMode="Insert"
                                            >
                                            <InsertItemTemplate>
                                                <asp:FileUpload ID="fullDoc"  runat="server" Height="23px" Width="270px" CssClass="controlContac" />
                                                <br />
                                            </InsertItemTemplate>
                                        </asp:FormView>
                                        <asp:LinkButton ID="SubirDoc" CssClass="cyan" runat="server" OnClick="SubirDoc_Click">Subir Documento</asp:LinkButton></td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px; height: 26px">
                        </td>
                        <td style="height: 26px; float:left">
                        
                        </td>
                        <td style="height: 26px">
                          <p class="insertar" style=" margin-left:50px">  <asp:Button ID="btnInsertar" runat="server" OnClick="btnInsertar_Click" Text="" /></p>
                           <p class="cancelar1"  style=" margin-right:172px"> <asp:Button ID="btnCancelar" runat="server" PostBackUrl="~/admin/listaNorma.aspx" Text="" /></p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5px">
                        </td>
                        <td style="width: 101px">
                        </td>
                        <td>
                            <asp:Label ID="lblMensaje" runat="server" Width="392px" ForeColor="#990000"></asp:Label></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ConsultarPorID"
            TypeName="clsNorma">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="&quot;&quot;" Name="id" QueryStringField="id"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
    <div class="footer">
        <p>&copy; 2010 SBDA <a  rel="nofollow" href="http://www.sbda.org.bo/" >www.sbda.org.bo</a></p>
       </div>
    </div>
</body>
</html>
