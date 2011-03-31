using System;
using System.Web.UI.WebControls;
using DevCow.Web.UI;

public partial class Events_Edit : DevCowThemePage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			object o = Request.QueryString["Action"];
			if (o != null)
			{
				string action = System.Convert.ToString(o).ToLower();
				if (action == "new")
				{
					FormView1.ChangeMode(FormViewMode.Insert);
					LocationsPicker lp = (LocationsPicker)(FormView1.FindControl("LocationPicker1"));
					lp.LocationID = null;
					DurationPicker dp = (DurationPicker)(FormView1.FindControl("dtpicker"));
					dp.startDateTime = DateTime.Now;
					dp.endDateTime = DateTime.Now.AddHours(3);
					TextBox slp = (TextBox)(FormView1.FindControl("staticURLTextBox"));
					slp.Enabled = false;
				}
				else if (action == "delete")
				{
					SqlDataSource1.Delete();
					Response.Redirect("Events_list.aspx");
				}
				else
				{
					CheckBox cb = (CheckBox)(FormView1.FindControl("CheckBox1"));
					TextBox surl = (TextBox)(FormView1.FindControl("staticURLTextBox"));
					if (surl.Text != null && surl.Text != "")
					{
						cb.Checked = true;
						surl.Enabled = true;
					}
					else
					{
						surl.Enabled = false;
					}
				}
			}
		}
	}
	protected void FormView1_ItemUpdated(object sender, System.Web.UI.WebControls.FormViewUpdatedEventArgs e)
	{
		Response.Redirect("events_view.aspx?eventID=" + e.Keys["id"].ToString());
	}

	protected void FormView1_ItemInserted(object sender, System.Web.UI.WebControls.FormViewInsertedEventArgs e)
	{
		Response.Redirect("events_list.aspx");
	}
	protected void CheckBox1_CheckedChanged(object sender, System.EventArgs e)
	{
		CheckBox cb = (CheckBox)(FormView1.FindControl("CheckBox1"));
		TextBox surl = (TextBox)(FormView1.FindControl("StaticURLTextBox"));
		if (cb.Checked)
		{
			surl.Enabled = true;
		}
		else
		{
			surl.Enabled = false;
		}
	}
}
