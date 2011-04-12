using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net.Mime;
using System.Net;
using System.Configuration;

public partial class Test_mailTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //sendGMail();
        sendMail();

    }

    private void sendMail()
    {
        string mail_outgoingmailserver = ConfigurationManager.AppSettings["mail_outgoingmailserver"];
        bool mail_usedefaultcredentials = Convert.ToBoolean(ConfigurationManager.AppSettings["mail_usedefaultcredentials"]);
        int mail_port = Convert.ToInt32(ConfigurationManager.AppSettings["mail_port"]);
        bool mail_enablessl = Convert.ToBoolean(ConfigurationManager.AppSettings["mail_enablessl"]);
        string mail_secureusername =  ConfigurationManager.AppSettings["mail_secureusername"];
        string mail_securepassword =  ConfigurationManager.AppSettings["mail_securepassword"];

        SmtpClient smtp = new SmtpClient(mail_outgoingmailserver);
        smtp.UseDefaultCredentials = mail_usedefaultcredentials;
        smtp.Port = mail_port;
        smtp.EnableSsl = mail_enablessl;
        smtp.Credentials = new NetworkCredential(mail_secureusername, mail_securepassword);

        /* create the email message */
        MailMessage message = new MailMessage("haim.magen@gmail.com",
            "haim.magen@gmail", "subject of the Message ",
            "body fo the message ");


        //System.Net.Mime.ContentType htmlType = new System.Net.Mime.ContentType("text/html");
        //System.Net.Mime.ContentType txtType = new System.Net.Mime.ContentType("text/plain");
        //message.AlternateViews.Add(AlternateView.CreateAlternateViewFromString(msg, htmlType));
        //message.From = new MailAddress(ConfigurationManager.AppSettings["from"], ConfigurationManager.AppSettings["displayname"]);

        /*Send the message */
        smtp.Send(message);
    }

    private void sendGMail()
    {
        /* create the email message */
        MailMessage message = new MailMessage("haim.magen@gmail.com",
            "haim.magen@gmail", "subject of the Message ",
            "body fo the message ");

        /* create and add the attachment(s)*/
        //Attachment attachment = new Attachment("sample.doc",
        //                        MediaTypeNames.Application.Octet);
        //message.Attachments.Add(attachment);

        /* create SMTP Client and add credentials */
        SmtpClient smtpClient = new SmtpClient("smtp.gmail.com");
        smtpClient.UseDefaultCredentials = false;
        /* Email with Authentication */
        smtpClient.Credentials = new NetworkCredential("xxxxx", "xxxxx");
        smtpClient.Port = 587;
        smtpClient.EnableSsl = true;

        /*Send the message */
        smtpClient.Send(message);
    }
}
