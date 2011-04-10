using System;
using System.Web.Security;
using DevCow.Web.UI;
using System.Web.UI.WebControls;

public partial class Member_Register : DevCowThemePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateUserFinished(object sender, System.Web.UI.WebControls.WizardNavigationEventArgs e)
    {
        try
        {            
            BukiDataSetTableAdapters.MemberInfoTableAdapter da = new BukiDataSetTableAdapters.MemberInfoTableAdapter();
            MembershipUser user = Membership.GetUser(CreateUserWizard1.UserName);

            //get the type of user
            CheckBox isSupplier = (CheckBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("Suplier");
            byte userType = 0;

            if (isSupplier.Checked)
            {
                userType = 1;
            }

            da.Insert(((Guid)(user.ProviderUserKey)), Addr.Text, Phone.Text, fname.Text, lname.Text, userType);

            // insert into memeberinfo suppliers            
            if (isSupplier.Checked == true)
            {
                BukiDataSetTableAdapters.SupplierzTableAdapter mista = new BukiDataSetTableAdapters.SupplierzTableAdapter();
                mista.Insert(((Guid)(user.ProviderUserKey)), CompanyName.Text,
                    ContactName.Text,
                    ContactTitle.Text,
                    Address.Text,
                    City.Text,
                    Region.Text,
                    PostalCode.Text,
                    Country.Text,
                    Phone1.Text,
                    Fax1.Text,
                    HomePage1.Text);
            }

            //user.IsApproved = true;
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
            //FormsAuthentication.SetAuthCookie(CreateUserWizard1.UserName, false);

            // continue to complete
            //CreateUserWizard1.ActiveStepIndex = 4;
        }
        catch
        {
        }
    }

    protected void CreateUserWizard1_ActiveStepChanged(object sender, EventArgs e)
    {
        //CheckBox isSupplier = (CheckBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("Suplier");
        //if (isSupplier.Checked == false)
        //{            
        //    if (CreateUserWizard1.ActiveStep == WizardStepSupplier)
        //    {
        //        CreateUserWizard1.ActiveStepIndex += 1;
        //    }
        //}
    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        CheckBox isSupplier = (CheckBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("Suplier");
        if (isSupplier.Checked == false)
        {
            //CreateUserWizard1.WizardSteps.Remove(WizardStepSupplier);
            WizardStep1.StepType = WizardStepType.Finish;
        }
    }
}
