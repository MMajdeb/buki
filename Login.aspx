<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Login.aspx.cs"
	Inherits="Login" Title="Login" %>

<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="body">
		<!--Start of left column-->
		<div id="columnleft">
			<a name="content_start" id="content_start"></a>
			<div class="leftblock">
				<h2>
					Login</h2>
				<p>
					Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
					euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad
					minim veniam, quis nostrud exercitation ulliam corper suscipit lobortis nisl ut
					aliquip ex ea commodo consequat. Duis autem veleum iriure dolor in hendrerit in
					vulputate velit esse molestie consequat, vel willum lunombro dolore eu feugiat nulla
					facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent
					luptatum zzril delenit augue duis dolore te feugait nulla facilisi.</p>
			</div>
		</div>
		<!--end columnleft-->
		<!--Start of right column-->
		<div id="columnright">
			<div class="rightblock">
				<h2>
					Login</h2>
				<div class="dashedline">
				</div>
				<h3 class="none">
					Log into My Club Site</h3>
				<asp:Login ID="Login1" runat="server">
					<LayoutTemplate>
						<fieldset>
							<legend class="none">Log into My Club Site</legend>
							<asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
							<table>
								<tr>
									<td>
										<asp:Label runat="server" AssociatedControlID="UserName" ID="UserNameLabel">User name:</asp:Label></td>
									<td>
										<asp:TextBox runat="server" ID="UserName"></asp:TextBox>
										<asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" ValidationGroup="Login1"
											ErrorMessage="User Name is required." ToolTip="User Name is required." ID="UserNameRequired">*</asp:RequiredFieldValidator>
									</td>
								</tr>
								<tr>
									<td>
										<asp:Label runat="server" AssociatedControlID="Password" ID="PasswordLabel">Password:</asp:Label></td>
									<td>
										<asp:TextBox runat="server" TextMode="Password" ID="Password"></asp:TextBox>
										<asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ValidationGroup="Login1"
											ErrorMessage="Password is required." ToolTip="Password is required." ID="PasswordRequired">*</asp:RequiredFieldValidator>
									</td>
								</tr>
								<tr>
									<td>
									</td>
									<td>
										<asp:CheckBox runat="server" ID="RememberMe" Text="Remember me next time." /></td>
								</tr>
							</table>
							<Club:RolloverButton ID="LoginButton" runat="server" Text="Login" CommandName="Login" />
						</fieldset>
					</LayoutTemplate>
				</asp:Login>
			</div>
			<div class="rightblock">
				<h2>
					Forgot Username or Password
				</h2>
				<div class="dashedline">
				</div>
				<asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
					<UserNameTemplate>
						Forgot your password? Enter your username to recover your password.
						<asp:Literal EnableViewState="False" ID="FailureText" runat="server"></asp:Literal>
						<table border="0" cellpadding="0">
							<tr>
								<td align="right">
									<asp:Label AssociatedControlID="UserName" ID="UserNameLabel" runat="server">User Name:</asp:Label></td>
								<td>
									<asp:TextBox ID="UserName" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ControlToValidate="UserName" ErrorMessage="User Name is required."
										ID="UserNameRequired" runat="server" ToolTip="User Name is required." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
								</td>
							</tr>
						</table>
						<Club:RolloverButton CommandName="Submit" ID="SubmitButton" runat="server" Text="Submit"
							ValidationGroup="PasswordRecovery1" />
					</UserNameTemplate>
				</asp:PasswordRecovery>
			</div>
			<div class="rightblock">
				<h2>
					New member registration</h2>
				<div class="dashedline">
				</div>
				<p>
					Do not have a Login? Use the <a href="Member_Register.aspx">registration</a> page
					to join the club.</p>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
