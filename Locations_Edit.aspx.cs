using System;
using System.Web.UI.WebControls;
using DevCow.Web.UI;

public partial class Locations_Edit : DevCowThemePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
		{
			object o = Request.QueryString["Action"];
			if (o != null)
			{
				string action = Convert.ToString(o).ToLower();
				if (action == "new")
				{
					FormView1.ChangeMode(FormViewMode.Insert);
				}
				else if (action == "remove")
				{
					SqlDataSource1.Delete();
					Response.Redirect("locations_list.aspx");
				}
			}
		}
    }
	protected void FormView1_ItemUpdated(object sender, System.Web.UI.WebControls.FormViewUpdatedEventArgs e)
	{
		Response.Redirect("locations_view.aspx?locationID=" + e.Keys["id"].ToString());
	}
	protected void FormView1_ItemInserted(object sender, System.Web.UI.WebControls.FormViewInsertedEventArgs e)
	{
		Response.Redirect("locations_list.aspx");
	}
}
