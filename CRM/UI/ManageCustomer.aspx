<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageCustomer.aspx.cs" Inherits="CRM.UI.ManageCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
   <script src="../Scripts/jquery-1.8.2.js"></script>
    <link href="../Scripts/jquery-easyui-1.4.1/themes/default/easyui.css" rel="stylesheet" />
    <script src="../Scripts/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <link href="../Scripts/jquery-easyui-1.4.1/themes/icon.css" rel="stylesheet" />
<script src="../Scripts/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#grid").datagrid({
                url:"<%= Page.ResolveUrl("~/Handler/CustomerHandler.ashx")%>?Mode="+"Query",
                toolbar: '#tb'
            })
        })

        function insertRow() {     
            $('#dlg').dialog('open').dialog('setTitle', '新增客户').dialog('move', { 
            });
        }

        function saveData() {
            var customerName = $("#CustomerName").val();
            var IdentityNum=$("#IdentityNum").val();
            var PhoneNum=$("#PhoneNum").val();
            var RegisterDate=$("#RegisterDate").val();
            var UserName=$("#UserName").val();
            var Company=$("#Company").val();
            var test="Add"
            $('#form1').form('submit',{
                url: "<%= Page.ResolveUrl("~/Handler/CustomerHandler.ashx")%>?Mode=" + test + "&customerName=" + customerName + "&IdentityNum="
                + IdentityNum + "&PhoneNum=" + PhoneNum + "&RegisterDate=" + RegisterDate + "&UserName=" + UserName + "&Company=" + Company,
                success:function(result){
                    $('div[id="frmAjax"] input[type=text]').each(function () {
                        $(this).val('');
                    });
                    $('#dlg').dialog('close');
                    $('#form1').form('clear');
                    $('#grid').datagrid('reload');
                }
            });
            }
       
        function getQueryParams(queryParams) {
            var customerName = $("#txtCustomerName").val();
            var phoneNum = $("#txtCustomerPhoneNumber").val();
            var companyName = $("#txtCompanyName").val();
            var IdentityNum = $("#txtIdentityNum").val();
            var beginTime = $("#txtBeginTime").val();
            var endTime = $("#txtEndeTime").val();

            queryParams.customerName = customerName;
            queryParams.phoneNum = phoneNum;
            queryParams.companyName = companyName;
            queryParams.IdentityNum = IdentityNum;
            queryParams.beginTime = beginTime;
            queryParams.endTime = endTime;
            return queryParams;
        }
        function Query() {
            var queryParams = $("#grid").datagrid('options').queryParams;
            getQueryParams(queryParams);
            $("#grid").datagrid('options').queryParams = queryParams;
            $("#grid").datagrid('reload');
        }

        function Reset() {
            $('table[id="tt"] input[type=text]').each(function () {
                $(this).val('');
            });
            $("#grid").datagrid('reload');
        }
    </script>
</head>
<body>
       <form id="form1" runat="server">
   <table id="tt">
       <tr>
           <td>客户姓名</td><td><asp:TextBox ID="txtCustomerName" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
           <td>&nbsp;&nbsp;&nbsp;&nbsp;手机</td><td><asp:TextBox ID="txtCustomerPhoneNumber" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
           <td>&nbsp;&nbsp;&nbsp;&nbsp; 业务员</td><td><asp:TextBox ID="txtUserName" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
       </tr>
       <tr>
           <td>所属公司</td><td><asp:TextBox ID="txtCompanyName" runat="server" CssClass="easyui-textbox">无锡市信贷一部</asp:TextBox></td>
           <td>&nbsp;&nbsp;&nbsp; 身份证号</td><td><asp:TextBox ID="txtIdentityNum" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
       </tr>
       <tr>
           <td>起始时间</td><td><asp:TextBox ID="txtBeginTime" runat="server" CssClass="easyui-datebox"></asp:TextBox></td>
           <td>&nbsp;&nbsp;&nbsp;&nbsp; 结束时间</td><td><asp:TextBox ID="txtEndeTime" runat="server" CssClass="easyui-datebox"></asp:TextBox></td>
       </tr>
       <tr>
            <td>  
                 <a href="#" class="easyui-linkbutton" iconCls="icon-search"  onclick="javascript:Query()">查询</a> 
                  
                 <a href="#" class="easyui-linkbutton" onclick="javascript:Reset()">重置</a>
            </td>
       </tr>
   </table>
   <div>

          <table id="grid">
        <thead>
            <tr>
                <th field="Id" width="80">
                    行号
                </th>
                <th field="CustomerName" width="100" align="left">
                    客户姓名
                </th>
                <th field="IdentityNum" width="100" align="left">
                    身份证号
                </th>
                <th field="PhoneNum" width="100" align="left">
                    手机号
                </th>
                 <th field="RegisterDate" width="100" align="left">
                    登记时间
                </th>
                <th field="UserName" width="100" align="left">
                    业务员
                </th>
                <th field="Company" width="100" align="left">
                    业务公司
                </th>
            </tr>
        </thead>
    </table>
	<div id="tb">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:insertRow()">新增客户</a>
	</div>
   </div>
   <div id="dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px"
        closed="true" buttons="#dlg-buttons">
        <div id="frmAjax">
            <input name="Test" id="test" type="hidden" />
            <div class="fitem">
                <label>
                    客户姓名:</label>
                <input name="CustomerName" id="CustomerName" type="text" class="easyui-textbox" />
            </div>
            <div class="fitem">
                <label>
                    身份证号码:</label>
                <input name="IdentityNum" id="IdentityNum" type="text" class="easyui-textbox" />
            </div>
            <div class="fitem">
                <label>
                    手机号:</label>
                <input name="PhoneNum" id="PhoneNum" type="text" class="easyui-textbox" />
            </div>
            <div class="fitem">
                <label>
                    登记时间:</label>
                <input name="RegisterDate" id="RegisterDate" type="text" class="easyui-textbox" />
            </div>
            <div class="fitem">
                <label>
                    业务员:</label>
                <input name="UserName" type="text" id="UserName" class="easyui-textbox" />
            </div>
               <div class="fitem">
                <label>
                    业务公司:</label>
                <input name="Company" type="text" id="Company" class="easyui-textbox" />
            </div>

        </div>
    </div>
       <div id="dlg-buttons">
            <a class="easyui-linkbutton" iconcls="icon-ok" onclick="saveData()">新增</a> <a class="easyui-linkbutton"
                iconcls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
        </div>
    </form>
</body>
</html>
