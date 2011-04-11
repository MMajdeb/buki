using System;
using System.Drawing;
using System.Web.Security;
using DevCow.Web.UI;

public partial class Member_Supplier_Infrastructure : DevCowThemePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!Page.User.Identity.IsAuthenticated)
		{
			Response.Write("To use the member details functionality, you need to be authenticated. Please use the <a href='login.aspx'>Login</a> page to authenticate yourself.");
			Response.End();
		}
    }

}
