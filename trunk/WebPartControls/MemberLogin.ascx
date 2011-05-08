<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MemberLogin.ascx.cs" Inherits="WebPartControls_MemberLogin" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:LoginView ID="LoginControl" runat="server">
					<AnonymousTemplate>
						<h2>
							התחברות</h2>
						<div class="dashedline">
						</div>
						<asp:Login ID="Login1" runat="server">
							<LayoutTemplate>
								<h3 class="none">
									התחברות לאתר</h3>
								<fieldset>
									<asp:Panel ID="pl" runat="server" DefaultButton="LoginButton"> 
									<legend class="none">התחברות לאתר</legend>
									<asp:Label runat="server" AssociatedControlID="UserName" ID="UserNameLabel">User name:</asp:Label>
									<br />
									<asp:TextBox runat="server" ID="UserName"></asp:TextBox>
									<asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" ValidationGroup="Login1"
										ErrorMessage="User Name is required." ToolTip="User Name is required." ID="UserNameRequired">*</asp:RequiredFieldValidator>
									<p>
									</p>
									<asp:Label runat="server" AssociatedControlID="Password" ID="PasswordLabel">Password:</asp:Label>
									<br />
									<asp:TextBox runat="server" TextMode="Password" ID="Password"></asp:TextBox>
									<asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ValidationGroup="Login1"
										ErrorMessage="Password is required." ToolTip="Password is required." ID="PasswordRequired">*</asp:RequiredFieldValidator>
									<p>
									</p>
									<asp:CheckBox runat="server" ID="RememberMe" Text="Remember me next time." />
									<p>
									</p>									
									<Club:RolloverButton runat="server" ValidationGroup="Login1" Text="Login" ID="LoginButton"
										CommandName="Login" />									
									<p>
									</p>
									<asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
									</asp:Panel>	
								</fieldset>
							</LayoutTemplate>
						</asp:Login>
					</AnonymousTemplate>
					<LoggedInTemplate>
						<h2>
							Hello
							<asp:LoginName ID="LoginName1" runat="server" />
						</h2>
						<p>
							Welcome back to the clubsite.
						</p>
						<Club:RolloverButton runat="server" ID="logout" Text="Log off" OnClick="logout_click" />
					</LoggedInTemplate>
				</asp:LoginView>