﻿<%@ Page Title="Administration Page" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="AdminOnly.aspx.cs" Inherits="WebAssignment.AdminOnly" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="server">
    Administration Page
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="MetaDescriptionPlaceHolder" runat="server">
    <asp:PlaceHolder id="MetaPlaceHolder" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="NavPlaceHolder" runat="server">
                    <li><a href="Default.aspx">Home</a></li>
                    <li><a href="AboutUs.aspx">About Us</a></li>
                    <li><a href="ResultsNFixtures.aspx">Results and Fixtures</a></li>
                    <li><a href="TeamProfiles.aspx">Team Profiles</a></li>
                    <li><a href="PitchInfo.aspx">Pitch Info</a></li>
                    <li><a href="JoinUs.aspx">Join Us</a></li>
                    <li><a href="ContactUs.aspx">Contact Us</a></li>
                    <li><a href="Gallery.aspx">Gallery</a></li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LoginPlaceHolder" runat="server">
                    <li class="active" runat="server" id="adminOnly"><a href="AdminOnly.aspx">Admin</a></li>
                    <li runat="server" id="loginON"><a href="LoginPage.aspx">Login</a></li>
                    <li runat="server" id="loginOFF"><a href="LoginPage.aspx">Logout</a></li>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SideBarPlaceHolder" runat="server">
    <!--***PLACE HOLDER SIDE BAR***-->
    <div class="row extraLength"> 
        <div class="sidebar-css">
                    <ul>
                        <li class="sidebar-label"><span class="underline">Quick Links</span></li>
                        <li><a href="TeamProfiles.aspx">Player Profiles</a></li>
                        <li><a href="ContactUs.aspx">Contact Us</a></li>
                        <li><a href="JoinUs.aspx">Join Us</a></li>
                        <li><a href="ResultsNFixtures.aspx">Results</a></li>
				    </ul>
        </div> <!-- end sidebar-css-->
    </div> <!-- end row-->

