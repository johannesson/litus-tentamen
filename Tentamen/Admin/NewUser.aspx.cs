using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newuser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Hämtar alla roller i databasen
            string[] allaRoller = Roles.GetAllRoles();
            CheckBoxList cbl = ((CheckBoxList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("cblRoller"));

            //Skriver ut rollerna i checkboxlistan
            foreach (string roll in allaRoller)
            {
                cbl.Items.Add(roll);
            }
        }
    }

    //När användaren är skapad
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        //Hämtar användarens användarnamn
        string anvnamn = CreateUserWizard1.UserName;

        //Hämtar förnamn och efternamn
        string fnamn = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("fnamn")).Text;
        string enamn = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("enamn")).Text;

        //Lägger in namn i profilen
        ProfileCommon profilen = Profile.GetProfile(anvnamn);
        profilen.fnamn = fnamn;
        profilen.enamn = enamn;
        profilen.Save();


        CheckBoxList cbl = ((CheckBoxList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("cblRoller"));

        //Hämtar valda roller från checkboxlistan
        List<string> rollerL = new List<string>();

        foreach (ListItem roll in cbl.Items)
        {
            if (roll.Selected)
                rollerL.Add(roll.Value);
        }

        //Lägger rollerna på användaren om något är valt
        if (rollerL.Count > 0)
        {
            string[] roller = rollerL.ToArray();
            Roles.AddUserToRoles(anvnamn, roller);
        }
    }
}