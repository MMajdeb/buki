using System;
using System.Web.Security;
using DevCow.Web.UI;

public partial class PhotoAlbum_List : DevCowThemePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		panel1.Visible = User.IsInRole("Administrators");
    }
	protected void SqlDataSource1_Selected(object sender, System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
	{
		int pages;
		pages = Convert.ToInt32(e.Command.Parameters["@pageCount"].Value);
		pn1.Count = pages;
		pn2.Count = pages;
	}
	protected void pn1_SelectedPageChanged(object sender, System.EventArgs e)
	{
		pn2.SelectedPage = pn1.SelectedPage;
	}
	protected void Pn2_SelectedPageChanged(object sender, System.EventArgs e)
	{
		pn1.SelectedPage = pn2.SelectedPage;
	}
	protected void SqlDataSource1_Selecting(object sender, System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs e)
	{
		if (User.Identity.IsAuthenticated)
		{
			e.Command.Parameters["@ownerid"].Value = Membership.GetUser().ProviderUserKey;
		}
		else
		{
			e.Command.Parameters["@ownerid"].Value = DBNull.Value;
		}
	}
}
