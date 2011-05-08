using System;
using System.Web.Security;
using System.Web.UI.WebControls;
using DevCow.Web.UI;

public partial class Suppliers : DevCowThemePage
{
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

        if (ddl.SelectedItem != null)
        {
            lblSearchCreteria.Text = ddl.SelectedItem.Text;

            (this.Master as MasterPage1).ddlCategorySelectedIndex = ddl.SelectedIndex;

            //update SupplierszObjectDataSource
            selectedValue = ddl.SelectedValue;
        }

        //update SupplierszObjectDataSource
        SupplierszObjectDataSource.SelectParameters["CategoryID"].DefaultValue = selectedValue;        

    }



}
