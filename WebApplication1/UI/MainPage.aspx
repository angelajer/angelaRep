<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="WebApplication1.UI.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="width: 328px">
   <section class="container">
     <div class="login">
        <form id="form1" runat="server">
        <p><asp:TextBox ID="txtUserName" runat="server" placeholder="用户名"></asp:TextBox></p>
        <p><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="密码"></asp:TextBox></p>
        <p class="remember_me">
          <label>
            <input type="checkbox" name="remember_me" id="remember_me" />
            Remember me on this computer
          </label>
        </p>
        <p class="submit"><asp:Button ID="btn" runat="server" Text="登录"  OnClick="login_Click"/></p>
        </form>
      </div>

  </section>
    
   
  <%--   <h1>人和信贷系统</h1>
      <form id="form1" runat="server">
        <p><asp:TextBox ID="txtUserName" runat="server"  placeholder="用户名"></asp:TextBox></p>
        <p><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="密码"></asp:TextBox></p>
        <p class="remember_me">
          <label>
            <input type="checkbox" name="remember_me" id="remember_me" />
            Remember me on this computer
          </label>
        </p>
        <p class="submit"><asp:Button ID="btn" runat="server" Text="登录"  OnClick="login_Click"/></p>
      </form>

--%>
</body>
</html>
