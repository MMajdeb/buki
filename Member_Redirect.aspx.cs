using System;
using DevCow.Web.UI;

public partial class Member_Redirect : DevCowThemePage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Page.User.Identity.IsAuthenticated)
		{
			Response.Redirect("member_details.aspx");
		}
		else
		{
			Response.Redirect("member_register.aspx");
		}
	}
}
