<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="ThemeManagement.aspx.cs" Inherits="Admin_ThemeManagement" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="body">
        <div id="loginbanner">
            Current Theme: &nbsp;<asp:Label ID="lblCurrentTheme" runat="server"></asp:Label>
            <br />
            <br />
            <asp:DropDownList ID="drpThemes" runat="server" DataSourceID="SqlDataSource1"
                DataTextField="Theme" DataValueField="ThemeID">
            </asp:DropDownList>
            <asp:Button ID="btnChangeTheme" runat="server" OnClick="btnChangeTheme_Click" Text="Change Theme" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
                InsertCommand="INSERT INTO SiteSettings(Theme) VALUES (@ThemeID)" SelectCommand="SELECT [Theme], [ThemeID] FROM [SiteThemes]"
                UpdateCommand="UPDATE SiteSettings SET Theme = @ThemeID WHERE (SiteName = @SiteName)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ThemeID" PropertyName="SelectedValue" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="drpThemes" Name="ThemeID" PropertyName="SelectedValue" />
                    <asp:Parameter Name="SiteName" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
        </div>
    </div>
</asp:Content>

