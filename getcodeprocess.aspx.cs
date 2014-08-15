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
        string icode = Request.Params["icode"];
        string userIP = Request.UserHostAddress;
        string userId = MISCoreLibrary.ClsDecrypt.DecryptSTD(Convert.ToString(((AuthenCommon)(Session["GetItemUserAuthen"])).userId), "GjrAIdzK97quE67Pho3pBhpV6VPP72hB", "OI1miOctWpPCvOu9");
        string username = ((AuthenCommon)(Session["GetItemUserAuthen"])).userName;

        wsClickCodeService.GetOfflineItemCodeDataManagement resItem = ClickItem.GetOfflineItemCodeManagement(ApplicationKey.partKey, ApplicationKey.channelKey, ApplicationKey.eventKey, userId, username, icode, userIP);
        Response.Write("is code => " + resItem.itemCode + " des ==> " + resItem.itemDesc);
        Response.Write("=====split=====");
        Response.Write("tesxt_2");
    }
}