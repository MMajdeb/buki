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

public partial class Admin_ThemeManagement : DevCowThemePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblCurrentTheme.Text = DevCowSiteSettings.GetSiteSettings().SiteTheme;
            drpThemes.SelectedValue = DevCowSiteSettings.GetSiteSettings().SiteThemeID.ToString();
        }

    }
    protected void btnChangeTheme_Click(object sender, EventArgs e)
    {
        SqlDataSource1.UpdateParameters["SiteName"].DefaultValue = "DevCow.com";
        SqlDataSource1.Update();

        //clear theme cache
        DevCowSiteSettings.ClearCache();

        Response.Redirect(Request.Url.ToString());
    }
}
