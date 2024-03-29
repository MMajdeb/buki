<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Member_Details.aspx.cs"
	Inherits="Member_Details" Title="Modify Membership Details" %>

<%@ Register Src="Photos_formpicker.ascx" TagName="Photos_formpicker" TagPrefix="Club" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="body">
		<!--Start of left column-->
		<div id="columnleft">
			<a name="content_start" id="content_start"></a>
			<div class="leftblock">
				<h2>
					����� ����� ��
					<asp:Label ID="UserName" runat="server" /></h2>
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
					����� ���� ���
				</h2>
				<div class="dashedline">
				</div>
				<p>
					����� ����� ����� ��� ����� �� ���� ���� ���. ����� ��� ������ �� ����� �����, ��� ����� ���� ����� ���� ���.
				</p>
				<asp:Label EnableViewState="False" ID="ContactStatus" runat="server" />
				<table border="0">
					<tr>
						<td class="formlabel">
							<label for="Email">
								���"�:</label></td>
						<td>
							<asp:TextBox ID="Email" runat="server" CssClass="txtfield" />
							<asp:RequiredFieldValidator ControlToValidate="Email" ErrorMessage="E-mail is required."
								ID="EmailRequired" runat="server" ToolTip="E-mail is required." ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							<label for="fname">
								�� ����:</label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="fname" CssClass="txtfield" />
							<asp:RequiredFieldValidator ControlToValidate="fname" ErrorMessage="First Name is required."
								ID="RequiredFieldValidator1" runat="server" ToolTip="First Name is required."
								ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							<label for="lname">
								�� �����:</label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="lname" CssClass="txtfield" />
							<asp:RequiredFieldValidator ControlToValidate="lname" ErrorMessage="Last Name is required."
								ID="RequiredFieldValidator2" runat="server" ToolTip="Last Name is required."
								ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							<label for="Addr">
								�����:</label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="Addr" Rows="3" TextMode="MultiLine" CssClass="txtblock" />
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							<label for="Phone">
								�����:</label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="Phone" CssClass="txtfield" />
						</td>
					</tr>
				</table>
				<p>
					<Club:RolloverButton ID="update" runat="server" Text="���� �����" OnClick="update_Click" />
				</p>
			</div>
			<asp:PlaceHolder runat="server" ID="phSuppliers" Visible="false">
			<div class="rightblock">
				<h2>
					����� ���� ���
				</h2>
				<div class="dashedline">
				</div>
				<p>
					����� ����� ����� ��� ����� �� ���� ���� ���. ����� ��� ������ �� ����� �����, ��� ����� ���� ����� ���� ���.
				</p>
				<asp:Label EnableViewState="False" ID="Label1" runat="server" />
				<table>
					<tr>
						<td class="formlabel">
							<label for="CompanyName">
								�� ����:</label>
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="CompanyName" CssClass="txtfield" />
							<asp:RequiredFieldValidator ControlToValidate="CompanyName" ErrorMessage="�� ����� ����"
								ID="RequiredFieldValidator3" runat="server" ToolTip="�� ����� ����"
								ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							<label for="ContactName">
								��� ���:</label>
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="ContactName" CssClass="txtfield" />
							<asp:RequiredFieldValidator ControlToValidate="ContactName" ErrorMessage="�� ��� ��� ��� ����."
								ID="RequiredFieldValidator4" runat="server" ToolTip="�� ��� ��� ��� ����."
								ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							<label for="ContactTitle">
								����� ��� ���:</label>
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="ContactTitle" CssClass="txtfield" />
							<asp:RequiredFieldValidator ControlToValidate="ContactTitle" ErrorMessage="����� ��� ��� ����."
								ID="RequiredFieldValidator5" runat="server" ToolTip="����� ��� ��� ����."
								ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>								
					<tr>
						<td class="formlabel">
							<label for="Address">
								�����</label>
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Address" Rows="3" TextMode="MultiLine" CssClass="txtblock" />
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							<label for="City">
								���:</label>
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="City" CssClass="txtfield" />
							<asp:RequiredFieldValidator ControlToValidate="City" ErrorMessage="��� ����."
								ID="RequiredFieldValidator6" runat="server" ToolTip="��� ����."
								ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>		
					<tr>
						<td class="formlabel">
							<label for="Region">
								�����:</label>
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Region" CssClass="txtfield" />
							<asp:RequiredFieldValidator ControlToValidate="Region" ErrorMessage="����� ����."
								ID="RequiredFieldValidator7" runat="server" ToolTip="����� ����."
								ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>														
					<tr>
						<td class="formlabel">
							<label for="PostalCode">
								���� ����:</label>
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="PostalCode" CssClass="txtfield" />
							<asp:RequiredFieldValidator ControlToValidate="PostalCode" ErrorMessage="���� ���� ����."
								ID="RequiredFieldValidator8" runat="server" ToolTip="���� ���� ����."
								ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>														
					<tr>
						<td class="formlabel">
							<label for="Country">
								���:</label>
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Country" CssClass="txtfield" />
							<asp:RequiredFieldValidator ControlToValidate="Country" ErrorMessage="����� �����."
								ID="RequiredFieldValidator9" runat="server" ToolTip="����� �����."
								ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>																						
					<tr>
						<td class="formlabel">
							<label for="Phone1">
								�����</label>
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Phone1" CssClass="txtfield" />
							<asp:RegularExpressionValidator ID="Phone1RegularExpression" runat="server" ErrorMessage="����� ����� ��� �� ����-�����: 03-3333333,077-3333333" ValidationGroup="CreateUserForm" ControlToValidate="Phone1" ValidationExpression="^(\d{2}|\d{3})-\d{7}$"></asp:RegularExpressionValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							<label for="Fax1">
								���</label>
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Fax1" CssClass="txtfield" />
						</td>
					</tr>								
					<tr>
						<td class="formlabel">
							<label for="HomePage1">
								�� ���</label>
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="HomePage1" CssClass="txtfield" />
						</td>
					</tr>								
				</table>
				<p>
					<Club:RolloverButton ID="updateSupplier" runat="server" Text="���� ����� ���" OnClick="updateSupplier_Click" />
					&nbsp;&nbsp;&nbsp;
					<Club:RolloverButton ID="UpdateDupplierInfr" runat="server" Text="���� ����� ��� �������" OnClientClick="window.location='Member_Supplier_Layout.aspx'; return false;"  />
				</p>
			</div>			
			</asp:PlaceHolder>
			<div class="rightblock">
				<h2>
					����� �����
				</h2>
				<div class="dashedline">
				</div>
				<p>
					��� ���� ������ ����� ����� ������ ������. ������ ������� ���:
				</p>
				<asp:Image runat="server" ID="avatarimage" CssClass="photo" />
				<p>
					To upload a new image, select a file and click on the upload button.</p>
				Filename:
				<asp:FileUpload ID="newavatar" runat="server" />
				<p>
					<Club:RolloverButton ID="uploadimage" runat="server" Text="Upload Image" OnClick="uploadimage_Click" />
					<Club:RolloverButton ID="clearimage" runat="server" Text="Clear Image" OnClick="clearimage_Click" /></p>
			</div>
			<div class="rightblock">
				<h2>
					Change Password
				</h2>
				<div class="dashedline">
				</div>
				<asp:ChangePassword ID="ChangePassword1" runat="server">
					<ChangePasswordTemplate>
						<table border="0" cellpadding="1">
							<tr>
								<td>
									<table border="0" cellpadding="0">
										<tr>
											<td align="center" colspan="2">
												Change Your Password</td>
										</tr>
										<tr>
											<td align="right">
												<asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Password:</asp:Label></td>
											<td>
												<asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
												<asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword"
													ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
											</td>
										</tr>
										<tr>
											<td align="right">
												<asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label></td>
											<td>
												<asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
												<asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword"
													ErrorMessage="New Password is required." ToolTip="New Password is required."
													ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
											</td>
										</tr>
										<tr>
											<td align="right">
												<asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label></td>
											<td>
												<asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
												<asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
													ErrorMessage="Confirm New Password is required." ToolTip="Confirm New Password is required."
													ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
											</td>
										</tr>
										<tr>
											<td align="center" colspan="2">
												<asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
													ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry."
													ValidationGroup="ChangePassword1"></asp:CompareValidator>
											</td>
										</tr>
										<tr>
											<td align="center" colspan="2" style="color: red">
												<asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
											</td>
										</tr>
										<tr>
											<td align="right">
												<asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword"
													Text="Change Password" ValidationGroup="ChangePassword1" />
											</td>
											<td>
												<asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel"
													Text="Cancel" />
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</ChangePasswordTemplate>
				</asp:ChangePassword>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
