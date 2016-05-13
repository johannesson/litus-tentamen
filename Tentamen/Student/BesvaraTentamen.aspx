<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BesvaraTentamen.aspx.cs" Inherits="student_BesvaraTentamen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:SqlDataSource ID="dsStudentsTentor" runat="server" ConnectionString="<%$ ConnectionStrings:tentamendb %>" SelectCommand="SELECT tentamen.*, besvaradtentamen.* FROM tentamen INNER JOIN besvaradtentamen ON tentamen.id = besvaradtentamen.tentamen_id WHERE (besvaradtentamen.student_id = @userid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="userid" Name="userid" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsAktivTentamen" runat="server" ConnectionString="<%$ ConnectionStrings:tentamendb %>" SelectCommand="SELECT * FROM [tentamen] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="aktivTentamen" Name="id" PropertyName="Value" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsAktivBesvaradTentamenUppgifter" runat="server" ConnectionString="<%$ ConnectionStrings:tentamendb %>" SelectCommand="SELECT besvaraduppgift.*, uppgift.* FROM uppgift INNER JOIN besvaraduppgift ON uppgift.id = besvaraduppgift.uppgift_id WHERE (besvaraduppgift.besvaradtentamen_id = @besvaradtentamen_id)" UpdateCommand="UPDATE [besvaraduppgift] SET [svar] = @svar WHERE [id] = @id">
            <SelectParameters>
                <asp:ControlParameter ControlID="aktivBesvaradTentamen" Name="besvaradtentamen_id" PropertyName="Value" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="svar" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="userid" runat="server" />
        <asp:HiddenField ID="aktivTentamen" runat="server" />
        <asp:HiddenField ID="aktivBesvaradTentamen" runat="server" />
    </p>
        <asp:MultiView ID="mvTentamen" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewTentamen" runat="server">
                <h1>Mina tentor</h1>
                <asp:GridView ID="gvBesvaradTentamen" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="dsStudentsTentor" OnRowCommand="gvBesvaradTentamen_RowCommand" OnRowDataBound="gvBesvaradTentamen_RowDataBound" CssClass="table table-striped">
                    <Columns>
                        <asp:TemplateField HeaderText="Kurs och moment" SortExpression="kurs">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("kurs") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <h4>
                                    <asp:Label ID="lblKurs" runat="server" Text='<%# Bind("kurs") %>'></asp:Label>
                                </h4>
                                <asp:Label ID="lblNamn" runat="server" Text='<%# Bind("namn") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="maxtid" HeaderText="Maxtid (min)" SortExpression="maxtid" />
                        <asp:BoundField DataField="examinator_id" HeaderText="Examinator" SortExpression="examinator_id" />
                        <asp:TemplateField HeaderText="Status" SortExpression="paborjad">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("paborjad") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPaborjad" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="lblAvslutad" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="lblGranskad" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Poäng">
                            <ItemTemplate>
                                <asp:Label ID="lblPoang" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="btnBesvaraTentamen" runat="server" CausesValidation="False" CommandArgument='<%# Eval("id") + ";" + Eval("id1") %>' CommandName="BesvaraTentamen" Text="Besvara" CssClass="btn btn-primary" Enabled="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="btnResultat" runat="server" CausesValidation="False" CommandArgument='<%# Eval("id1") %>' CommandName="SeResultat" Text="Resultat" CssClass="btn btn-primary" Enabled="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        Du är inte registrerad på någon tentamen.
                    </EmptyDataTemplate>
                </asp:GridView>
            </asp:View>
            <asp:View ID="viewBesvaraStart" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="dsAktivTentamen">
                    <EditItemTemplate>
                        id:
                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                        <br />
                        examinator_id:
                        <asp:TextBox ID="examinator_idTextBox" runat="server" Text='<%# Bind("examinator_id") %>' />
                        <br />
                        kurs:
                        <asp:TextBox ID="kursTextBox" runat="server" Text='<%# Bind("kurs") %>' />
                        <br />
                        namn:
                        <asp:TextBox ID="namnTextBox" runat="server" Text='<%# Bind("namn") %>' />
                        <br />
                        beskrivning:
                        <asp:TextBox ID="beskrivningTextBox" runat="server" Text='<%# Bind("beskrivning") %>' />
                        <br />
                        maxtid:
                        <asp:TextBox ID="maxtidTextBox" runat="server" Text='<%# Bind("maxtid") %>' />
                        <br />
                        godkandprocent:
                        <asp:TextBox ID="godkandprocentTextBox" runat="server" Text='<%# Bind("godkandprocent") %>' />
                        <br />
                        starttid:
                        <asp:TextBox ID="starttidTextBox" runat="server" Text='<%# Bind("starttid") %>' />
                        <br />
                        sluttid:
                        <asp:TextBox ID="sluttidTextBox" runat="server" Text='<%# Bind("sluttid") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        examinator_id:
                        <asp:TextBox ID="examinator_idTextBox" runat="server" Text='<%# Bind("examinator_id") %>' />
                        <br />
                        kurs:
                        <asp:TextBox ID="kursTextBox" runat="server" Text='<%# Bind("kurs") %>' />
                        <br />
                        namn:
                        <asp:TextBox ID="namnTextBox" runat="server" Text='<%# Bind("namn") %>' />
                        <br />
                        beskrivning:
                        <asp:TextBox ID="beskrivningTextBox" runat="server" Text='<%# Bind("beskrivning") %>' />
                        <br />
                        maxtid:
                        <asp:TextBox ID="maxtidTextBox" runat="server" Text='<%# Bind("maxtid") %>' />
                        <br />
                        godkandprocent:
                        <asp:TextBox ID="godkandprocentTextBox" runat="server" Text='<%# Bind("godkandprocent") %>' />
                        <br />
                        starttid:
                        <asp:TextBox ID="starttidTextBox" runat="server" Text='<%# Bind("starttid") %>' />
                        <br />
                        sluttid:
                        <asp:TextBox ID="sluttidTextBox" runat="server" Text='<%# Bind("sluttid") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <h1>
                            <asp:Label ID="namnLabel" runat="server" Text='<%# Bind("rubrik") %>' />
                        </h1>
                        <asp:Label ID="beskrivningLabel" runat="server" Text='<%# Bind("beskrivning") %>' />
                        <br />
                    </ItemTemplate>
                </asp:FormView>
                <br />
                * Är tentamen tidsbestämd börjar tiden gå när du trycker på knappen.<br /> * När du har skickat in din tentamen går den inte att ändra.<br />
                <br />
                <asp:CheckBox ID="cbInstruktioner" runat="server" Text="Ja, jag har läst och förstått instruktionerna" OnCheckedChanged="cbInstruktioner_CheckedChanged" AutoPostBack="True" />
                <br />
                <br />
                <asp:Button ID="btnStarta" runat="server" OnClick="btnStarta_Click" Text="Påbörja tentamen" Enabled="False" CssClass="btn btn-primary" />
                &nbsp;<asp:HyperLink ID="linkTillbaka" runat="server" CssClass="btn btn-default" NavigateUrl="~/Student/BesvaraTentamen.aspx">Tillbaka</asp:HyperLink>
                <br />
            </asp:View>
            <asp:View ID="viewBesvara" runat="server">
                <h1>Fråga
                    <asp:Label ID="lblNuvarandeUppgift" runat="server"></asp:Label>
                    av
                    <asp:Label ID="lblbAntalUppgifter" runat="server"></asp:Label>
                </h1>
                <asp:FormView ID="fwUppgiften" runat="server" DataKeyNames="id,id1" DataSourceID="dsAktivBesvaradTentamenUppgifter" DefaultMode="Edit" OnItemCreated="fwUppgiften_ItemCreated" AllowPaging="True" OnPageIndexChanging="fwUppgiften_PageIndexChanging" Width="100%">
                    <EditItemTemplate>
                        <h3>
                            <asp:Label ID="rubrikLabel" runat="server" Text='<%# Bind("rubrik") %>' />
                        </h3>
                        <asp:Label ID="textLabel" runat="server" Text='<%# Bind("text") %>' />
                        <br />
                        <br />
                        Maxpoäng:
                        <asp:Label ID="maxpoangLabel" runat="server" Text='<%# Bind("maxpoang") %>' />
                        <br />
                        <br />
                        Svar:<br />
                        <asp:TextBox ID="svarTextBox" runat="server" Height="160px" Text='<%# Bind("svar") %>' TextMode="MultiLine" CssClass="form-control" />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        Det finns inga frågor i tentamen. Kontakta din examinator.
                    </EmptyDataTemplate>
                    <PagerSettings NextPageText="Nästa fråga" PreviousPageText="Föregående fråga" />
                    <PagerStyle CssClass="bs-pagination" />
                </asp:FormView>

                <div class="progress">
  <div class="progress-bar" role="progressbar" aria-valuenow='<% =lblProgressProcent.Text %>' aria-valuemin="0" aria-valuemax="100" style='width:<% =lblProgressProcent.Text %>'>
      <asp:Label ID="lblProgressProcent" runat="server"></asp:Label></div>
