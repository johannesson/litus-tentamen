<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="losenord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Ändra lösenord</h1>

        <asp:ChangePassword ID="ChangePassword1" runat="server" CancelDestinationPageUrl="~/Default.aspx">
            <ChangePasswordTemplate>
                <table>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>Nuvarande lösenord:</td>
                                    <td>
                                        <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" CssClass="validator" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Nytt lösenord:</td>
                                    <td>
                                        <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" CssClass="validator" ErrorMessage="New Password is required." ToolTip="New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Bekräfta nytt lösenord:</td>
                                    <td>
                                        <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" CssClass="validator" ErrorMessage="Confirm New Password is required." ToolTip="Confirm New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="Lösenorden måste vara lika." ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                    <td style="color:Red;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td><asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" CssClass="btn btn-primary" Text="Ändra lösenord" ValidationGroup="ChangePassword1" /></td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ChangePasswordTemplate>
            <SuccessTemplate>
                <table>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>Lösenordet har ändrats!</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </SuccessTemplate>
        </asp:ChangePassword>
</asp:Content>
