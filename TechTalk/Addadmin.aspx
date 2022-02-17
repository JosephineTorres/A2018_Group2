<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Addadmin.aspx.cs" Inherits="Addadmin" %>

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
    <title>Add Admin</title>
</head>

<body style= "background-image:url(img/bg.jpg)">
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
              
                        <a class="active" href="admin.aspx" id"addstudent">ADD STUDENT +</a>      
                        <a  href="Addadmin.aspx" id"addstudent">ADD ADMIN +</a>
                        <a  href="Adminupload.aspx" id"addstudent">UPLOAD VIDEO</a>  
                        <a  href="Userlogin.aspx" id"addstudent">LOGOUT</a> 
                 
                  
                </div>
            </div>
        </div>
    </div>
        <div>

        </div>
        
        <div>
        <asp:GridView ID="gvAdmin" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="ID"
                ShowHeaderWhenEmpty="true"

                OnRowCommand="gvPhoneBook_RowCommand" OnRowEditing="gvPhoneBook_RowEditing" OnRowCancelingEdit="gvPhoneBook_RowCancelingEdit"
                OnRowUpdating="gvPhoneBook_RowUpdating" OnRowDeleting="gvPhoneBook_RowDeleting"

             BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" HorizontalAlign="Center" style="margin-left: auto; margin-right: auto;">
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />

            <Columns>
                    <asp:TemplateField HeaderText="Username">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Username") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUsername" Text='<%# Eval("Username") %>' runat="server" />
                            </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtUsernameFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Password">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Password") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPassword" Text='<%# Eval("Password") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPasswordFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="~/Images/addnew.png" runat="server" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px"/>
                        </FooterTemplate>
                    </asp:TemplateField>

                </Columns>
        </asp:GridView>
            <br />
            <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" HorizontalAlign="Center" style="margin-left: auto; text-align: center; margin-right: auto;" />
            <br />
            <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" HorizontalAlign="Center" style="margin-left:  auto; text-align: center; margin-right: auto;"/>

            </div>

        </form>
    </body>
    </html>
