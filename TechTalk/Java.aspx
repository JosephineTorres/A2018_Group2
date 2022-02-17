<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Java.aspx.cs" Inherits="Java" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="discretecss.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&family=Sen:wght@400;700;800&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <title>Java</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
      
        }
        .auto-style2 {
            height: 48px;
            text-align: center;
        }
        .auto-style3 {
            text-align: center;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
    <div class="navbar">
        <div class="navbar-container">
            <div class="logo-container">
                <h1 class="logo">TechTalk</h1>
            </div>
            <div class="menu-container">
            </div>
            <div class="profile-container">
                <div class="profile-text-container">
                    
                             
                        <a  href="login.aspx" id"addstudent" style="color: #ff6a00;">Chat</a>  
                        <a  href="Userlogin.aspx" id"addstudent" style="color: #ff6a00;">Logout</a> 
                        <asp:Label Text="Student" ID="Label1" runat="server" style="color: #ff6a00;"/>
                   
                  
                </div>
                <div class="toggle">
                    <i class="fas fa-moon toggle-icon"></i>
                    <i class="fas fa-sun toggle-icon"></i>
                    <div class="toggle-ball"></div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="content-container">
            <div class="featured-content"
                style="background: linear-gradient(to bottom, rgba(0,0,0,0), #151515), url('img/bggg.jpg');">
                
            
            </div>
            <div class="movie-list-container">
                <h1 class="movie-list-title">ALL VIDEOS</h1>
                <div class="movie-list-wrapper">
                   
                <p class="movie-list-title">
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Height="600px" RepeatColumns="3" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" Width="1005px">
                        <ItemTemplate>
                            <table class="auto-style1">
                                <tr>
                                    <td class="auto-style2">
                                        <asp:Label ID="Label1" runat="server" style="color: #ff6a00;" Text='<%# Eval("Title") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("videolink") %>'></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </p>
                <p class="movie-list-title">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT * FROM [video] where Category='Java'"></asp:SqlDataSource>
                </p>
                </div>
                </div>
      </div>
    </div>
    </form>
     <script src="app.js"></script>
</body>

</html>