<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewUser.aspx.cs" Inherits="newuser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser" LoginCreatedUser="False" RequireEmail="False">
        <CreateUserButtonStyle CssClass="btn btn-success" />
    <WizardSteps>
        <asp:CreateUserWizardStep runat="server" >
            <ContentTemplate>
                <h1>Skapa ny användare</h1>
                <table>
                    <tr>
                        <td>Förnamn:</td>
                        <td>
                            <asp:TextBox ID="fnamn" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="FnamnRequired" runat="server" ControlToValidate="fnamn" ErrorMessage="Förnamn krävs." ToolTip="Förnamn krävs." ValidationGroup="CreateUserWizard1" CssClass="validator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Efternamn:</td>
                        <td>
                            <asp:TextBox ID="enamn" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="EnamnRequired" runat="server" ControlToValidate="enamn" ErrorMessage="Efternamn krävs." ToolTip="Efternamn krävs." ValidationGroup="CreateUserWizard1" CssClass="validator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Användarnamn:</td>
                        <td>
                            <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1" CssClass="validator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Lösenord:</td>
                        <td>
                            <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1" CssClass="validator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Bekräfta lösenord:</td>
                        <td>
                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1" CssClass="validator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            E-post:</td>
                        <td>
                            <asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1" CssClass="validator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Säkerhetsfråga:</td>
                        <td>
                            <asp:TextBox ID="Question" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1" CssClass="validator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Svar på frågan:</td>
                        <td>
                            <asp:TextBox ID="Answer" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1" CssClass="validator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Roller:</td>
                        <td>
                            <asp:CheckBoxList ID="cblRoller" runat="server">
                            </asp:CheckBoxList>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Lösenorden måste vara lika." ValidationGroup="CreateUserWizard1" CssClass="validator"></asp:CompareValidator>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:Red;">
                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                        </td>
                        <td style="color:Red;"></td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:CreateUserWizardStep>
        <asp:CompleteWizardStep runat="server" >
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            <h1>Klart!</h1>
                        </td>
                    </tr>
                    <tr>
                        <td>Kontot är skapat.</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HyperLink ID="linkFlerAnv" runat="server" NavigateUrl="~/Admin/NewUser.aspx">Skapa fler användare</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:CompleteWizardStep>
    </WizardSteps>
</asp:CreateUserWizard>
</asp:Content>

