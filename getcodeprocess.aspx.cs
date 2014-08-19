using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class getcodeprocess : System.Web.UI.Page
{
    wsClickCodeService.ClickCodeServiceClient ClickItem = new wsClickCodeService.ClickCodeServiceClient();

    protected void Page_Load(object sender, EventArgs e)
    {   
        //string icode = Request.Params["icode"];
        //string userIP = Request.UserHostAddress;
        //string userId = MISCoreLibrary.ClsDecrypt.DecryptSTD(Convert.ToString(((AuthenCommon)(Session["GetItemUserAuthen"])).userId), "GjrAIdzK97quE67Pho3pBhpV6VPP72hB", "OI1miOctWpPCvOu9");
        //string username = ((AuthenCommon)(Session["GetItemUserAuthen"])).userName;

        //wsClickCodeService.GetOfflineItemCodeDataManagement resItem = ClickItem.GetOfflineItemCodeManagement(ApplicationKey.partKey, ApplicationKey.channelKey, ApplicationKey.eventKey, userId, username, icode, userIP);
        //Response.Write("is code => " + resItem.itemCode + " des ==> " + resItem.itemDesc);

        int waitsec = 60;
        double totalsec = 0;
        string tmpsec = "60";
        if (Session["lastGetdate"] != null)
        {
            DateTime tmpdate = DateTime.Now;
            DateTime lastgetItem = Convert.ToDateTime(Session["lastGetdate"]);
            TimeSpan difference = tmpdate.Subtract(lastgetItem);
            totalsec = Math.Ceiling(difference.TotalSeconds);

            if (totalsec > 60)
            {
                waitsec = 0;
            }
            else if(totalsec >= 0 )
            {
                tmpsec = (60 - totalsec).ToString();
                waitsec = Convert.ToInt32((60 - totalsec).ToString());
            }
        }

        Response.Write("{ \"waitsec\":\"" + waitsec + "\" ,\"totalsec\":\"" + tmpsec + "\" }");
    }
}