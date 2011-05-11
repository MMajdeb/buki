using System;
using System.Drawing;
using System.Web.Security;
using DevCow.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Linq;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;

public partial class Member_Supplier_Layout : DevCowThemePage
{    

    protected void Page_Init(object sender, EventArgs e)
    {
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.User.Identity.IsAuthenticated)
        {
            Response.Write("To use the member details functionality, you need to be authenticated. Please use the <a href='login.aspx'>Login</a> page to authenticate yourself.");
            Response.End();
        }

        if (!Page.IsPostBack)
        {
            //load layout of table
            LoadItems();
            LoadLayout();
        }
    }

    private void LoadItems()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Image");

        dt.Rows.Add(new object[] { "images/icons-basic/circleh.png" });
        dt.Rows.Add(new object[] { "images/icons-basic/squreh.png" });
        dt.Rows.Add(new object[] { "images/icons-basic/round-recth.png" });
        dt.Rows.Add(new object[] { "images/icons-basic/diamondh.png" });
        dt.Rows.Add(new object[] { "images/icons-basic/hexagonh.png" });
        dt.Rows.Add(new object[] { "images/icons-basic/parallelogramh.png" });
        dt.Rows.Add(new object[] { "images/icons-basic/trapezoid2h.png" });
        dt.Rows.Add(new object[] { "images/icons-basic/trapezoidh.png" });
        dt.Rows.Add(new object[] { "images/icons-basic/triangleh.png" });

        rptItems.DataSource = dt;
        rptItems.DataBind();
    }

    private void LoadLayout()
    {
        MembershipUser user = Membership.GetUser();
        BukiDataSetTableAdapters.ProductszTableAdapter pta = new BukiDataSetTableAdapters.ProductszTableAdapter();
        //get by suplier
        BukiDataSet.ProductszDataTable pdt = pta.GetDataBySupplierID((Guid)user.ProviderUserKey);

        //fill categories ddl
        BukiDataSetTableAdapters.CategoriesTableAdapter cta = new BukiDataSetTableAdapters.CategoriesTableAdapter();
        BukiDataSet.CategoriesDataTable cdt = cta.GetDataByGT8();
        BukiDataSet.CategoriesRow rowCat = (BukiDataSet.CategoriesRow)cdt.NewRow();
        rowCat.ItemArray = new object[] { -1, "", "" };
        cdt.Rows.InsertAt(rowCat, 0);

        ddlCategory.DataSource = cdt;
        ddlCategory.DataTextField = "CategoryName";
        ddlCategory.DataValueField = "CategoryID";
        ddlCategory.DataBind();


        if (pdt.Rows.Count > 0)
        {
            BukiDataSet.ProductszRow row = (BukiDataSet.ProductszRow)pdt.Rows[0];

            txtLayoutdata.Value = row.Layout;
            ddlCategory.Items.FindByValue(row.CategoryID.ToString()).Selected = true;
        }
    }
    
    protected void btnAddRecord_Click(object sender, EventArgs e)
    {
        string txtLayout = txtLayoutdata.Value;
        int categoryID = Convert.ToInt32(ddlCategory.SelectedValue);
        int productID;

        MembershipUser user = Membership.GetUser();
        BukiDataSetTableAdapters.ProductszTableAdapter pta = new BukiDataSetTableAdapters.ProductszTableAdapter();
        //get by suplier
        BukiDataSet.ProductszDataTable pdt = pta.GetDataBySupplierID((Guid)user.ProviderUserKey);

        //for time resources
        BukiDataSetTableAdapters.ProductszResourcesTableAdapter prta = new BukiDataSetTableAdapters.ProductszResourcesTableAdapter();

        // loop all layout and give guid id's to resurces
        JObject oLayout = JObject.Parse(txtLayout);
        // get JSON result objects into a list
        IList<JToken> results = oLayout["data"].Children().ToList();
        foreach (JToken itemResource in results)
        {
            int index = results.IndexOf(itemResource);

            if (oLayout["data"][index]["id"].ToString() == "\"\"")
            {
                oLayout["data"][index]["id"] = System.Guid.NewGuid().ToString();
            }
        }

        // set new string with ids
        txtLayout = oLayout.ToString();

        BukiDataSet.ProductszRow row;

        if (pdt.Rows.Count == 0)
        {
            pta.Insert(ddlCategory.SelectedValue, (Guid)user.ProviderUserKey, categoryID, "", 0, 0, 0, 0, false, txtLayout, 0, 0);

            pdt = pta.GetDataBySupplierID((Guid)user.ProviderUserKey);
            row = (BukiDataSet.ProductszRow)pdt.Rows[0];

            productID = row.ProductID;
        }
        else
        {
            row = (BukiDataSet.ProductszRow)pdt.Rows[0];
            row.Layout = txtLayout;

            pta.Update(row);

            productID = row.ProductID;

            //delete time resurces of product
            prta.DeleteQueryByProductID(row.ProductID);            
        }            
        

        // add new time resources for table
        foreach (JToken itemResource in results)
        {
            int index = results.IndexOf(itemResource);

            //id of resource
            string id = oLayout["data"][index]["id"].ToString();
            string time = oLayout["data"][index]["time"].ToString();

            JObject itemTime = JObject.Parse(time);

            IList<JToken> resultsTime = itemTime["data"].Children().ToList();
            foreach (JToken itemResourceTime in resultsTime)
            {
                short day = 0;

                IList<JToken> resultsTimeValues = itemResourceTime.Children().ToList();
                for (int i = 0; i < resultsTimeValues.Count; i++)
                {                    
                    //skip first value
                    if (i == 0) continue;

                    // skip every 2-nd item 12:00 - 12:30 pick 2 values at once
                    if (i % 2 == 0) continue;

                    day++;

                    string valueTimeStart = resultsTimeValues[i].Value<string>();
                    string valueTimeEnd = resultsTimeValues[i + 1].Value<string>();

                    // both start time and end time must appear
                    if (String.IsNullOrEmpty(valueTimeStart)) continue;
                    if (String.IsNullOrEmpty(valueTimeEnd)) continue;

                    DateTime dtStart = Convert.ToDateTime("2011-01-01 " + valueTimeStart);
                    DateTime dtEnd = Convert.ToDateTime("2011-01-01 " + valueTimeEnd);

                    prta.Insert(new Guid(id), productID, day, null, null);
                } // resultsTimeValues
            } //resultsTime

        } //results
        
    }

}
