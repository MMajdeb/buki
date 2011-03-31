using System;
using System.Data;
using System.Data.Common;
using System.Web.Security;
using System.Web.UI.WebControls;
using DevCow.Web.UI;

public partial class News_Edit : DevCowThemePage
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
					((DateAndTimePicker)(FormView1.FindControl("dtpicker"))).selectedDateTime = DateTime.Now;
					((PhotoAlbum_Picker)(FormView1.FindControl("albumpick"))).AlbumID = 0;
				}
				if (action == "remove")
				{
					SqlDataSource1.Delete();
					Response.Redirect("news_list.aspx");
				}
			}
		}
    }
	protected void FormView1_DataBound(object sender, System.EventArgs e)
	{
		if (FormView1.CurrentMode == FormViewMode.Insert)
		{
			((DateAndTimePicker)(FormView1.FindControl("dtpicker"))).selectedDateTime = DateTime.Now;
		}
		else
		{
			CheckBox cb = ((CheckBox)(FormView1.FindControl("CheckBox1")));
			TextBox surl = ((TextBox)(FormView1.FindControl("staticURLTextBox")));
			if (surl.Text != "")
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
	protected void FormView1_ItemUpdated(object sender, System.Web.UI.WebControls.FormViewUpdatedEventArgs e)
	{
		Response.Redirect("news_view.aspx?ArticleID=" + e.Keys["id"].ToString());
	}
	protected void FormView1_ItemInserted(object sender, System.Web.UI.WebControls.FormViewInsertedEventArgs e)
	{
		Response.Redirect("news_list.aspx");
	}
	protected void CheckBox1_CheckedChanged(object sender, System.EventArgs e)
	{
		CheckBox cb = ((CheckBox)(FormView1.FindControl("CheckBox1")));
		TextBox surl = ((TextBox)(FormView1.FindControl("StaticURLTextBox")));
		if (cb.Checked)
		{
			surl.Enabled = true;
		}
		else
		{
			surl.Enabled = false;
		}
	}
	protected void AlbumList_Selecting(object sender, System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs e)
	{
		DbParameter param = e.Command.Parameters["@userid"];
		param.DbType = DbType.Guid;
		if (Page.User.Identity.IsAuthenticated)
		{
			param.Value = Membership.GetUser().ProviderUserKey;
		}
		else
		{
			param.Value = DBNull.Value;
		}
	}
}
