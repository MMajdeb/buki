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

        string json1 = @"{

  ""Name"": ""Apple"",

  ""Expiry"": new Date(1230422400000),

  ""Price"": 3.99,

  ""Sizes"": [

    ""Small"",

    ""Medium"",

    ""Large""

  ]

}";

string json2 =  "{\r\n  \"Name\": \"Apple\",\r\n  \"Expiry\": new Date(\r\n    1230422400000\r\n  ),\r\n  \"Price\": 3.99,\r\n  \"Sizes\": [\r\n    \"Small\",\r\n    \"Medium\",\r\n    \"Large\"\r\n  ]\r\n}";




        JObject o = JObject.Parse(json2);

        string tt6 = o.ToString() + " ";

        JObject to = JObject.Parse(tt6);


        string name = (string)o["Name"];

        // Apple



        JArray sizes = (JArray)o["Sizes"];



        string smallest = (string)sizes[0];

        // Small



        string json = @"{
  CPU: 'Intel',
  Drives: [
    'DVD read/writer',
    ""500 gigabyte hard drive""
  ]
}";

        string lay = @"{
        ""data"":{
        ""row_0"":{
        ""col_0"":{
        ""textValues"":[
        ""עמדה1""
        ,
        ""עמדה1""
        ]
        }
        ,
        ""col_1"":{
        ""textValues"":[
        ""2עמדה""
        ]
        }
        }
        ,
        ""row_1"":{
        ""col_0"":{
        ""textValues"":[
        ]
        }
        ,
        ""col_1"":{
        ""textValues"":[
        ""עמדה3""
        ]
        }
        }
        }
        }";

        //JObject o = JObject.Parse(lay);

        var postTitles =
    from p in o["data"].Children()
  select p;

  //      foreach (var item in postTitles)
  //      {
  //          Console.WriteLine(item);
  //      }

        // get JSON result objects into a list
        IList<JToken> results = o["data"].Children().ToList();

        Response.Write("data<br>");

        foreach (JToken row in results)
        {
            //SearchResult searchResult = JsonConvert.DeserializeObject<SearchResult>(result.ToString());            
            string s = row.ToString();

            int index = results.IndexOf(row);

            JObject row1 = new JObject(row);

            IList<JToken> resultsCols = row1["row_" + index].Children().ToList();

            Response.Write("&nbsp;row_" + index  + "<br>");

            foreach (JToken col in resultsCols)
            {
                string s1 = col.ToString();

                int index2 = resultsCols.IndexOf(col);

                JObject col1 = new JObject(col);

                IList<JToken> resultsValues = col1["col_" + index2]["textValues"].Children().ToList();

                Response.Write("&nbsp;&nbsp;col_" + index2 + "<br>");

                foreach (JToken val in resultsValues)
                {
                    int index3 = resultsValues.IndexOf(val);

                    Response.Write("&nbsp;&nbsp;&nbsp;val_" + index3 + " " + val.ToString() + "<br>");
                }

            }
        }


    }
}
