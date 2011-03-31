using System;
using System.Web.UI.WebControls;
using DevCow.Web.UI;

public partial class Member_List : DevCowThemePage
{
	protected string Filter
	{
		get
		{
			object o = ViewState["Filter"];
			return (o != null) ? (string)o : string.Empty;
		}
		set
		{
			ViewState["Filter"] = value;
		}
	}
	protected string linkClass(string letter)
	{
		if (letter == Filter)
		{
			return "selectedLetter";
		}
		else
		{
			return "";
		}
	}
	public string PreFormat(string content)
	{
		if (content != null)
		{
			return content.Replace("\r\n", "<br/>");
		}
		else
		{
			return null;
		}
	}

	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void hp1_Click(object sender, System.EventArgs e)
	{
		Filter = ((LinkButton)sender).Text;
		ObjectDataSource1.SelectParameters[0].DefaultValue = Filter;
	}
	protected void showall_Click(object sender, System.EventArgs e)
	{
		Filter = "";
		ObjectDataSource1.SelectParameters[0].DefaultValue = Filter;
	}
}
