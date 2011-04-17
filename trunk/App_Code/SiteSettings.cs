using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Microsoft.Practices.EnterpriseLibrary.Caching;

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
        const string BUKI_DEVCOWSITESETTINGS = "Buki.DevCowSiteSettings";

        // Attempt to retrieve from cache
        ICacheManager cache = CacheFactory.GetCacheManager();
        DevCowSiteSettings sitesettings = (DevCowSiteSettings)cache[BUKI_DEVCOWSITESETTINGS];        

        // Retrieve from dataProvider if not in Cache
        if (sitesettings == null)
        {
            BukiDataSetTableAdapters.SiteSettingsTableAdapter daSiteSettings = new BukiDataSetTableAdapters.SiteSettingsTableAdapter();
            BukiDataSet.SiteSettingsDataTable ssdt = daSiteSettings.GetSiteSettings();

            if (ssdt.Count > 0)
            {
                sitesettings = new DevCowSiteSettings(ssdt[0]);
            }
            else
            {
                sitesettings = new DevCowSiteSettings();
            }

            cache.Add(BUKI_DEVCOWSITESETTINGS, sitesettings);
        }

        return sitesettings;        
    }

    public static void ClearCache()
    {
        // TODO: Clear Cache
        ICacheManager cache = CacheFactory.GetCacheManager();
        cache.Flush();
    }

}
