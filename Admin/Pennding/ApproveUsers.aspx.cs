using System;
using System.Web.Security;
using DevCow.Web.UI;
using System.Web.UI.WebControls;

public partial class ApproveUsers : DevCowThemePage
{
    string username;
    string usertype;
    MembershipUser user;

    protected void Page_Init(object sender, EventArgs e)
    {
    }

	protected void Page_Load(object sender, EventArgs e)
	{
        bool isAdmin = Page.User.IsInRole("Administrators");
        //MemberAppendingAprove1.Visible = isAdmin;
        username = Request.QueryString["username"];
        usertype = Request.QueryString["usertype"];
        user = Membership.GetUser(username);

        if (IsPostBack == false)
        {
            
            if (username == null || username == "")
            {
                Response.Redirect("users.aspx");
            }            

            // hide suppliers panel
            if (usertype == "0")
            {
                phSuppliers.Visible = false;
            }
    
            // Load the User Roles into checkboxes.
            UserRoles.DataSource = Roles.GetAllRoles();
            UserRoles.DataBind();

            // Bind these checkboxes to the User's own set of roles.
            string[] userRoles = Roles.GetRolesForUser(username);
            foreach (string role in userRoles)
            {
                ListItem checkbox = UserRoles.Items.FindByValue(role);
                checkbox.Selected = true;
            }

            //update part 1
            //set start details
            isapproved.Checked = user.IsApproved;
            email.Text = user.Email;
            comment.Text = user.Comment;
            username1.Text = username;
            
            //update part 2
            BukiDataSetTableAdapters.MemberInfoTableAdapter mida = new BukiDataSetTableAdapters.MemberInfoTableAdapter();
            BukiDataSet.MemberInfoRow midr;

            // get memeber
            midr = mida.GetMember((Guid)(user.ProviderUserKey))[0];

            fname.Text = midr.firstname;
            lname.Text = midr.lastname;
            Addr.Text = midr.address;
            Phone.Text = midr.phone;

            if (usertype == "1")
            {
                //update part 3
                BukiDataSetTableAdapters.SupplierzTableAdapter sda = new BukiDataSetTableAdapters.SupplierzTableAdapter();
                BukiDataSet.SupplierzRow sdr;

                // get memeber
                sdr = sda.GetDataByMemberID((Guid)(user.ProviderUserKey))[0];

                CompanyName.Text = sdr.CompanyName;
                ContactName.Text = sdr.ContactName;
                ContactTitle.Text = sdr.ContactTitle;
                Address.Text = sdr.Address;
                City.Text = sdr.City;
                Region.Text = sdr.Region;
                PostalCode.Text = sdr.PostalCode;
                Country.Text = sdr.Country;
                Phone1.Text = sdr.Phone;
                Fax1.Text = sdr.Fax;
                HomePage1.Text = sdr.HomePage;
            }


        }

        if (IsPostBack)
        {
            try
            {
            }
            catch (Exception ex)
            {
            }
        }
	}

    private void UpdateUserRoles()
    {
        foreach (ListItem rolebox in UserRoles.Items)
        {
            if (rolebox.Selected)
            {
                if (!Roles.IsUserInRole(username, rolebox.Text))
                {
                    Roles.AddUserToRole(username, rolebox.Text);
                }
            }
            else
            {
                if (Roles.IsUserInRole(username, rolebox.Text))
                {
                    Roles.RemoveUserFromRole(username, rolebox.Text);
                }
            }
        }
    }

    private void DeleteUser(object sender, EventArgs e)
    {
        //Membership.DeleteUser(username, false); // DC: My apps will NEVER delete the related data.
        Membership.DeleteUser(username, true); // DC: except during testing, of course!
        Response.Redirect("users.aspx");
    }

    private void UpdateUser(object sender, EventArgs e)
    {
        // Update user info:
        Membership.UpdateUser(user);

        // Update user roles:
        UpdateUserRoles();
    }

    protected void btnUpdateA_Click(object sender, EventArgs e)
    {
        user.IsApproved = isapproved.Checked;
        user.Email = email.Text;
        user.Comment = comment.Text;

        // Update user info:
        Membership.UpdateUser(user);

        // Update user roles:
        UpdateUserRoles();

        lblResult.Text = "מידע כללי עודכן בהצלחה";
    }
    protected void btnUpdateB_Click(object sender, EventArgs e)
    {
        BukiDataSetTableAdapters.MemberInfoTableAdapter mida = new BukiDataSetTableAdapters.MemberInfoTableAdapter();
        BukiDataSet.MemberInfoRow midr;        

        // get memeber
        midr = mida.GetMember((Guid)(user.ProviderUserKey))[0];

        midr.firstname = fname.Text;
        midr.lastname = lname.Text;
        midr.address = Addr.Text;
        midr.phone = Phone.Text;

        mida.Update(midr);

        lblResult.Text = "מידע מורחב עודכן בהצלחה";
    }

    protected void btnUpdateC_Click(object sender, EventArgs e)
    {
        //update part 3
        BukiDataSetTableAdapters.SupplierzTableAdapter sda = new BukiDataSetTableAdapters.SupplierzTableAdapter();
        BukiDataSet.SupplierzRow sdr;

        // get memeber
        sdr = sda.GetDataByMemberID((Guid)(user.ProviderUserKey))[0];

        sdr.CompanyName = CompanyName.Text;
        sdr.ContactName=ContactName.Text;
        sdr.ContactTitle=ContactTitle.Text;
        sdr.Address=Address.Text;
        sdr.City=City.Text;
        sdr.Region=Region.Text;
        sdr.PostalCode=PostalCode.Text;
        sdr.Country=Country.Text;
        sdr.Phone=Phone1.Text;
        sdr.Fax= Fax1.Text;
        sdr.HomePage = HomePage1.Text;

        sda.Update(sdr);

        lblResult.Text = "מידע ספק עודכן בהצלחה";
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        btnUpdateA_Click(this, null);
        btnUpdateB_Click(this, null);
        btnUpdateC_Click(this, null);
    }
}
