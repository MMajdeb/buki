using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using DevCow.Web.UI;

public partial class Events_View : DevCowThemePage
{
	protected int nextEventID;
	protected int prevEventID;
	protected const int INVALIDID = -1;

	protected void Page_Load(object sender, System.EventArgs e)
	{
		SqlDataSource1.SelectParameters["id"].DefaultValue = System.Convert.ToString(EventID);
	}
	protected void NextButton_Click(object sender, System.EventArgs e)
	{
		InitValsFromSql(EventID);
		if (nextEventID != INVALIDID)
		{
			prevEventID = EventID;
			EventID = nextEventID;
			SqlDataSource1.SelectParameters["id"].DefaultValue = System.Convert.ToString(nextEventID);
		}
		ToggleLinks();
	}
	protected void PrevButton_Click(object sender, System.EventArgs e)
	{
		InitValsFromSql(EventID);
		if (prevEventID != INVALIDID)
		{
			nextEventID = EventID;
			EventID = prevEventID;
			SqlDataSource1.SelectParameters["id"].DefaultValue = System.Convert.ToString(prevEventID);
		}
		ToggleLinks();
	}
	protected void ToggleLinks()
	{
		LinkButton1.Enabled = (nextEventID != INVALIDID);
		LinkButton3.Enabled = (nextEventID != INVALIDID);
		LinkButton2.Enabled = (prevEventID != INVALIDID);
		LinkButton4.Enabled = (prevEventID != INVALIDID);
	}
	protected int EventID
	{
		get
		{
			int m_EventID;
			object id = ViewState["EventID"];
			if (id != null)
			{
				m_EventID = (int)id;
			}
			else
			{
				id = Request.QueryString["EventID"];
				if (id != null)
				{
					m_EventID = System.Convert.ToInt32(id);
				}
				else
				{
					m_EventID = 1;
				}
				ViewState["EventID"] = m_EventID;
			}
			return m_EventID;
		}
		set
		{
			ViewState["EventID"] = value;
		}
	}
	protected void InitValsFromSql(int EventID)
	{
		try
		{
			SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ClubSiteDB"].ConnectionString);
			SqlCommand command = new SqlCommand("dbo.NextPrevEvent", connection);

			SqlParameter param0 = new SqlParameter("@id", EventID);
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
				prevEventID = (int)param1.Value;
			}
			else
			{
				prevEventID = INVALIDID;
			}

			if (param2.Value != null && param2.Value != DBNull.Value)
			{
				nextEventID = (int)param2.Value;
			}
			else
			{
				nextEventID = INVALIDID;
			}
			connection.Close();
		}
		catch
		{
			prevEventID = INVALIDID;
			nextEventID = INVALIDID;
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
	protected string ShowLocationLink(object locationname, object id)
	{
		if (id != null && id != DBNull.Value)
		{
			return "At <a href='Locations_view.aspx?LocationID=" + Convert.ToString(id) + "'>" + (string)locationname + "</a><br/>";
		}
		else
		{
			return "";
		}
	}
	protected string ShowDuration(object starttime, object endtime)
	{
		DateTime starttimeDT = (DateTime)starttime;
		if (endtime != null && endtime != DBNull.Value)
		{
			DateTime endtimeDT = (DateTime)endtime;
			if (starttimeDT.Date == endtimeDT.Date)
			{
				if (starttimeDT == endtimeDT)
				{
					return starttimeDT.ToString("h:mm tt");
				}
				else
				{
					return starttimeDT.ToString("h:mm tt") + " - " + endtimeDT.ToString("h:mm tt");
				}
			}
			else
			{
				return "thru " + endtimeDT.ToString("M/d/yy");
			}
		}
		else
		{
			return starttimeDT.ToString("h:mm tt");
		}
	}
}
