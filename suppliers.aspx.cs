using System;
using System.Web.Security;
using System.Web.UI.WebControls;
using DevCow.Web.UI;
using System.Data;

public partial class Suppliers : DevCowThemePage
{
    enum SupplierszSelectOptions
    {
        GetData,
        GetData1
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        MasterPage1 mp;
        MasterPage1 mpt = this.Master as MasterPage1;
        string selectedValue = "0";

        if (PreviousPage != null)
        {
            mp = PreviousPage.Master as MasterPage1;
        }
        else
        {
            mp = this.Master as MasterPage1;
        }

        TextBox tb = mp.FindControl("tbFreeText") as TextBox;
        //TextBox tbt = mpt.FindControl("tbFreeText") as TextBox;
        DropDownList ddl = mp.FindControl("ddlCategory") as DropDownList;
        //DropDownList ddlt = mpt.FindControl("ddlCategory") as DropDownList;

        //if (ddl.SelectedItem != null)
        //{
        //    lblSearchCreteria.Text = ddl.SelectedItem.Text;

        //    (this.Master as MasterPage1).ddlCategorySelectedIndex = ddl.SelectedIndex;

        //    //update SupplierszObjectDataSource
        //    selectedValue = ddl.SelectedValue;
        //}

        //update SupplierszObjectDataSource
        //SupplierszObjectDataSource.SelectParameters["CategoryID"].DefaultValue = selectedValue;        

        (this.Master as MasterPage1).ddlCategorySelectedIndex = ddl.SelectedIndex;
        (this.Master as MasterPage1).tbFreeTextText = tb.Text;

        //options
        // GetData
        // GetDataByCompanyNameAndCategoryID
        // GetDataByCategoryId
        // GetDataByLikeCompanyName

        if (!String.IsNullOrEmpty(tb.Text) && ddl.SelectedValue != "-1")
        {
            SupplierszObjectDataSource.SelectMethod = "GetDataByCompanyNameAndCategoryID";
            SupplierszObjectDataSource.SelectParameters.Clear();
            SupplierszObjectDataSource.SelectParameters.Add("CategoryID", ddl.SelectedValue);
            SupplierszObjectDataSource.SelectParameters.Add("CompanyName", "%" + tb.Text + "%");
            lblSearchCreteria.Text = String.Format("{0} å {1}", ddl.SelectedItem.Text, tb.Text);
        }
        if (String.IsNullOrEmpty(tb.Text) && ddl.SelectedValue != "-1")
        {
            SupplierszObjectDataSource.SelectMethod = "GetDataByCategoryId";
            SupplierszObjectDataSource.SelectParameters.Clear();
            SupplierszObjectDataSource.SelectParameters.Add("CategoryID", ddl.SelectedValue);
            lblSearchCreteria.Text = String.Format("{0}", ddl.SelectedItem.Text);
        }
        if (!String.IsNullOrEmpty(tb.Text) && ddl.SelectedValue == "-1")
        {
            SupplierszObjectDataSource.SelectMethod = "GetDataByLikeCompanyName";
            SupplierszObjectDataSource.SelectParameters.Clear();            
            SupplierszObjectDataSource.SelectParameters.Add("CompanyName", "%" + tb.Text + "%");
            lblSearchCreteria.Text = String.Format("{0}", tb.Text);
        }
        if (String.IsNullOrEmpty(tb.Text) && ddl.SelectedValue == "-1")
        {
            SupplierszObjectDataSource.SelectMethod = "GetData";
            SupplierszObjectDataSource.SelectParameters.Clear();
        }

    }



}