<!--***END PLACE HOLDER SIDE BAR***-->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
 <!-- *** PLACE HOLDER MAIN CONTENT*** -->
    <div class="row moveInEmma">
        <p><asp:Label ID="WelcomeLabel" runat="server" Text="Label"></asp:Label> </p>
    </div><!-- end div row-->

    <!-- ************ Grid View for Admin ************ -->
    <div runat="server" class="row moveInEmma" id="divAdminView">
        <div class="adminDgv">
            <h1>List of all Users</h1>
            <asp:GridView CssClass="table table-bordered" ID="GridView1" runat="server" AutoGenerateDeleteButton="true" OnRowDeleted="GridView1_RowDeleted"></asp:GridView>
        </div> <!-- end adminDgv -->
    </div> <!-- end row -->

    <!-- ************* Change Users Access Level ************* -->
    <div runat="server" class="row moveInEmma" id="divChangeAccess">
        <div class="adminDgv">
            <h1>Change Users Access Level</h1>

            <div class="form-group">
                <label for="txtInputUserID" class="col-sm-2 control-label">User ID</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtInputUserID" placeholder="UserID" runat="server"></asp:TextBox>
                    <!-- Field Validation-->
                    <p><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="You must fill in UserID" ControlToValidate="txtInputUserID"></asp:RequiredFieldValidator></p>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter correct ID numbers only" ControlToValidate="txtInputUserID"  ValidationExpression="^[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div> <!-- end form-group -->

            <div class="form-group">
                <asp:DropDownList ID="ddlAccessLevel" runat="server">
                    <asp:ListItem>level1</asp:ListItem>
                    <asp:ListItem>level2</asp:ListItem>
                    <asp:ListItem>level3</asp:ListItem>
                    <asp:ListItem>Guest</asp:ListItem>
                </asp:DropDownList>
            </div> <!-- end form-group -->

            <div class="form-group">
                    <asp:Button ID="btnChange" CssClass="btn btn-default EmmasButton" runat="server" Text="Change Access Level" OnClick="btnChange_Click" />
            </div> <!-- end form-group -->

        </div> <!-- end adminDgv -->
    </div> <!-- end row -->

    <!-- ************* Add Users to Team List ************* -->
    <div runat="server" class="row moveInEmma" id="divAddTeamPlayer">
        <div class="adminDgv">
            <h1>Add User to Team</h1>

            <div class="form-group">
                <label for="txtTeamUserID" class="col-sm-2 control-label">User ID:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtTeamUserID" placeholder="UserID" runat="server"></asp:TextBox>
                    <!-- Field Validation-->
                    <p><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You must fill in UserID" ControlToValidate="txtTeamUserID"></asp:RequiredFieldValidator></p>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter correct ID numbers only" ControlToValidate="txtTeamUserID"  ValidationExpression="^[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div> <!-- end form-group -->

            <div class="form-group">
                <label for="txtTeamFirstName" class="col-sm-2 control-label">First Name:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtTeamFirstName" placeholder="First Name" runat="server"></asp:TextBox>
                    <!-- Field Validation-->
                    <p><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You must fill in First Name" ControlToValidate="txtTeamFirstName"></asp:RequiredFieldValidator></p>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter a valid First name" ControlToValidate="txtTeamFirstName"  ValidationExpression="^([A-Z]{1}([a-z]*)?\s?([A-Z]{1}([a-z]*)?)?)[a-z]$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div> <!-- end form-group -->

            <div class="form-group">
                <label for="txtTeamLastName" class="col-sm-2 control-label">Last Name:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtTeamLastName" placeholder="Last Name" runat="server"></asp:TextBox>
                    <!-- Field Validation-->
                    <p><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="You must fill in Last Name" ControlToValidate="txtTeamLastName"></asp:RequiredFieldValidator></p>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please enter a valid Last name" ControlToValidate="txtTeamLastName"  ValidationExpression="^[A-Z]{1}[']?[a-z]*[']?[A-Za-z]*?[a-z]$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div> <!-- end form-group -->

            <div class="form-group">
                <label for="txtTeamDOB" class="col-sm-2 control-label">Date of Birth:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtTeamDOB" placeholder="DOB" runat="server"></asp:TextBox>
                    <!-- Field Validation-->
                    <p><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="You must fill in DOB" ControlToValidate="txtTeamDOB"></asp:RequiredFieldValidator></p>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Please enter correct date day/month/year" ControlToValidate="txtTeamDOB"  ValidationExpression="^[0-9m]{1,2}/[0-9d]{1,2}/[0-9y]{4}$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div> <!-- end form-group -->

            <div class="form-group">
                <label for="txtTeamAbout" class="col-sm-2 control-label">About Player:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtTeamAbout" placeholder="About" runat="server"></asp:TextBox>
                    <!-- Field Validation-->
                    <p><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="You must fill in About" ControlToValidate="txtTeamAbout"></asp:RequiredFieldValidator></p>                    
                </div>
            </div> <!-- end form-group -->

            <div class="form-group">
                <label for="txtTeamEmail" class="col-sm-2 control-label">Email:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtTeamEmail" placeholder="Email" runat="server"></asp:TextBox>
                    <!-- Field Validation-->
                    <p><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="You must fill in Email" ControlToValidate="txtTeamEmail"></asp:RequiredFieldValidator></p>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Please enter a valid email" ControlToValidate="txtTeamEmail"  ValidationExpression="([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div> <!-- end form-group -->

            <div class="form-group">
                <label for="txtTeamPhone" class="col-sm-2 control-label">Phone number:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtTeamPhone" placeholder="Phone number" runat="server"></asp:TextBox>
                    <!-- Field Validation-->
                    <p><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="You must fill in Phone Number" ControlToValidate="txtTeamPhone"></asp:RequiredFieldValidator></p>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Please enter a valid phone number in the format (0)00-0000000" ControlToValidate="txtTeamPhone"  ValidationExpression="^[0-9]{2,3}[-][0-9]{7}$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div> <!-- end form-group -->

            <div class="form-group">
                <label for="txtTeamadd1" class="col-sm-2 control-label">Address 1:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtTeamadd1" placeholder="Address 1" runat="server"></asp:TextBox>
                    <!-- Field Validation-->
                    <p><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="You must fill in Address 1" ControlToValidate="txtTeamadd1"></asp:RequiredFieldValidator></p>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Please enter a valid address" ControlToValidate="txtTeamadd1"  ValidationExpression="^[0-9A-Za-z][0-9A-Za-z'\s]*[a-z0-9]$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div> <!-- end form-group -->

            <div class="form-group">
                <label for="txtTeamadd2" class="col-sm-2 control-label">Address 2:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtTeamadd2" placeholder="Address 2" runat="server"></asp:TextBox>
                    <!-- Field Validation-->
                    <p><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="You must fill in Address 2" ControlToValidate="txtTeamadd2"></asp:RequiredFieldValidator></p>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="Please enter a valid address" ControlToValidate="txtTeamadd2"  ValidationExpression="^[0-9A-Za-z][0-9A-Za-z'\s]*[a-z0-9]$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div> <!-- end form-group -->

            <div class="form-group">
                <label for="txtTeamCity" class="col-sm-2 control-label">City:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtTeamCity" placeholder="City" runat="server"></asp:TextBox>
                    <!-- Field Validation-->
                    <p><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="You must fill in City" ControlToValidate="txtTeamCity"></asp:RequiredFieldValidator></p>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ErrorMessage="Please enter a valid city name Must Begin with capital" ControlToValidate="txtTeamCity"  ValidationExpression="^[A-Z][a-z]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div> <!-- end form-group -->

            <div class="form-group">
                    <asp:Button ID="btnAddPlayer" CssClass="btn btn-default EmmasButton" runat="server" Text="Add User to Team" OnClick="btnAddPlayer_Click" />
            </div> <!-- end form-group -->

        </div> <!-- end adminDgv -->
    </div> <!-- end row -->

<!-- *** END PLACE HOLDER MAIN CONTENT*** -->
</asp:Content>
