﻿<%@ Page Title="" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="ResultsNFixtures.aspx.cs" Inherits="WebAssignment.ResultsNFixtures" %>

<asp:Content ID="Content4" ContentPlaceHolderID="NavPlaceHolder" runat="server">
                    <li><a href="Default.aspx">Home</a></li>
                    <li><a href="AboutUs.aspx">About Us</a></li>
                    <li class="active"><a href="ResultsNFixtures.aspx">Results and Fixtures</a></li>
                    <li><a href="TeamProfiles.aspx">Team Profiles</a></li>
                    <li><a href="PitchInfo.aspx">Pitch Info</a></li>
                    <li><a href="JoinUs.aspx">Join Us</a></li>
                    <li><a href="ContactUs.aspx">Contact Us</a></li>
                    <li><a href="Gallery.aspx">Gallery</a></li>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LoginPlaceHolder" runat="server">
                    <li runat="server" id="adminOnly" visible="false"><a href="AdminOnly.aspx">Admin</a></li>
                    <li runat="server" id="loginON"><a href="LoginPage.aspx">Login</a></li>
                    <li runat="server" id="loginOFF"><a href="LoginPage.aspx">Logout</a></li>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="server">
Results and Fixtures
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="MetaDescriptionPlaceHolder" runat="server">
    <asp:PlaceHolder id="MetaPlaceHolder" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SideBarPlaceHolder" runat="server">
<!--***PLACE HOLDER SIDE BAR***-->

    <div class="row extraLength"> 
        <div class="sidebar-css">
                    <ul>
                        <li class="sidebar-label"><span class="underline">Quick Links</span></li>
                        <li><a href="TeamProfiles.aspx">Players Profiles</a></li>
                        <li><a href="ContactUs.aspx">Contact Us</a></li>
                        <li><a href="JoinUs.aspx">Join Us</a></li>
				    </ul>
        </div> <!-- end sidebar-css-->
    </div> <!-- end row-->

<!--***END PLACE HOLDER SIDE BAR***-->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<!--***PLACE HOLDER MAIN CONTENT ***-->
    <div class="row moveInEmma">
        <p><asp:Label ID="WelcomeLabel" runat="server" Text="Label"></asp:Label> </p>
    </div> <!-- end div row -->

    <div class="row moveInEmma" id="resultsPageResults">
        <div class="col-md-12 form-horizontal">
            <div class="page-header text-uppercase">
                <h1>Past and future games</h1>
            </div>
            <h2>Games Scores</h2>
            <asp:GridView class="table table-striped table-bordered" ID="dgvResults" runat="server" AutoGenerateDeleteButton="true" OnRowDeleting="dgvResults_RowDeleting">
            </asp:GridView>
         </div> <!-- end col-md-12 form-horizontal --> 
    </div><!-- end row -->

    <!--***XML BUTTON ***-->
    <div class="row">
        <div class="col-md-4">
            <div runat="server" id="btn4CoachXML" visible="false" class="row moveInEmma">
                <div class="form-group">
                    <asp:Button ID="btnXML" CssClass="btn btn-default EmmasButton" runat="server" Text="Export to XML" OnClick="btnXML_Click" />
                </div>
                <!-- end form-group -->
            </div>
            <!-- end row -->
            <!--***END XML BUTTON ***-->
        </div><!--end of col-md-4-->
        <div class="col-md-8">

        </div>
    </div><!--End of row-->

    <div class="row moveInEmma" id="resultsPageFixtures">
        <div class="col-md-12 form-horizontal">
            <h2>Future Games</h2>
            <asp:GridView class="table table-striped table-bordered" ID="dgvFixtures" runat="server" AutoGenerateDeleteButton="true" OnRowDeleting="dgvFixtures_RowDeleting" >
            </asp:GridView>
         </div> <!-- end col-md-12 form-horizontal -->
    </div><!-- end row -->

