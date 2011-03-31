<%@ Page Language="C#" MasterPageFile="~/4guys.master" %>

<script runat="server">
	MembershipUser user;
    string username;
    
	private void Page_Load()
	{
        username = Request.QueryString["username"];
        if (username == null || username == "")
        {
            Response.Redirect("users.aspx");
        }
        user = Membership.GetUser(username);
        lblHead.Text = "Change user " + user.UserName;
        ConfirmationMessage.InnerText = "";        
        
		if (IsPostBack)
		{
			try
			{
				CahngeUser();

                ConfirmationMessage.InnerText = "Password Changed";
				//Response.Redirect("users.aspx");
			}
			catch (Exception ex)
			{
				ConfirmationMessage.InnerText = "Change Failure: " + ex.Message;
			}            
            
   
		}
	}

    protected void CahngeUser()
	{
        user.ChangePassword(user.ResetPassword(), userpass.Text);
	}

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="c" Runat="Server">

<!-- #include file="_nav.aspx -->

<table class="webparts">
<tr>
	<th>
        <asp:Label ID="lblHead" runat="server" Text="Change user"></asp:Label></th>
</tr>
<tr>
<td class="details" valign="top">

<h3>Password</h3>

<table>
<tr>
	<td class="detailheader">New passwrd</td>
	<td>
		<asp:TextBox ID="userpass" runat="server"></asp:TextBox>
	</td>    
    	<td>
		
	</td>
</tr>
<tr>
	<td class="detailheader">Confirm Password</td>
	<td>
		<asp:TextBox ID="confirmpassword" runat="server"></asp:TextBox>
	</td>
	<td>
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ErrorMessage="password error" ControlToCompare="userpass" 
            ControlToValidate="confirmpassword" Font-Bold="True" ForeColor="Red"></asp:CompareValidator>
	</td>
</tr>
<tr>
	<td colspan="3"><br />
		<input type="submit" value="Change password" runat="server" />&nbsp;&nbsp;
	</td>
</tr>
<tr>
	<td colspan="3">
	<div id="ConfirmationMessage" runat="server" class="alert"></div>
	</td>
</tr>
</table>

</td>

</tr></table>

</asp:Content>