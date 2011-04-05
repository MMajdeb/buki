using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;

public class HelperDAL
{
    public DataTable ExecuteSqlCommand(string sql, List<SqlParameter> paramLst)
    {
        System.Data.DataTable tbl;
        SqlCommand cmd;
        SqlDataAdapter da;     

        cmd = new SqlCommand();
        cmd.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ClubSiteDB"].ToString());
        cmd.CommandText = sql;
        cmd.CommandType = CommandType.Text;

        //For i = 0 To params.Count - 1
        //    cmd.Parameters.Add(params(i))
        //Next

        // Iterate through a collection
        foreach (SqlParameter prm in paramLst)
        {
            cmd.Parameters.Add(prm);
        }

        da = new SqlDataAdapter(cmd);
        
        tbl = new System.Data.DataTable();
        da.Fill(tbl);

        return tbl;
    }

    public System.Data.DataSet ExecuteSqlCommandEL(string sql, List<SqlParameter> paramLst)
    {
        Database db = null;
        db = DatabaseFactory.CreateDatabase();

        SqlCommand cmd = new SqlCommand();
        //cmd.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ClubSiteDB"].ToString());
        cmd.CommandText = sql;
        cmd.CommandType = CommandType.Text;

        //For i = 0 To params.Count - 1
        //    cmd.Parameters.Add(params(i))
        //Next

        // Iterate through a collection
        foreach (SqlParameter prm in paramLst)
        {
            cmd.Parameters.Add(prm);
        }

        //DbCommand selectCommand 

        System.Data.DataSet ds = db.ExecuteDataSet(cmd);

        return ds;
    }


}

