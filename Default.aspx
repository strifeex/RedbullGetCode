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

</head>
<body>

<form id="form1" runat="server">
    <div id="wrapper">
        <div id="nav-login">

            <div class="user"><asp:TextBox ID="txtUser" required="required" runat="server" placeholder="Username" 
                class="form-control" MaxLength="20" CssClass="btn-input"></asp:TextBox></div>
            <div class="pass"><asp:TextBox ID="txtPwd" required="required" runat="server" TextMode="Password" 
                placeholder="Password" class="form-control" MaxLength="20" CssClass="btn-input"></asp:TextBox></div>
        
            <div class="captcha"><cc1:CaptchaControl ID="ccCode" runat="server" 
                            CaptchaLength="6" CaptchaMaxTimeout="200" CaptchaMinTimeout="5" Height="45px" 
                            Width="322px" CaptchaWidth="305" CaptchaHeight="45" CssClass="capcha_txt" 
                            Font-Names="Tahoma" Font-Size="XX-Large" FontColor="Red" 
                    CaptchaBackgroundNoise="None" CaptchaFontWarping="None" 
                    CaptchaLineNoise="Extreme" /></div>
            <div class="captcha-input"><asp:TextBox ID="txtCaptcha" required="required" runat="server" 
                placeholder="Enter code" class="form-control" MaxLength="6" 
                CssClass="btn-input"></asp:TextBox></div>

            <div class="login">
                <asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click" 
                CssClass="btn-Login" Text="login" /></div>
        </div>
    </div>      
    </form>
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
      m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-52510534-1', 'auto');
        ga('send', 'pageview');

    </script>

    
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
</body>
</html>
