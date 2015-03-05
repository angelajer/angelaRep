<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="CRM.UI.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
    <script src="../Scripts/jquery-1.8.2.js"></script>
    <link href="../Scripts/jquery-easyui-1.4.1/themes/default/easyui.css" rel="stylesheet" />
    <script src="../Scripts/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script src="../Scripts/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
  article, aside, figure, footer, header, hgroup, 
  menu, nav, section { display: block; }
  .west{
    width:200px;
    padding:10px;
  }
  .north{
    height:30px;
    background:#0ca3d2;
  }
</style>
    <script type="text/javascript">
        $(function () {
            //动态菜单数据
            var treeData;
            var role= "<%=getRole()%>";
            
            if (role == "Admin") {
                treeData = [{
                    text: "业务管理",
                    children: [{
                        text: "客户管理",
                        attributes: {
                            url: "<%= Page.ResolveUrl("~/UI/ManageCustomer.aspx")%>"
                        }
                    }, {
                        text: "贷款管理",
                        attributes: {
                            url: "<%=Page.ResolveUrl("~/UI/LoanManagement.aspx")%>"
                        }
                    }
                    ]
                }
                ];
            } else {

                treeData = [{
                    text: "业务管理",
                    children: [{
                        text: "客户管理",
                        attributes: {
                            url: "<%= Page.ResolveUrl("~/UI/ManageCustomer.aspx")%>"
                        }
                    }
                    ]
                }
                ];

            }
           

            //实例化树形菜单
            $("#tree").tree({
                data: treeData,
                //url:"<%= Page.ResolveUrl("~/Handler/TreeHandler.ashx")%>",
                lines: true,
                onClick: function (node) {
                    if (node.attributes) {
                        Open(node.text, node.attributes.url);
                    }
                }
            });
            //在右边center区域打开菜单，新增tab
            function Open(text, url) {
                if ($("#tabs").tabs('exists', text)) {
                    $('#tabs').tabs('select', text);
                } else 
                {
                    var content = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
                    $('#tabs').tabs('add', {
                        title: text,
                        closable: true,
                        content: content

                    });
                }
            }

            //绑定tabs的右键菜单
            $("#tabs").tabs({
                onContextMenu: function (e, title) {
                    e.preventDefault();
                    $('#tabsMenu').menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    }).data("tabTitle", title);
                }
            });

            //实例化menu的onClick事件
            $("#tabsMenu").menu({
                onClick: function (item) {
                    CloseTab(this, item.name);
                }
            });

            //几个关闭事件的实现
            function CloseTab(menu, type) {
                var curTabTitle = $(menu).data("tabTitle");
                var tabs = $("#tabs");

                if (type === "close") {
                    tabs.tabs("close", curTabTitle);
                    return;
                }

                var allTabs = tabs.tabs("tabs");
                var closeTabsTitle = [];

                $.each(allTabs, function () {
                    var opt = $(this).panel("options");
                    if (opt.closable && opt.title != curTabTitle && type === "Other") {
                        closeTabsTitle.push(opt.title);
                    } else if (opt.closable && type === "All") {
                        closeTabsTitle.push(opt.title);
                    }
                });

                for (var i = 0; i < closeTabsTitle.length; i++) {
                    tabs.tabs("close", closeTabsTitle[i]);
                }
            }
        });
    </script>
</head>
<body class="easyui-layout">
    <form id="form1" runat="server">
  <div region="north" class="north" >
      <div style="float:right;">
   <asp:Label ID="lblDate" runat="server" />|<asp:Label ID="txtUser" runat="server"  Text="">|</asp:Label><a href="#">修改密码</a>|<asp:Button Text="退出"  CssClass="easyui-linkbutton"  ID="Logout" runat="server" />
  </div>
      </div>
  <div region="center">
    <div class="easyui-tabs" fit="true" border="false" id="tabs">
      <div title="首页"></div>
    </div>
  </div>
  <div region="west" class="west" title="主菜单">
    <ul id="tree"></ul>
  </div>
  
  <div id="tabsMenu" class="easyui-menu" style="width:120px;">  
    <div name="close">关闭</div>  
    <div name="Other">关闭其他</div>  
    <div name="All">关闭所有</div>
  </div>  
         </form>
</body>
</html>
