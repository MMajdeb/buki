using System;
using DevCow.Web.UI;

public partial class News_List : DevCowThemePage
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
		Pn2.Count = pages;
	}
	protected void pn1_SelectedPageChanged(object sender, System.EventArgs e)
	{
		Pn2.SelectedPage = pn1.SelectedPage;
	}
	protected void Pn2_SelectedPageChanged(object sender, System.EventArgs e)
	{
		pn1.SelectedPage = Pn2.SelectedPage;
	}
}
