using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace DevCow.Web.UI
{
    /// <summary>
    /// Summary description for DevCowThemePage
    /// </summary>
    public class DevCowThemePage: Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            string strSiteThem = DevCowSiteSettings.GetSiteSettings().SiteTheme;
            if(strSiteThem != "")
            {
                Page.Theme = strSiteThem;
            }
        }
    }
}