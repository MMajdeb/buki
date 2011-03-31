using System;
using DevCow.Web.UI;

public partial class Events_Calendar : DevCowThemePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		bool isAdmin = User.IsInRole("Administrators");
		panel1.Visible = isAdmin;
		panel2.Visible = isAdmin;
    }
}
