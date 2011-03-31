using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using DevCow.Web.UI;

public partial class News_View : DevCowThemePage
{
	protected int nextArticleID;
	protected int prevArticleID;
	protected const int INVALIDID = -1;

	protected int ArticleID
	{
		get
		{
			int m_articleID;
			object id = ViewState["ArticleId"];
			if (id != null)
			{
				m_articleID = System.Convert.ToInt32(id);
			}
			else
			{
				id = Request.QueryString["ArticleId"];
				if (id != null)
				{
					m_articleID = System.Convert.ToInt32(id);
				}
				else
				{
					m_articleID = 1;
				}
				ViewState["ArticleId"] = m_articleID;
			}
			return m_articleID;
		}
		set
		{
			ViewState["ArticleId"] = value;
		}
	}

	protected void Page_Load(object sender, System.EventArgs e)
	{
		if (!IsPostBack)
		{
			InitDatasources();
		}
	}
	protected void FormView1_DataBound(object sender, System.EventArgs e)
	{
		DataRowView view = (DataRowView)(FormView1.DataItem);
		object o = view["staticURL"];
		if (o != null && o != DBNull.Value)
		{
			string staticurl = (string)o;
			if (staticurl != "")
			{
				Response.Redirect(staticurl);
			}
		}
	}
	protected void nextButton_Click(object sender, System.EventArgs e)
	{
		InitValsFromSql(ArticleID);
		if (nextArticleID != INVALIDID)
		{
			prevArticleID = ArticleID;
			ArticleID = nextArticleID;
			InitDatasources();
		}
		ToggleLinks();
	}
	protected void prevButton_Click(object sender, System.EventArgs e)
	{
		InitValsFromSql(ArticleID);
		if (prevArticleID != INVALIDID)
		{
			nextArticleID = ArticleID;
			ArticleID = prevArticleID;
			InitDatasources();
		}
		ToggleLinks();
	}
	protected void InitDatasources()
	{
		PhotoPanel.Visible = true;
		SqlDataSource1.SelectParameters["id"].DefaultValue = System.Convert.ToString(ArticleID);
		SqlDataSource2.SelectParameters["id"].DefaultValue = System.Convert.ToString(ArticleID);
	}
	protected void ToggleLinks()
	{
		LinkButton1.Enabled = (nextArticleID != INVALIDID);
		LinkButton3.Enabled = (nextArticleID != INVALIDID);
		LinkButton2.Enabled = (prevArticleID != INVALIDID);
		LinkButton4.Enabled = (prevArticleID != INVALIDID);
	}
	protected void InitValsFromSql(int ArticleID)
	{
		try
		{
			SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ClubSiteDB"].ConnectionString);
			SqlCommand command = new SqlCommand("dbo.NextPrevAnnouncement", connection);

			SqlParameter param0 = new SqlParameter("@id", ArticleID);
			SqlParameter param1 = new SqlParameter("@previd", INVALIDID);
			SqlParameter param2 = new SqlParameter("@nextid", INVALIDID);

			param1.Direction = ParameterDirection.InputOutput;
			param2.Direction = ParameterDirection.InputOutput;

			command.Parameters.Add(param0);
			command.Parameters.Add(param1);
			command.Parameters.Add(param2);

			command.CommandType = CommandType.StoredProcedure;
			connection.Open();
			command.ExecuteNonQuery();
			if (param1.Value != null && param1.Value != DBNull.Value)
			{
				prevArticleID = Convert.ToInt32(param1.Value);
			}
			else
			{
				prevArticleID = INVALIDID;
			}
			if (param2.Value != null && param2.Value != DBNull.Value)
			{
				nextArticleID = Convert.ToInt32(param2.Value);
			}
			else
			{
				nextArticleID = INVALIDID;
			}
			connection.Close();
		}
		catch
		{
			prevArticleID = INVALIDID;
			nextArticleID = INVALIDID;
		}
	}
	protected void SqlDataSource2_Selected(object sender, System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
	{
		PhotoPanel.Visible = (e.AffectedRows != 0);
	}
}
