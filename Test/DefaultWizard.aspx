<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultWizard.aspx.cs" Inherits="Test_DefaultWizard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="1">
			<WizardSteps>
				<asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1">
				</asp:WizardStep>
				<asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2">
				</asp:WizardStep>
				<asp:WizardStep ID="gh" runat="server" StepType="Complete" Title="com">
				</asp:WizardStep>
			</WizardSteps>
			<FinishNavigationTemplate>
				<asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" 
					CommandName="MovePrevious" Text="Previous" />
				<asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" 
					Text="Finish" />
			</FinishNavigationTemplate>
		</asp:Wizard>
    </div>
    </form>
</body>
</html>
