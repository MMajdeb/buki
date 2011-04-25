using System;
using System.Drawing;
using System.Web.Security;
using DevCow.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

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
            LoadLayout();
        }
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

        MembershipUser user = Membership.GetUser();
        BukiDataSetTableAdapters.ProductszTableAdapter pta = new BukiDataSetTableAdapters.ProductszTableAdapter();
        //get by suplier
        BukiDataSet.ProductszDataTable pdt = pta.GetDataBySupplierID((Guid)user.ProviderUserKey);

        if (pdt.Rows.Count == 0)
        {
            pta.Insert(ddlCategory.SelectedValue, (Guid)user.ProviderUserKey, categoryID, "", 0, 0, 0, 0, false, txtLayout, 0, 0);
        }
        else
        {
            BukiDataSet.ProductszRow row = (BukiDataSet.ProductszRow)pdt.Rows[0];
            row.Layout = txtLayout;

            pta.Update(row);
        }
        
    }
}
