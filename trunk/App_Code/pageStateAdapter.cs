using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace RJB
{
    /// <summary>
    /// Summary description for SiteSettings
    /// </summary>
    public class PageStateAdapter : System.Web.UI.Adapters.PageAdapter
    {
        public override PageStatePersister GetStatePersister()
        {
            //return base.GetStatePersister();
            return new SessionPageStatePersister(Page);
        }
    }
}
