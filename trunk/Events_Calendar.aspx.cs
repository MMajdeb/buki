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

    protected void ObjectDataSource1_Selecting(object sender, System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs e)
    {
        DateTime st = eventscalendar.VisibleDate;
        DateTime et = st.AddMonths(1);

        // for test only
        e.InputParameters["SupplierID"] = 24;
        e.InputParameters["ProductID"] = 52;

        e.InputParameters["st"] = st.ToString("yyyy-MM-01 00:00");
        e.InputParameters["et"] = et.ToString("yyyy-MM-01 00:00");
    }
}
