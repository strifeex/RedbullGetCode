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
            //Go to Process
            //wsClickMemberService.ClickAlotLoginMember resItem = ClickMember.LoginMember(4, txtUser.Text, txtPwd.Text);

            string icode = i_code.Text;
            string userIP = Request.UserHostAddress;
            string userId = MISCoreLibrary.ClsDecrypt.DecryptSTD(Convert.ToString(((AuthenCommon)(Session["GetItemUserAuthen"])).userId), "GjrAIdzK97quE67Pho3pBhpV6VPP72hB", "OI1miOctWpPCvOu9");
            string username = ((AuthenCommon)(Session["GetItemUserAuthen"])).userName;

            wsClickCodeService.GetOfflineItemCodeDataManagement resItem = ClickItem.GetOfflineItemCodeManagement(ApplicationKey.partKey, ApplicationKey.channelKey, ApplicationKey.eventKey, userId, username, icode, userIP);
            //Response.Write("is code => " + resItem.itemCode + " des ==> " + resItem.itemDesc);
            if (resItem.itemCode != null)
            {
                //ScriptManager.RegisterClientScriptBlock(btngetcode, typeof(Button), "Onclick", "alert('redbull code ไม่ถูกต้อง กรุณาทดลองใหม่อีกครั้งค่ะ');", true); return;
                Lblitem.Text = "ได้รับโค้ด" + resItem.itemCode + " " + resItem.itemDesc + " ";
                switch (resItem.itemName)
                {
                    case "Red Bull_001":
                        Image1.ImageUrl = "images/coin_prize20000.png";
                        break;
                    case "Red Bull_002":
                        Image1.ImageUrl = "images/gun-1.jpg";
                        break;
                    case "Red Bull_003":
                        Image1.ImageUrl = "images/gun-2.jpg";
                        break;
                    case "Red Bull_004":
                        Image1.ImageUrl = "images/coin_prize20000.png";
                        break;
                    case "Red Bull_005":
                        Image1.ImageUrl = "images/gun-1.jpg";
                        break;
                    case "Red Bull_006":
                        Image1.ImageUrl = "images/gun-2.jpg";
                        break;
                    case "Red Bull_007":
                        Image1.ImageUrl = "images/coin_prize20000.png";
                        break;
                    case "Red Bull_008":
                        Image1.ImageUrl = "images/gun-1.jpg";
                        break;
                    case "Red Bull_009":
                        Image1.ImageUrl = "images/gun-2.jpg";
                        break;
                    case "Red Bull_010":
                        Image1.ImageUrl = "images/coin_prize20000.png";
                        break;
                    case "Red Bull_011":
                        Image1.ImageUrl = "images/gun-1.jpg";
                        break;
                    case "Red Bull_012":
                        Image1.ImageUrl = "images/gun-2.jpg";
                        break;
                    case "Red Bull_013":
                        Image1.ImageUrl = "images/coin_prize20000.png";
                        break;
                    case "Red Bull_014":
                        Image1.ImageUrl = "images/gun-1.jpg";
                        break;
                    case "Red Bull_015":
                        Image1.ImageUrl = "images/gun-2.jpg";
                        break;
                    case "Red Bull_016":
                        Image1.ImageUrl = "images/coin_prize20000.png";
                        break;
                    case "Red Bull_017":
                        Image1.ImageUrl = "images/gun-1.jpg";
                        break;
                    case "Red Bull_018":
                        Image1.ImageUrl = "images/gun-2.jpg";
                        break;
                    case "Red Bull_019":
                        Image1.ImageUrl = "images/coin_prize20000.png";
                        break;
                    case "Red Bull_020":
                        Image1.ImageUrl = "images/gun-1.jpg";
                        break;
                    case "Red Bull_021":
                        Image1.ImageUrl = "images/gun-2.jpg";
                        break;
                    default:
                        Image1.ImageUrl = "images/gun-3.jpg";
                        break;
                }
                itemHistoryBind(userId, username);
            }
            else
            {
                Lblitem.Text = "";
                ScriptManager.RegisterClientScriptBlock(btngetcode, typeof(Button), "Onclick", "alert('redbull code ไม่ถูกต้อง กรุณาทดลองใหม่อีกครั้งค่ะ');", true); return;
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
                Session["lastGetdate"] = dataTable.Rows[0].Cells[3].Text;
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
}