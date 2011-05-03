using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Caching;

public class CategoriesBLL
{
    const string BUKI_CATEGORIESBLL_GETDATABYGT8 = "Buki.CategoriesBLL.GetDataByGT8";

    public BukiDataSet.CategoriesDataTable GetDataByGT8()
    {        
        // Attempt to retrieve from cache
        ICacheManager cache = CacheFactory.GetCacheManager();

        BukiDataSet.CategoriesDataTable cdt = (BukiDataSet.CategoriesDataTable)cache[BUKI_CATEGORIESBLL_GETDATABYGT8];

        // Retrieve from dataProvider if not in Cache
        if (cdt == null)
        {
            BukiDataSetTableAdapters.CategoriesTableAdapter cta = new BukiDataSetTableAdapters.CategoriesTableAdapter();
            cdt = cta.GetDataByGT8();

            cache.Add(BUKI_CATEGORIESBLL_GETDATABYGT8, cdt);
        }

        return cdt;
    }

    public void GetDataByGT8_ClearCache()
    {
        // TODO: Clear Cache
        ICacheManager cache = CacheFactory.GetCacheManager();
        cache.Remove(BUKI_CATEGORIESBLL_GETDATABYGT8);
    }
}

