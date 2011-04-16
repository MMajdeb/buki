using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;

public partial class Test_jsonNetTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string json = @"{
  CPU: 'Intel',
  Drives: [
    'DVD read/writer',
    ""500 gigabyte hard drive""
  ]
}";

        JObject o = JObject.Parse(json);

        var postTitles =
  from p in o["channel"]["item"].Children()
  select (string)p["title"];

        foreach (var item in postTitles)
        {
            Console.WriteLine(item);
        }


    }
}
