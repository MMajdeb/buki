using System;
using System.Web.Security;
using DevCow.Web.UI;

public partial class _Default : DevCowThemePage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        bool isAdmin = Page.User.IsInRole("Administrators");
        MemberAppendingAprove1.Visible = isAdmin;
	}



}
