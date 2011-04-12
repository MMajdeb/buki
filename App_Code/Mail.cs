using System;
using System.Data;
using System.Collections.Generic;
using System.Web.Security;
using System.Configuration;
using System.Net.Mail;
using System.Net;

namespace ClubSite
{
    public class Mail
    {

        public static void SendMail()
        {

            string mail_outgoingmailserver = ConfigurationManager.AppSettings["mail_outgoingmailserver"];
            bool mail_usedefaultcredentials = Convert.ToBoolean(ConfigurationManager.AppSettings["mail_usedefaultcredentials"]);
            int mail_port = Convert.ToInt32(ConfigurationManager.AppSettings["mail_port"]);
            bool mail_enablessl = Convert.ToBoolean(ConfigurationManager.AppSettings["mail_enablessl"]);
            string mail_secureusername = ConfigurationManager.AppSettings["mail_secureusername"];
            string mail_securepassword = ConfigurationManager.AppSettings["mail_securepassword"];

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
        
    }
}