using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using DevCow.Web.UI;

public partial class Locations_View : DevCowThemePage
{
	private int nextLocationID;
	private int prevLocationID;
	const int INVALIDID = -1;

	protected int LocationID
	{
		get
		{
			int m_LocationID;
			object id = ViewState["LocationID"];
			if (id != null)
			{
				m_LocationID = (int)id;
			}
			else
			{
				id = Request.QueryString["LocationID"];
				if (id != null)
				{
					m_LocationID = Convert.ToInt32(id);
				}
				else
				{
					m_LocationID = 1;
				}
				ViewState["LocationID"] = m_LocationID;
			}
			return m_LocationID;
		}
		set
		{
			ViewState["LocationID"] = value;
		}
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		SqlDataSource1.SelectParameters["id"].DefaultValue = Convert.ToString(LocationID);
	}
	protected void nextButton_Click(object sender, EventArgs e)
	{
		InitValsFromSql(LocationID);
		if (nextLocationID != INVALIDID)
		{
			prevLocationID = LocationID;
			LocationID = nextLocationID;
			SqlDataSource1.SelectParameters["id"].DefaultValue = Convert.ToString(nextLocationID);
		}
		ToggleLinks();
	}
	protected void prevButton_Click(object sender, System.EventArgs e)
	{
		InitValsFromSql(LocationID);
		if (prevLocationID != INVALIDID)
		{
			nextLocationID = LocationID;
			LocationID = prevLocationID;
			SqlDataSource1.SelectParameters["id"].DefaultValue = Convert.ToString(prevLocationID);
		}
		ToggleLinks();
	}
	protected void ToggleLinks()
	{
		LinkButton1.Enabled = (nextLocationID != INVALIDID);
		LinkButton3.Enabled = (nextLocationID != INVALIDID);
		LinkButton2.Enabled = (prevLocationID != INVALIDID);
		LinkButton4.Enabled = (prevLocationID != INVALIDID);
	}
	protected void InitValsFromSql(int LocationID)
	{
		try
		{
			SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ClubSiteDB"].ConnectionString);
			SqlCommand command = new SqlCommand("dbo.NextPrevLocation", connection);

			SqlParameter param0 = new SqlParameter("@id", LocationID);
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
				prevLocationID = Convert.ToInt32(param1.Value);
			}
			else
			{
				prevLocationID = INVALIDID;
			}
			if (param2.Value != null && param2.Value != DBNull.Value)
			{
				nextLocationID = Convert.ToInt32(param2.Value);
			}
			else
			{
				nextLocationID = INVALIDID;
			}
			connection.Close();
		}
		catch
		{
			prevLocationID = INVALIDID;
			nextLocationID = INVALIDID;
		}
	}
}
