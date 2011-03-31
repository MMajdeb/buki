using System;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.WebControls;
using System.Web;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void Page_Init(object sender, EventArgs e)
    {
        

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
}
