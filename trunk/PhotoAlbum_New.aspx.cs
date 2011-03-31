using System;
using System.Web.Security;
using DevCow.Web.UI;

public partial class PhotoAlbum_New : DevCowThemePage
{
	protected string privatelabel(bool isprivate)
	{
		return (isprivate) ? "Album is private" : "Album is not private";
	}
	
    protected void Page_Load(object sender, EventArgs e)
    {

    }
	protected void SqlDataSource1_Inserting(object sender, System.Web.UI.WebControls.SqlDataSourceCommandEventArgs e)
	{
		if (User.Identity.IsAuthenticated)
		{
			e.Command.Parameters["@ownerid"].Value = Membership.GetUser().ProviderUserKey;
		}
		else
		{
			throw new Exception("User must be authenticated to create an album");
		}
	}
	protected void SqlDataSource1_Inserted(object sender, System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
	{
		Response.Redirect("photoalbum_list.aspx");
	}
}
