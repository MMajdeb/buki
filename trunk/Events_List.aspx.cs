using System;
using DevCow.Web.UI;
using System.Web.Security;

public partial class Events_List : DevCowThemePage
{
	protected bool IsAdmin;
	
	protected void Page_Load(object sender, EventArgs e)
	{
		IsAdmin = User.IsInRole("Administrators");
		panel1.Visible = IsAdmin;

        //fill list by user
        ObjectDataSourceEventsUpcoming.SelectParameters["UserID"].DefaultValue = Membership.GetUser().ProviderUserKey.ToString();
        ObjectDataSourceRecentUsers.SelectParameters["UserID"].DefaultValue = Membership.GetUser().ProviderUserKey.ToString();
	}

}
