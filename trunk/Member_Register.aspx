<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Member_Register.aspx.cs"
	Inherits="Member_Register" Title="New Member Registration" %>

<%@ Register Src="Photos_formpicker.ascx" TagName="Photos_formpicker" TagPrefix="Club" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="body">
		<!--Start of left column-->
		<div id="columnleft">
			<a name="content_start" id="content_start"></a>
			<div class="leftblock">
				<h2>
					New Member Registration</h2>
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
					����� ����� ���
				</h2>
				<div class="dashedline">
				</div>
				<asp:CreateUserWizard ID="CreateUserWizard1" runat="server" DisableCreatedUser="True"
					OnFinishButtonClick="CreateUserFinished"  
					onactivestepchanged="CreateUserWizard1_ActiveStepChanged" 
					oncreateduser="CreateUserWizard1_CreatedUser" FinishDestinationPageUrl="Member_Register_Complete.aspx">
					<WizardSteps>						
						<asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
							<ContentTemplate>
								<p>
									����� ���� ����� ��� ����
								</p>
								<table border="0">
									<tr>
										<td class="formlabel">
											<label for="UserName">
												�� �����:</label></td>
										<td>
											<asp:TextBox ID="UserName" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
												ErrorMessage="�� ����� ����." ToolTip="�� ����� ����." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
											<asp:RegularExpressionValidator ID="UserNameRegularExpression" runat="server" ErrorMessage="����� �� ����� �� ����" ControlToValidate="UserName" ValidationExpression="^[a-zA-Z]+.*$" ValidationGroup="CreateUserWizard1"></asp:RegularExpressionValidator>												
										</td>
									</tr>
									<tr>
										<td class="formlabel">
											<label for="Password">
												�����:</label></td>
										<td>
											<asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
											<asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
												ErrorMessage="����� �����." ToolTip="����� �����." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
										</td>
									</tr>
									<tr>
										<td class="formlabel">
											<label for="ConfirmPassword">
												����� �����:</label></td>
										<td>
											<asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
											<asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
												ErrorMessage="��� ����� �����." ToolTip="��� ����� �����."
												ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
										</td>
									</tr>
									<tr>
										<td class="formlabel">
											<label for="Email">
												���� ��������:</label></td>
										<td>
											<asp:TextBox ID="Email" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
												ErrorMessage="���� �������� ��� ����." ToolTip="���� �������� ��� ����." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
											<asp:RegularExpressionValidator ID="EmailRegularExpression" runat="server" 
												ErrorMessage="����� ���� �������� ���� �����" ControlToValidate="Email" 
												ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
												ValidationGroup="CreateUserWizard1"></asp:RegularExpressionValidator>
										</td>
									</tr>
									<tr>
										<td class="formlabel">
											<label for="Question">
												���� �����:</label></td>
										<td>
											<asp:TextBox ID="Question" runat="server"></asp:TextBox>											
										</td>
									</tr>
									<tr>
										<td class="formlabel">
											<label for="Answer">
												����� �����:</label></td>
										<td>
											<asp:TextBox ID="Answer" runat="server"></asp:TextBox>											
										</td>
									</tr>
									<tr>
										<td class="formlabel">
											<label for="Suplier">
												����� �����/���:</label></td>
										<td>
											<asp:CheckBox ID="Suplier" runat="server" />											
										</td>
									</tr>									
									<tr>
										<td align="center" colspan="2">
											<asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
												ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="����� ������ ����� ������ ������."
												ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
										</td>
									</tr>
									<tr>
										<td align="center" colspan="2" style="color: red">
											<asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
										</td>
									</tr>
								</table>
							</ContentTemplate>							
							<CustomNavigationTemplate>								
								<Club:RolloverButton ID="cu" runat="server" CommandName="MoveNext" ValidationGroup="CreateUserWizard1" Text="��� �����" />								
							</CustomNavigationTemplate>
						</asp:CreateUserWizardStep>
						<asp:WizardStep ID="WizardStep1" runat="server" Title="Contact details">
							<table>
								<tr>
									<td class="formlabel">
										<label for="fname">
											�� ����:</label>
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
										<label for="lname">
											�� �����:</label>
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
										<label for="Addr">
											�����:</label>
									</td>
									<td class="formvalue">
										<asp:TextBox runat="server" ID="Addr" Rows="3" TextMode="MultiLine" CssClass="txtblock" />
									</td>
								</tr>
								<tr>
									<td class="formlabel">
										<label for="Phone">
											�����:</label>
									</td>
									<td class="formvalue">
										<asp:TextBox runat="server" ID="Phone" CssClass="txtfield" />
									</td>
								</tr>
							</table>
						</asp:WizardStep>
						<asp:WizardStep ID="WizardStepSupplier" runat="server" Title="Supplier details">
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
										<asp:RegularExpressionValidator ID="Phone1RegularExpression" runat="server" ErrorMessage="����� ����� ��� �� ����-�����: 03-3333333,077-3333333" ValidationGroup="CreateUserForm" ControlToValidate="Phone1" ValidationExpression="(\d{2})|(\d{3})-(\d{7})"></asp:RegularExpressionValidator>
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
						</asp:WizardStep>
						<asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
							<ContentTemplate>
								<p>
									������ ��� ���� ������.
								</p>
								<Club:RolloverButton ID="ContinueButton" runat="server" CommandName="Continue" Text="����" />
							</ContentTemplate>
						</asp:CompleteWizardStep>
					</WizardSteps>
					<StepNavigationTemplate>
						<Club:RolloverButton ID="StepPreviousButton" runat="server" CausesValidation="False"
							CommandName="MovePrevious" Text="�����" />
						<Club:RolloverButton ID="StepNextButton" runat="server" CommandName="MoveNext" Text="���" CausesValidation="True" ValidationGroup="CreateUserForm" />						
					</StepNavigationTemplate>					
					<FinishNavigationTemplate> 
						<Club:RolloverButton ID="StepPreviousButton" runat="server" CausesValidation="False"
							CommandName="MovePrevious" Text="�����" />					
						<%--<Club:RolloverButton ID="StepFinishButton" runat="server" CausesValidation="False"
							CommandName="MoveFinish" Text="Finish" />--%>
						<Club:RolloverButton ID="StepCompleteButton" runat="server" CausesValidation="True" ValidationGroup="CreateUserForm"
							CommandName="MoveComplete" Text="����" />							
					</FinishNavigationTemplate>							
				</asp:CreateUserWizard>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
