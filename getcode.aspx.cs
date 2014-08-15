using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class getcode : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GetItemUserAuthen"] != null)
        {
            Label1.Text = ((AuthenCommon)(Session["GetItemUserAuthen"])).userId + "&& " + ((AuthenCommon)(Session["GetItemUserAuthen"])).userName;
        }
        else
        {
            Response.Redirect("default.aspx");
        }

    }
    protected void btngetcode_Click(object sender, EventArgs e)
    {

    }
}