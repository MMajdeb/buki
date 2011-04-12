using System;
using System.Drawing;
using System.Web.Security;
using DevCow.Web.UI;
using System.Web.UI.WebControls;

public partial class Member_Supplier_Infrastructure : DevCowThemePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!Page.User.Identity.IsAuthenticated)
		{
			//Response.Write("To use the member details functionality, you need to be authenticated. Please use the <a href='login.aspx'>Login</a> page to authenticate yourself.");
			//Response.End();
		}
    }

    protected void btnUpdateTblMain_Click(object sender, EventArgs e)
    {
        int cols = Convert.ToInt32(tbCols.Text);
        int rows = Convert.ToInt32(tbRows.Text);

        for (int i = 0; i < rows; i++)
        {
            TableRow row = new TableRow();            

            for (int j = 0; j < cols; j++)
            {
                TableCell cell1 = new TableCell();
                cell1.Text = String.Concat( "Cell ",  j.ToString(), " Rows ", i.ToString());
                row.Cells.Add(cell1);
            }

            tblMain.Rows.Add(row);                
        }

        tblMain.UpdateAfterCallBack = true;
    }
}
