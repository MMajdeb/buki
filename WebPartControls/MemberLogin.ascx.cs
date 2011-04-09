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

public partial class WebPartControls_MemberLogin : System.Web.UI.UserControl, System.Web.UI.WebControls.WebParts.IWebPart
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void logout_click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect(Request.RawUrl);
        //Server.Transfer(); 

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
