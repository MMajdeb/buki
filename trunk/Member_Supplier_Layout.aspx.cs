using System;
using System.Drawing;
using System.Web.Security;
using DevCow.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Member_Supplier_Layout : DevCowThemePage
{    

    protected void Page_Init(object sender, EventArgs e)
    {
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.User.Identity.IsAuthenticated)
        {
            //Response.Write("To use the member details functionality, you need to be authenticated. Please use the <a href='login.aspx'>Login</a> page to authenticate yourself.");
            //Response.End();
        }

        if (!Page.IsPostBack)
        {
            //load layout of table
            //LoadLayout();
        }
    }

    private void LoadLayout()
    {
 
    }

    protected void btnAddRecord_Click(object sender, EventArgs e)
    {
  
        
    }
}
