using System;
using System.Data;
using System.Data.Common;
using System.Text;
using System.Web.Security;

public partial class Photos_FormPicker : System.Web.UI.UserControl
{
	protected const string CLIENTSCRIPTPREFIX = "__FormPhotoPicker_";

	public int ImageId
	{
		get
		{
			EnsureChildControls();
			if (viewswitch.ActiveViewIndex == 1)
			{
				return Convert.ToInt32(selectedimage.Value);
			}
			else
			{
				object id = ViewState["ImageID"];
				if (id == null)
				{
					ViewState["ImageID"] = 0;
					return 0;
				}
				else
				{
					return Convert.ToInt32(id);
				}
			}
		}
		set
		{
			ViewState["ImageID"] = value;
		}
	}
	public bool SmallImage
	{
		get
		{
			object o = ViewState["SmallImage"];
			if (o != null)
			{
				return Convert.ToBoolean(o);
			}
			else
			{
				return false;
			}
		}
		set
		{
			ViewState["SmallImage"] = value;
		}
	}
	protected string imagesize()
	{
		return (SmallImage) ? "1" : "0";
	}

	protected void Page_PreRender(object sender, System.EventArgs e)
	{
		RenderScript();
		if (ImageId != 0)
		{
			imagepreview.ImageUrl = "imagefetch.ashx?ImageID=" + ImageId.ToString() + "&Size=" + imagesize();
		}
		else
		{
			imagepreview.ImageUrl = "images/nophoto.gif";
		}
	}
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			viewswitch.SetActiveView(main);
		}
	}
	protected void ShowPickExistingBtn_Click(object sender, System.EventArgs e)
	{
		viewswitch.SetActiveView(pickexistingview);
	}

	protected void ShowUploadBtn_Click(object sender, System.EventArgs e)
	{
		viewswitch.SetActiveView(uploadimageview);
	}
	protected void ClearBtn_Click(object sender, System.EventArgs e)
	{
		ImageId = 0;
	}
	protected void RenderScript()
	{
		StringBuilder sb = new StringBuilder();
		sb.AppendLine("var " + CLIENTSCRIPTPREFIX + "selecteditem = null;");
		sb.AppendLine("function " + CLIENTSCRIPTPREFIX + "SelectItem(element, newimageid)");
		sb.AppendLine("{");
		sb.AppendLine(" if (" + CLIENTSCRIPTPREFIX + "selecteditem != null)");
		sb.AppendLine(" {");
		sb.AppendLine(" " + CLIENTSCRIPTPREFIX + "selecteditem.className='unselected';");
		sb.AppendLine(" }");
		sb.AppendLine(" " + CLIENTSCRIPTPREFIX + "selecteditem = element; ");
		sb.AppendLine(" " + CLIENTSCRIPTPREFIX + "selecteditem.className='selected';");
		sb.AppendLine(" document.getElementById('" + selectedimage.ClientID + "').value = newimageid;");
		sb.AppendLine("}");
		Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "SelectItem", sb.ToString(), true);
	}
	protected void existingChosen_Click(object sender, System.EventArgs e)
	{
		ImageId = Convert.ToInt32(selectedimage.Value);
		viewswitch.SetActiveView(main);
	}
	protected void Cancel_Click(object sender, System.EventArgs e)
	{
		viewswitch.SetActiveView(main);
	}
	protected void UploadBtn_Click(object sender, System.EventArgs e)
	{
		int newimageid;
		newimageid = ImageUtils.uploadImage(Title.Text, Convert.ToInt32(AlbumList2.SelectedValue), FileUpload1.FileContent);
		ImageId = newimageid;
		viewswitch.SetActiveView(main);
	}
	protected void SetOwner(object sender, System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs e)
	{
		DbParameter param = e.Command.Parameters["@owner"];
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
