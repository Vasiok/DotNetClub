<%@ Page Title="" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="WebAssignment.LoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="server">
    Login / Sign Up
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

<asp:Content ID="Content5" ContentPlaceHolderID="LoginPlaceHolder" runat="server">
                    <li runat="server" id="adminOnly" visible="false"><a href="AdminOnly.aspx">Admin</a></li>
                    <li class="active" runat="server" id="loginON"><a href="LoginPage.aspx">Login</a></li>
                    <li class="active" runat="server" id="loginOFF"><a href="LoginPage.aspx">Logout</a></li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SideBarPlaceHolder" runat="server">
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

<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <!-- ***PLACE HOLDER MAIN CONTENT*** -->
    <div class="row moveInEmma"> 
        <p><asp:Label ID="WelcomeLabel" runat="server" Text="Label"></asp:Label> </p>
    </div> <!-- end row -->

    <!-- ************ Login as a User ************ -->
    <div runat="server" class="row" id="loginHere">
        <div class="col-md-12 form-horizontal">
                <div class="form-group">
                    <label for="tbUsername" class="col-sm-2 control-label">Username</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="tbUsername" placeholder="Username" runat="server"></asp:TextBox>
                        <!-- Field Validation-->
                        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You must fill in Username" ControlToValidate="tbUsername"></asp:RequiredFieldValidator></p>
                    </div>
                </div> <!-- end form-group -->

                <div class="form-group">
                    <label for="tbPassword" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="tbPassword" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
                        <!-- Field Validation-->
                        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You must fill in Password" ControlToValidate="tbUsername"></asp:RequiredFieldValidator></p>
                    </div>
                </div> <!-- end form-group -->

                <div class="form-group">
                    <asp:Button ID="btnSubmit" CssClass="btn btn-default EmmasButton" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </div> <!-- end form-group -->

         </div> <!-- end col-md-12 form-horizontal -->
    </div> <!-- end row -->

    <!-- ************ Button to Register ************ -->
    <div runat="server" class="row" id="Need2Registers">
                <div class="form-group">
                    <asp:Button ID="btnShow" CssClass="btn btn-default EmmasButton" runat="server" Text="Not Registered Yet?" OnClick="btnShow_Click" />
                </div> <!-- end form-group -->
    </div> <!-- end row -->

    <!-- ************ Register as a User ************ -->
    <div runat="server" class="row" id="register" visible="false">
        <div class="col-md-12 form-horizontal">
            <h1>Register</h1>
                <div class="form-group">
                    <label for="txtUsername" class="col-sm-2 control-label">Username</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtUsername" placeholder="Username" runat="server"></asp:TextBox>
                        <!-- Field Validation-->
                        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="You must fill in Username" ControlToValidate="txtUsername"></asp:RequiredFieldValidator></p>
                    </div>
                </div> <!-- end form-group -->

                <div class="form-group">
                    <label for="txtPassword" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtPassword" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
                        <!-- Field Validation-->
                        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="You must fill in Password" ControlToValidate="txtPassword"></asp:RequiredFieldValidator></p>
                    </div>
                </div> <!-- end form-group -->

                <div class="form-group">
                    <label for="txtPassword2" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtPassword2" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
                        <!-- Field Validation-->
                        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Passwords must match" ControlToValidate="txtPassword2"></asp:RequiredFieldValidator></p>
                    </div>
                </div> <!-- end form-group -->

                <div class="form-group">
                    <label for="txtFullName" class="col-sm-2 control-label">Full Name</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtFullName" placeholder="Full Name" runat="server"></asp:TextBox>
                        <!-- Field Validation-->
                        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="You must fill in Full Name" ControlToValidate="txtFullName"></asp:RequiredFieldValidator></p>
                    </div>
                </div> <!-- end form-group -->

                <div class="form-group">
                    <label for="txtPosition" class="col-sm-2 control-label">Position</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtPosition" placeholder="Position" runat="server"></asp:TextBox>
                        <!-- Field Validation-->
                        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="You must fill in Position" ControlToValidate="txtPosition"></asp:RequiredFieldValidator></p>
                    </div>
                </div> <!-- end form-group -->

                <div class="form-group">
                    <asp:Button ID="btnRegister" CssClass="btn btn-default EmmasButton" runat="server" Text="Register" OnClick="btnRegister_Click" />
                </div> <!-- end form-group -->

         </div> <!-- end col-md-12 form-horizontal -->
    </div> <!-- end row -->

<!-- *** END PLACE HOLDER MAIN CONTENT*** -->
</asp:Content>
