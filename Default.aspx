<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Final Bullet : Redbull Code</title>
    <link rel="shortcut icon" href="http://www.fnb.in.th/images/icon/favicon.ico">
    <meta name="stats-in-th" content="7828" />
	<meta name="keywords" content="เกมส์, เกม, เกมส์ออนไลน์, เกมส์ออนไลน์ใหม่, เล่นเกมส์ออนไลน์, game, games online, FNB, Finalbullet">
    <meta name="description" content="เกมออนไลน์ เกมส์ออนไลน์ เกมส์มันๆ สนุกๆ เล่นเกมส์ เกม finalbullet เกมส์ game games online fnb">	
	<meta http-equiv="robots" content="index,follow">
    <link type="text/css" rel="stylesheet" href="css/reset.css" />
    <link type="text/css" rel="stylesheet" href="css/fonts.css"   charset="utf-8" />
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <!--[if lt IE 9]>
    <script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
    <![endif]-->
</head>
<body>
<div class="loginMain">
<form id="form1" runat="server">

<div class="leftside">
    <div class="leftside__headEvent">
        <div class="logobox">
            <div class="logobox__L">
                <div class="L__redbulllogo"></div>
            </div>
            <div class="logobox__R">
                <div class="R__FNBlogo"></div>
            </div>
        </div>
    </div>
    <a class="leftside__btn--infoevent" href="https://clickalot.co.th/index.php/users/register"></a>
</div>
<div class="rightside">
    <div class="rightside__txthead">กรุณาล็อกอินเข้าสู่ระบบรับไอเทมโค้ด</div>
    <div class="rightside__username">
        <div class="labeltxt">กรุณากรอกไอดี</div>
        <asp:TextBox ID="txtUser" required="required" runat="server" placeholder="" 
                    class="form-control" MaxLength="20" CssClass="IDinput txtinput"></asp:TextBox>
    </div>
    <div class="rightside__password">
        <div class="labeltxt">กรุณากรอกรหัสผ่าน</div>
                <div class="pass"><asp:TextBox ID="txtPwd" required="required" runat="server" TextMode="Password" 
                    placeholder="" class="form-control" MaxLength="20" CssClass="btn-input txtinput"></asp:TextBox></div>
    </div>
    <div class="rightside__captcha">
        <div class="captcha">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                            <cc1:CaptchaControl ID="ccCode" runat="server" CaptchaLength="6" CaptchaMaxTimeout="200" 
                                CaptchaMinTimeout="5" Height="55px" Width="250px" CaptchaWidth="250" 
                                CaptchaHeight="55" CssClass="capcha_txt" 
                                Font-Names="Tahoma" Font-Size="XX-Large" FontColor="Red" 
                                CaptchaFontWarping="None" />&nbsp;<asp:LinkButton ID="lnkrefresh" runat="server" OnClick="_Click" class="btnRefresh" CausesValidation="false"></asp:LinkButton>  
            </ContentTemplate>
        </asp:UpdatePanel>     
        </div>
        <div class="labeltxt">กรุณาระบุอักษรตามภาพ</div>
            <div class="captcha-input"><asp:TextBox ID="txtCaptcha" required="required" runat="server" 
            placeholder="" class="form-control" MaxLength="6" 
            CssClass="btn-input txtinput"></asp:TextBox></div>
    </div>
    <div class="rightside__buttonbox">
        <asp:Button ID="btnLogin" runat="server" style="cursor:pointer;" onclick="btnLogin_Click" 
        CssClass="buttonbox__btn--login" Text="" />
                
        <a class="buttonbox__btn--forgetID" href="https://clickalot.co.th/users/forget_username"></a>

        <a class="buttonbox__btn--forgetPass" href="https://clickalot.co.th/users/reset_pass"></a>

        <a class="buttonbox__btn--problem" href="https://clickalot.co.th/users/ticket/create"></a>
    </div>
</div>

</form>
</div>

    <script>        
    document.addEventListener("DOMContentLoaded", function () {
            var elements = document.getElementsByTagName("INPUT");
            for (var i = 0; i < elements.length; i++) {
                elements[i].oninvalid = function (e) {
                    e.target.setCustomValidity("");
                    if (!e.target.validity.valid) {
                        e.target.setCustomValidity("กรุณากรอกช่องนี้");
                    }
                };
                elements[i].oninput = function (e) {
                    e.target.setCustomValidity("");
                };
            }
        })
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
      m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-52510534-1', 'auto');
        ga('send', 'pageview');

    </script>

    <div class="statpanel">
    <script type="text/javascript" language="javascript1.1" src="http://tracker.stats.in.th/tracker.php?sid=59428"></script>
    <noscript><a target="_blank" href="http://www.stats.in.th/">www.Stats.in.th</a></noscript>

    <!-- Histats.com  START  (standard)-->
    <script type="text/javascript">        document.write(unescape("%3Cscript src=%27http://s10.histats.com/js15.js%27 type=%27text/javascript%27%3E%3C/script%3E"));</script>
    <a href="http://www.histats.com" target="_blank" title="site stats" ><script  type="text/javascript" >
                                                                             try {
                                                                                 Histats.start(1, 2735357, 4, 500, 95, 18, "00010000");
                                                                                 Histats.track_hits();
                                                                             } catch (err) { };
    </script></a>
    <noscript><a href="http://www.histats.com" target="_blank"><img  src="http://sstatic1.histats.com/0.gif?2735357&101" alt="site stats" border="0"></a></noscript>
    <!-- Histats.com  END  -->
    </div>
</body>
</html>
