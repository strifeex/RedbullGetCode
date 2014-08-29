using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class getcode : System.Web.UI.Page
{
    itemHistoryService.itemHistoryServiceSoapClient ItemHistoryservice = new itemHistoryService.itemHistoryServiceSoapClient();
    wsClickCodeService.ClickCodeServiceClient ClickItem = new wsClickCodeService.ClickCodeServiceClient();

    protected void Page_Load(object sender, EventArgs e)
    {
        Lblitem.Text = "";

        if (Session["GetItemUserAuthen"] != null)
        {
            string tmpuserId = MISCoreLibrary.ClsDecrypt.DecryptSTD(Convert.ToString(((AuthenCommon)(Session["GetItemUserAuthen"])).userId), "GjrAIdzK97quE67Pho3pBhpV6VPP72hB", "OI1miOctWpPCvOu9");
            //Label1.Text = tmpuserId + "&& " + ((AuthenCommon)(Session["GetItemUserAuthen"])).userName;
            usernameLabel.Text = ((AuthenCommon)(Session["GetItemUserAuthen"])).userName;

            itemHistoryBind(tmpuserId, ((AuthenCommon)(Session["GetItemUserAuthen"])).userName);
        }
        else
        {
            Response.Redirect("default.aspx");
        }
    }

    protected void btngetcode_Click(object sender, EventArgs e)
    {
        ccCode.ValidateCaptcha(txtCaptcha.Text);

        if (!ccCode.UserValidated)
        {
            ScriptManager.RegisterClientScriptBlock(btngetcode, typeof(Button), "Onclick", "alert('กรุณาระบุรหัสอักขระให้ถูกต้อง');", true); return;
        }
        else
        {
            string icode = i_code.Text;
            string userIP = Request.UserHostAddress;
            string userId = MISCoreLibrary.ClsDecrypt.DecryptSTD(Convert.ToString(((AuthenCommon)(Session["GetItemUserAuthen"])).userId), "GjrAIdzK97quE67Pho3pBhpV6VPP72hB", "OI1miOctWpPCvOu9");
            string username = ((AuthenCommon)(Session["GetItemUserAuthen"])).userName;

            wsClickCodeService.GetOfflineItemCodeDataManagement resItem = ClickItem.GetOfflineItemCodeManagement(ApplicationKey.partKey, ApplicationKey.channelKey, ApplicationKey.eventKey, userId, username, icode, userIP);
            //Response.Write("is code => " + resItem.itemCode + " des ==> " + resItem.itemDesc);
            //usernameLabel.Text = resItem.GetOfflineItemCodeDataResult.ToString();
            if (resItem.itemCode != null)
            {
                Lblitem.Text = resItem.itemCode ;
                switch (resItem.itemName)
                {
                    case "Red Bull_001":
                        Image1.ImageUrl = "images/100000.png";
                        break;
                    case "Red Bull_002":
                        Image1.ImageUrl = "images/10000.png";
                        break;
                    case "Red Bull_003":
                        Image1.ImageUrl = "images/1000.png";
                        break;
                    case "Red Bull_004":
                        Image1.ImageUrl = "images/SWAT_HELMET.png";
                        break;
                    case "Red Bull_005":
                        Image1.ImageUrl = "images/OAKLEY_GLASSES.png";
                        break;
                    case "Red Bull_006":
                        Image1.ImageUrl = "images/SWAT_MASK.png";
                        break;
                    case "Red Bull_007":
                        Image1.ImageUrl = "images/ARAB_SCARF.png";
                        break;
                    case "Red Bull_008":
                        Image1.ImageUrl = "images/SOFT_ARM_PAD.png";
                        break;
                    case "Red Bull_009":
                        Image1.ImageUrl = "images/ADVENTURE_BACKPACK.png";
                        break;
                    case "Red Bull_010":
                        Image1.ImageUrl = "images/SOFT_SHIN_PAD.png";
                        break;
                    case "Red Bull_011":
                        Image1.ImageUrl = "images/AK47.png";
                        break;
                    case "Red Bull_012":
                        Image1.ImageUrl = "images/TAR21.png";
                        break;
                    case "Red Bull_013":
                        Image1.ImageUrl = "images/P90.png";
                        break;
                    case "Red Bull_014":
                        Image1.ImageUrl = "images/MP7.png";
                        break;
                    case "Red Bull_015":
                        Image1.ImageUrl = "images/BARRETT_M98.png";
                        break;
                    case "Red Bull_016":
                        Image1.ImageUrl = "images/AWP.png";
                        break;
                    case "Red Bull_017":
                        Image1.ImageUrl = "images/M1887.png";
                        break;
                    case "Red Bull_018":
                        Image1.ImageUrl = "images/BENELLI_M4.png";
                        break;
                    case "Red Bull_019":
                        Image1.ImageUrl = "images/MG43.png";
                        break;
                    case "Red Bull_020":
                        Image1.ImageUrl = "images/DESERT_EAGLE.png";
                        break;
                    case "Red Bull_021":
                        Image1.ImageUrl = "images/TOMAHAWK_AXE.png";
                        break;
                    default:
                        Image1.ImageUrl = "images/KUKRI.png";
                        break;
                }

                txtCaptcha.Text = "";
                itemHistoryBind(userId, username);
            }
            else
            {
                //"OfflineDistributedNotFound"
                Lblitem.Text = "";
                txtCaptcha.Text = "";
                ScriptManager.RegisterClientScriptBlock(btngetcode, typeof(Button), "Onclick", "alert('code ไม่ถูกต้อง หรือ code ถูกใช้งานไปแล้ว');", true); return;
            }
        }

    }

    protected void itemHistoryBind(string userId, string userName)
    {
        try
        {
            string tmpuserIdcut = Convert.ToInt32(userId).ToString();

            itemHistoryService.itemHistoryDataList codeData = ItemHistoryservice.itemHistoryList(ApplicationKey.gameId, tmpuserIdcut, userName, ApplicationKey.partKey, ApplicationKey.channelKey, ApplicationKey.eventKey);
            dataTable.DataSource = codeData.itemHistoryDataListResult;
            dataTable.DataBind();

            int rowCount = dataTable.Rows.Count;

            if (rowCount > 0)
            {
                Session["lastGetdate"] = dataTable.Rows[0].Cells[0].Text;
            }
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
        dataTable.PageIndex = e.NewPageIndex;
        dataTable.DataBind();
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
    protected void _Click(object sender, EventArgs e)
    {

    }
}