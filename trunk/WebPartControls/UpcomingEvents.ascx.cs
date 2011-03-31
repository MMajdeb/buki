using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class WebPartControls_UpcomingEvents : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected string ShowDuration(object starttime, object endtime)
    {
        System.DateTime starttimeDT = (DateTime)starttime;
        if (endtime != null && endtime != DBNull.Value)
        {
            System.DateTime endtimeDT = (DateTime)endtime;
            if (starttimeDT.Date == endtimeDT.Date)
            {
                if (starttimeDT == endtimeDT)
                {
                    return starttimeDT.ToString("h:mm tt");
                }
                else
                {
                    return starttimeDT.ToString("h:mm tt") + " - " + endtimeDT.ToString("h:mm tt");
                }
            }
            else
            {
                return "thru " + endtimeDT.ToString("d");
            }
        }
        else
        {
            return starttimeDT.ToString("h:mm tt");
        }
    }
}
