<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dashboards.aspx.cs" Inherits="dashboards" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styless.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&family=Sen:wght@400;700;800&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <title>TechTalk</title>
</head>

<body>
    <form runat="server">
    <div class="navbar">
        <div class="navbar-container">
            <div class="logo-container">
                <h1 class="logo">TechTalk</h1>
            </div>
            <div class="menu-container">
            </div>
            <div class="profile-container">
                <div class="profile-text-container">
                
                        <a  href="login.aspx" id"addstudent">Chat</a>  
                        <a  href="Userlogin.aspx" id"addstudent">Logout</a> 
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
                style="background: linear-gradient(to bottom, rgba(0,0,0,0), #151515), url('img/header.jpg');">
                <img class="featured-title" src="img/logoo.png" alt="">
                <p class="featured-desc">This Website created by Josephine Torres, Kevin Olano, 
                    John Michael Sejane, Guilliermo Rodriguez. </p>



            
            </div>
            
           
            <div class="movie-list-container">
                <h1 class="movie-list-title">COURSES</h1>
                <div class="movie-list-wrapper">
                    <div class="movie-list">
                        
                        <div class="movie-list-item">
                            <img class="movie-list-item-img" src="img/discrete.jpg" alt="">
                            <span class="movie-list-item-title">Discrete</span>
                            <p class="movie-list-item-desc"> Discrete Mathematics provides an essential foundation for virtually 
                                every area of computer science, and its applications are correspondingly vast.</p>
                             
                            <asp:Button Text="Watch" value="Login" id="btnlogin" runat="server" OnClick="btndiscrete_Click" Cssclass="movie-list-item-button"/>
                            
                        </div>
                        <div class="movie-list-item">
                            <img class="movie-list-item-img" src="img/java.jpg" alt="">
                            <span class="movie-list-item-title">Java</span>
                            <p class="movie-list-item-desc">Java is a widely used object-oriented programming language 
                                and software platform that runs on billions of devices</p>
                            <asp:Button Text="Watch" value="Login" id="Button2" runat="server" OnClick="btnJava_Click" Cssclass="movie-list-item-button"/>
                        </div>
                        <div class="movie-list-item">
                            <img class="movie-list-item-img" src="img/c.jpg" alt="">
                            <span class="movie-list-item-title">C#</span>
                            <p class="movie-list-item-desc">C# is an object-oriented programming language from Microsoft that aims to combine the 
                                computing power of C++.</p>
                            <asp:Button Text="Watch" value="Login" id="Button1" runat="server" OnClick="btnCsharp_Click" Cssclass="movie-list-item-button"/>
                        </div>
                        <div class="movie-list-item">
                            <img class="movie-list-item-img" src="img/Webdev.jpg" alt="">
                            <span class="movie-list-item-title">WebDevelopmet</span>
                            <p class="movie-list-item-desc">This course is intended to teach students the fundamentals of 
                                web development in a project-based learning environment.</p>
                           <asp:Button Text="Watch" value="Login" id="Button3" runat="server" OnClick="btnWeb_Click" Cssclass="movie-list-item-button"/>
                        </div>
                        <div class="movie-list-item">
                            <img class="movie-list-item-img" src="img/AI.jpg" alt="">
                            <span class="movie-list-item-title">AI</span>
                            <p class="movie-list-item-desc">Artificial intelligence (AI) is the ability of a computer or a robot 
                                controlled by a computer to do tasks that are usually done by humans</p>
                            <asp:Button Text="Watch" value="Login" id="Button4" runat="server" OnClick="btnAI_Click" Cssclass="movie-list-item-button"/>
                        </div>
                        <div class="movie-list-item">
                            <img class="movie-list-item-img" src="img/python.jpeg" alt="">
                            <span class="movie-list-item-title">Python</span>
                            <p class="movie-list-item-desc">Python is a high-level programming language designed 
                                to be easy to read and simple to implement.</p>
                            <asp:Button Text="Watch" value="Login" id="Button5" runat="server" OnClick="btnPython_Click" Cssclass="movie-list-item-button"/>
                        </div>
                        <div class="movie-list-item">
                            <img class="movie-list-item-img" src="img/cc.png" alt="">
                            <span class="movie-list-item-title">C++</span>
                            <p class="movie-list-item-desc">C++ is a statically typed, compiled, general-purpose, case-sensitive, free-form 
                                programming language that supports procedural, object-oriented, and generic programming.</p>
                            <asp:Button Text="Watch" value="Login" id="Button6" runat="server" OnClick="btnCplus_Click" Cssclass="movie-list-item-button"/>
                        </div>
                            
                    </div>
                    <i class="fas fa-chevron-right arrow"></i>
                </div>

            </div>
  </form>

    

   
    <script src="app.js"></script>
</body>

</html>