<div class="row" id="coachEditArea" runat="server" visible="false">
        
        <%--<div class="row" id="fixtureRemoveAre">
            <div class="col-md-1"></div>
            <div class="col-md-11">
                <div class="form-group">
                    <label for="txtContactID" class="col-sm-2 control-label">Enter Fixture ID to remove past fixtures</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtFixtureID" placeholder="Fixture ID" runat="server"></asp:TextBox>
                    </div>

                    <%-- <asp:Button ID="btnSeen" CssClass="btn btn-default EmmasButton" runat="server" Text="Seen"  />--%>
                   <%-- <asp:Button ID="btnDeleteFixture" CssClass="btn btn-default EmmasButton" runat="server" Text="Delete Fixture" OnClick="btnDeleteFixture_Click" />
                </div>
            </div>
            <!-- end form-group -->
        </div>  --%>    
<!--******************************************************************************************************************************************************************-->  
<!--***************************************************************ADD NEW FIXTURE************************************************************************************-->
<!--******************************************************************************************************************************************************************-->  
<div runat="server" class="row moveInEmma" id="divAddnewFixture">
        
    <div class="col-md-6">
        <div class="adminDgv">
            <h1>Add New Fixture</h1>

            <div class="form-group">
                <div class="row">
                    <label for="txtHomeTeam" class="col-sm-4 control-label">Home Team:</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtHomeTeam" placeholder="Home Team Name" runat="server" ValidationGroup="fixturesValidationGroup"></asp:TextBox>
                        <!-- Field Validation-->                        
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You must fill Home Team Name" ControlToValidate="txtHomeTeam" ValidationGroup="fixturesValidationGroup" Display="Dynamic"></asp:RequiredFieldValidator>                        
                        <!--Regex field validation-->                        
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter team name with words only" ControlToValidate="txtHomeTeam" ValidationGroup="fixturesValidationGroup" ValidationExpression="^[a-zA-Z]*(\s[a-zA-Z]*\s?([a-zA-Z]*)?)?$" Display="Dynamic"></asp:RegularExpressionValidator>                        
                    </div>
                </div>
                <div class="row">
                    <label for="txtAwayTeam" class="col-sm-4 control-label">Away Team:</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtAwayTeam" placeholder="Away Team Name" runat="server" ValidationGroup="fixturesValidationGroup"></asp:TextBox>
                        <!-- Field Validation-->                        
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You must provide Away Team Name" ControlToValidate="txtAwayTeam" ValidationGroup="fixturesValidationGroup" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter team name with words only" ControlToValidate="txtAwayTeam" ValidationGroup="fixturesValidationGroup" ValidationExpression="^[a-zA-Z]*(\s[a-zA-Z]*\s?([a-zA-Z]*)?)?$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row">
                    <label for="txtPitchName" class="col-sm-4 control-label">Pitch Name:</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtPitchName" placeholder="Pitch Name" runat="server" ValidationGroup="fixturesValidationGroup"></asp:TextBox>
                        <!-- Field Validation-->                        
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="You must provide Pitch Name" ControlToValidate="txtPitchName" ValidationGroup="fixturesValidationGroup" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter correct pitch name" ControlToValidate="txtPitchName" ValidationGroup="fixturesValidationGroup" ValidationExpression="^[0-9A-Za-z][0-9A-Za-z'\s]*[a-z0-9]$" Display="Dynamic"></asp:RegularExpressionValidator>                        
                    </div>
                </div>
                <div class="row">
                    <label for="txtDate" class="col-sm-4 control-label">Date:</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtDate" placeholder="Please enter date" runat="server" ValidationGroup="fixturesValidationGroup"></asp:TextBox>
                        <!-- Field Validation-->                        
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="You must provide a Date" ControlToValidate="txtDate" ValidationGroup="fixturesValidationGroup" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please enter correct date day/month/year" ControlToValidate="txtDate" ValidationGroup="fixturesValidationGroup" ValidationExpression="^[0-9m]{1,2}/[0-9d]{1,2}/[0-9y]{4}$" Display="Dynamic"></asp:RegularExpressionValidator>                        
                    </div>
                </div>
            </div>
            <!-- end form-group -->



            <div class="form-group">
                <asp:Button ID="btnAddFixture" CssClass="btn btn-default EmmasButton" runat="server" Text="Add New Fixture" OnClick="btnAddFixture_Click" ValidationGroup="fixturesValidationGroup"/>
            </div>
            <!-- end form-group -->

        </div>
        <!-- end adminDgv -->
    </div>
    <div class="col-md-6">
        <div class="adminDgv">
            <h1>Add New Results</h1>

            <div class="form-group">
                <div class="row">
                    <label for="txtHomeTeamResults" class="col-sm-4 control-label">Home Team:</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtHomeTeamResults" placeholder="Home Team Name" runat="server" ValidationGroup="scoresValidationGroup"></asp:TextBox>
                        <!-- Field Validation-->                        
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="You must fill Home Team Name" ControlToValidate="txtHomeTeamResults" ValidationGroup="scoresValidationGroup" Display="Dynamic"></asp:RequiredFieldValidator>                        
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Please enter team name using words" ControlToValidate="txtHomeTeamResults" ValidationGroup="scoresValidationGroup" ValidationExpression="^[a-zA-Z]*(\s[a-zA-Z]*\s?([a-zA-Z]*)?)?$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row">
                    <label for="txtAwayTeamResults" class="col-sm-4 control-label">Away Team:</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtAwayTeamResults" placeholder="Away Team Name" runat="server" ValidationGroup="scoresValidationGroup"></asp:TextBox>
                        <!-- Field Validation-->                        
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="You must provide Away Team Name" ControlToValidate="txtAwayTeamResults" ValidationGroup="scoresValidationGroup" Display="Dynamic"></asp:RequiredFieldValidator>                        
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Please enter team name using words" ControlToValidate="txtAwayTeamResults" ValidationGroup="scoresValidationGroup" ValidationExpression="^[a-zA-Z]*(\s[a-zA-Z]*\s?([a-zA-Z]*)?)?$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row">
                    <label for="txtScoreHome" class="col-sm-4 control-label">Score Home:</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtScoreHome" placeholder="Score Home" runat="server" ValidationGroup="scoresValidationGroup"></asp:TextBox>
                        <!-- Field Validation-->                        
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="You must provide Score" ControlToValidate="txtScoreHome" ValidationGroup="scoresValidationGroup" Display="Dynamic"></asp:RequiredFieldValidator>                        
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Please enter correct score using numbers" ControlToValidate="txtScoreHome" ValidationGroup="scoresValidationGroup" ValidationExpression="^[0-9]{1,2}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row">
                    <label for="txtScoreAway" class="col-sm-4 control-label">Score Away:</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtScoreAway" placeholder="Score Away" runat="server" ValidationGroup="scoresValidationGroup"></asp:TextBox>
                        <!-- Field Validation-->                        
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="You must provide a Score" ControlToValidate="txtScoreAway" ValidationGroup="scoresValidationGroup" Display="Dynamic"></asp:RequiredFieldValidator>                        
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Please enter correct score using numbers" ControlToValidate="txtScoreAway" ValidationGroup="scoresValidationGroup" ValidationExpression="^[0-9]{1,2}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row">
                    <label for="txtDate" class="col-sm-4 control-label">Date:</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtDateScores" placeholder="Please enter date" runat="server" ValidationGroup="scoresValidationGroup"></asp:TextBox>
                        <!-- Field Validation-->                        
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="You must provide a Date" ControlToValidate="txtDateScores" ValidationGroup="scoresValidationGroup" Display="Dynamic"></asp:RequiredFieldValidator>                        
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="Please enter correct date day/month/year" ControlToValidate="txtDateScores" ValidationGroup="scoresValidationGroup" ValidationExpression="^[0-9m]{1,2}/[0-9d]{1,2}/[0-9y]{4}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>
            <!-- end form-group -->



            <div class="form-group">
                <asp:Button ID="btnAddResult" CssClass="btn btn-default EmmasButton" runat="server" Text="Add New Score" ValidationGroup="scoresValidationGroup" OnClick="btnAddResult_Click"/>
            </div>
            <!-- end form-group -->

        </div>
        <!-- end adminDgv -->
    </div>
    </div> <!-- end row -->
    </div>




    
<!--***END PLACE HOLDER MAIN CONTENT ***-->
</asp:Content>