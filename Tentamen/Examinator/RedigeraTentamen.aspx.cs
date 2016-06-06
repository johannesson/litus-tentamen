using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Examinator_RedigeraTentamen : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Hämtar aktuell användare
        userid.Value = Membership.GetUser().ProviderUserKey.ToString();
    }


    protected void gvTentamen_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //När knappen "redigera" trycks
        if(e.CommandName == "RedigeraTentamen")
        {
            //Ändrar aktuell view
            mvTentamen.ActiveViewIndex = 1;
            aktivTentamen.Value = e.CommandArgument.ToString();
        }
    }
    

    //Fyller listboxen med studenter
    protected void fvKopplaStudent_DataBound(object sender, EventArgs e)
    {
        //Hämtar adressen till databasen
        SqlConnection conn = new SqlConnection(Global.db);

        //Hämtar studenter som är kopplade till akutell tentamen
        SqlCommand sql = new SqlCommand("SELECT student_id FROM besvaradtentamen WHERE tentamen_id = @aktivTentamen ", conn);
        sql.Parameters.AddWithValue("@aktivTentamen", aktivTentamen.Value);

        //Lista för att hålla studenterna
        List<string> userlist = new List<string>();

        using (conn)
        {
            conn.Open();
            SqlDataReader sqllasare = sql.ExecuteReader();

            //Lägger in studenterna i listan
            while(sqllasare.Read())
                userlist.Add(sqllasare.GetValue(0).ToString());

            sqllasare.Close();
            conn.Close();
        }


        //Hämtar alla användare i systemet med rollen student
        string[] studenter = Roles.GetUsersInRole("student");

        //Identifierar listboxen i koppla student till tentamen
        ListBox lb = fvKopplaStudent.FindControl("lbStudenter") as ListBox;


        foreach (string student in studenter)
        {
            ListItem item = new ListItem(Profile.GetProfile(student).fnamn + " " + Profile.GetProfile(student).enamn + " (" + student.ToString() + ")", Membership.GetUser(student).ProviderUserKey.ToString());

            //Lägger in studenterna i listan (om de inte redan är kopplade)
            if (!userlist.Contains(Membership.GetUser(student).ProviderUserKey.ToString()))
                lb.Items.Add(item);
        }
    }
    
    
    
    //När en rad i listan med kopplade studenter har laddats
    protected void gvKoppladeStudenter_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //Kollar så att det är en rad i tabellen och inte rubriken
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Byter ut idnumret till förnamn, efternamn och användarnamn
            string username = Membership.GetUser(Guid.Parse(e.Row.Cells[0].Text)).UserName;
            e.Row.Cells[0].Text = Profile.GetProfile(username).fnamn + " " + Profile.GetProfile(username).enamn + " ("+ username +")";

            //Hämtar radens värden till en DataRowView
            DataRowView view = e.Row.DataItem as DataRowView;

            if (view["paborjad"].ToString() != "")
            {
                //Öppnar rätta-knappen om tentamen är påbörjad
                (e.Row.FindControl("btnGranska") as Button).Enabled = true;

                if (view["granskad"].ToString() == "")
                {
                    //Aktiverar även knappen för att markera som rättad om den inte redan är rättad
                    (e.Row.FindControl("btnGranskad") as Button).Enabled = true;
                }
            }

            //Ändrat 2016-06-02
            //Räknar ut poäng om tentan är granskad
            SqlConnection conn = new SqlConnection(Global.db);

            //Hämtar maxpoäng för tentamen
            SqlCommand sqlKollaMaxpoang = new SqlCommand("SELECT sum(maxpoang) FROM uppgift WHERE tentamen_id = @aktivBesvaradTentamen ", conn);
            sqlKollaMaxpoang.Parameters.AddWithValue("@aktivBesvaradTentamen", view["tentamen_id"]);

            //Hämtar total poäng för tentamen
            SqlCommand sqlKollaPoang = new SqlCommand("SELECT sum(poang) FROM besvaraduppgift WHERE besvaradtentamen_id = @aktivBesvaradTentamen ", conn);
            sqlKollaPoang.Parameters.AddWithValue("@aktivBesvaradTentamen", view[0]);

            using (conn)
            {
                conn.Open();

                string maxpoang = sqlKollaMaxpoang.ExecuteScalar().ToString();
                string poang = sqlKollaPoang.ExecuteScalar().ToString();

                if (poang == "")
                    poang = "0";

                conn.Close();

                (e.Row.FindControl("lblPoang") as Label).Text = poang + " av " + maxpoang;
            }

        }
    }



    //När listan med uppgifter har laddats
    protected void gvUppgift_DataBound(object sender, EventArgs e)
    {
        //Skriver ut frågenummer i listan
        //Möjlighet finns att lagra nummer i databasen men används inte
        int i = 0;
        foreach (GridViewRow rad in gvUppgift.Rows)
        {
            i++;
            rad.Cells[0].Text = i + "";
        }

        //Hämtar adressen till databasen
        SqlConnection conn = new SqlConnection(Global.db);

        //Kollar om det finns någon starttid på aktuell besvaradtentamen
        SqlCommand sql = new SqlCommand("SELECT paborjad FROM besvaradtentamen WHERE tentamen_id = @aktivTentamen ", conn);
        sql.Parameters.AddWithValue("@aktivTentamen", aktivTentamen.Value);

        List<string> userlist = new List<string>();

        using (conn)
        {
            conn.Open();
            SqlDataReader sqllasare = sql.ExecuteReader();

            while (sqllasare.Read())
            {
                //Kollar om det är någon påbörjad som inte är null
                if (!sqllasare.IsDBNull(0))
                {
                    //Kollar om någon påbörjat tentamen
                    //Inaktiverar i så fall knapparna redigera och ta bort fråga
                    foreach (GridViewRow rad in gvUppgift.Rows)
                    {
                        (rad.FindControl("btnRedigeraUppgift") as Button).Enabled = false;
                        (rad.FindControl("btnTaBortUppgift") as Button).Enabled = false;
                    }
                    
                    //Inaktiverar knappen lägg till uppgift och alla dess fält
                    (fvNyUppgift.FindControl("btnLaggTillUppgift") as Button).Enabled = false;
                    (fvNyUppgift.FindControl("tbRubrik") as TextBox).Enabled = false;
                    (fvNyUppgift.FindControl("tbText") as TextBox).Enabled = false;
                    (fvNyUppgift.FindControl("tbMaxpoang") as TextBox).Enabled = false;

                    break;
                }
            }
            sqllasare.Close();
            conn.Close();
        }
    }




    protected void gvKoppladeStudenter_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //När knappen "rätta" trycks
        if (e.CommandName == "GranskaTentamen")
        {
            //Ändrar aktuell view
            mvTentamen.ActiveViewIndex = 2;
            aktivBesvaradTentamen.Value = e.CommandArgument.ToString();
        }

        //När knappen "markera som rättad" trycks
        if (e.CommandName == "MarkeraGranskad")
        {
            aktivBesvaradTentamen.Value = e.CommandArgument.ToString();

            //Hämtar adressen till databasen
            SqlConnection conn = new SqlConnection(Global.db);

            //Lägger in tid för granskning i besvaradtentamen
            SqlCommand sqlSkapaTid = new SqlCommand("UPDATE besvaradtentamen SET granskad = @granskad WHERE id = @aktivBesvaradTentamen", conn);
            sqlSkapaTid.Parameters.AddWithValue("@granskad", DateTime.Now);
            sqlSkapaTid.Parameters.AddWithValue("@aktivBesvaradTentamen", aktivBesvaradTentamen.Value);

            using (conn)
            {
                conn.Open();
                sqlSkapaTid.ExecuteNonQuery();
                conn.Close();
            }

            //Uppdaterar listan
            gvKoppladeStudenter.DataBind();
        }

    }


    //Knappen föregående uppgift
    protected void btnBack_Click(object sender, EventArgs e)
    {
        //Sparar och byter uppgift
        spara();
        fwUppgiften.PageIndex = fwUppgiften.PageIndex - 1;
    }

    //Knappen nästa uppgift
    protected void btnNext_Click(object sender, EventArgs e)
    {
        //Sparar och byter uppgift
        spara();
        fwUppgiften.PageIndex = fwUppgiften.PageIndex + 1;
    }



    private void spara()
    {
        fwUppgiften.UpdateItem(true);
    }


    protected void btnAvbryt_Click(object sender, EventArgs e)
    {
        //Sparar
        spara();

        mvTentamen.ActiveViewIndex = 1;
    }


    protected void fwUppgiften_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {
        //Sparar
        spara();
    }


    protected void fwUppgiften_ItemCreated(object sender, EventArgs e)
    {
        //Hämtar index för uppgift och totalt antal
        string nuvarandeUppgift = (fwUppgiften.PageIndex + 1).ToString();
        string antalUppgifter = fwUppgiften.PageCount.ToString();

        //Skriver ut
        lblNuvarandeUppgift.Text = nuvarandeUppgift;
        lblbAntalUppgifter.Text = antalUppgifter;

        //Aktiverar eller deaktiverar navigationsknapparna
        if (nuvarandeUppgift == antalUppgifter)
            btnNext.Enabled = false;
        else
            btnNext.Enabled = true;

        if (nuvarandeUppgift == "1")
            btnBack.Enabled = false;
        else
            btnBack.Enabled = true;
    }

}