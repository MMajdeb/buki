using System;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.WebControls;
using System.Web;

public partial class MasterPage1 : System.Web.UI.MasterPage
{

    public int ddlCategorySelectedIndex { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //load layout of table
            InitControls();            
        }
    }

    private void InitControls()
    {
        //fill categories ddl
        CategoriesBLL cbll = new CategoriesBLL(); 
        BukiDataSet.CategoriesDataTable cdt = cbll.GetDataByGT8();
        BukiDataSet.CategoriesRow rowCat = (BukiDataSet.CategoriesRow)cdt.NewRow();
        if(((BukiDataSet.CategoriesRow)cdt.Rows[0]).CategoryID > -1)
        {
            rowCat.ItemArray = new object[] { -1, "", "" };
            cdt.Rows.InsertAt(rowCat, 0);
        }

        ddlCategory.DataSource = cdt;
        ddlCategory.DataTextField = "CategoryName";
        ddlCategory.DataValueField = "CategoryID";
        ddlCategory.DataBind();

        //set index that filled from suppliers page
        ddlCategory.SelectedIndex = ddlCategorySelectedIndex;        
    }
    
    protected void Page_Init(object sender, EventArgs e)
    {
        this.ContentPlaceHolder1.ID = "C";
        this.HeaderPlaceHolder1.ID = "H";

        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            foreach (WebPartDisplayMode wpdmDisplayMode in WebPartManager1.SupportedDisplayModes)
            {
                if (wpdmDisplayMode.IsEnabled(WebPartManager1))
                {
                    drpDisplayModes.Items.Add(new ListItem(wpdmDisplayMode.Name, wpdmDisplayMode.Name));
                }
            }
        }
        else
        {
            drpDisplayModes.Visible = false;
        }
    }
    protected void drpDisplayModes_SelectedIndexChanged(object sender, EventArgs e)
    {
        WebPartManager1.DisplayMode = WebPartManager1.SupportedDisplayModes[drpDisplayModes.SelectedValue.ToString()];
    }
    protected void ClubMenu_MenuItemDataBound(object sender, MenuEventArgs e)
    {        
        const string user_propile = "����� �����";
        const string user_propile_logged = "������ �����";

        SiteMapNode node = e.Item.DataItem as SiteMapNode;
        Menu menu = sender as Menu;
        MenuItem item = menu.FindItem(node.Title);        

        if (Page.User.Identity.IsAuthenticated)
        {
            if (node.Title.Equals(user_propile))
            {
                //node.ReadOnly = false;
                //node.Title = user_propile_logged;
                item.Text = user_propile_logged;
            }
        }
        else
        {
            if (node.Title.Equals(user_propile_logged))
            {
                //node.ReadOnly = false;
                //node.Title = user_propile;
                item.Text = user_propile;
            }
        }
    }

}
