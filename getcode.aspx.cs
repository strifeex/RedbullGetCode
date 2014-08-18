using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class getcode : System.Web.UI.Page
{
    itemHistoryService.itemHistoryServiceSoapClient ItemHistoryservice = new itemHistoryService.itemHistoryServiceSoapClient();

    protected void Page_Load(object sender, EventArgs e)
    {

        string tmpuserId = MISCoreLibrary.ClsDecrypt.DecryptSTD(Convert.ToString(((AuthenCommon)(Session["GetItemUserAuthen"])).userId), "GjrAIdzK97quE67Pho3pBhpV6VPP72hB", "OI1miOctWpPCvOu9");

        if (Session["GetItemUserAuthen"] != null)
        {
            Label1.Text = tmpuserId + "&& " + ((AuthenCommon)(Session["GetItemUserAuthen"])).userName;
        }
        else
        {
            Response.Redirect("default.aspx");
        }

        string tmpuserIdcut = Convert.ToInt32(tmpuserId).ToString();
        itemHistoryBind(tmpuserIdcut, ((AuthenCommon)(Session["GetItemUserAuthen"])).userName);

    }

    protected void btngetcode_Click(object sender, EventArgs e)
    {

    }

    protected void itemHistoryBind(string userId, string userName)
    {
        try
        {
            itemHistoryService.itemHistoryDataList codeData = ItemHistoryservice.itemHistoryList(ApplicationKey.gameId, userId, userName, ApplicationKey.partKey, ApplicationKey.channelKey, ApplicationKey.eventKey);
            dataTable.DataSource = codeData.itemHistoryDataListResult;
            dataTable.DataBind();

            int rowCount = dataTable.Rows.Count;

            //int i = 0;

            //while (i < rowCount)
            //{

            //    if (dataTable.Rows[i].Cells[5].Text == "1")
            //    {

            //        dataTable.Rows[i].ForeColor = System.Drawing.Color.DarkSlateBlue;
            //    }

            //    if (dataTable.Rows[i].Cells[2].Text == "1")
            //    {

            //        dataTable.Rows[i].ForeColor = System.Drawing.Color.DarkSeaGreen;
            //    }

            //    ++i;
            //}

            var allcode = 0;

            //if (rowCount > 0)
            //{
            //    allcode = codeData.AcCodeListResult.Count();
            //}

        }
        catch (Exception)
        {
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "Onclick", "alert('ขออภัยค่ะ เกิดข้อผิดพลาดในการทำงานของระบบค่ะ');", true);
            throw;
        }
    }

    protected void dataTable_PageIndexChanged(object sender, GridViewPageEventArgs e)
    {
        //dataTable.PageIndex = e.NewPageIndex;
        //dataTable.DataBind();

        //string channelval = "";

        //if (cbChannel.SelectedValue.ToString() != "")
        //{
        //    channelval = "'" + cbChannel.SelectedValue.ToString() + "'";
        //}

        //activeStat = Convert.ToInt32(cbActiveStat.SelectedValue);
        //dealStat = Convert.ToInt32(cbDealStat.SelectedValue);
        //AcCodeBind(" ", channelval, activeStat, dealStat, "", "");
    }

    protected void dataTable_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    Label lblSlideId = (Label)e.Row.FindControl("lblSlideId");

        //    lblSlideId.Text = DataBinder.Eval(e.Row.DataItem, "acId").ToString();

        //    Label lblFileExt = (Label)e.Row.FindControl("lblFileExt");

        //    lblFileExt.Text = DataBinder.Eval(e.Row.DataItem, "acCode").ToString();
        //}
    }
}