<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="PageManagement.aspx.cs" Inherits="admin_PageManagement" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="body">
<div id="loginbanner">
    &nbsp;<asp:Label ID="lblErrors" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" ImageSet="XPFileExplorer" NodeIndent="15" ShowCheckBoxes="All" ShowLines="True">
        <ParentNodeStyle Font-Bold="False" />
        <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
        <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
            VerticalPadding="0px" />
        <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
            NodeSpacing="0px" VerticalPadding="2px" />
    </asp:TreeView>
    <asp:Button ID="btnUp" runat="server" OnClick="btnUp_Click" Text="Move Up" /><asp:Button
        ID="btnMoveDown" runat="server" OnClick="btnMoveDown_Click" Text="Move Down" /><asp:Button
            ID="btnChild" runat="server" OnClick="btnChild_Click" Text="Make Child" /><asp:Button
                ID="btnSibling" runat="server" OnClick="btnSibling_Click" Text="Make Sibling" />
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
</div>
</div>

</asp:Content>

