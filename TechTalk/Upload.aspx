<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Upload.aspx.cs" Inherits="Upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload Video</title>
  <link rel="stylesheet" href="addstudentcss.css"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>
<body style= "background:black">
  <div class="wrapper">
    <header><img src="img/logoo.png" width="250" height="30"></header>
    <form runat="server">
      <div class="field email">
        <div class="input-area">
          <asp:TextBox placeholder="Title" id="txttitle" runat="server"/>
          <i class="icon fas fa-envelope"></i>
          <i class="error error-icon fas fa-exclamation-circle"></i>
        </div>
        <div class="error error-txt">Title can't be blank</div>
      </div>
      <div class="field password">
        <div class="input-area">
          Select Categories: <asp:DropDownList Id="select" runat="server">
                               <asp:ListItem value="0">-- Select --</asp:ListItem>
                                <asp:ListItem>Discrete Math</asp:ListItem>
                                <asp:ListItem>AI</asp:ListItem>
                                <asp:ListItem>Java</asp:ListItem>
                                <asp:ListItem>Python</asp:ListItem>
                                <asp:ListItem>C++</asp:ListItem>
                                <asp:ListItem>Web Development</asp:ListItem>
                                <asp:ListItem>C#</asp:ListItem>
                                </asp:DropDownList>
        </div>
        <div class="error error-txt">Categories can't be blank</div>
      </div>
        <div class="upload" >
            <asp:FileUpload ID="FileUpload1" runat="server" style="left: 15px;"/>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

        </div>
      <asp:Button Text="Register" value="Login" id="btnlogin" runat="server" OnClick="btnregister_Click" Width="142px"/>
      <asp:Button Text="Cancel" value="Login" id="Button1" runat="server" OnClick="btncancel_Click" Width="131px"/>
    </form>
  </div>
</body>
</html>

