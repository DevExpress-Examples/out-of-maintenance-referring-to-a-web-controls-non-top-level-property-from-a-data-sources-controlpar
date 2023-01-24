<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ReferringHiddenFieldPropertyFromControlParameter._Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web" TagPrefix="dx" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript">
        function OnMaxIDChanged(s, e) {
            var maxID = s.GetNumber();
            hfData.Set("MaxID", maxID);
            gvGridView.PerformCallback("Rebind");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%-- BeginRegion MaxID Increment/Decrement --%>
        <table>
            <tr>
                <td>
                    <strong>ProductID&nbsp;&lt;=&nbsp;</strong>
                </td>
                <td>
                    <dx:ASPxSpinEdit ID="spnMaxID" runat="server" AllowUserInput="False" Number="5" Width="50px"
                        MinValue="1" MaxValue="77" ClientSideEvents-ValueChanged="OnMaxIDChanged" />
                </td>
            </tr>
        </table>
        <%-- EndRegion --%>

        <dx:ASPxGridView ID="gvGridView" runat="server" DataSourceID="dsDataSource" ClientInstanceName="gvGridView"
            OnCustomCallback="OnGridViewCustomCallback" SettingsPager-Mode="ShowAllRecords" />

        <dx:ASPxHiddenField ID="hfData" runat="server" ClientInstanceName="hfData" />

        <asp:AccessDataSource ID="dsDataSource" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice] FROM [Products] WHERE [ProductID] <= @MaxID">
            <SelectParameters>
                <asp:ControlParameter Name="MaxID" ControlID="hfData" PropertyName="['MaxID']" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>

    </div>
    </form>
</body>
</html>