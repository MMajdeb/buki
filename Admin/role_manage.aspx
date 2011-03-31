<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="role_manage.aspx.cs" Inherits="admin_role_manage" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="body">
<div id="loginbanner">
    Current Role:
    <asp:Label ID="lblCurrentRole" runat="server"></asp:Label><br />
    <br />
    UserName
    <asp:DropDownList ID="drpUsers" runat="server" DataTextField="FullName" DataValueField="UserName">
    </asp:DropDownList>&nbsp;<asp:Button ID="btnAddUser" runat="server" Text="Add User" OnClick="btnAddUser_Click" /><br />
    <br />
    <asp:LinkButton ID="lnkDisplayUsers" runat="server" CommandArgument="InRole" CommandName="DisplayUsers" Enabled="False" OnCommand="DisplayUsers">Display Users in Role</asp:LinkButton>
    |
    <asp:LinkButton ID="lnkDisplayAllUsers" runat="server" CommandArgument="All" CommandName="DisplayUsers" OnCommand="DisplayUsers">Display All Users</asp:LinkButton><br />
    <br />
    <asp:DataList ID="dlDisplayRoles" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCreated="dlDisplayRoles_ItemCreated">
					<ItemTemplate>
						<div class="membercard">
							<div style="float: left; padding: 0 5px 0 0;">
								<asp:Image ID="ImageThumbnail1" runat="server" ImageUrl='<%# Eval("PhotoURL") %>' />
							</div>
							<h3>
								<asp:Label ID="titleLabel" runat="server" Text='<%# (string)Eval("FirstName") + " " +  (string)Eval("LastName")  %>' />
							</h3>
							<p>
								<asp:HyperLink ID="emailLink" runat="server" NavigateUrl='<%# "mailto:" + (string)Eval("Email")%>'
									Text='<%# Eval("Email") %>' />
							</p>
							<p>
								<asp:Label ID="addressLabel" runat="server" Text='<%# PreFormat((string)Eval("Address")) %>' />
							</p>
							<p>
								Phone:
								<asp:Label ID="phonelabel" runat="server" Text='<%# Eval("Phone")%>' />
							</p>
							<p>
								<asp:LinkButton ID="lnkRemoveUser" runat="server" CommandArgument='<%# Eval("UserName")%>' CommandName="RemoveUser" OnCommand="RemoveUser" Visible="false">Remove From Role</asp:LinkButton>
							</p>
							<div class="clearcard">
							</div>
						</div>
					</ItemTemplate>    

    </asp:DataList><br />
    &nbsp;
</div>
</div>
</asp:Content>

