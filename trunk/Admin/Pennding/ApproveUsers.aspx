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
					עדכון משתמש</h3>
				<div class="dashedline">
				</div>
				<asp:Label runat="server" ID="lblResult" style="color:Red;font-weight:bolder;"></asp:Label>
				<h3>
					הרשאות:</h3>
				<asp:CheckBoxList ID="UserRoles" runat="server" />
				<div class="dashedline">
				</div>				
				<h3>
					מידע כללי:</h3>
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
							<asp:Button ID="btnUpdateA" runat="server" Text="עדכן משתמש" 
								onclick="btnUpdateA_Click" />							
							<input type="reset" />							
						</td>
					</tr>
				</table>
				<div class="dashedline">
				</div>
				<h3>
					מידע מורחב:</h3>
				<div class="dashedline">
				</div>				
				<table>
					<tr>
						<td class="formlabel">
							שם פרטי:
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="fname" CssClass="txtfield" />
										<asp:RequiredFieldValidator ControlToValidate="fname" ErrorMessage="שם פרטי נדרש"
											ID="RequiredFieldValidator1" runat="server" ToolTip="שם פרטי נדרש"
											ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							שם משפחה:
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="lname" CssClass="txtfield" />
										<asp:RequiredFieldValidator ControlToValidate="lname" ErrorMessage="שם משפחה נדרש"
											ID="RequiredFieldValidator2" runat="server" ToolTip="שם משפחה נדרש"
											ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							כתובת:
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Addr" Rows="3" TextMode="MultiLine" CssClass="txtblock" />
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							טלפון:
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Phone" CssClass="txtfield" />
						</td>
					</tr>
					<tr>
						<td colspan="2" class="formvalue">
							<br />
							<asp:Button ID="btnUpdateB" runat="server" Text="עדכן פרטי משתמש מורחב" 
								onclick="btnUpdateB_Click" />							
							<input type="reset" />							
						</td>
					</tr>
				</table>				
				<asp:PlaceHolder runat="server" ID="phSuppliers">
				<div class="dashedline">
				</div>
				<h3>
					מידע ספק:</h3>
				<div class="dashedline">
				</div>				
				<table>
					<tr>
						<td class="formlabel">
							שם חברה:
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="CompanyName" CssClass="txtfield" />
										<asp:RequiredFieldValidator ControlToValidate="CompanyName" ErrorMessage="שם החברה נדרש"
											ID="RequiredFieldValidator3" runat="server" ToolTip="שם החברה נדרש"
											ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							איש קשר:
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="ContactName" CssClass="txtfield" />
										<asp:RequiredFieldValidator ControlToValidate="ContactName" ErrorMessage="שם איש קשר הוא נדרש."
											ID="RequiredFieldValidator4" runat="server" ToolTip="שם איש קשר הוא נדרש."
											ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							תיאור איש קשר:
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="ContactTitle" CssClass="txtfield" />
										<asp:RequiredFieldValidator ControlToValidate="ContactTitle" ErrorMessage="תיאור איש קשר נדרש."
											ID="RequiredFieldValidator5" runat="server" ToolTip="תיאור איש קשר נדרש."
											ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							כתובת
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Address" Rows="3" TextMode="MultiLine" CssClass="txtblock" />
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							עיר:
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="City" CssClass="txtfield" />
										<asp:RequiredFieldValidator ControlToValidate="City" ErrorMessage="עיר נדרש."
											ID="RequiredFieldValidator6" runat="server" ToolTip="עיר נדרש."
											ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							איזור:
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Region" CssClass="txtfield" />
										<asp:RequiredFieldValidator ControlToValidate="Region" ErrorMessage="איזור נדרש."
											ID="RequiredFieldValidator7" runat="server" ToolTip="איזור נדרש."
											ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							תיבת דואר:
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="PostalCode" CssClass="txtfield" />
										<asp:RequiredFieldValidator ControlToValidate="PostalCode" ErrorMessage="תיבת דואר נדרש."
											ID="RequiredFieldValidator8" runat="server" ToolTip="תיבת דואר נדרש."
											ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							ארץ:
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Country" CssClass="txtfield" />
										<asp:RequiredFieldValidator ControlToValidate="Country" ErrorMessage="מדינה נדרשת."
											ID="RequiredFieldValidator9" runat="server" ToolTip="מדינה נדרשת."
											ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							טלפון
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Phone1" CssClass="txtfield" />
										<asp:RegularExpressionValidator ID="Phone1RegularExpression" runat="server" ErrorMessage="פורמט טלפון הוא לא חוקי-דוגמה: 03-3333333,077-3333333" ValidationGroup="CreateUserForm" ControlToValidate="Phone1" ValidationExpression="^(\d{2}|\d{3})-\d{7}$"></asp:RegularExpressionValidator>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							פקס
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="Fax1" CssClass="txtfield" />
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							דף בית
						</td>
						<td class="formvalue">
							<asp:TextBox runat="server" ID="HomePage1" CssClass="txtfield" />
						</td>
					</tr>
					
					<tr>
						<td colspan="2" class="formvalue">
							<br />
							<asp:Button ID="btnUpdateC" runat="server" Text="עדכן ספק/משתמש" onclick="btnUpdateC_Click" />							
							<input type="reset" />							
						</td>
					</tr>
				</table>				
				</asp:PlaceHolder>
			</div>
		</div>
	</div>
</asp:Content>
