using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevCow.Web.UI;

public partial class admin_role_view : DevCowThemePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DisplayRoles();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!Roles.RoleExists(txtNewRole.Text))
        {
            Roles.CreateRole(txtNewRole.Text);
            DisplayRoles();
        }
        else
        {
            lblNewRoleError.Text = "Role Already Exists";
            lblNewRoleError.Visible = true;
        }
    }


    public void LinkButtonClick(object sender, CommandEventArgs e)
    {
        if (e.CommandName.Equals("ManageRole"))
        {
            Session["CurrentRole"] = (string)e.CommandArgument;
            // do not prepend ~/ to this path since it is not at the root
            Response.Redirect("role_manage.aspx");
        }
        if (e.CommandName.Equals("DeleteRole"))
        {
            string strRoleName = (string)e.CommandArgument;
            Roles.DeleteRole(strRoleName,false);
            DisplayRoles();
        }
    }

    private void DisplayRoles()
    {
        GridView1.DataSource = Roles.GetAllRoles();
        GridView1.DataBind();
    }
}
