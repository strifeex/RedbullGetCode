using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class getcodeprocess : System.Web.UI.Page
{
    wsClickCodeService.ClickCodeServiceClient ClickItem = new wsClickCodeService.ClickCodeServiceClient();
    itemHistoryService.itemHistoryServiceSoapClient ItemHistoryservice = new itemHistoryService.itemHistoryServiceSoapClient();

    protected void Page_Load(object sender, EventArgs e)
    {   
        int waitsec = 0;

        if (Session["lastGetdate"] != null)
        {
            string[] res = ItemHistoryservice.getTimeDiffSeconds(((AuthenCommon)(Session["GetItemUserAuthen"])).userName, ApplicationKey.eventKey);
            // uncomment for use countdown
            if (res[0] == "0")
            {
                if (res[1].Length < 3)
                {
                    waitsec = Convert.ToInt32(res[1]);
                    if (waitsec <= 30)
                    {
                        waitsec = 30 - waitsec;
                    }
                    else {
                        waitsec = 0;
                    }
                }
            }
        }
        //json format
        Response.Write("{ \"waitsec\":\"" + waitsec + "\" ,\"totalsec\":\"" + waitsec + "\" }");
    }
}