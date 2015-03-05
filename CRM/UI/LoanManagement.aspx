<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanManagement.aspx.cs" Inherits="CRM.UI.LoanManagement" %>

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
                url: "<%= Page.ResolveUrl("~/Handler/LoanHandler.ashx")%>",
                  toolbar: '#tb'
              })
        })

        function insertRow() {
            $('#dlg').dialog('open').dialog('setTitle', '添加贷款申请').dialog('move', {
            });
        }

    </script>
    <style type="text/css">
        .auto-style3 {
            width: 146px;
        }
        .auto-style4 {
            width: 239px;
        }
        .auto-style6 {
            width: 98px;
        }
        .auto-style7 {
            width: 221px;
        }
        .auto-style8 {
            width: 217px;
        }
        .auto-style11
        {
            width: 51px;
        }
        .auto-style15
        {
            width: 37px;
        }
        .auto-style16
        {
            width: 68px;
        }
        .auto-style17
        {
            width: 69px;
        }
        .auto-style18
        {
            width: 70px;
        }
        #frmAjax
        {
            height: 319px;
            width: 833px;
        }
        .auto-style19
        {
            width: 175px;
        }
        .easyui-textbox
        {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
     <table id="tt">
       <tr>
           <td class="auto-style8">所属公司</td><td class="auto-style6"><asp:TextBox ID="txtCompanyName" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
           <td class="auto-style7">申请编号</td><td><asp:TextBox ID="txtNum" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
           <td class="auto-style3">借款人</td><td><asp:TextBox ID="txtLoanUserName" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
           <td class="auto-style4">资料审核人</td><td><asp:TextBox ID="txtAuditMaterialUserName" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
       </tr>
       <tr>
           <td class="auto-style8">申请状态</td><td class="auto-style6"><select id="txtStatus" class="easyui-combobox" name="dept" style="width:200px;">
    <option value="1">已通过</option>
    <option value="2">未通过</option>
    <option value="3">已审核</option>
</select></td>
           <td class="auto-style7">申请人</td><td><asp:TextBox ID="txtApplicant" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
           <td class="auto-style3">贷款审核人</td><td><asp:TextBox ID="txtAuditLoanUserName" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
       </tr>
       <tr>
           <td class="auto-style8">起始时间</td><td class="auto-style6"><asp:TextBox ID="txtBeginTime" runat="server" CssClass="easyui-datebox"></asp:TextBox></td>
           <td class="auto-style7">结束时间</td><td><asp:TextBox ID="txtEndeTime" runat="server" CssClass="easyui-datebox"></asp:TextBox></td>
           <td class="auto-style3">产品名称</td><td><select id="txtProduct" class="easyui-combobox" name="dept" style="width:200px;">
    <option value="1">产品1</option>
    <option value="2">产品2</option>
    <option value="3">产品3</option>
</select></td>
       </tr>
   </table>
        </div>
        <div>
             <a href="#" class="easyui-linkbutton" iconCls="icon-search"  onclick="javascript:Query()">查询</a> 
                  
                 <a href="#" class="easyui-linkbutton" onclick="javascript:Reset()">重置</a>
        </div>
        <div>
          <table id="grid">
        <thead>
            <tr>
                <th field="Id" class="auto-style15">
                    行号
                </th>
                <th field="CompanyName" align="left" class="auto-style16">
                    业务公司
                </th>
                <th field="AuditNum" align="left" class="auto-style16">
                    申请编号
                </th>
                <th field="ApplicantDate" align="left" class="auto-style17">
                    申请日期
                </th>
                 <th field="Lender" align="left" class="auto-style11">
                    借款人
                </th>
                <th field="ProductName" align="left" class="auto-style16">
                    产品名称
                </th>
                <th field="LoanNum" align="left" class="auto-style16">
                    借款金额
                </th>
                <th field="LoanDate" align="left" class="auto-style17">
                    借款日期
                </th>
                <th field="LoanNum" align="left" class="auto-style16">
                    申请状态
                </th>
                <th field="LoanType" align="left" class="auto-style18">
                    申请类型
                </th>
                <th field="ApplicantName" align="left" class="auto-style11">
                    申请人
                </th>
                <th field="LoanAuditUserName" align="left" class="auto-style16">
                    贷款审核
                </th>
                <th field="MaterialAuditUserName" align="left" class="auto-style16">
                    资料审核
                </th>
                <th field="CustomerType" width="50" align="left">
                    客户类别
                </th>
            </tr>
        </thead>
    </table>
	<div id="tb">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:insertRow()">查看贷款申请</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:insertRow()">添加贷款申请</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:insertRow()">贷款流程用时</a>
	</div>
    </div>
    
<div id="dlg" class="easyui-dialog" style="width: 900px; height: 550px; padding: 10px 20px"
        closed="true" buttons="#dlg-buttons">
        <div id="frmAjax">
           <%-- <input name="Test" id="test" type="hidden" />
            <div class="fitem">
                <label>
                    申请日期:</label>
                <input name="CustomerName" id="CustomerName" type="text" class="easyui-datebox" />
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
                <label>申请时间:</label>
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
            </div>--%>

          <table id="Table1">
            <tr>
                <td class="auto-style8">申请时间</td><td class="auto-style19"><asp:TextBox ID="TextBox7" runat="server" CssClass="easyui-datebox"></asp:TextBox></td>
                <td class="auto-style7">申请人</td><td><asp:TextBox ID="TextBox5" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
                <td class="auto-style7">申请编号</td><td><asp:TextBox ID="TextBox2" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
            </tr>
           <tr>
                <td class="auto-style3">客户名称</td><td class="auto-style19"><asp:TextBox ID="TextBox3" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
               <td class="auto-style8">进行标准</td><td class="auto-style6"><select id="Select3" class="easyui-combobox" name="dept" style="width:200px;">
                <option value="1">标准1</option>
                <option value="2">标准2</option>
                <option value="3">标准3</option>
               </select></td>
           </tr>
           <tr>
                <td class="auto-style3">借款详细用途</td><td class="auto-style19"><asp:TextBox ID="TextBox9" runat="server" CssClass="easyui-textbox" Width="181px"></asp:TextBox></td>
           </tr>
           <tr>
               <td class="auto-style3">贷款产品</td><td class="auto-style19"><select id="Select2" class="easyui-combobox" name="dept" style="width:200px;">
                <option value="1">产品1</option>
                <option value="2">产品2</option>
                <option value="3">产品3</option>
               </select></td>
                <td class="auto-style3">借款金额</td><td><asp:TextBox ID="TextBox10" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
                <td class="auto-style3">借款期限(天)</td><td><asp:TextBox ID="TextBox11" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
           </tr>
           <tr>
               <td class="auto-style3">利率(按结算周期)</td><td class="auto-style19"><asp:TextBox ID="TextBox12" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
               <td class="auto-style3">服务费率(结算周期)</td><td><asp:TextBox ID="TextBox13" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
               <td class="auto-style3">结算周期(天)</td><td><asp:TextBox ID="TextBox14" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
           </tr>
           <tr>
               <td class="auto-style4">业务员</td><td class="auto-style19"><asp:TextBox ID="TextBox4" runat="server" CssClass="easyui-textbox"></asp:TextBox></td>
           </tr>
           <tr>   
               <td class="auto-style3">销售备注</td><td class="auto-style19"><asp:TextBox ID="TextBox6" runat="server" CssClass="easyui-textbox" Width="182px"></asp:TextBox></td>  
           </tr>
   </table>

        </div>
    </div>
       <div id="dlg-buttons">
            <a class="easyui-linkbutton" iconcls="icon-ok" onclick="saveData()">新增</a> <a class="easyui-linkbutton"
                iconcls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
        </div>
    </form>
</body>
</html>
