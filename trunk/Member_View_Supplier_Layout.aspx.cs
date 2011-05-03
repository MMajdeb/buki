using System;
using System.Drawing;
using System.Web.Security;
using DevCow.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Member_Supplier_Layout : DevCowThemePage
{

    string supplierID = null;

    protected void Page_Init(object sender, EventArgs e)
    {
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        supplierID = Request["supplierID"];

         if (!Page.IsPostBack)
        {
            //load layout of table            
            LoadLayout();
        }
    }

    private void LoadLayout()
    {
        Guid guid = new Guid(supplierID);
        MembershipUser user = Membership.GetUser((object)guid);
        BukiDataSetTableAdapters.ProductszTableAdapter pta = new BukiDataSetTableAdapters.ProductszTableAdapter();
        //get by suplier
        BukiDataSet.ProductszDataTable pdt = pta.GetDataBySupplierID((Guid)user.ProviderUserKey);

        ////fill categories ddl
        //BukiDataSetTableAdapters.CategoriesTableAdapter cta = new BukiDataSetTableAdapters.CategoriesTableAdapter();
        //BukiDataSet.CategoriesDataTable cdt = cta.GetDataByGT8();
        //BukiDataSet.CategoriesRow rowCat = (BukiDataSet.CategoriesRow)cdt.NewRow();
        //rowCat.ItemArray = new object[] { -1, "", "" };
        //cdt.Rows.InsertAt(rowCat, 0);

        //ddlCategory.DataSource = cdt;
        //ddlCategory.DataTextField = "CategoryName";
        //ddlCategory.DataValueField = "CategoryID";
        //ddlCategory.DataBind();


        if (pdt.Rows.Count > 0)
        {
            BukiDataSet.ProductszRow row = (BukiDataSet.ProductszRow)pdt.Rows[0];

            txtLayoutdata.Value = row.Layout;
            //ddlCategory.Items.FindByValue(row.CategoryID.ToString()).Selected = true;
        }
    }

}
