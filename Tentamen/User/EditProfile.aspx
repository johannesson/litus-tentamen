<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="User_EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Ändra uppgifter</h1>
        <table>
            <tr>
                <td>Förnamn:</td>
                <td><asp:TextBox ID="fnamn" runat="server" CssClass="form-control"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fnamn" CssClass="validator" ErrorMessage="Förnamn krävs">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Efternamn:</td>
                <td><asp:TextBox ID="enamn" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="enamn" CssClass="validator" ErrorMessage="Efternamn krävs">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Spara" CssClass="btn btn btn-primary" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
<p>
    <asp:Label ID="lbSaveStatus" runat="server"></asp:Label>
    <br />
</p>
<p>
</p>
    <p>
</p>
</asp:Content>

