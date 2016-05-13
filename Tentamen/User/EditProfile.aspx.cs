using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_EditProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Hämtar namn
            fnamn.Text = Profile.fnamn;
            enamn.Text = Profile.enamn;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        //Sparar namn
        Profile.fnamn = fnamn.Text;
        Profile.enamn = enamn.Text;

        lbSaveStatus.Text = "Sparat!";
    }
}