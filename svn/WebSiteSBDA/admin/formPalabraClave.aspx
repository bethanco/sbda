<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formPalabraClave.aspx.cs" Inherits="formPalabraClave" %>

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
          <img src="../common/image/logosbda2.jpg"  alt="SBDA" />
    <div  style=" text-align:center; padding-left:32%">
        <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1">
            <ItemTemplate>
                <table cellpadding="0" cellspacing="0" border="0" class="mainTable " style="margin-left:100px; width: 634px;">
                   <tr class="label">
                <td style="width: 56px">
                        </td>
                        <td class="leftdate" style="width: 204px" >
                          <p>    <asp:Label ID="lblTitulo" runat="server" Text="Editando el Registro"></asp:Label></p></td>
                    </tr>
                    <tr class="label">
                        <td  style="width: 56px; height: 24px" class="textAlignLeft">
                            <asp:Label ID="Label1" runat="server" Text="Nombre:"></asp:Label></td>
                        <td class="controlContac left label" style="height: 24px; width:204px">
                            <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("NOMBRE") %>' MaxLength="49"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 56px">
                        </td>
                        <td  style="width:204px">
                            <p class="insertar">  <asp:Button ID="btnInsertar" runat="server" OnClick="btnInsertar_Click" Text="" /></p>
                            <p class="cancelar1"><asp:Button ID="btnCancelar" runat="server" PostBackUrl="~/admin/listaPalabraClave.aspx"
                                Text="" /></p></td>
                    </tr>
                    <tr>
                        <td style="width: 56px; height: 20px;">
                        </td>
                        <td style="width: 204px; height: 20px;">
                        </td>
                        <td style="height: 20px">
                            <asp:Label ID="lblMensaje" runat="server" Width="354px" ForeColor="#990000"></asp:Label></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ConsultarPorID"
            TypeName="clsPPalClave">
            <SelectParameters>
                <asp:QueryStringParameter ConvertEmptyStringToNull="False" DefaultValue="&quot;0&quot;"
                    Name="id" QueryStringField="id" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
       <div class="footer" style=" display:block">
        <p class="foot"> &copy; 2010 <img class="nofoot" alt="SBDA"  src="../common/image/footer_logo.jpg"/><a rel="nofollow" href="http://www.sbda.org.bo/" >www.sbda.org.bo</a></p>
        </div>
      </div>
</body>
</html>
