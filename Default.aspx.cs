using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        ccCode.ValidateCaptcha(txtCaptcha.Text);

        if (!ccCode.UserValidated)
        {
            ScriptManager.RegisterClientScriptBlock(btnLogin, typeof(Button), "Onclick", "alert('กรุณาระบุรหัสอักขระให้ถูกต้อง');", true); return;
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(btnLogin, typeof(Button), "Onclick", "alert('รหัสอักขระถูกต้อง');", true); return;
            //Go to Process
            //wsClickMemberService.ClickAlotLoginMember resItem = ClickMember.LoginMember(4, txtUser.Text, txtPwd.Text);

            //if (resItem.ClickAlotMemberDataListResult != null)
            //{
            //    ds = resItem.ClickAlotMemberDataListResult;
            //    this.ChkGetClickItemCode(ds);
            //}
            //else
            //{
            //    ScriptManager.RegisterClientScriptBlock(btnLogin, typeof(Button), "Onclick", "alert('Username หรือ Password ไม่ถูกต้อง กรุณาทดลองใหม่อีกครั้งค่ะ');", true); return;
            //}
        }
    }
}