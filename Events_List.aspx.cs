using System;
using DevCow.Web.UI;

public partial class Events_List : DevCowThemePage
{
	protected bool IsAdmin;
	
	protected void Page_Load(object sender, EventArgs e)
	{
		IsAdmin = User.IsInRole("Administrators");
		panel1.Visible = IsAdmin;
	}
	protected void SqlDataSource1_Selected(object sender, System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
	{
		int pages;
		pages = (int)e.Command.Parameters["@pageCount"].Value;
		pn1.Count = pages;
		pn2.Count = pages;
	}
	protected void SqlDataSource2_Selected(object sender, System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
	{
		int pages;
		pages = (int)e.Command.Parameters["@pageCount"].Value;
		pn3.Count = pages;
		pn4.Count = pages;
	}
	protected void pn1_SelectedPageChanged(object sender, System.EventArgs e)
	{
		pn2.SelectedPage = pn1.SelectedPage;
	}
	protected void pn2_SelectedPageChanged(object sender, System.EventArgs e)
	{
		pn1.SelectedPage = pn2.SelectedPage;
	}
	protected void pn3_SelectedPageChanged(object sender, System.EventArgs e)
	{
		pn4.SelectedPage = pn3.SelectedPage;
	}
	protected void pn4_SelectedPageChanged(object sender, System.EventArgs e)
	{
		pn3.SelectedPage = pn4.SelectedPage;
	}
}
