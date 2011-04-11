using System;
using System.Drawing;
using System.Web.Security;
using DevCow.Web.UI;

public partial class Member_Details : DevCowThemePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!Page.User.Identity.IsAuthenticated)
		{
			Response.Write("To use the member details functionality, you need to be authenticated. Please use the <a href='login.aspx'>Login</a> page to authenticate yourself.");
			Response.End();
		}
		else if (!IsPostBack)
		{
			InitPageData();
		}
    }

	protected void update_Click(object sender, System.EventArgs e)
	{
		MembershipUser user = Membership.GetUser();
        BukiDataSetTableAdapters.MemberInfoTableAdapter da = new BukiDataSetTableAdapters.MemberInfoTableAdapter();
		if (Email.Text != user.Email)
		{
			user.Email = Email.Text;
		}
		try
		{
			da.Update((Guid)user.ProviderUserKey, Addr.Text, Phone.Text, fname.Text, lname.Text, 0,(Guid)user.ProviderUserKey);
			ContactStatus.Text = "Details have been updated sucessfully.";
			ContactStatus.ControlStyle.ForeColor = Color.Black;
		}
		catch (Exception ex)
		{
			ContactStatus.Text = "Error updating contact details: " + ex.Message;
			ContactStatus.ControlStyle.ForeColor = Color.Red;
		}
	}

    protected void updateSupplier_Click(object sender, System.EventArgs e)
    {
        MembershipUser user = Membership.GetUser();
        BukiDataSetTableAdapters.SupplierzTableAdapter da = new BukiDataSetTableAdapters.SupplierzTableAdapter();
        try
        {
            da.Update((Guid)user.ProviderUserKey, CompanyName.Text, ContactTitle.Text, ContactName.Text, Address.Text,City.Text, Region.Text, PostalCode.Text, Country.Text, Phone1.Text, Fax1.Text, HomePage1.Text, (Guid)user.ProviderUserKey);
            ContactStatus.Text = "Details have been updated sucessfully.";
            ContactStatus.ControlStyle.ForeColor = Color.Black;
        }
        catch (Exception ex)
        {
            ContactStatus.Text = "Error updating contact details: " + ex.Message;
            ContactStatus.ControlStyle.ForeColor = Color.Red;
        }
    }
	protected void InitPageData()
	{
		MembershipUser user = Membership.GetUser();
        BukiDataSetTableAdapters.MemberInfoTableAdapter da = new BukiDataSetTableAdapters.MemberInfoTableAdapter();
        BukiDataSet.MemberInfoDataTable dt = da.GetMember((Guid)user.ProviderUserKey);
		if (dt.Rows.Count == 1)
		{
            BukiDataSet.MemberInfoRow mr = dt[0];
			UserName.Text = user.UserName;
			fname.Text = mr.firstname;
			lname.Text = mr.lastname;
			Email.Text = user.Email;
			Addr.Text = mr.address;
			Phone.Text = mr.phone;
			if (!mr.IsAvatarSizeNull())
			{
				avatarimage.ImageUrl = "AvatarImagefetch.ashx?Memberid=" + user.ProviderUserKey.ToString();
			}
			else
			{
				avatarimage.ImageUrl = "images/nophoto.gif";
			}

            if (mr.memberType == 1)
            {
                // show suppliers panel
                phSuppliers.Visible = true;

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
	}
	protected void uploadimage_Click(object sender, System.EventArgs e)
	{
		byte[] thumbimage = ImageUtils.MakeThumb(newavatar.FileBytes, 69, 69);
        BukiDataSetTableAdapters.MemberInfo1TableAdapter m = new BukiDataSetTableAdapters.MemberInfo1TableAdapter();
		Guid memberid = (Guid)(Membership.GetUser().ProviderUserKey);
		Guid origid = memberid;
		m.Update(memberid, thumbimage, origid);
		avatarimage.ImageUrl = "AvatarImagefetch.ashx?Memberid=" + memberid.ToString();
	}
	protected void clearimage_Click(object sender, System.EventArgs e)
	{
        BukiDataSetTableAdapters.MemberInfo1TableAdapter m = new BukiDataSetTableAdapters.MemberInfo1TableAdapter();
		Guid memberid = ((Guid)(Membership.GetUser().ProviderUserKey));
		Guid origid = memberid;
		m.Update(memberid, null, origid);
		avatarimage.ImageUrl = "images/nophoto.gif";
	}
}
