<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Admin_Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="dsUsers" runat="server" ConnectionString="<%$ ConnectionStrings:tentamendb %>" SelectCommand="SELECT * FROM [vw_aspnet_MembershipUsers], [vw_aspnet_Users] WHERE  [vw_aspnet_MembershipUsers].UserId =[vw_aspnet_Users].UserId"></asp:SqlDataSource>
    <h1>Användare</h1>
<p>
    <asp:Button ID="btnNewUser" runat="server" CssClass="btn btn-success" Text="Ny användare" PostBackUrl="~/Admin/NewUser.aspx" />
</p>
<p>
    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" DataSourceID="dsUsers" OnRowCommand="gvUsers_RowCommand" OnRowDataBound="gvUsers_RowDataBound" CssClass="table table-striped">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="Användarnamn" SortExpression="UserName" />
            <asp:TemplateField HeaderText="Förnamn"></asp:TemplateField>
            <asp:TemplateField HeaderText="Efternamn"></asp:TemplateField>
            <asp:BoundField DataField="Email" HeaderText="E-post" SortExpression="Email" />
            <asp:TemplateField HeaderText="Roller">
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="btnTaBortAnv" runat="server" CausesValidation="False" CommandArgument='<%# Eval("UserName") %>' CommandName="tabort" Text="Ta bort" CssClass="btn btn-danger" OnClientClick="return tabort()" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
</p>
</asp:Content>

