<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="ApproveUsers.aspx.cs"
	Inherits="ApproveUsers" Title="My User Group" %>

<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="body">
		<div id="columnleft">
			<div class="leftblock">
			</div>
		</div>
		<div id="Div1">
			<div class="rightblock">
				<h3>
					����� �����</h3>
				<div class="dashedline">
				</div>
				<asp:Label runat="server" ID="lblResult" style="color:Red;font-weight:bolder;"></asp:Label>
				<h3>
					������:</h3>
				<asp:CheckBoxList ID="UserRoles" runat="server" />
				<div class="dashedline">
				</div>				
				<h3>
					���� ����:</h3>
				<br />
				<table>
					<tr>
						<td class="formlabel">
							Active User
						</td>
						<td class="formvalue">
							<asp:CheckBox ID="isapproved" runat="server" Checked="false" />
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							User Name
						</td>
						<td class="formvalue">
							<asp:TextBox ID="username1" runat="server"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							Email
						</td>
						<td class="formvalue">
							<asp:TextBox ID="email" runat="server"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							Comment
						</td>
						<td class="formvalue">
							<asp:TextBox ID="comment" runat="server"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="formvalue">
							<br />
							<asp:Button ID="btnUpdateA" runat="server" Text="���� �����" 
								onclick="btnUpdateA_Click" />							
							<input type="reset" />							
						</td>
					</tr>
				</table>
				<div class="dashedline">
				</div>
				<h3>
					���� �����:</h3>
				<div class="dashedline">
				</div>				
				<table>
					<tr>
						<td class="formlabel">
							�� ����:
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="fname" CssClass="txtfield" />
										<asp:RequiredFieldValidator ControlToValidate="fname" ErrorMessage="�� ���� ����"
											ID="RequiredFieldValidator1" runat="server" ToolTip="�� ���� ����"
											ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							�� �����:
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="lname" CssClass="txtfield" />
										<asp:RequiredFieldValidator ControlToValidate="lname" ErrorMessage="�� ����� ����"
											ID="RequiredFieldValidator2" runat="server" ToolTip="�� ����� ����"
											ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							�����:
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Addr" Rows="3" TextMode="MultiLine" CssClass="txtblock" />
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							�����:
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Phone" CssClass="txtfield" />
						</td>
					</tr>
					<tr>
						<td colspan="2" class="formvalue">
							<br />
							<asp:Button ID="btnUpdateB" runat="server" Text="���� ���� ����� �����" 
								onclick="btnUpdateB_Click" />							
							<input type="reset" />							
						</td>
					</tr>
				</table>				
				<asp:PlaceHolder runat="server" ID="phSuppliers">
				<div class="dashedline">
				</div>
				<h3>
					���� ���:</h3>
				<div class="dashedline">
				</div>				
				<table>
					<tr>
						<td class="formlabel">
							�� ����:
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
							��� ���:
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
							����� ��� ���:
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
							�����
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Address" Rows="3" TextMode="MultiLine" CssClass="txtblock" />
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							���:
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
							�����:
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
							���� ����:
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
							���:
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
							�����
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Phone1" CssClass="txtfield" />
										<asp:RegularExpressionValidator ID="Phone1RegularExpression" runat="server" ErrorMessage="����� ����� ��� �� ����-�����: 03-3333333,077-3333333" ValidationGroup="CreateUserForm" ControlToValidate="Phone1" ValidationExpression="^(\d{2}|\d{3})-\d{7}$"></asp:RegularExpressionValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							���
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Fax1" CssClass="txtfield" />
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							�� ���
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="HomePage1" CssClass="txtfield" />
						</td>
					</tr>
					
					<tr>
						<td colspan="2" class="formvalue">
							<br />
							<asp:Button ID="btnUpdateC" runat="server" Text="���� ���/�����" onclick="btnUpdateC_Click" />							
							<input type="reset" />							
						</td>
					</tr>
				</table>				
				</asp:PlaceHolder>
			</div>
		</div>
	</div>
</asp:Content>
