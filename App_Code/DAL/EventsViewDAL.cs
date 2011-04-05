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

public class EventsViewDAL
{
    public System.Data.DataSet EventsSearch(int SupplierID, int ProductID, Nullable<DateTime> st, Nullable<DateTime> et)
    {
        HelperDAL dal = new HelperDAL();

        List<SqlParameter> paramLst = new List<SqlParameter>();
        paramLst.Add(new SqlParameter("SupplierID", SupplierID));
        paramLst.Add(new SqlParameter("ProductID", ProductID));
        paramLst.Add(new SqlParameter("st", st));
        paramLst.Add(new SqlParameter("et", et));

        return dal.ExecuteSqlCommandEL(@"SELECT     id, starttime, endtime, title, description, staticURL, location, photo, album
FROM         Events INNER JOIN
                      Orders ON Events.id = Orders.EventID INNER JOIN
                      [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
                      Products ON [Order Details].ProductID = Products.ProductID INNER JOIN
                      Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE     (Suppliers.SupplierID = @SupplierID) AND (Products.ProductID = @ProductID) AND (Orders.RequiredDate BETWEEN @st AND @et)"
            , paramLst);        
    }
}

