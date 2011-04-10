<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Member_Register_Complete.aspx.cs"
	Inherits="Member_Register_Complete" Title="New Member Registration" %>

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
					רישום משתמש חדש
				</h2>
				<div class="dashedline">
				</div>
				<asp:CreateUserWizard ID="CreateUserWizard1" runat="server" ActiveStepIndex="1"
				FinishDestinationPageUrl="Default.aspx">
					<WizardSteps>												
						<asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
							<ContentTemplate>
								<p>
									החשבון שלך נוצר בהצלחה.
								</p>
								<Club:RolloverButton ID="ContinueButton" runat="server" CommandName="MoveComplete" Text="המשך" />
							</ContentTemplate>
						</asp:CompleteWizardStep>
					</WizardSteps>
					<StepNavigationTemplate>
						<Club:RolloverButton ID="StepPreviousButton" runat="server" CausesValidation="False"
							CommandName="MovePrevious" Text="הקודם" />
						<Club:RolloverButton ID="StepNextButton" runat="server" CommandName="MoveNext" Text="הבא" />						
					</StepNavigationTemplate>					
					<FinishNavigationTemplate> 
						<Club:RolloverButton ID="StepPreviousButton" runat="server" CausesValidation="False"
							CommandName="MovePrevious" Text="הקודם" />					
						<%--<Club:RolloverButton ID="StepFinishButton" runat="server" CausesValidation="False"
							CommandName="MoveFinish" Text="Finish" />--%>
						<Club:RolloverButton ID="StepCompleteButton" runat="server" CausesValidation="False"
							CommandName="MoveComplete" Text="סיום" />							
					</FinishNavigationTemplate>							
				</asp:CreateUserWizard>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
