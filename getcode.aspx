<%@ Page Language="C#" AutoEventWireup="true" CodeFile="getcode.aspx.cs" Inherits="getcode" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Final Bullet : Redbull Code</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>

    <form id="form1" runat="server">

    <input id="i_code" type="text" placeholder="Redbull Code" required="required"/><asp:Label 
        ID="Label1" runat="server" Text="Label"></asp:Label>
&nbsp;<div id="btn_shipping" class="one_half last"><a class="btn btn_red" onClick="getCodedata();">getcode</a></div>

    <div class="form_list">
        <p id="itemcode">ITEM CODE</p>
        <p id="itemDes"></p>
    </div>
              <div class="table-responsive">
              <asp:GridView ID="dataTable" EmptyDataText="Data Not Found!" runat="server" AutoGenerateColumns="False" 
                class="table table-bordered table-condensed table-hover table-striped" 
                  AllowPaging="True" OnPageIndexChanging="dataTable_PageIndexChanged" 
                  PageSize="50" >
                   <PagerStyle CssClass="cssPager" />
                <Columns>
                    <asp:BoundField DataField="userName" HeaderText="username" >
                    <ItemStyle Width="1%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="itemCode" HeaderText="Code" >
                    <ItemStyle Width="5%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="getItemDate" HeaderText="date" >
                    <ItemStyle Width="20%" Wrap="true"/>
                    </asp:BoundField>
                </Columns>
                  <PagerSettings Mode="NumericFirstLast" PageButtonCount="10" />
            </asp:GridView>
            </div>

    </form>
        <script language="JavaScript" type="text/javascript" charset="utf-8">
            $(".form_list").hide();

            function getCodedata() {
                var EventParams = {};
                var icode = document.getElementById('i_code');
                EventParams['icode'] = icode.value;
                $.post("getcodeprocess.aspx", EventParams,
                function (data, status) {

                    var res = data.split("=====split=====");
                    document.getElementById("itemcode").innerHTML = res[0];
                    $(".form_list").show();
                });
            }

    </script>
</body>
</html>
