using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class student_BesvaraTentamen : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Hämtar aktuell användare
        userid.Value = Membership.GetUser().ProviderUserKey.ToString();
    }

    protected void gvBesvaradTentamen_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //Kollar så att det är en rad i tabellen och inte rubriken
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Byter ut idnumret till förnamn och efternamn
            string username = Membership.GetUser(Guid.Parse(e.Row.Cells[2].Text)).UserName;
            e.Row.Cells[2].Text = Profile.GetProfile(username).fnamn + " " + Profile.GetProfile(username).enamn;


            //Hämtar radens värden till en DataRowView
            DataRowView view = e.Row.DataItem as DataRowView;

            if(view["paborjad"].ToString() != "")
                (e.Row.FindControl("lblPaborjad") as Label).Text = "Påbörjad";

            if(view["avslutad"].ToString() != "")
                (e.Row.FindControl("lblAvslutad") as Label).Text = "Inlämnad";

            if (view["granskad"].ToString() != "")
                (e.Row.FindControl("lblGranskad") as Label).Text = "Rättad";

            //Ändrat 2016-02-18
            //Räknar ut poäng om tentan är granskad
            if (view["granskad"].ToString() != "")
            {               
                SqlConnection conn = new SqlConnection(Global.db);

                //Hämtar maxpoäng för tentamen
                SqlCommand sqlKollaMaxpoang = new SqlCommand("SELECT sum(maxpoang) FROM uppgift WHERE tentamen_id = @aktivBesvaradTentamen ", conn);
                sqlKollaMaxpoang.Parameters.AddWithValue("@aktivBesvaradTentamen", view["tentamen_id"]);

                //Hämtar total poäng för tentamen
                SqlCommand sqlKollaPoang = new SqlCommand("SELECT sum(poang) FROM besvaraduppgift WHERE besvaradtentamen_id = @aktivBesvaradTentamen ", conn);
                sqlKollaPoang.Parameters.AddWithValue("@aktivBesvaradTentamen", view[11]);

                using (conn)
                {
                    conn.Open();

                    string maxpoang = sqlKollaMaxpoang.ExecuteScalar().ToString();
                    string poang = sqlKollaPoang.ExecuteScalar().ToString();

                    if(poang == "")
                        poang = "0";

                    conn.Close();
                    
                    (e.Row.FindControl("lblPoang") as Label).Text = poang + " av " + maxpoang;
                }
            }


            //KOLLAR TIDER OM KNAPPAR SKA AKTIVERAS ELLER INAKTIVERAS
            try
            {
                //Kollar om tentamen är inlämnad
                if (view["avslutad"].ToString() == "")
                {

                    //Kollar om tentamen är öppen (inom intervallet starttid och sluttid)
                    if (DateTime.Now >= Convert.ToDateTime(view["starttid"]) && DateTime.Now <= Convert.ToDateTime(view["sluttid"]))
                    {
                        //Kollar om det finns någon maxtid
                        if (view["maxtid"].ToString() != "")
                        {
                            //Kollar om tentamen är påbörjad
                            if (view["paborjad"].ToString() != "")
                            {
                                //Gör om påbörjadtid till DateTime
                                DateTime paborjad = Convert.ToDateTime(view["paborjad"].ToString());

                                //Gör om maxtid och nutid till DateTime
                                DateTime maxSluttid = paborjad.AddMinutes(Convert.ToDouble(view["maxtid"]));

                                if (DateTime.Now < maxSluttid)
                                {
                                    //Öppnar besvaraknappen
                                    (e.Row.FindControl("btnBesvaraTentamen") as Button).Enabled = true;
                                }
                            }

                            else
                            {
                                //Öppnar besvaraknappen
                                (e.Row.FindControl("btnBesvaraTentamen") as Button).Enabled = true;
                            }
                        }

                        else
                        {
                            //Öppnar besvaraknappen
                            (e.Row.FindControl("btnBesvaraTentamen") as Button).Enabled = true;
                        }
                    }
                }
            }

            catch
            {

            }

            //Öppnar resultatknappen om tentamen är granskad
            if (view["granskad"].ToString() != "")
            {
                (e.Row.FindControl("btnResultat") as Button).Enabled = true;
            }

        }
    }


    protected void gvBesvaradTentamen_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "BesvaraTentamen")
        {
            //Sätter godkännview
            mvTentamen.ActiveViewIndex = 1;

            //Hämtar aktuell tentamen och besvaradtentamen
            string[] args = e.CommandArgument.ToString().Split(new char[] { ';' });

            aktivTentamen.Value = args[0];
            aktivBesvaradTentamen.Value = args[1];
        }


        if (e.CommandName == "SeResultat")
        {
            //Sätter resultatview
            mvTentamen.ActiveViewIndex = 4;

            aktivBesvaradTentamen.Value = e.CommandArgument.ToString();
        }
    }


    //Aktiverar eller inaktiverar startknappen
    protected void cbInstruktioner_CheckedChanged(object sender, EventArgs e)
    {
        if (cbInstruktioner.Checked == true)
            btnStarta.Enabled = true;
        else
            btnStarta.Enabled = false;
    }




    //Startar tentamen
    protected void btnStarta_Click(object sender, EventArgs e)
    {
        //Sätter uppgiftview
        mvTentamen.ActiveViewIndex = 2;
                
        SqlConnection conn = new SqlConnection(Global.db);

        //Kollar om det finns någon påbörjadtid på aktuell besvaradtentamen
        SqlCommand sqlKollaTid = new SqlCommand("SELECT paborjad FROM besvaradtentamen WHERE id = @aktivBesvaradTentamen ", conn);
        sqlKollaTid.Parameters.AddWithValue("@aktivBesvaradTentamen", aktivBesvaradTentamen.Value);

        //Räknar antalet uppgifter i besvaraduppgift
        SqlCommand sqlKollaUppgift = new SqlCommand("SELECT COUNT(id) FROM besvaraduppgift WHERE besvaradtentamen_id = @aktivBesvaradTentamen ", conn);
        sqlKollaUppgift.Parameters.AddWithValue("@aktivBesvaradTentamen", aktivBesvaradTentamen.Value);

        //Lägger in påbörjadtid i besvaradtentamen
        SqlCommand sqlSkapaTid = new SqlCommand("UPDATE besvaradtentamen SET paborjad = @paborjad WHERE id = @aktivBesvaradTentamen", conn);
        sqlSkapaTid.Parameters.AddWithValue("@paborjad", DateTime.Now);
        sqlSkapaTid.Parameters.AddWithValue("@aktivBesvaradTentamen", aktivBesvaradTentamen.Value);

        //Lägger in uppgifter i besvaraduppgift
        SqlCommand sqlSkapaUppgifter = new SqlCommand("INSERT INTO besvaraduppgift (besvaradtentamen_id, uppgift_id) SELECT @aktivBesvaradTentamen, id FROM uppgift WHERE tentamen_id = @tentamen_id", conn);
        sqlSkapaUppgifter.Parameters.AddWithValue("@aktivBesvaradTentamen", aktivBesvaradTentamen.Value);
        sqlSkapaUppgifter.Parameters.AddWithValue("@tentamen_id", aktivTentamen.Value);
        
        using (conn)
        {
            conn.Open();

            string paborjad = sqlKollaTid.ExecuteScalar().ToString();
            int antalUppgifter = int.Parse(sqlKollaUppgift.ExecuteScalar().ToString());

            //Skapar starttid om den inte redan finns
            if (paborjad == "")
                sqlSkapaTid.ExecuteNonQuery();

            //Skapar rader i besvaraduppgift om de inte finns
            if (antalUppgifter < 1)
                sqlSkapaUppgifter.ExecuteNonQuery();

            conn.Close();
        }
    }



    //Knappen föregående uppgift (besvara)
    protected void btnBack_Click(object sender, EventArgs e)
    {
        //Sparar och byter uppgift
        spara();
        fwUppgiften.PageIndex = fwUppgiften.PageIndex - 1;
    }

    //Knappen nästa uppgift (besvara)
    protected void btnNext_Click(object sender, EventArgs e)
    {
        //Sparar och byter uppgift
        spara();
        fwUppgiften.PageIndex = fwUppgiften.PageIndex + 1;
    }



    //När uppgift laddats (besvara)
    protected void fwUppgiften_ItemCreated(object sender, EventArgs e)
    {
        try
        {
            //Hämtar index för uppgift och totalt antal samt nuvarande procent
            string nuvarandeUppgift = (fwUppgiften.PageIndex + 1).ToString();
            string antalUppgifter = fwUppgiften.PageCount.ToString();
            int nuvarandeProcent = (100 / (int.Parse(antalUppgifter))) * (int.Parse(nuvarandeUppgift));

            //Skriver ut
            lblNuvarandeUppgift.Text = nuvarandeUppgift;
            lblbAntalUppgifter.Text = antalUppgifter;
            lblProgressProcent.Text = nuvarandeProcent + "%";

            //Aktiverar eller inaktiverar navigationsknapparna
            if (nuvarandeUppgift == antalUppgifter)
                btnNext.Enabled = false;
            else
                btnNext.Enabled = true;

            if (nuvarandeUppgift == "1")
                btnBack.Enabled = false;
            else
                btnBack.Enabled = true;
        }
        catch
        {

        }
    }


    //Knappen "lämna in"
    protected void btnSkicka_Click(object sender, EventArgs e)
    {
        //Sparar
        spara();

        SqlConnection conn = new SqlConnection(Global.db);

        //Lägger in sluttid i besvaradtentamen
        SqlCommand sqlSkapaTid = new SqlCommand("UPDATE besvaradtentamen SET avslutad = @avslutad WHERE id = @aktivBesvaradTentamen", conn);
        sqlSkapaTid.Parameters.AddWithValue("@avslutad", DateTime.Now);
        sqlSkapaTid.Parameters.AddWithValue("@aktivBesvaradTentamen", aktivBesvaradTentamen.Value);

        using(conn)
        {
            conn.Open();
            sqlSkapaTid.ExecuteNonQuery();
            conn.Close();
        }

        mvTentamen.ActiveViewIndex = 3;
    }



    private void spara()
    {
        fwUppgiften.UpdateItem(true);
    }


    protected void btnAvbryt_Click(object sender, EventArgs e)
    {
        spara();

        Response.Redirect("BesvaraTentamen.aspx");
    }

    protected void fwUppgiften_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {
        spara();
    }

    //När uppgift laddats (resultat)
    protected void fwResultatUppgift_ItemCreated(object sender, EventArgs e)
    {
        try
        {
            //Hämtar index för uppgift och totalt antal samt nuvarande procent
            string nuvarandeUppgift = (fwResultatUppgift.PageIndex + 1).ToString();
            string antalUppgifter = fwResultatUppgift.PageCount.ToString();
            int nuvarandeProcent = (100 / (int.Parse(antalUppgifter))) * (int.Parse(nuvarandeUppgift));

            //Skriver ut
            lblNuvarandeUppgiftResultat.Text = nuvarandeUppgift;
            lblbAntalUppgifterResultat.Text = antalUppgifter;

            //Aktiverar eller inaktiverar navigationsknapparna
            if (nuvarandeUppgift == antalUppgifter)
                btnNextResultat.Enabled = false;
            else
                btnNextResultat.Enabled = true;

            if (nuvarandeUppgift == "1")
                btnBackResultat.Enabled = false;
            else
                btnBackResultat.Enabled = true;
        }
        catch
        {

        }
    }

    //Knappen föregpående uppgift (resultat)
    protected void btnBackResultat_Click(object sender, EventArgs e)
    {
        fwResultatUppgift.PageIndex = fwResultatUppgift.PageIndex - 1;
    }

    //Knappen nästa uppgift (resultat)
    protected void btnNextResultat_Click(object sender, EventArgs e)
    {
        fwResultatUppgift.PageIndex = fwResultatUppgift.PageIndex + 1;
    }
}