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
        int waitsec = 60;
        double totalsec = 0;
        string tmpsec = "60";
        TimeSpan difference ;

        if (Session["lastGetdate"] != null)
        {
            DateTime tmpdate = DateTime.Now;
            DateTime lastgetItem = Convert.ToDateTime(Session["lastGetdate"]);
            difference = lastgetItem.Subtract(tmpdate);

            if (totalsec < 100)
            {
                waitsec = 0;
                tmpsec = "0";
            }
            else if(totalsec <= 160)
            {
                tmpsec = (totalsec - 100).ToString();
                waitsec = Convert.ToInt32((totalsec - 100).ToString());
            } 
        }

        Response.Write("{ \"waitsec\":\"" + waitsec + "\" ,\"totalsec\":\"" + tmpsec + "\" }");
        
    }
}