</div>

                <asp:Button ID="btnBack" runat="server" CssClass="btn btn-default" OnClick="btnBack_Click" Text="Föregående fråga" />
                &nbsp;<asp:Button ID="btnNext" runat="server" CssClass="btn btn-default" OnClick="btnNext_Click" Text="Nästa fråga" />
                <br />
                <br />
                <asp:Button ID="btnSkicka" runat="server" OnClick="btnSkicka_Click" Text="Lämna in" CssClass="btn btn-danger" OnClientClick="return skickain()" />
                &nbsp;<asp:Button ID="btnAvbryt" runat="server" OnClick="btnAvbryt_Click" Text="Spara och gå tillbaka" CssClass="btn btn-success" />
                <br />
            </asp:View>
            <asp:View ID="viewSkickatIn" runat="server">
                <h1>Inlämnat!</h1>
                Nu har du lämnat in din tentamen.<br />
                <br />
                <asp:HyperLink ID="HyperLink8" runat="server" CssClass="btn btn-primary" NavigateUrl="~/Student/BesvaraTentamen.aspx">Tillbaka till mina tentor</asp:HyperLink>
            </asp:View>
            <asp:View ID="viewGranskad" runat="server">
                <h1>Fråga
                    <asp:Label ID="lblNuvarandeUppgiftResultat" runat="server"></asp:Label>
                    av
                    <asp:Label ID="lblbAntalUppgifterResultat" runat="server"></asp:Label>
                </h1>
                    <asp:FormView ID="fwResultatUppgift" runat="server" AllowPaging="True" DataKeyNames="id,id1" DataSourceID="dsAktivBesvaradTentamenUppgifter" OnItemCreated="fwResultatUppgift_ItemCreated" Width="100%">
                        <EditItemTemplate>
                            id:
                            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                            <br />
                            besvaradtentamen_id:
                            <asp:TextBox ID="besvaradtentamen_idTextBox" runat="server" Text='<%# Bind("besvaradtentamen_id") %>' />
                            <br />
                            uppgift_id:
                            <asp:TextBox ID="uppgift_idTextBox" runat="server" Text='<%# Bind("uppgift_id") %>' />
                            <br />
                            svar:
                            <asp:TextBox ID="svarTextBox" runat="server" Text='<%# Bind("svar") %>' />
                            <br />
                            poang:
                            <asp:TextBox ID="poangTextBox" runat="server" Text='<%# Bind("poang") %>' />
                            <br />
                            kommentar:
                            <asp:TextBox ID="kommentarTextBox" runat="server" Text='<%# Bind("kommentar") %>' />
                            <br />
                            svarsalternativ_id:
                            <asp:TextBox ID="svarsalternativ_idTextBox" runat="server" Text='<%# Bind("svarsalternativ_id") %>' />
                            <br />
                            id1:
                            <asp:Label ID="id1Label1" runat="server" Text='<%# Eval("id1") %>' />
                            <br />
                            tentamen_id:
                            <asp:TextBox ID="tentamen_idTextBox" runat="server" Text='<%# Bind("tentamen_id") %>' />
                            <br />
                            nummer:
                            <asp:TextBox ID="nummerTextBox" runat="server" Text='<%# Bind("nummer") %>' />
                            <br />
                            rubrik:
                            <asp:TextBox ID="rubrikTextBox" runat="server" Text='<%# Bind("rubrik") %>' />
                            <br />
                            text:
                            <asp:TextBox ID="textTextBox" runat="server" Text='<%# Bind("text") %>' />
                            <br />
                            maxpoang:
                            <asp:TextBox ID="maxpoangTextBox" runat="server" Text='<%# Bind("maxpoang") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            besvaradtentamen_id:
                            <asp:TextBox ID="besvaradtentamen_idTextBox" runat="server" Text='<%# Bind("besvaradtentamen_id") %>' />
                            <br />
                            uppgift_id:
                            <asp:TextBox ID="uppgift_idTextBox" runat="server" Text='<%# Bind("uppgift_id") %>' />
                            <br />
                            svar:
                            <asp:TextBox ID="svarTextBox" runat="server" Text='<%# Bind("svar") %>' />
                            <br />
                            poang:
                            <asp:TextBox ID="poangTextBox" runat="server" Text='<%# Bind("poang") %>' />
                            <br />
                            kommentar:
                            <asp:TextBox ID="kommentarTextBox" runat="server" Text='<%# Bind("kommentar") %>' />
                            <br />
                            svarsalternativ_id:
                            <asp:TextBox ID="svarsalternativ_idTextBox" runat="server" Text='<%# Bind("svarsalternativ_id") %>' />
                            <br />
                            tentamen_id:
                            <asp:TextBox ID="tentamen_idTextBox" runat="server" Text='<%# Bind("tentamen_id") %>' />
                            <br />
                            nummer:
                            <asp:TextBox ID="nummerTextBox" runat="server" Text='<%# Bind("nummer") %>' />
                            <br />
                            rubrik:
                            <asp:TextBox ID="rubrikTextBox" runat="server" Text='<%# Bind("rubrik") %>' />
                            <br />
                            text:
                            <asp:TextBox ID="textTextBox" runat="server" Text='<%# Bind("text") %>' />
                            <br />
                            maxpoang:
                            <asp:TextBox ID="maxpoangTextBox" runat="server" Text='<%# Bind("maxpoang") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <h3>
                                <asp:Label ID="rubrikLabel" runat="server" Text='<%# Bind("rubrik") %>' />
                            </h3>
                            <asp:Label ID="textLabel" runat="server" Text='<%# Bind("text") %>' />
                            <br />
                            <br />
                            Svar:<asp:TextBox ID="tbSvar" runat="server" CssClass="form-control" Height="150px" ReadOnly="True" Text='<%# Bind("svar") %>' TextMode="MultiLine"></asp:TextBox>
                            Maxpoäng:
                            <asp:Label ID="maxpoangLabel" runat="server" Text='<%# Bind("maxpoang") %>' />
                            <br />
                            <br />
                            Poäng:
                            <table>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="poangTextBox" runat="server" CssClass="form-control" MaxLength="4" ReadOnly="True" Text='<%# Bind("poang") %>' Width="60px" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <br />
                            Kommentar:<asp:TextBox ID="kommentarTextBox" runat="server" CssClass="form-control" Height="150px" ReadOnly="True" Text='<%# Bind("kommentar") %>' TextMode="MultiLine" />
                        </ItemTemplate>
                        <PagerStyle CssClass="bs-pagination" />
                    </asp:FormView>
                <p>
                    <asp:Button ID="btnBackResultat" runat="server" CssClass="btn btn-default" OnClick="btnBackResultat_Click" Text="Föregående fråga" />
                    &nbsp;<asp:Button ID="btnNextResultat" runat="server" CssClass="btn btn-default" OnClick="btnNextResultat_Click" Text="Nästa fråga" />
                </p>
                <p>
                    <asp:HyperLink ID="linkTillbaka0" runat="server" CssClass="btn btn-success" NavigateUrl="~/Student/BesvaraTentamen.aspx">Tillbaka</asp:HyperLink>
                </p>
            </asp:View>
        </asp:MultiView>
    </asp:Content>

