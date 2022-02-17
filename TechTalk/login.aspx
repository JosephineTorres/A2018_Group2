<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Title="Chat" Inherits="login" MasterPageFile="~/MasterPage.master" %>

<%@ Register src="Banner.ascx" tagname="Banner" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


    <style type="text/css">
        .loadingBody{
            opacity:0;
            position:relative;
        }
        .loadingOut{
            text-align:center;
        }
        .auto-style2 {
            width: 32px;
            height: 32px;
        }
    </style>
    <script>
        function loadingOp() {
            $(document).ready(function () {
                $('.loadingBody').animate({ opacity: 0 }, 0);
                $('.loadingOut').fadeIn(0);
                $('.loadingOut').fadeOut(2400);
                $('.loadingBody').animate({ opacity: 1 }, 2500);
            });
        }

        function loadingIconVisible() {

            if (Page_ClientValidate("AllValidationGroup")) {
                document.getElementById('<%=loadingIcon.ClientID%>').style.opacity = 1;
                document.getElementById('<%=ButtonLogin.ClientID%>').style.cursor = "not-allowed"
            }
        }

        loadingOp();
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentHolder" Runat="Server">
    <uc1:Banner ID="Banner1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentHolder" runat="Server">
    <div class="loadingOut alert alert-info"><p> Please Wait While Loading....</p></div>
    <div class="loadingBody">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <form >
                    <table class="modal-content">
                        <tr>
                            <td class="modal-header" colspan="5"><strong>Enter Your Username:</strong></td>
                        </tr>
                        <tr class="form-group">
                            <td class="control-label col-sm-2">Username</td>
                            <td>
                                <asp:TextBox ID="TextBoxUN" runat="server" CssClass="form-control col-sm-10" placeholder="Username" ></asp:TextBox>
                            </td>
                            <td style="padding-left: 1px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUN" ErrorMessage="Username is requried" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                             <td style="padding-left: 1px">
                                <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClientClick="loadingIconVisible();" OnClick="ButtonLogin_Click" CssClass="btn btn-default" />
                                <span>
                                    <asp:Image ID="loadingIcon" runat="server" ImageUrl="~/icon/loadingIcon.gif" AlternateText="Loading..." />
                                </span>
                            </td>
                             <td class="control-label col-sm-2">
                                <asp:CheckBox ID="RememberMeCheckBox" runat="server" Text="Remember Me" CssClass="checkbox" /></td>
                        </tr>
                        
                        </tr>
                        <tr>
                            <td class="auto-style10"></td>
                            <td class="auto-style11">
                                <asp:Label ID="InfoLabel" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style12"></td>
                        </tr>
                    </table>
                </form>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
