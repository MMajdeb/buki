using System;
using System.Web.Security;
using DevCow.Web.UI;

public partial class Member_Register : DevCowThemePage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void CreateUserFinished(object sender, System.Web.UI.WebControls.WizardNavigationEventArgs e)
	{
		try
		{
			DataSetTableAdapters.MemberInfoTableAdapter da = new DataSetTableAdapters.MemberInfoTableAdapter();
			MembershipUser user = Membership.GetUser(CreateUserWizard1.UserName);
			da.Insert(((Guid)(user.ProviderUserKey)), Addr.Text, Phone.Text, fname.Text, lname.Text);
			user.IsApproved = true;
            if (Membership.GetAllUsers().Count == 1)
            {
                // Validate "Administrator" role is avaliable
                if (!Roles.RoleExists("Administrators"))
                {
                    Roles.CreateRole("Administrators");
                }
                // Add the user to the role
                Roles.AddUserToRole(user.UserName, "Administrators");
            }
			Membership.UpdateUser(user);
			FormsAuthentication.SetAuthCookie(CreateUserWizard1.UserName, false);
		}
		catch
		{
		}
	}
}
