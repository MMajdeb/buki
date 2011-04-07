using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for SiteSettings
/// </summary>
public class DevCowSiteSettings
{
    public DevCowSiteSettings()
    {
        m_SiteTheme = "";
        m_SiteThemeID = 0;
    }

    public DevCowSiteSettings(BukiDataSet.SiteSettingsRow siteRow)
    {
        m_SiteTheme = siteRow.Theme;
        m_SiteThemeID = siteRow.SiteThemeID;
    }

    private string m_SiteTheme;
    public string SiteTheme
    {
        get
        {
            return m_SiteTheme;
        }
    }

    private int m_SiteThemeID;
    public int SiteThemeID
    {
        get
        {
            return m_SiteThemeID;
        }
    }

    public static DevCowSiteSettings GetSiteSettings()
    {
        BukiDataSetTableAdapters.SiteSettingsTableAdapter daSiteSettings = new BukiDataSetTableAdapters.SiteSettingsTableAdapter();
        BukiDataSet.SiteSettingsDataTable sitesettings = daSiteSettings.GetSiteSettings();
        if (sitesettings.Count > 0)
        {
            return new DevCowSiteSettings(sitesettings[0]);
        }
        else
        {
            return new DevCowSiteSettings();
        }
        
    }
}
