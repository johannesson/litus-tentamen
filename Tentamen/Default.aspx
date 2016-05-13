<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="jumbotron">
    <h1>LITUS - Tentamen</h1>
        <p class="lead">
            Välkommen <asp:Label ID="fnamnet" runat="server"></asp:Label> till tentamenssystemet LITUS. LinusTentamenochUniversitetsSystem.
        </p>
    </div>

    <div class="col-md-4">
        <h3>För examinatorer</h3>
        <p>
            Är du examinator har du möjlighet att skapa tentamen, lägga till frågor och koppla studenter till en tentamen.
        </p>
        <p>
            När studenterna slutfört sin tentamen kan du se studentens svar och ge poäng. Det är också möjligt att lämna en kommentar.
        </p>
    </div>

    <div class="col-md-4">
        <h3>För studenter</h3>
        <p>
            Är du student har du möjlighet att svara på tentamen.
        </p>
        <p>
            När examinatorn rättat din tentamen kan du se poäng och kommentarer på dina svar.
        </p>

    </div>
    <div class="col-md-4 ">
        <h3>För adminstratörer</h3>
        <p>
            Administratörer har koll på alla användare som arbetar i systemet.
        </p>
        <p>
            Här finns möjlighet att skapa och ta bort studenter, examinatorer och administratörer.
        </p>


    </div>
           
    </asp:Content>

