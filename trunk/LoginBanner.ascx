<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoginBanner.ascx.cs" Inherits="LoginBanner" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<div id="loginbanner">
	<asp:LoginView ID="LoginView1" runat="server">
		<LoggedInTemplate>
			<div style="float: left">
				<h2>
					Welcome
					<asp:LoginName ID="LoginName1" runat="server" />
					. <strong>You are logged in.</strong>
				</h2>
			</div>
			<div class="actionbuttons">
				<Club:RolloverButton ID="Logoutbtn" runat="server" Text="Logout" OnClick="Logoutbtn_Click" />
			</div>
		</LoggedInTemplate>
		<AnonymousTemplate>
			<div style="float: left">
				<h2>
					Please login
				</h2>
			</div>
			<div class="actionbuttons">
				<Club:RolloverLink ID="Logintbtn" runat="server" Text="Login" NavigateURL="Login.aspx" />
				&nbsp;
				<Club:RolloverLink ID="RegisterBtn" runat="server" Text="Register" NavigateURL="member_register.aspx" />
			</div>
		</AnonymousTemplate>
	</asp:LoginView>
</div>
