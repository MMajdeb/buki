using System;

public partial class DateAndTimePicker : System.Web.UI.UserControl
{
	public System.DateTime selectedDateTime
	{
		get
		{
			return dp1.SelectedDate.Add(tp1.SelectedTime.TimeOfDay);
		}
		set
		{
			dp1.SelectedDate = value;
			tp1.SelectedTime = value;
		}
	}
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
