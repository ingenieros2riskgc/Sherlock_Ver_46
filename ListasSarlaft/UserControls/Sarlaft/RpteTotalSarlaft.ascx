<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RpteTotalSarlaft.ascx.cs" Inherits="ListasSarlaft.UserControls.Sarlaft.RpteTotalSarlaft" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=14.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<style type="text/css">
    .gridViewHeader a:link
    {
        text-decoration: none;
    }

    .FondoAplicacion
    {
        background-color: Gray;
        filter: alpha(opacity=80);
        opacity: 0.8;
    }
</style>
<script type="text/javascript">
    function ChangeCalendarView(sender, args) {
        sender._switchMode("months", true);
    }

    function onCalendarHidden(sender) {
        if (sender._monthsBody) {
            for (var i = 0; i < sender._monthsBody.rows.length; i++) {
                var row = sender._monthsBody.rows[i];
                for (var j = 0; j < row.cells.length; j++) {
                    Sys.UI.DomEvent.removeHandler(row.cells[j].firstChild, "click", call);
                }
            }
        }

    }

    function onCalendarShown(sender) {

        sender._switchMode("months", true);

        if (sender._monthsBody) {
            for (var i = 0; i < sender._monthsBody.rows.length; i++) {
                var row = sender._monthsBody.rows[i];
                for (var j = 0; j < row.cells.length; j++) {
                    Sys.UI.DomEvent.addHandler(row.cells[j].firstChild, "click", call);
                }
            }
        }

    }

    function call(sender) {
        var target = sender.target;
        switch (target.mode) {
            case "month":
                var strId = sender.target.id;
                if (strId.indexOf("Calendar1") != -1) {
                    var cal = $find("Calendar1");
                    cal._visibleDate = target.date;
                    cal.set_selectedDate(target.date);
                    cal._blur.post(true);
                    cal.raiseDateSelectionChanged();
                }
                else {
                    var cal2 = $find("Calendar2");
                    cal2._visibleDate = target.date;
                    cal2.set_selectedDate(target.date);
                    cal2._blur.post(true);
                    cal2.raiseDateSelectionChanged();
                }
                break;
        }
    }
</script>
<script type="text/javascript">
    function popUp(pagina) {
        hiddden = open(pagina, 'NewWindow', 'top=0,left=0,width=1280,height=1024,status=yes,resizable=yes,scrollbars=yes');
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <Triggers>
        <asp:PostBackTrigger ControlID="ImageButton2"></asp:PostBackTrigger>
    </Triggers>
    <ContentTemplate>
        <table align="center">
            <tr align="center" bgcolor="#333399">
                <td>
                    <asp:Label ID="Label61" runat="server" ForeColor="White" Text="Reporte Total"
                        Font-Bold="False" Font-Names="Calibri" Font-Size="Large"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    <table align="center" runat="server" id="TbTraza" visible="true">
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Imagenes/Icons/excel.png" OnClick="ImageButton2_Click" ToolTip="Exportar a Excel" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    ForeColor="#333333" GridLines="Vertical" ShowHeaderWhenEmpty="True" HeaderStyle-CssClass="gridViewHeader"
                                    BorderStyle="Solid" HorizontalAlign="Center" Font-Names="Calibri" Font-Size="Small" AllowPaging="True" OnPageIndexChanging="GridView2_PageIndexChanging">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="Registro_Operacion" HeaderText="Registro_Operacion" InsertVisible="False"
                                            ReadOnly="True" SortExpression="Registro_Operacion" />
                                        <asp:BoundField DataField="Identificacion" HeaderText="Identificacion" InsertVisible="False"
                                            ReadOnly="True" SortExpression="Identificacion" />
                                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" InsertVisible="False"
                                            ReadOnly="True" SortExpression="Nombre" />
                                        <asp:BoundField DataField="NombreIndicador" HeaderText="NombreIndicador" InsertVisible="False" ReadOnly="True"
                                            SortExpression="NombreIndicador" />
                                        <asp:BoundField DataField="Indicador" HeaderText="Indicador" InsertVisible="False"
                                            ReadOnly="True" SortExpression="Indicador" />
                                        <asp:BoundField DataField="MensajeCorreo" HeaderText="MensajeCorreo" InsertVisible="False"
                                            ReadOnly="True" SortExpression="MensajeCorreo" />
                                        <asp:BoundField DataField="Estado" HeaderText="Estado" InsertVisible="False"
                                            ReadOnly="True" SortExpression="Estado" />
                                        <asp:BoundField DataField="Tipo" HeaderText="Tipo" InsertVisible="False" ReadOnly="True"
                                            SortExpression="Tipo" />
                                        <asp:BoundField DataField="FechaDeteccion" HeaderText="FechaDeteccion" InsertVisible="False"
                                            ReadOnly="True" SortExpression="FechaDeteccion" />
                                        <asp:BoundField DataField="FechaPosibleSolucion" HeaderText="Fecha PosibleSolucion" InsertVisible="False"
                                            ReadOnly="True" SortExpression="FechaPosibleSolucion" />
                                        <asp:BoundField DataField="Responsable" HeaderText="Responsable"
                                            InsertVisible="False" ReadOnly="True"
                                            SortExpression="Responsable" />
                                        <asp:BoundField DataField="NombreResponsable" HeaderText="NombreResponsable" InsertVisible="False"
                                            ReadOnly="True" SortExpression="NombreResponsable" />

                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="White" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <asp:ModalPopupExtender ID="mpeMsgBox" runat="server" TargetControlID="btndummy"
            PopupControlID="pnlMsgBox" OkControlID="btnAceptar" BackgroundCssClass="FondoAplicacion"
            Enabled="True" DropShadow="true">
        </asp:ModalPopupExtender>
        <asp:Button ID="btndummy" runat="server" Text="Button" Style="display: none" />
        <asp:Panel ID="pnlMsgBox" runat="server" Width="400px" Style="display: none;" BorderColor="#575757"
            BackColor="#FFFFFF" BorderStyle="Solid">
            <table width="100%">
                <tr class="topHandle" style="background-color: #5D7B9D">
                    <td colspan="2" align="center" runat="server" id="tdCaption">&nbsp;
                        <asp:Label ID="lblCaption" runat="server" Text="Atención" Font-Names="Calibri" Font-Size="Small"></asp:Label><br />
                    </td>
                </tr>
                <tr>
                    <td style="width: 60px" valign="middle" align="center">
                        <asp:Image ID="imgInfo" runat="server" ImageUrl="~/Imagenes/Icons/icontexto-webdev-about.png" />
                    </td>
                    <td valign="middle" align="left">
                        <asp:Label ID="lblMsgBox" runat="server" Font-Names="Calibri" Font-Size="Small"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Button ID="btnAceptar" runat="server" Text="Ok" Font-Names="Calibri" Font-Size="Small" />
                    </td>
                </tr>
            </table>
        </asp:Panel>

    </ContentTemplate>
</asp:UpdatePanel>
