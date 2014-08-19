using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    wsClickMemberService.ClickMemberServiceClient ClickMember = new wsClickMemberService.ClickMemberServiceClient();
    wsClickCodeService.ClickCodeServiceClient ClickItem = new wsClickCodeService.ClickCodeServiceClient();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GetItemUserAuthen"] != null)
        {
            Session.Abandon();
        }
        else
        {
            //ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "Onload", "alert('Permission to access system expire. Please login to system agian.'); window.location.href='Default.aspx';", true);
            //return;
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //dataset for userlogin result
        DataSet ds = new DataSet();

        ccCode.ValidateCaptcha(txtCaptcha.Text);

        if (!ccCode.UserValidated)
        {
            ScriptManager.RegisterClientScriptBlock(btnLogin, typeof(Button), "Onclick", "alert('กรุณาระบุรหัสอักขระให้ถูกต้อง');", true); return;
        }
        else
        {    
            //Go to Process
            wsClickMemberService.ClickAlotLoginMember resItem = ClickMember.LoginMember(4, txtUser.Text, txtPwd.Text);
            
            if (resItem.ClickAlotMemberDataListResult != null)
            {
                ds = resItem.ClickAlotMemberDataListResult;
                this.KeepSession(ds);
                //this.ChkGetClickItemCode(ds);
                Response.Redirect("getcode.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(btnLogin, typeof(Button), "Onclick", "alert('Username หรือ Password ไม่ถูกต้อง กรุณาทดลองใหม่อีกครั้งค่ะ');", true); return;
            }
        }
    }

    protected void KeepSession(DataSet ds)
    {
        AuthenCommon Authen = new AuthenCommon();
        Authen.userId = MISCoreLibrary.ClsEncrypt.EncryptSTD(Convert.ToString(ds.Tables[0].Rows[0].ItemArray[0]), "GjrAIdzK97quE67Pho3pBhpV6VPP72hB", "OI1miOctWpPCvOu9");
        Authen.userName = ds.Tables[0].Rows[0].ItemArray[1].ToString();
        Authen.userEmail = ds.Tables[0].Rows[0].ItemArray[2].ToString();
        Session["GetItemUserAuthen"] = Authen;
    }

}