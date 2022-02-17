<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Userlogin.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
  <link rel="stylesheet" href="style.css"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>
<body style= "background-image:url(img/bg.jpg)">
  <div class="wrapper">
    <header><img src="img/logoo.png" width="250" height="30"></header>
    <form runat="server">
      <div class="field email">
        <div class="input-area">
          <asp:TextBox placeholder="User ID" id="txtuser" runat="server"/>
          <i class="icon fas fa-envelope"></i>
          <i class="error error-icon fas fa-exclamation-circle"></i>
        </div>
        <div class="error error-txt">User ID can't be blank</div>
      </div>
      <div class="field password">
        <div class="input-area">
          <asp:TextBox type="password" placeholder="Password" id="txtpass" runat="server"/>
          <i class="icon fas fa-lock"></i>
          <i class="error error-icon fas fa-exclamation-circle"></i>
        </div>
        <div class="error error-txt">Password can't be blank</div>
      </div>
      <asp:Button Text="Login" value="Login" id="btnlogin" runat="server" OnClick="btnlogin_Click"/>
    </form>
    <div class="sign-txt">Are you an admin? <a href="Loginadmin.aspx">Admin</a></div>
  </div>
</body>
</html>
