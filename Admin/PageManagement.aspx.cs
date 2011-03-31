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
using System.Xml;
using System.IO;
using DevCow.Web.UI;

public partial class admin_PageManagement : DevCowThemePage
{
    string virtualFile;
    string virtualOutPutFile;

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnUp_Click(object sender, EventArgs e)
    {
        XmlDocument xmlSiteMap = GetSiteMapFile();

        //Move the node up
        XmlNamespaceManager nsmgr = new XmlNamespaceManager(xmlSiteMap.NameTable);
        nsmgr.AddNamespace("devcow", @"http://schemas.microsoft.com/AspNet/SiteMap-File-1.0");

        XmlNode xmlMoveUpNode = 
            xmlSiteMap.SelectSingleNode("//devcow:siteMapNode[@title='" + TreeView1.CheckedNodes[0].Value + "']",nsmgr);

        if (xmlMoveUpNode.PreviousSibling != null)
        {
            XmlNode PrevSibling = xmlMoveUpNode.PreviousSibling;
            xmlMoveUpNode.ParentNode.InsertBefore(xmlMoveUpNode, PrevSibling);

            WriteSiteMapFile(xmlSiteMap);
        }
        else
        {
            lblErrors.Text = "Page is already at the top";
        }
    }

    protected void btnMoveDown_Click(object sender, EventArgs e)
    {
        XmlDocument xmlSiteMap = GetSiteMapFile();

        //Move the node up
        XmlNamespaceManager nsmgr = new XmlNamespaceManager(xmlSiteMap.NameTable);
        nsmgr.AddNamespace("devcow", @"http://schemas.microsoft.com/AspNet/SiteMap-File-1.0");

        XmlNode xmlMoveDownNode =
            xmlSiteMap.SelectSingleNode("//devcow:siteMapNode[@title='" + TreeView1.CheckedNodes[0].Value + "']", nsmgr);

        if (xmlMoveDownNode.NextSibling != null)
        {
            XmlNode NextSibling = xmlMoveDownNode.NextSibling;
            xmlMoveDownNode.ParentNode.InsertAfter(xmlMoveDownNode, NextSibling);

            WriteSiteMapFile(xmlSiteMap);
        }
        else
        {
            lblErrors.Text = "Page is already at the bottom";
        }
    }

    protected void btnChild_Click(object sender, EventArgs e)
    {
        XmlDocument xmlSiteMap = GetSiteMapFile();

        //Move the node up
        XmlNamespaceManager nsmgr = new XmlNamespaceManager(xmlSiteMap.NameTable);
        nsmgr.AddNamespace("devcow", @"http://schemas.microsoft.com/AspNet/SiteMap-File-1.0");

        XmlNode xmlMoveUpNode =
            xmlSiteMap.SelectSingleNode("//devcow:siteMapNode[@title='" + TreeView1.CheckedNodes[0].Value + "']", nsmgr);

        if (xmlMoveUpNode.PreviousSibling != null)
        {
            XmlNode PrevSibling = xmlMoveUpNode.PreviousSibling;
            PrevSibling.AppendChild(xmlMoveUpNode);

            WriteSiteMapFile(xmlSiteMap);
        }
        else
        {
            lblErrors.Text = "Page does not have a parent";
        }
    }

    protected void btnSibling_Click(object sender, EventArgs e)
    {
        XmlDocument xmlSiteMap = GetSiteMapFile();

        //Move the node up
        XmlNamespaceManager nsmgr = new XmlNamespaceManager(xmlSiteMap.NameTable);
        nsmgr.AddNamespace("devcow", @"http://schemas.microsoft.com/AspNet/SiteMap-File-1.0");

        XmlNode xmlMoveUpNode =
            xmlSiteMap.SelectSingleNode("//devcow:siteMapNode[@title='" + TreeView1.CheckedNodes[0].Value + "']", nsmgr);

        if (xmlMoveUpNode.ParentNode.Attributes["title"].Value != "top")
        {
            XmlNode xmlParent = xmlMoveUpNode.ParentNode;
            xmlParent.ParentNode.InsertAfter(xmlMoveUpNode,xmlParent);

            WriteSiteMapFile(xmlSiteMap);
        }
        else
        {
            lblErrors.Text = "Cannot change the parent node";
        }
    }

    #region "Helper Functions"

    private void WriteSiteMapFile(XmlDocument xmlSiteMap)
    {
        //Write out to file
        using (StreamWriter fileStream = new StreamWriter(virtualOutPutFile))
        {
            XmlWriter fileWriter = new XmlTextWriter(fileStream);
            xmlSiteMap.WriteContentTo(fileWriter);
        }
        Response.Redirect(Request.Url.ToString());
    }

    private XmlDocument GetSiteMapFile()
    {
        //Get the XML file
        virtualFile = Server.MapPath("~/Web.sitemap");
        virtualOutPutFile = virtualFile;
        XmlDocument xmlSiteMap = new ConfigXmlDocument();

        try
        {
            using (StreamReader fileStream = new StreamReader(virtualFile))
            {
                XmlReader fileReader = new XmlTextReader(fileStream);
                xmlSiteMap.Load(fileReader);
            }
        }
        catch (XmlException xmlexp)
        {
            throw new ApplicationException("DevCowXmlSiteMapProvider failed, file: " + virtualFile, xmlexp);
        }
        catch (Exception generalexp)
        {
            throw new ApplicationException("DevCowXmlSiteMapProvider failed, file: " + virtualFile, generalexp);
        }
        return xmlSiteMap;
    }
    #endregion


}
