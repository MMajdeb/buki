using System;
using System.Web.UI.WebControls;

public partial class LocationsPicker : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
	protected void locationselect_SelectedIndexChanged(object sender, System.EventArgs e)
	{
		int value = Convert.ToInt32(locationselect.SelectedValue);
		if (value == 0)
		{
			FormView1.Visible = false;
		}
		else
		{
			FormView1.ChangeMode(FormViewMode.ReadOnly);
			FormView1.PageIndex = locationselect.SelectedIndex - 1;
			FormView1.Visible = true;
		}
	}
	public object LocationID
	{
		get
		{
			object o = locationselect.SelectedValue;
			if (o != null && (string)o != "")
			{
				int val = System.Convert.ToInt32(o);
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
				locationselect.SelectedIndex = 0;
			}
			else
			{
				locationselect.DataBind();
				locationselect.SelectedValue = Convert.ToString(value);
				FormView1.PageIndex = locationselect.SelectedIndex - 1;
				FormView1.Visible = true;
			}
		}
	}
	protected void locationselect_DataBinding(object sender, System.EventArgs e)
	{
		locationselect.Items.Clear();
		locationselect.Items.Add(new ListItem("No location Selected", "0"));
	}
}
