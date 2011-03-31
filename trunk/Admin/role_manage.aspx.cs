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

public partial class admin_role_manage : DevCowThemePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strCurrentRole;
            if (Session["CurrentRole"] == null)
            {
                strCurrentRole = Roles.GetAllRoles()[0];
                Session["CurrentRole"] = strCurrentRole;
            }
            else
            {
                strCurrentRole = Session["CurrentRole"].ToString();
            }

            lblCurrentRole.Text = strCurrentRole;
            dlDisplayRoles.DataSource = MemberDetails.GetMembersInRole(String.Empty, strCurrentRole);
            dlDisplayRoles.DataBind();
            drpUsers.DataSource = MemberDetails.GetMembers(String.Empty);
            drpUsers.DataBind();
        }

    }


    public string PreFormat(string content)
    {
        if (content != null)
        {
            return content.Replace("\r\n", "<br/>");
        }
        else
        {
            return null;
        }
    }
    protected void DisplayUsers(object sender, CommandEventArgs e)
    {
        if (e.CommandArgument.ToString() == "All")
        {
            dlDisplayRoles.DataSource = MemberDetails.GetMembers(String.Empty);
            dlDisplayRoles.DataBind();
            lnkDisplayAllUsers.Enabled = false;
            lnkDisplayUsers.Enabled = true;
        }
        else if(e.CommandArgument.ToString() == "InRole")
        {
            dlDisplayRoles.DataSource = MemberDetails.GetMembersInRole(String.Empty, Session["CurrentRole"].ToString());
            dlDisplayRoles.DataBind();
            lnkDisplayAllUsers.Enabled = true;
            lnkDisplayUsers.Enabled = false;
        }

    }

    protected void RemoveUser(object sender, CommandEventArgs e)
    {
        Roles.RemoveUserFromRole(e.CommandArgument.ToString(), Session["CurrentRole"].ToString());
        LoadDataList();
    }

    private void LoadDataList()
    {
        if (lnkDisplayAllUsers.Enabled == true)
        {
            dlDisplayRoles.DataSource = MemberDetails.GetMembers(String.Empty);
            dlDisplayRoles.DataBind();
        }
        else
        {
            dlDisplayRoles.DataSource = MemberDetails.GetMembersInRole(String.Empty, Session["CurrentRole"].ToString());
            dlDisplayRoles.DataBind();
        }
    }

    protected void btnAddUser_Click(object sender, EventArgs e)
    {
        if (!Roles.IsUserInRole(drpUsers.SelectedValue.ToString(),Session["CurrentRole"].ToString()))
        {
            Roles.AddUserToRole(drpUsers.SelectedValue.ToString(), Session["CurrentRole"].ToString());
        }
        LoadDataList();
    }
    protected void dlDisplayRoles_ItemCreated(object sender, DataListItemEventArgs e)
    {
        if(e.Item.DataItem != null)
        {
            MemberDetails strCurrentUser = (MemberDetails)e.Item.DataItem;
            if (Roles.IsUserInRole(strCurrentUser.UserName, Session["CurrentRole"].ToString()))
            {
                ((LinkButton)e.Item.FindControl("lnkRemoveUser")).Visible = true;
            }
        }
    }
}
