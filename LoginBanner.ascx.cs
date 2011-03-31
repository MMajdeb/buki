using System;
using System.Web.Security;

public partial class LoginBanner : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
	protected void Logoutbtn_Click(object sender, System.EventArgs e)
	{
		FormsAuthentication.SignOut();
	}
}
