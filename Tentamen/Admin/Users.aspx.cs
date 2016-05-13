using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    
    }

    protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string username = e.Row.Cells[0].Text;

        //Kollar så att det är en rad i tabellen och inte rubriken
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Lägger till förnamn och efternamn
            e.Row.Cells[1].Text = Profile.GetProfile(username).fnamn;
            e.Row.Cells[2].Text = Profile.GetProfile(username).enamn;

            string[] roles = Roles.GetRolesForUser(username);

            //Skriver ut rollerna
            foreach (string role in roles)
            {
                e.Row.Cells[4].Text += role + " ";
            }
        }

    }

    protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //Om knappen ta bort trycks
        if(e.CommandName == "tabort")
        {
            //TODO - Kolla om det verkligen ska tas bort
            Membership.DeleteUser(e.CommandArgument.ToString());

            gvUsers.DataBind();
        }
    }
}