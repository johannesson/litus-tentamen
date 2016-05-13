using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Om någon är inloggad
        if (Context.User.Identity.IsAuthenticated)
        {
            //Hämtar för- och efternamn till menyn
            Label fnamn = this.MasterLoginView.FindControl("lblFnamn") as Label;
            Label enamn = this.MasterLoginView.FindControl("lblEnamn") as Label;

            fnamn.Text = Profile.fnamn;
            enamn.Text = Profile.enamn;
        }
    }
}
