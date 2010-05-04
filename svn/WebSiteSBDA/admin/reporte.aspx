<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reporte.aspx.cs" Inherits="admin_reporte" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link href="../common/css/sbda.css" type="text/css" rel="stylesheet" />
    <title>Buscador SBDA</title>
</head>
<body>
<div  style="display:block; text-align:center" >
    <form id="form1" runat="server">
    <br />
          <img src="../common/image/logo sbda.png" alt="SBDA" />
    <div style=" text-align:center; padding-left:8%">
        <table cellpadding="0" cellspacing="0" border="0" class="mainTable " style="margin-left:100px">
            <tr>
                <td colspan="2" style="height: 21px">
                </td>
                <td style="width: 88px; height: 21px">
                </td>
                <td style="width: 90px; height: 21px">
                </td>
                <td style="width: 103px; height: 21px">
                </td>
                <td style="width: 65px; height: 21px">
                </td>
                <td style="width: 114px; height: 21px">
                </td>
            </tr>
            <tr class="label">
                <td class="leftdate" style="width: 170px">
                    <asp:Label ID="lblTitulo" runat="server" Text="Reporte de Normas" Font-Bold="True" ForeColor="Black"></asp:Label></td>
                <td style="width: 90px">
                </td>
                <td style="width: 103px">
                </td>
                <td style="width: 65px">
                </td>
                <td style="width: 114px">
                </td>
            </tr>
            <tr>
                <td style="width: 54px">
                </td>
                <td style="width: 22px">
                    </td>
                <td style="width: 88px">
                    </td>
                <td style="width: 90px">
                    </td>
                <td style="width: 103px">
                    </td>
                <td style="width: 65px">
                    </td>
                <td style="width: 114px">
                    </td>
            </tr>
            <tr>
                <td colspan="7" rowspan="1">
                    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
                        Height="500px" Width="887px" BackColor="YellowGreen">
                        <LocalReport ReportPath="admin\Report1.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSet1_tblNorma" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="ReporteGetDataBy" TypeName="DataSet1TableAdapters.tblNormaTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="&quot;1/1/0&quot;" Name="fecha" QueryStringField="fecha"
                                Type="DateTime" />
                            <asp:QueryStringParameter DefaultValue="&quot;&quot;" Name="nombre" QueryStringField="nombre"
                                Type="String" />
                            <asp:QueryStringParameter DefaultValue="&quot;&quot;" Name="numero" QueryStringField="numero"
                                Type="String" />
                            <asp:QueryStringParameter DefaultValue="&quot;0&quot;" Name="idPalabra" QueryStringField="idPalabra"
                                Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    
    </div>
    <div class="footer">
        &nbsp;<asp:HyperLink ID="lnkVolver" runat="server"  NavigateUrl="~/admin/listaNorma.aspx"
            Width="114px"> << Volver</asp:HyperLink>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br />
        &nbsp; </div>
    </form>
   <div class="footer" style=" display:block">
        <p class="foot"> &copy; 2010 <img class="nofoot" alt="SBDA"  src="../common/image/footer_logo.jpg"/><a rel="nofollow" href="http://www.sbda.org.bo/" >www.sbda.org.bo</a></p>
        </div>
      </div>
</body>
</html>
