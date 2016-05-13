<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RedigeraTentamen.aspx.cs" Inherits="Examinator_RedigeraTentamen" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="dsTentamen" runat="server" ConnectionString="<%$ ConnectionStrings:tentamendb %>" DeleteCommand="DELETE FROM [tentamen] WHERE [id] = @id" InsertCommand="INSERT INTO [tentamen] ([examinator_id], [kurs], [namn], [rubrik], [beskrivning], [maxtid], [godkandprocent], [starttid], [sluttid]) VALUES (@examinator_id, @kurs, @namn, @rubrik, @beskrivning, @maxtid, @godkandprocent, @starttid, @sluttid)" SelectCommand="SELECT * FROM [tentamen] WHERE ([examinator_id] = @examinator_id)" UpdateCommand="UPDATE [tentamen] SET [examinator_id] = @examinator_id, [kurs] = @kurs, [namn] = @namn, [rubrik] = @rubrik, [beskrivning] = @beskrivning, [maxtid] = @maxtid, [godkandprocent] = @godkandprocent, [starttid] = @starttid, [sluttid] = @sluttid WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="userid" Name="examinator_id" PropertyName="Value" Type="String" />
            <asp:Parameter Name="kurs" Type="String" />
            <asp:Parameter Name="namn" Type="String" />
            <asp:Parameter Name="rubrik" />
            <asp:Parameter Name="beskrivning" Type="String" />
            <asp:Parameter Name="maxtid" Type="Int32" />
            <asp:Parameter Name="godkandprocent" Type="Int32" />
            <asp:Parameter Name="starttid" Type="DateTime" />
            <asp:Parameter Name="sluttid" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="userid" Name="examinator_id" PropertyName="Value" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="examinator_id" Type="String" />
            <asp:Parameter Name="kurs" Type="String" />
            <asp:Parameter Name="namn" Type="String" />
            <asp:Parameter Name="rubrik" />
            <asp:Parameter Name="beskrivning" Type="String" />
            <asp:Parameter Name="maxtid" Type="Int32" />
            <asp:Parameter Name="godkandprocent" Type="Int32" />
            <asp:Parameter Name="starttid" Type="DateTime" />
            <asp:Parameter Name="sluttid" Type="DateTime" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsTentamenId" runat="server" ConnectionString="<%$ ConnectionStrings:tentamendb %>" DeleteCommand="DELETE FROM [tentamen] WHERE [id] = @id" InsertCommand="INSERT INTO [tentamen] ([examinator_id], [kurs], [namn], [rubrik] [beskrivning], [maxtid], [godkandprocent], [starttid], [sluttid]) VALUES (@examinator_id, @kurs, @namn, @rubrik, @beskrivning, @maxtid, @godkandprocent, @starttid, @sluttid)" SelectCommand="SELECT * FROM [tentamen] WHERE ([id] = @id)" UpdateCommand="UPDATE [tentamen] SET [kurs] = @kurs, [namn] = @namn, [rubrik] = @rubrik, [beskrivning] = @beskrivning, [maxtid] = @maxtid, [godkandprocent] = @godkandprocent, [starttid] = @starttid, [sluttid] = @sluttid WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="examinator_id" Type="String" />
            <asp:Parameter Name="kurs" Type="String" />
            <asp:Parameter Name="namn" Type="String" />
            <asp:Parameter Name="rubrik" />
            <asp:Parameter Name="beskrivning" Type="String" />
            <asp:Parameter Name="maxtid" Type="Int32" />
            <asp:Parameter Name="godkandprocent" Type="Int32" />
            <asp:Parameter Name="starttid" Type="DateTime" />
            <asp:Parameter Name="sluttid" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="aktivTentamen" Name="id" PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="kurs" Type="String" />
            <asp:Parameter Name="namn" Type="String" />
            <asp:Parameter Name="rubrik" />
            <asp:Parameter Name="beskrivning" Type="String" />
            <asp:Parameter Name="maxtid" Type="Int32" />
            <asp:Parameter Name="godkandprocent" Type="Int32" />
            <asp:Parameter Name="starttid" Type="DateTime" />
            <asp:Parameter Name="sluttid" Type="DateTime" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsUppgiftTentamenId" runat="server" ConnectionString="<%$ ConnectionStrings:tentamendb %>" DeleteCommand="DELETE FROM [uppgift] WHERE [id] = @id" InsertCommand="INSERT INTO [uppgift] ([tentamen_id], [nummer], [rubrik], [text], [maxpoang]) VALUES (@tentamen_id, @nummer, @rubrik, @text, @maxpoang)" SelectCommand="SELECT * FROM [uppgift] WHERE ([tentamen_id] = @tentamen_id)" UpdateCommand="UPDATE [uppgift] SET [nummer] = @nummer, [rubrik] = @rubrik, [text] = @text, [maxpoang] = @maxpoang WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="aktivTentamen" Name="tentamen_id" PropertyName="Value" Type="Int32" />
            <asp:Parameter Name="nummer" Type="Int32" />
            <asp:Parameter Name="rubrik" Type="String" />
            <asp:Parameter Name="text" Type="String" />
            <asp:Parameter Name="maxpoang" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="aktivTentamen" Name="tentamen_id" PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nummer" Type="Int32" />
            <asp:Parameter Name="rubrik" Type="String" />
            <asp:Parameter Name="text" Type="String" />
            <asp:Parameter Name="maxpoang" Type="Int32" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsBesvaradTentamen" runat="server" ConnectionString="<%$ ConnectionStrings:tentamendb %>" DeleteCommand="DELETE FROM [besvaradtentamen] WHERE [id] = @id" InsertCommand="INSERT INTO [besvaradtentamen] ([tentamen_id], [student_id], [paborjad], [avslutad]) VALUES (@tentamen_id, @student_id, @paborjad, @avslutad)" SelectCommand="SELECT * FROM [besvaradtentamen] WHERE ([tentamen_id] = @tentamen_id)" UpdateCommand="UPDATE [besvaradtentamen] SET [tentamen_id] = @tentamen_id, [student_id] = @student_id, [paborjad] = @paborjad, [avslutad] = @avslutad, [granskad] = @granskad WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="aktivTentamen" Name="tentamen_id" PropertyName="Value" Type="Int32" />
            <asp:Parameter Name="student_id" Type="String" />
            <asp:Parameter Name="paborjad" Type="DateTime" />
            <asp:Parameter Name="avslutad" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="aktivTentamen" Name="tentamen_id" PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="tentamen_id" Type="Int32" />
            <asp:Parameter Name="student_id" Type="String" />
            <asp:Parameter Name="paborjad" Type="DateTime" />
            <asp:Parameter Name="avslutad" Type="DateTime" />
            <asp:Parameter Name="granskad" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsAktivBesvaradTentamenUppgifter" runat="server" ConnectionString="<%$ ConnectionStrings:tentamendb %>" SelectCommand="SELECT besvaraduppgift.*, uppgift.* FROM uppgift INNER JOIN besvaraduppgift ON uppgift.id = besvaraduppgift.uppgift_id WHERE (besvaraduppgift.besvaradtentamen_id = @besvaradtentamen_id)" UpdateCommand="UPDATE besvaraduppgift SET poang = @poang, kommentar = @kommentar WHERE (id = @id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="aktivBesvaradTentamen" Name="besvaradtentamen_id" PropertyName="Value" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="poang" />
                <asp:Parameter Name="kommentar" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <asp:HiddenField ID="userid" runat="server" />
    <asp:HiddenField ID="aktivTentamen" runat="server" />
        <asp:HiddenField ID="aktivBesvaradTentamen" runat="server" />
                <asp:ScriptManager ID="ScriptManagerRedigeraTentamen" runat="server">
                </asp:ScriptManager>
        <asp:MultiView ID="mvTentamen" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewTentamen" runat="server">
                <h1>Mina tentor</h1>
                <p>
                    &nbsp;</p>
                <asp:UpdatePanel ID="upTentamen" runat="server">
                    <ContentTemplate>
                        <div class="nytentamen">
                            <asp:FormView ID="fwNyTentamen" runat="server" DataKeyNames="id" DataSourceID="dsTentamen" DefaultMode="Insert" Width="100%">
                                <InsertItemTemplate>
                                    <br />
                                    <table style="width:100%;">
                                        <tr>
                                            <td>Kurs</td>
                                            <td>
                                                <asp:TextBox ID="kursTextBox" runat="server" CssClass="form-control" Text='<%# Bind("kurs") %>' />
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="kursTextBox" CssClass="validator" ErrorMessage="Fyll i fältet" ValidationGroup="nytentamen">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Moment</td>
                                            <td>
                                                <asp:TextBox ID="namnTextBox" runat="server" CssClass="form-control" Text='<%# Bind("namn") %>' />
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="namnTextBox" CssClass="validator" ErrorMessage="Fyll i fältet" ValidationGroup="nytentamen">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Rubrik</td>
                                            <td>
                                                <asp:TextBox ID="rubrikTextBox" runat="server" CssClass="form-control" Text='<%# Bind("rubrik") %>' />
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="rubrikTextBox" CssClass="validator" ErrorMessage="Fyll i fältet" ValidationGroup="nytentamen">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Beskrivning</td>
                                            <td>
                                                <asp:TextBox ID="beskrivningTextBox" runat="server" CssClass="form-control" Text='<%# Bind("beskrivning") %>' TextMode="MultiLine" />
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="beskrivningTextBox" CssClass="validator" ErrorMessage="Fyll i fältet" ValidationGroup="nytentamen">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Maxtid (min)</td>
                                            <td>
                                                <asp:TextBox ID="maxtidTextBox" runat="server" CssClass="form-control" Text='<%# Bind("maxtid") %>' />
                                            </td>
                                            <td>
                                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="maxtidTextBox" CssClass="validator" ErrorMessage="RangeValidator" MaximumValue="900" MinimumValue="1" SetFocusOnError="True" Type="Integer" ValidationGroup="nytentamen">Måste vara ett heltal mellan 1 och 900</asp:RangeValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Öppnas</td>
                                            <td>
                                                <asp:TextBox ID="starttidTextBox" runat="server" CssClass="form-control" Text='<%# Bind("starttid") %>' />
                                                <cc1:CalendarExtender ID="starttidTextBox_CalendarExtender" runat="server" BehaviorID="starttidTextBox_CalendarExtender" DaysModeTitleFormat="yyyy-MM-dd hh:mm:ss" FirstDayOfWeek="Monday" Format="yyyy-MM-dd hh:mm:ss" TargetControlID="starttidTextBox" TodaysDateFormat="yyyy-MM-dd hh:mm:ss" />
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="starttidTextBox" CssClass="validator" ErrorMessage="Fyll i fältet" ValidationGroup="nytentamen">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="regex1" runat="server" ControlToValidate="starttidTextBox" CssClass="validator" ErrorMessage="Måste vara datum och tid" ValidationExpression="^(19[0-9]{2}|[2-9][0-9]{3})-((0(1|3|5|7|8)|10|12)-(0[1-9]|1[0-9]|2[0-9]|3[0-1])|(0(4|6|9)|11)-(0[1-9]|1[0-9]|2[0-9]|30)|(02)-(0[1-9]|1[0-9]|2[0-9]))\x20(0[0-9]|1[0-9]|2[0-3])(:[0-5][0-9]){2}$" ValidationGroup="nytentamen"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Stängs</td>
                                            <td>
                                                <asp:TextBox ID="sluttidTextBox" runat="server" CssClass="form-control" Text='<%# Bind("sluttid") %>' />
                                                <cc1:CalendarExtender ID="sluttidTextBox_CalendarExtender" runat="server" BehaviorID="sluttidTextBox_CalendarExtender" DaysModeTitleFormat="yyyy-MM-dd hh:mm:ss" FirstDayOfWeek="Monday" Format="yyyy-MM-dd hh:mm:ss" TargetControlID="sluttidTextBox" TodaysDateFormat="yyyy-MM-dd hh:mm:ss" />
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="sluttidTextBox" CssClass="validator" ErrorMessage="Fyll i fältet" ValidationGroup="nytentamen">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="regex2" runat="server" ControlToValidate="sluttidTextBox" CssClass="validator" ErrorMessage="Måste vara datum och tid" ValidationExpression="^(19[0-9]{2}|[2-9][0-9]{3})-((0(1|3|5|7|8)|10|12)-(0[1-9]|1[0-9]|2[0-9]|3[0-1])|(0(4|6|9)|11)-(0[1-9]|1[0-9]|2[0-9]|30)|(02)-(0[1-9]|1[0-9]|2[0-9]))\x20(0[0-9]|1[0-9]|2[0-3])(:[0-5][0-9]){2}$" ValidationGroup="nytentamen"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>&nbsp;<asp:Button ID="btnSkapaTentamen" runat="server" CommandName="Insert" CssClass="btn btn-success" Text="Skapa tentamen" ValidationGroup="nytentamen" />
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                    <br />
                                </InsertItemTemplate>
                            </asp:FormView>
                        </div>
                        <br />
                        <asp:GridView ID="gvTentamen" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" DataKeyNames="id" DataSourceID="dsTentamen" OnRowCommand="gvTentamen_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="kurs" HeaderText="Kurs" SortExpression="kurs" />
                                <asp:BoundField DataField="namn" HeaderText="Moment" SortExpression="namn" />
                                <asp:BoundField DataField="starttid" HeaderText="Öppnas" SortExpression="starttid" />
                                <asp:BoundField DataField="sluttid" HeaderText="Stängs" SortExpression="sluttid" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnRedigeraTentamen" runat="server" CausesValidation="False" CommandArgument='<%# Bind("id") %>' CommandName="RedigeraTentamen" CssClass="btn btn-primary">Hantera</asp:LinkButton>
                                        &nbsp;</span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnTaBortTentamen" runat="server" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return tabort()">Ta bort</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                Du har inte skapat någon tentamen än.
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="gvTentamen" />
                    </Triggers>
                </asp:UpdatePanel>

             
                







                <br />


            </asp:View>
            <asp:View ID="viewUppgift" runat="server">
                <h1>Hantera tentamen</h1>
                <asp:UpdatePanel ID="upRedigeraTentamen" runat="server">
                    <ContentTemplate>
                        <asp:DetailsView ID="dvTentamen" runat="server" AutoGenerateRows="False" CssClass="table table-striped" DataKeyNames="id" DataSourceID="dsTentamenId" Height="50px" Width="100%">
                            <Fields>
                                <asp:TemplateField HeaderText="Kurs" SortExpression="kurs">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbKurs" runat="server" CssClass="form-control" Text='<%# Bind("kurs") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfRedigeraKurs" runat="server" ControlToValidate="tbKurs" CssClass="validator" ErrorMessage="Fältet måste fyllas i!" ValidationGroup="redigeratentamen"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("kurs") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("kurs") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Moment" SortExpression="namn">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbNamn" runat="server" CssClass="form-control" Text='<%# Bind("namn") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfRedigeraNamn" runat="server" ControlToValidate="tbNamn" CssClass="validator" ErrorMessage="Fältet måste fyllas i!" ValidationGroup="redigeratentamen"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("namn") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("namn") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rubrik" SortExpression="rubrik">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbRubrik" runat="server" CssClass="form-control" Text='<%# Bind("rubrik") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfRedigeraRubrik" runat="server" ControlToValidate="tbRubrik" CssClass="validator" ErrorMessage="Fältet måste fyllas i!" ValidationGroup="redigeratentamen"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("rubrik") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("rubrik") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Beskrivning" SortExpression="beskrivning">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbBeskrivning" runat="server" CssClass="form-control" Height="100px" Text='<%# Bind("beskrivning") %>' TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfRedigeraBeskrivning" runat="server" ControlToValidate="tbBeskrivning" CssClass="validator" ErrorMessage="Fältet måste fyllas i!" ValidationGroup="redigeratentamen"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("beskrivning") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("beskrivning") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Maxtid (min)" SortExpression="maxtid">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbMaxtid" runat="server" CssClass="form-control" MaxLength="4" Text='<%# Bind("maxtid") %>' Width="60px"></asp:TextBox>
                                        <asp:RangeValidator ID="rvRedigeraMaxtid" runat="server" ControlToValidate="tbMaxtid" CssClass="validator" ErrorMessage="RangeValidator" MaximumValue="900" MinimumValue="1" SetFocusOnError="True" Type="Integer" ValidationGroup="redigeratentamen">Måste vara ett heltal mellan 1 och 900</asp:RangeValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("maxtid") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("maxtid") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Öppnas" SortExpression="starttid">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbStarttid" runat="server" CssClass="form-control" Text='<%# Bind("starttid") %>'></asp:TextBox>
                                        <cc1:CalendarExtender ID="tbStarttid_CalendarExtender" runat="server" BehaviorID="tbStarttid_CalendarExtender" DaysModeTitleFormat="yyyy-MM-dd hh:mm:ss" FirstDayOfWeek="Monday" Format="yyyy-MM-dd hh:mm:ss" TargetControlID="tbStarttid" TodaysDateFormat="yyyy-MM-dd hh:mm:ss" />
                                        <asp:RequiredFieldValidator ID="rfRedigeraStarttid" runat="server" ControlToValidate="tbStarttid" CssClass="validator" ErrorMessage="Fältet måste fyllas i!" ValidationGroup="redigeratentamen" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regex3" runat="server" ControlToValidate="tbStarttid" CssClass="validator" ErrorMessage="Måste vara datum och tid" ValidationExpression="^(19[0-9]{2}|[2-9][0-9]{3})-((0(1|3|5|7|8)|10|12)-(0[1-9]|1[0-9]|2[0-9]|3[0-1])|(0(4|6|9)|11)-(0[1-9]|1[0-9]|2[0-9]|30)|(02)-(0[1-9]|1[0-9]|2[0-9]))\x20(0[0-9]|1[0-9]|2[0-3])(:[0-5][0-9]){2}$" ValidationGroup="redigeratentamen"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("starttid") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("starttid") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Stängs" SortExpression="sluttid">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbSluttid" runat="server" CssClass="form-control" Text='<%# Bind("sluttid") %>'></asp:TextBox>
                                        <cc1:CalendarExtender ID="tbSluttid_CalendarExtender" runat="server" BehaviorID="tbSluttid_CalendarExtender" DaysModeTitleFormat="yyyy-MM-dd hh:mm:ss" FirstDayOfWeek="Monday" Format="yyyy-MM-dd hh:mm:ss" TargetControlID="tbSluttid" TodaysDateFormat="yyyy-MM-dd hh:mm:ss" />
                                        <asp:RequiredFieldValidator ID="rfRedigeraSluttid" runat="server" ControlToValidate="tbSluttid" CssClass="validator" ErrorMessage="Fältet måste fyllas i!" ValidationGroup="redigeratentamen" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regex4" runat="server" ControlToValidate="tbSluttid" CssClass="validator" ErrorMessage="Måste vara datum och tid" ValidationExpression="^(19[0-9]{2}|[2-9][0-9]{3})-((0(1|3|5|7|8)|10|12)-(0[1-9]|1[0-9]|2[0-9]|3[0-1])|(0(4|6|9)|11)-(0[1-9]|1[0-9]|2[0-9]|30)|(02)-(0[1-9]|1[0-9]|2[0-9]))\x20(0[0-9]|1[0-9]|2[0-3])(:[0-5][0-9]){2}$" ValidationGroup="redigeratentamen"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("sluttid") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("sluttid") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-primary" Text="Spara" ValidationGroup="redigeratentamen" />
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-danger" Text="Avbryt" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="btnRedigeraTentamen" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary" Text="Redigera" ValidationGroup="redigeratentamen" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <h2>Uppgifter</h2>

                <asp:UpdatePanel ID="upUppgifter" runat="server">
                    <ContentTemplate>
                        <div class="nyuppgift">
                            <asp:FormView ID="fvNyUppgift" runat="server" DataKeyNames="id" DataSourceID="dsUppgiftTentamenId" DefaultMode="Insert" Width="100%">
                                <InsertItemTemplate>
                                    <table style="width:100%;">
                                        <tr>
                                            <td>Rubrik</td>
                                            <td>
                                                <asp:TextBox ID="tbRubrik" runat="server" CssClass="form-control" Text='<%# Bind("rubrik") %>' />
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbRubrik" CssClass="validator" ErrorMessage="Fyll i fältet" ValidationGroup="nyuppgift">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Text</td>
                                            <td>
                                                <asp:TextBox ID="tbText" runat="server" CssClass="form-control" Height="90px" Text='<%# Bind("text") %>' TextMode="MultiLine" />
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbText" CssClass="validator" ErrorMessage="Fyll i fältet" ValidationGroup="nyuppgift">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Maxpoäng</td>
                                            <td>
                                                <asp:TextBox ID="tbMaxpoang" runat="server" CssClass="form-control" MaxLength="4" Text='<%# Bind("maxpoang") %>' Width="60px" />
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbMaxpoang" CssClass="validator" ErrorMessage="Värde måste finnas" ValidationGroup="nyuppgift">*</asp:RequiredFieldValidator>
                                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbMaxpoang" CssClass="validator" ErrorMessage="RangeValidator" MaximumValue="900" MinimumValue="1" Type="Integer" ValidationGroup="nyuppgift">Måste vara ett heltal mellan 1 och 900</asp:RangeValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:Button ID="btnLaggTillUppgift" runat="server" CommandName="Insert" CssClass="btn btn-success" Text="Lägg till uppgift" ValidationGroup="nyuppgift" />
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                            </asp:FormView>
                        </div>
                        <br />
                        <asp:GridView ID="gvUppgift" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" DataKeyNames="id" DataSourceID="dsUppgiftTentamenId" OnDataBound="gvUppgift_DataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="#" SortExpression="nummer">
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Uppgift" SortExpression="rubrik">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbRubrik" runat="server" CssClass="form-control" Text='<%# Bind("rubrik") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbRubrik" CssClass="validator" ErrorMessage="Fältet måste fyllas i!" ValidationGroup="redigerauppgift"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="tbText" runat="server" CssClass="form-control" Height="120px" Text='<%# Bind("text") %>' TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbText" CssClass="validator" ErrorMessage="Fältet måste fyllas i!" ValidationGroup="redigerauppgift"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <h4>
                                            <asp:Label ID="lblRubrik" runat="server" Text='<%# Bind("rubrik") %>'></asp:Label>
                                        </h4>
                                        <asp:Label ID="lblText" runat="server" Text='<%# Bind("text") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Maxpoäng" SortExpression="maxpoang">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbMaxpoang" runat="server" CssClass="form-control" MaxLength="4" Text='<%# Bind("maxpoang") %>' Width="60px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbMaxpoang" CssClass="validator" Display="Dynamic" ErrorMessage="Fältet måste fyllas i!" ValidationGroup="redigerauppgift"></asp:RequiredFieldValidator>
                                        &nbsp;<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbMaxpoang" CssClass="validator" ErrorMessage="RangeValidator" MaximumValue="900" MinimumValue="1" Type="Integer" ValidationGroup="redigerauppgift">Måste vara ett heltal mellan 1 och 900</asp:RangeValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("maxpoang") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-primary" Text="Spara" ValidationGroup="redigerauppgift" />
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-danger" Text="Avbryt" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="btnRedigeraUppgift" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary" Text="Redigera" ValidationGroup="redigerauppgift" />
                                        &nbsp;
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnTabortUppgift" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return tabort()" Text="Ta bort" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                Det finns inga uppgifter i denna tentamen.
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <h2>Studenter</h2>
                <asp:UpdatePanel ID="upStudenter" runat="server">
                    <ContentTemplate>
                        <div class="laggtillstudent">
                            <asp:FormView ID="fvKopplaStudent" runat="server" DataKeyNames="id" DataSourceID="dsBesvaradTentamen" DefaultMode="Insert" OnDataBound="fvKopplaStudent_DataBound" Width="100%">
                                <EditItemTemplate>
                                    id:
                                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                    <br />
                                    tentamen_id:
                                    <asp:TextBox ID="tentamen_idTextBox" runat="server" Text='<%# Bind("tentamen_id") %>' />
                                    <br />
                                    student_id:
                                    <asp:TextBox ID="student_idTextBox" runat="server" Text='<%# Bind("student_id") %>' />
                                    <br />
                                    paborjad:
                                    <asp:TextBox ID="paborjadTextBox" runat="server" Text='<%# Bind("paborjad") %>' />
                                    <br />
                                    avslutad:
                                    <asp:TextBox ID="avslutadTextBox" runat="server" Text='<%# Bind("avslutad") %>' />
                                    <br />
                                    granskad:
                                    <asp:TextBox ID="granskadTextBox" runat="server" Text='<%# Bind("granskad") %>' />
                                    <br />
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <table style="width:100%;">
                                        <tr>
                                            <td>Studenter</td>
                                            <td>
                                                <asp:ListBox ID="lbStudenter" runat="server" CssClass="form-control" DataSource='<%# Bind("student_id") %>' Height="150px" SelectedValue='<%# Bind("student_id") %>'></asp:ListBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="lbStudenter" CssClass="validator" ErrorMessage="Student måste väljas!" InitialValue="" ValidationGroup="laggtillstudent"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>
                                                <asp:Button ID="btnLaggTillStudent" runat="server" CommandName="Insert" CssClass="btn btn-success" Text="Lägg till student" ValidationGroup="laggtillstudent" />
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    id:
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                    <br />
                                    tentamen_id:
                                    <asp:Label ID="tentamen_idLabel" runat="server" Text='<%# Bind("tentamen_id") %>' />
                                    <br />
                                    student_id:
                                    <asp:Label ID="student_idLabel" runat="server" Text='<%# Bind("student_id") %>' />
                                    <br />
                                    paborjad:
                                    <asp:Label ID="paborjadLabel" runat="server" Text='<%# Bind("paborjad") %>' />
                                    <br />
                                    avslutad:
                                    <asp:Label ID="avslutadLabel" runat="server" Text='<%# Bind("avslutad") %>' />
                                    <br />
                                    granskad:
                                    <asp:Label ID="granskadLabel" runat="server" Text='<%# Bind("granskad") %>' />
                                    <br />
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                                </ItemTemplate>
                            </asp:FormView>
                        </div>
                        <br />
                        <asp:GridView ID="gvKoppladeStudenter" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" DataKeyNames="id" DataSourceID="dsBesvaradTentamen" OnRowCommand="gvKoppladeStudenter_RowCommand" OnRowDataBound="gvKoppladeStudenter_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="student_id" HeaderText="Student" SortExpression="student_id" />
                                <asp:BoundField DataField="paborjad" HeaderText="Påbörjad" SortExpression="paborjad" />
                                <asp:BoundField DataField="avslutad" HeaderText="Avslutad" SortExpression="avslutad" />
                                <asp:BoundField DataField="granskad" HeaderText="Rättad" SortExpression="granskad" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="btnGranska" runat="server" CausesValidation="False" CommandArgument='<%# Bind("id") %>' CommandName="GranskaTentamen" CssClass="btn btn-primary" Enabled="False" Text="Rätta" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnGranskad" runat="server" CommandArgument='<%# Bind("id") %>' CommandName="MarkeraGranskad" CssClass="btn btn-primary" Enabled="False" Text="Markera som rättad" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="btnTaBortStudent" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return tabort()" Text="Ta bort" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                Det finns inga studenter kopplade till tentan.
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <br />
                        <asp:HyperLink ID="HyperLink7" runat="server" CssClass="btn btn-success" NavigateUrl="~/Examinator/RedigeraTentamen.aspx">Spara och gå tillbaka</asp:HyperLink>
                        <br />
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="gvKoppladeStudenter" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
            </asp:View>
            <asp:View ID="viewGranskaUppgift" runat="server">
                

                <h1>Fråga
                    <asp:Label ID="lblNuvarandeUppgift" runat="server"></asp:Label>
                    av
                    <asp:Label ID="lblbAntalUppgifter" runat="server"></asp:Label>
                </h1>
                    <p>
                        <asp:FormView ID="fwUppgiften" runat="server" AllowPaging="True" DataKeyNames="id,id1" DataSourceID="dsAktivBesvaradTentamenUppgifter" DefaultMode="Edit" OnItemCreated="fwUppgiften_ItemCreated" OnPageIndexChanging="fwUppgiften_PageIndexChanging" Width="100%">
                            <EditItemTemplate>
                                <h3>
                                    <asp:Label ID="rubrikLabel" runat="server" Text='<%# Bind("rubrik") %>' />
                                </h3>
                                <asp:Label ID="textLabel" runat="server" Text='<%# Bind("text") %>' />
                                <br />
                                <br />
                                Svar:<br />
                                <asp:TextBox ID="tbSvar" runat="server" CssClass="form-control" Height="150px" ReadOnly="True" Text='<%# Bind("svar") %>' TextMode="MultiLine"></asp:TextBox>
                                Maxpoäng:
                                <asp:Label ID="maxpoangLabel" runat="server" Text='<%# Bind("maxpoang") %>' />
                                <br />
                                <br />
                                Poäng:
                                <table>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="poangTextBox" runat="server" CssClass="form-control" MaxLength="4" Text='<%# Bind("poang") %>' Width="60px" />
                                        </td>
                                        <td>
                                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="poangTextBox" CssClass="validator" ErrorMessage="Värdet måste vara ett heltal mellan noll och maxpoäng" MaximumValue='<%# Bind("maxpoang") %>' MinimumValue="0" Type="Integer"></asp:RangeValidator>
                                            <br />
                                            Värdet måste vara ett heltal mellan noll och maxpoäng!</td>
                                    </tr>
                                </table>
                                <br />
                                Kommentar:<br />
                                <asp:TextBox ID="kommentarTextBox" runat="server" CssClass="form-control" Height="150px" Text='<%# Bind("kommentar") %>' TextMode="MultiLine" />
                            </EditItemTemplate>
                            <PagerStyle CssClass="bs-pagination" />
                        </asp:FormView>
                </p>
                <p>
                    <asp:Button ID="btnBack" runat="server" CssClass="btn btn-default" OnClick="btnBack_Click" Text="Föregående fråga" />
                    &nbsp;<asp:Button ID="btnNext" runat="server" CssClass="btn btn-default" OnClick="btnNext_Click" Text="Nästa fråga" />
                </p>
                <p>
                    <asp:Button ID="btnAvbryt" runat="server" CssClass="btn btn-success" OnClick="btnAvbryt_Click" Text="Spara och gå tillbaka" />
                </p>
            </asp:View>
        </asp:MultiView>
            </asp:Content>

