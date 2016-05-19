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

        <img src="bilder/student_bakom_ryggen.jpg" class="bilder" />

        <p>
            Examinatorer har möjlighet att skapa tentamen, lägga till frågor och koppla studenter till tentamen.
        </p>
        <p>
            När studenterna slutfört sin tentamen kan examinatorn se studentens svar och ge poäng. Det är också möjligt att lämna en kommentar på varje svar.
        </p>
        
    </div>

    <div class="col-md-4">
        <h3>För studenter</h3>

        <img src="bilder/studenter_skriver_tenta.jpg" class="bilder" />

        <p>
            Studenter har möjlighet att besvara tentamen i systemet.
        </p>
        <p>
            När examinatorn rättat studentens tentamen är det möjligt att se totalpoäng samt poäng och kommentar på varje svar.
        </p>
        
    </div>
    <div class="col-md-4 ">
        <h3>För administratörer</h3>
        
        <img src="bilder/narbild_student_laptop.jpg" class="bilder" />

        <p>
            Administratörer hanterar alla användare som arbetar i systemet.
        </p>
        <p>
            Här finns möjlighet att skapa och ta bort användare samt tilldela rollerna student, examinator och administratör.
        </p>
        
    </div>
           
    </asp:Content>

