using System;
using System.Web.UI.WebControls;
using DevCow.Web.UI;

public partial class Locations_List : DevCowThemePage
{
	protected bool IsAdmin;

	protected void Page_Load(object sender, EventArgs e)
	{
		IsAdmin = User.IsInRole("Administrators");
		panel1.Visible = IsAdmin;
	}
	protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
	{
		int pages;
		pages = System.Convert.ToInt32(e.Command.Parameters["@pageCount"].Value);
		pn1.Count = pages;
		pn2.Count = pages;
	}
	protected void pn1_SelectedPageChanged(object sender, EventArgs e)
	{
		pn2.SelectedPage = pn1.SelectedPage;
	}
	protected void Pn2_SelectedPageChanged(object sender, EventArgs e)
	{
		pn1.SelectedPage = pn2.SelectedPage;
	}
}
