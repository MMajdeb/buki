using System;
using System.Web.UI.WebControls;
using DevCow.Web.UI;

public partial class PhotoAlbum_Contents : DevCowThemePage
{
	protected bool IsAdmin;

	protected string privatelabel(bool isprivate)
	{
		return (isprivate) ? "Album is private" : "Album is not private";
	}
	
    protected void Page_Load(object sender, EventArgs e)
    {
		IsAdmin = User.IsInRole("Administrators");
		uploadpanel.Visible = IsAdmin;
    }
	protected void FormView2_PageIndexChanged(object sender, System.EventArgs e)
	{
		DataList2.SelectedIndex = FormView2.PageIndex;
		FormView1.ChangeMode(FormViewMode.ReadOnly);
	}
	protected void DataList2_SelectedIndexChanged(object sender, System.EventArgs e)
	{
		FormView2.PageIndex = DataList2.SelectedIndex;
		FormView1.ChangeMode(FormViewMode.ReadOnly);
		FormView2.ChangeMode(FormViewMode.ReadOnly);
	}
	protected void UploadFile_Click(object sender, System.EventArgs e)
	{
		if (FileUpload1.HasFile && IsAdmin)
		{
			int imageid;
			int albumid = 0;
			object o = Request.QueryString["AlbumID"];
			if (o != null)
			{
				albumid = System.Convert.ToInt32(o);
			}
			else
			{
				Response.Write("Error: Need to specify an album");
				Response.End();
			}
			imageid = ImageUtils.uploadImage(imgTitle.Text, albumid, FileUpload1.FileContent);
			DataList2.DataBind();
			DataList2.SelectedIndex = DataList2.Items.Count - 1;
			FormView2.DataBind();
			FormView2.PageIndex = FormView2.PageCount - 1;
			ErrorLabel.Text = "";
		}
		else
		{
			ErrorLabel.Text = "<p>Please select a file to upload<p>";
		}
	}
}
