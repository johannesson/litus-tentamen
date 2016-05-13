
//Cookie-koll
$(document).ready(function () {
    $.cookieBar(
        {
            message: 'Webbplatsen använder kakor (cookies). Genom att fortsätta använda sidan accepterar du detta.',
            acceptButton: true,
            acceptText: 'OK',
            policyButton: true,
            policyText: 'Läs mer',
            policyURL: '/Om.aspx',
            autoEnable: true,
            acceptOnContinue: false,
            expireDays: 365,
            forceShow: false,
            effect: 'slide',
            element: '.kaka',
            append: false,
            fixed: false,
            bottom: false
        });
});


//För att markera aktiv sida i menyn
//Hämtar adressen
var url = window.location;

//Markerar aktiv länk
$('ul.nav a').filter(function ()
{ return this.href == url; }).parent().addClass('active');


// Popup för ta bort
function tabort()
{
    svar = confirm("Vill du verkligen ta bort?");
    if (svar == true)
        return true;
    else
    return false;
}

// Popup för att lämna in
function skickain()
{
    svar = confirm("Vill du verkligen lämna in?\n\nÅtgärden går inte att ångra.");
    if (svar == true)
        return true;
    else
        return false;
}