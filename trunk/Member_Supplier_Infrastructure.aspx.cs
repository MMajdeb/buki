using System;
using System.Drawing;
using System.Web.Security;
using DevCow.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Member_Supplier_Infrastructure : DevCowThemePage
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

//        string lay = @"{
//""data"":{
//""row_0"":{
//""col_0"":{
//""textValues"":[
//""тогд1""
//,
//""тогд1""
//]
//}
//,
//""col_1"":{
//""textValues"":[
//""2тогд""
//]
//}
//}
//,
//""row_1"":{
//""col_0"":{
//""textValues"":[
//]
//}
//,
//""col_1"":{
//""textValues"":[
//""тогд3""
//]
//}
//}
//}
//}";

        //txtLayoutdata.Value = lay;
        //tbRows.Text = "2";
        //tbCols.Text = "2";

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
            tbRows.Text = row.Rows.ToString();
            tbCols.Text = row.Columns.ToString();
            ddlCategory.Items.FindByValue(row.CategoryID.ToString()).Selected = true;            
        }
        
    }

    protected void btnAddRecord_Click(object sender, EventArgs e)
    {
        string txtLayout = txtLayoutdata.Value;
        short rowsLayout = Convert.ToInt16(tbRows.Text);
        short colsLayout = Convert.ToInt16(tbCols.Text);
        int categoryID = Convert.ToInt32(ddlCategory.SelectedValue);

        MembershipUser user = Membership.GetUser();
        BukiDataSetTableAdapters.ProductszTableAdapter pta = new BukiDataSetTableAdapters.ProductszTableAdapter();
        //get by suplier
        BukiDataSet.ProductszDataTable pdt = pta.GetDataBySupplierID((Guid)user.ProviderUserKey);

        if (pdt.Rows.Count == 0)
        {
            pta.Insert(ddlCategory.SelectedValue,(Guid)user.ProviderUserKey,categoryID,"",0,0,0,0,false,txtLayout,colsLayout,rowsLayout);
        }
        else
        {
            BukiDataSet.ProductszRow row = (BukiDataSet.ProductszRow)pdt.Rows[0];
            row.Layout = txtLayout;
            row.Rows = rowsLayout;
            row.Columns = colsLayout;

            pta.Update(row);
        }

        //if supplier exists then update
        
    }
}
