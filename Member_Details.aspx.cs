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
		DataSetTableAdapters.MemberInfoTableAdapter da = new DataSetTableAdapters.MemberInfoTableAdapter();
		if (Email.Text != user.Email)
		{
			user.Email = Email.Text;
		}
		try
		{
			da.Update((Guid)user.ProviderUserKey, Addr.Text, Phone.Text, fname.Text, lname.Text, (Guid)user.ProviderUserKey);
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
		DataSetTableAdapters.MemberInfoTableAdapter da = new DataSetTableAdapters.MemberInfoTableAdapter();
		DataSet.MemberInfoDataTable dt = da.GetMember((Guid)user.ProviderUserKey);
		if (dt.Rows.Count == 1)
		{
			DataSet.MemberInfoRow mr = dt[0];
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
		}
	}
	protected void uploadimage_Click(object sender, System.EventArgs e)
	{
		byte[] thumbimage = ImageUtils.MakeThumb(newavatar.FileBytes, 69, 69);
		DataSetTableAdapters.MemberInfo1TableAdapter m = new DataSetTableAdapters.MemberInfo1TableAdapter();
		Guid memberid = (Guid)(Membership.GetUser().ProviderUserKey);
		Guid origid = memberid;
		m.Update(memberid, thumbimage, origid);
		avatarimage.ImageUrl = "AvatarImagefetch.ashx?Memberid=" + memberid.ToString();
	}
	protected void clearimage_Click(object sender, System.EventArgs e)
	{
		DataSetTableAdapters.MemberInfo1TableAdapter m = new DataSetTableAdapters.MemberInfo1TableAdapter();
		Guid memberid = ((Guid)(Membership.GetUser().ProviderUserKey));
		Guid origid = memberid;
		m.Update(memberid, null, origid);
		avatarimage.ImageUrl = "images/nophoto.gif";
	}
}
