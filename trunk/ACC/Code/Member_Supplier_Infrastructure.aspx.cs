using System;
using System.Drawing;
using System.Web.Security;
using DevCow.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Member_Supplier_Infrastructure : DevCowThemePage
{
    DataTable dt;

    protected void Page_Init(object sender, EventArgs e)
    {
        int i;        

        if (Session["i"] == null)
        {
            dt = new DataTable();            
            Session["i"] = 1;
            Session["dt"] = dt;
        }

        dt = Session["dt"] as DataTable;
        i = Convert.ToInt32(Session["i"]);

        if (i == 1)
        {
            dt.Columns.Add("A" + i);
            dt.Rows.Add(dt.NewRow());
        }

        if (i == 2)
        {
            dt.Columns.Add("A" + i);
            dt.Rows.Add(dt.NewRow());
        }

        if (i == 3)
        {
            dt.Rows.Add(dt.NewRow());
        }

        i++;
        Session["i"] = i;
        Session["dt"] = dt;

        //ph.Controls.Add(new Button());
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        gv1.DataSource = dt;
        gv1.DataBind();

		if (!Page.User.Identity.IsAuthenticated)
		{
			//Response.Write("To use the member details functionality, you need to be authenticated. Please use the <a href='login.aspx'>Login</a> page to authenticate yourself.");
			//Response.End();
		}

    }

    //protected void btnUpdateTblMain_Click(object sender, EventArgs e)
    //{
    //    //int cols = Convert.ToInt32(tbCols.Text);
    //    //int rows = Convert.ToInt32(tbRows.Text);

    //    //for (int i = 0; i < rows; i++)
    //    //{
    //    //    TableRow row = new TableRow();            

    //    //    for (int j = 0; j < cols; j++)
    //    //    {
    //    //        TableCell cell1 = new TableCell();
    //    //        cell1.Text = String.Concat( "Cell ",  j.ToString(), " Rows ", i.ToString());
    //    //        Anthem.Button btn = new Anthem.Button();
    //    //        btn.ID = String.Concat("Cell ", j.ToString(), " Rows ", i.ToString());
    //    //        cell1.Controls.Add(btn);
    //    //        row.Cells.Add(cell1);
    //    //    }

    //    //    tblMain.Rows.Add(row);                
    //    //}

    //    ////tblMain.UpdateAfterCallBack = true;
    //    //pnlMain.UpdateAfterCallBack = true;


    //    //pnlMain.UpdateAfterCallBack = true;
    //}
    protected void gv1_DataBinding(object sender, EventArgs e)
    {
        
    }
    protected void gv1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TextBox t = new TextBox();
            e.Row.Cells[0].Controls.Add(t);
        }
    }
}
