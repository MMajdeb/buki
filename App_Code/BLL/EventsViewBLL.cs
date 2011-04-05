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

[System.ComponentModel.DataObject]
public class EventsViewBLL
{
    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
    public System.Data.DataSet EventsSearch(int SupplierID, int ProductID, Nullable<DateTime> st, Nullable<DateTime> et)
    {
        EventsViewDAL dal = new EventsViewDAL();

        return dal.EventsSearch(SupplierID, ProductID, st, et);
    }
}

