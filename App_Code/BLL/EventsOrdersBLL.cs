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

public class EventsOrdersBLL
{    
    public int AddNewEventOrder(int eventID, DateTime st, DateTime et)
    {
        //get user id
        System.Guid userID = new Guid(Membership.GetUser().ProviderUserKey.ToString());
        string customerID = "VINET";
        int employeeID = 5;
        DateTime orderDate = DateTime.Now;
        int shipVia = 3;
        decimal freight = 0;
        string shipName = "";
        string shipAddress = "";
        string shipCity = "";
        string shipRegion = null;
        string ShipPostalCode = "";
        string shipCountry = "";
        bool isAproved = false;
        int orderAprovedNum = 0;

        BukiDataSetTableAdapters.OrdersTableAdapter ota = new BukiDataSetTableAdapters.OrdersTableAdapter();
        BukiDataSetTableAdapters.Order_DetailsTableAdapter odta = new BukiDataSetTableAdapters.Order_DetailsTableAdapter();

        object o = ota.InsertQuery(customerID, 
            employeeID, 
            orderDate, 
            st, 
            et, 
            shipVia, 
            freight, 
            shipName, 
            shipAddress, 
            shipCity, 
            shipRegion, 
            ShipPostalCode, 
            shipCountry, 
            eventID, 
            userID, 
            isAproved, 
            orderAprovedNum);

        //add new order
        int newOrderID = Convert.ToInt32(o);        

        //add new order detail to connect to supplier
        odta.Insert(newOrderID, 52, 3, 3, 0.1F);

        return 1;
    }
}

