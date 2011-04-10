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

public partial class WebPartControls_MemberAppendingAprove : System.Web.UI.UserControl, System.Web.UI.WebControls.WebParts.IWebPart
{
    protected void Page_PreRender()
    {
        //MembershipUserCollection allUsers = Membership.GetAllUsers();
        //MembershipUserCollection filteredUsers = new MembershipUserCollection();

        //bool isActive = false;

        //foreach (MembershipUser user in allUsers)
        //{
        //    if (user.IsApproved == isActive)
        //    {
        //        filteredUsers.Add(user);
        //    }
        //}
        //Users.DataSource = filteredUsers;
        //Users.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        
    }

    #region IWebPart interface
    public string Description
    {
        get
        {
            object objTitle = ViewState["Description"];
            if (objTitle == null)
                return String.Empty;

            return (string)objTitle;
        }
        set
        {
            ViewState["Description"] = value;
        }
    }

    public string Title
    {
        get
        {
            object objTitle = ViewState["Title"];
            if (objTitle == null)
                return "Schematic";
            //return String.Empty;

            return (string)objTitle;
        }
        set
        {
            ViewState["Title"] = value;
        }
    }

    public string Subtitle
    {
        get
        {
            object objSubTitle = ViewState["Subtitle"];
            if (objSubTitle == null)
                return String.Empty;

            return (string)objSubTitle;
        }

    }

    public string TitleIconImageUrl
    {
        get
        {
            object objTitle = ViewState["TitleIconImageUrl"];
            if (objTitle == null)
                return String.Empty;

            return (string)objTitle;
        }
        set
        {
            ViewState["TitleIconImageUrl"] = value;
        }
    }

    public string TitleUrl
    {
        get
        {
            object objTitle = ViewState["TitleUrl"];
            if (objTitle == null)
                return String.Empty;

            return (string)objTitle;
        }
        set
        {
            ViewState["TitleUrl"] = value;
        }
    }

    public string CatalogIconImageUrl
    {
        get
        {
            object objTitle = ViewState["CatalogIconImageUrl"];
            if (objTitle == null)
                return String.Empty;

            return (string)objTitle;
        }
        set
        {
            ViewState["CatalogIconImageUrl"] = value;
        }
    }
    #endregion
}
