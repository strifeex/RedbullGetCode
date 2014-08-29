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

    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <link type="text/css" rel="stylesheet" href="css/fonts.css" charset="utf-8" />
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <!--[if lt IE 9]>
    <script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
    <![endif]-->

</head>
<body>
<div class="maincontent">
    <form id="form1" runat="server">

    <div class="leftpanel">
    <div class="leftpanel__headEvent">
        <div class="headEvent__logo">
            <div class="logo__redbull"></div>
            <div class="logo__FNB"></div>
        </div>
        <div class="headEvent__txt">ดื่ม Red Bull เพิ่มพลัง ยิงมันส์ พร้อมลุ้นโชค Final Bullet</div>
    </div>
    <div class="leftpanel__GetitemDescr">กรุณาระบุโค้ด 8 หลัก ใต้กระป๋อง Red Bull</div>

    <div class="leftpanel__getitembox">   
        <asp:TextBox ID="i_code" runat="server" placeholder="" required="required" class="getitembox__igetcode" maxlength="8"></asp:TextBox>
        <div class="getitembox__coundownpanel">
            <%--<div class="loadingPanel"></div>--%>
            <asp:Button ID="btngetcode" runat="server" style="cursor:pointer;" onclick="btngetcode_Click" 
            CssClass="getitembox__btn--getcode" Text="" />
            <span id="countdown"></span>
        </div>
    </div>

    <div class="leftpanel__captchabox">
        <div class="captcha-input"><asp:TextBox ID="txtCaptcha" required="required" runat="server" 
                    placeholder="" class="form-control" MaxLength="6" 
                    CssClass="captchabox__getItemcaptcha"></asp:TextBox>
        </div>

        <div class="captchabox__img">
            <ContentTemplate>
                            <cc1:CaptchaControl ID="ccCode" runat="server" 
                CaptchaLength="6" CaptchaMaxTimeout="200" 
                                CaptchaMinTimeout="5" Height="40px" Width="154px" CaptchaWidth="154" 
                                CaptchaHeight="40" CssClass="captchabox__img__getitem" 
                                Font-Names="Tahoma" Font-Size="XX-Large" FontColor="Red" 
                CaptchaFontWarping="None" />
                            <asp:LinkButton ID="lnkrefresh" runat="server" OnClick="_Click" class="btnRefresh2" CausesValidation="false"></asp:LinkButton>  
            </ContentTemplate>
        </div>
    </div>


        <div class="leftpanel__getItemImage">
            <asp:Image ID="Image1" runat="server" />
        </div>
        <div class="bgShowCode">
            <center><asp:Label ID="Lblitem" runat="server" Text="Label"></asp:Label></center>
        </div>
        <div class="leftpanel__showCodeDescr">ไอเทมโค้ด 16 หลักนี้ ต้องนำไปเติมในเกมก่อนจึงจะได้รับของรางวัล</div>
        <a class="leftpanel__btn--how2use" href="http://www.fnb.in.th/gameinfo.aspx?postId=Yld6TjNQb0hlWmFIeU9QckcyOWUyZz09&cate=guide" target="_blank"></a>

    </div>
                   
    <div class="rightpanel">
    <div class="rightpanel__usernamebox">
      <center><asp:Label ID="usernameLabel" runat="server" Text="Label" class="usernamebox__Lbl"></asp:Label></center>
    </div>
    <ul class="rightpanel__btnBox">
        <a class="btnBox__btn--eventInfo" href="http://www.fnb.in.th/contentpreviews.aspx?postId=SERNN2VHYi9vL0swam1PZVBVZUdUQT09" target="_blank"></a>
        <a class="btnBox__btn--problem" href="http://www.fnb.in.th/gameinfo.aspx?postId=c0V6VWdGekZIeVE3dkZmK0NnTjFnZz09&cate=guide" target="_blank"></a>
        <a class="btnBox__btn--logout" href="#" onClick="logout();"></a>
    </ul>
    <div class="rightpanel__historyTitle">ประวัติการรับโค้ดไอเทม</div>

            <div class="table-responsive tablecontent">
                  <asp:GridView ID="dataTable" EmptyDataText="ไม่มีข้อมูลการรับไอเทม" runat="server" AutoGenerateColumns="False" 
                    class="table table-bordered tablecontent" 
                      AllowPaging="True" OnPageIndexChanging="dataTable_PageIndexChanged" 
                      PageSize="10" >
                       <PagerStyle CssClass="cssPager" />
                    <Columns>
                        <asp:BoundField DataField="getItemDate" HeaderText="วันที่รับ" DataFormatString="{0:dd/MM/yyyy}">
                        <ItemStyle Width="5%" Wrap="true"/>
                        </asp:BoundField>
                        <asp:BoundField DataField="itemCode" HeaderText="Code">
                        <ItemStyle Width="13%" font-size="1.5em"/>
                        </asp:BoundField>
                        <asp:BoundField DataField="itemDesc" HeaderText="ของรางวัล" htmlencode="false">
                        <ItemStyle Width="19%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="expireDate" HeaderText="วันหมดอายุ" DataFormatString="{0:dd/MM/yyyy}">
                        <ItemStyle Width="5%" font-size="1.5em" Wrap="true"/>
                        </asp:BoundField>
                    </Columns>
                      <PagerSettings Mode="NumericFirstLast" PageButtonCount="10" />
                </asp:GridView>
            </div>
    </div>

    </form>
    </div>

        <script language="JavaScript" type="text/javascript" charset="utf-8">

            $("#btngetcode").hide();

//            $('.loadingPanel').html('<div class="spinner">' +
//            '<div class="circle1 circle"></div>' +
//            '<div class="circle2 circle"></div>' +
//            '<div class="circle3 circle"></div>' +
//            '<div class="circle4 circle"></div>' +
//            '<div class="circle5 circle"></div>' +
//            '<div class="circle6 circle"></div>' +
//            '<div class="circle7 circle"></div>' +
//            '<div class="circle8 circle"></div>' +
//            '<div class="circle9 circle"></div>' +
//            '<div class="circle10 circle"></div>' +
//            '<div class="circle11 circle"></div>' +
//            '<div class="circle12 circle"></div>' +
//          '</div>');

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

                    }, "json");

                icode.value = "";
            }
            getCodedata();

            function logout() {
//                var tmpParams = {};

//                $.post("logoutprocess.aspx", tmpParams,
//                function (data, status) {

//                    window.location = "default.aspx";
                //                });
                window.location = "default.aspx";
            }

    </script> 

</body>
</html>
