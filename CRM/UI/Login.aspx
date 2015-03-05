<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CRM.Login2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/login.css" rel="stylesheet" />
    
</head>
<body>
  <section class="container">
    <div class="login">
      <h1>人和信贷系统</h1>
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
    </div>

  </section>

 <%-- <section class="about">
    <p class="about-links">
      <a href="http://www.cssflow.com/snippets/login-form" target="_parent">View Article</a>
      <a href="http://www.cssflow.com/snippets/login-form.zip" target="_parent">Download</a>
    </p>
    <p class="about-author">
      &copy; 2012&ndash;2013 <a href="http://thibaut.me" target="_blank">Thibaut Courouble</a> -
      <a href="http://www.cssflow.com/mit-license" target="_blank">MIT License</a><br>
      Original PSD by <a href="http://www.premiumpixels.com/freebies/clean-simple-login-form-psd/" target="_blank">Orman Clark</a>
  </section>--%>
</body>
</html>
