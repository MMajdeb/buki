using System;

public partial class DurationPicker : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	public System.DateTime startDateTime
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
	public System.DateTime endDateTime
	{
		get
		{
			return dp2.SelectedDate.Add(tp2.SelectedTime.TimeOfDay);
		}
		set
		{
			dp2.SelectedDate = value;
			tp2.SelectedTime = value;
		}
	}
}
