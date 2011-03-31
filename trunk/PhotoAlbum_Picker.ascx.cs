using System;
using System.Web.Security;
using System.Web.UI.WebControls;

public partial class PhotoAlbum_Picker : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
	protected void albumselect_SelectedIndexChanged(object sender, System.EventArgs e)
	{
		if (albumselect.SelectedIndex != 0)
		{
			FormView1.PageIndex = albumselect.SelectedIndex - 1;
			FormView1.Visible = true;
		}
		else
		{
			FormView1.Visible = false;
		}
	}
	public object AlbumID
	{
		get
		{
			object o = albumselect.SelectedValue;
			if (o != null && (string)o != "")
			{
				int val = Convert.ToInt32(o);
				if (val > 0)
				{
					return val;
				}
			}
			return DBNull.Value;
		}
		set
		{
			if (value == null || value == DBNull.Value)
			{
				FormView1.Visible = false;
				albumselect.SelectedIndex = 0;
			}
			else
			{
				albumselect.SelectedValue = Convert.ToString(value);
				albumselect.DataBind();
				FormView1.PageIndex = albumselect.SelectedIndex - 1;
				FormView1.Visible = true;
			}
		}
	}
	protected void albumselect_DataBinding(object sender, System.EventArgs e)
	{
		albumselect.Items.Clear();
		albumselect.Items.Add(new ListItem("No Album Selected", "0"));
	}
	protected void AlbumList_Selecting(object sender, System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs e)
	{
		if (Page.User.Identity.IsAuthenticated)
		{
			e.Command.Parameters["@userid"].Value = Membership.GetUser().ProviderUserKey;
		}
		else
		{
			e.Command.Parameters["@userid"].Value = DBNull.Value;
		}
	}
}
