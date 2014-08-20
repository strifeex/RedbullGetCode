<%@ Page Language="C#" AutoEventWireup="true" CodeFile="getcode.aspx.cs" Inherits="getcode" %>
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

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

    <link type="text/css" rel="stylesheet" href="css/style.css" />

    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</head>
<body>
<div class="maincontent">
    <form id="form1" runat="server">
    <div class="leftpanel">
        <asp:Label ID="usernameLabel" runat="server" Text="Label"></asp:Label><br>
    <%--    <input id="i_code" type="text" placeholder="Redbull Code" required="required"/>--%>
        <asp:TextBox ID="i_code" runat="server" placeholder="Redbull Code" required="required"></asp:TextBox>

                        <div class="captcha"><cc1:CaptchaControl ID="ccCode" runat="server" 
                                CaptchaLength="6" CaptchaMaxTimeout="200" CaptchaMinTimeout="5" Height="45px" 
                                Width="322px" CaptchaWidth="305" CaptchaHeight="45" CssClass="capcha_txt" 
                                Font-Names="Tahoma" Font-Size="XX-Large" FontColor="Red" 
                        CaptchaBackgroundNoise="None" CaptchaFontWarping="None" 
                        CaptchaLineNoise="Extreme" />
                        
        </div>
                <div class="captcha-input"><asp:TextBox ID="txtCaptcha" required="required" runat="server" 
                    placeholder="Enter code" class="form-control" MaxLength="6" 
                    CssClass="btn-input"></asp:TextBox>

        </div>

    <%--<a class="btn btn_red" onClick="getCodedata();">getcode</a>--%>
    <div class="coundownpanel"><span id="countdown"></span></div>
    <div class="loadingPanel"></div>

                    <asp:Button ID="btngetcode" runat="server" onclick="btngetcode_Click" 
                    CssClass="btn-Login" Text="getcode" />

        <div class="form_list">
        <asp:Label ID="Lblitem" runat="server" Text="Label"></asp:Label>
            <p id="itemcode">ITEM CODE</p>
            <p id="itemDes"></p>
        </div>
        <asp:Image ID="Image1" runat="server" />
    </div>               
      <div class="rightpanel">
        <br>history

              <div class="table-responsive tablecontent">
              <asp:GridView ID="dataTable" EmptyDataText="Data Not Found!" runat="server" AutoGenerateColumns="False" 
                class="table-bordered table-condensed table-hover table-striped tablecontent" 
                  AllowPaging="True" OnPageIndexChanging="dataTable_PageIndexChanged" 
                  PageSize="5" >
                   <PagerStyle CssClass="cssPager" />
                <Columns>
                    <asp:BoundField DataField="getItemDate" HeaderText="วันที่รับ" >
                    <ItemStyle Width="12%" Wrap="true"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="itemCode" HeaderText="Code" >
                    <ItemStyle Width="5%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="itemDesc" HeaderText="ของรางวัล" htmlencode="false">
                    <ItemStyle Width="23%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="expireDate" HeaderText="วันหมดอายุ" >
                    <ItemStyle Width="12%" Wrap="true"/>
                    </asp:BoundField>
                </Columns>
                  <PagerSettings Mode="NumericFirstLast" PageButtonCount="10" />
            </asp:GridView>
            </div>
        <a class="btn btn_red" onClick="logout();">logout</a>
    </div>

    </form>
    </div>

        <script language="JavaScript" type="text/javascript" charset="utf-8">

            $("#btngetcode").hide();

            $('.loadingPanel').html('<div class="spinner">' +
            '<div class="circle1 circle"></div>' +
            '<div class="circle2 circle"></div>' +
            '<div class="circle3 circle"></div>' +
            '<div class="circle4 circle"></div>' +
            '<div class="circle5 circle"></div>' +
            '<div class="circle6 circle"></div>' +
            '<div class="circle7 circle"></div>' +
            '<div class="circle8 circle"></div>' +
            '<div class="circle9 circle"></div>' +
            '<div class="circle10 circle"></div>' +
            '<div class="circle11 circle"></div>' +
            '<div class="circle12 circle"></div>' +
          '</div>');

            var milisec = 0
            var seconds = 10

            function display() {

                var countdown = document.getElementById("countdown");

                setInterval(function () {

                    if (seconds <= 0) {

                        $("#btngetcode").show();
                        $("#countdown").hide();
                        $('.loadingPanel').hide();
                        countdown.innerHTML = seconds + "";
                        return;
                    }
                    else {
                        seconds -= 1;
                    }

                    countdown.innerHTML = seconds + "";

                }, 1000);

            }

            function getCodedata() {
                var EventParams = {};
                var icode = document.getElementById('i_code');
                EventParams['icode'] = icode.value;
                $.post("getcodeprocess.aspx", EventParams,
                    function (data, status) {

                        //document.getElementById("usernameLabel").innerHTML = data.totalsec;
                        seconds = data.waitsec;
                        display();
                        //$(".form_list").show();
                        //window.location = "getcode.aspx";
                    }, "json");
            }
            getCodedata();

            function logout() {
                var tmpParams = {};

                $.post("logoutprocess.aspx", tmpParams,
                function (data, status) {

                    window.location = "default.aspx";
                });
            }


    </script> 


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
