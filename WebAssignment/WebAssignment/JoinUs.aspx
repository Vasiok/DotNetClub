﻿<%@ Page Title="" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="JoinUs.aspx.cs" Inherits="WebAssignment.JoinUs" %>
<asp:Content ID="Content4" ContentPlaceHolderID="NavPlaceHolder" runat="server">
                    <li><a href="Default.aspx">Home</a></li>
                    <li><a href="AboutUs.aspx">About Us</a></li>
                    <li><a href="ResultsNFixtures.aspx">Results and Fixtures</a></li>
                    <li><a href="TeamProfiles.aspx">Team Profiles</a></li>
                    <li><a href="PitchInfo.aspx">Pitch Info</a></li>
                    <li class="active"><a href="JoinUs.aspx">Join Us</a></li>
                    <li><a href="ContactUs.aspx">Contact Us</a></li>
                    <li><a href="Gallery.aspx">Gallery</a></li>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LoginPlaceHolder" runat="server">
                    <li runat="server" id="adminOnly" visible="false"><a href="AdminOnly.aspx">Admin</a></li>
                    <li runat="server" id="loginON"><a href="LoginPage.aspx">Login</a></li>
                    <li runat="server" id="loginOFF"><a href="LoginPage.aspx">Logout</a></li>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="server">
Join Us
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
                        <li><a href="TeamProfiles.aspx">Player Profiles</a></li>
                        <li><a href="ContactUs.aspx">Contact Us</a></li>
                        <li><a href="AboutUs.aspx">About Us</a></li>
				    </ul>
        </div> <!-- end sidebar-css-->
    </div> <!-- end row-->

<!--***END PLACE HOLDER SIDE BAR***-->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <!-- ***PLACE HOLDER MAIN CONTENT*** -->

    <div class="row moveInEmma">
        <p><asp:Label ID="WelcomeLabel" runat="server" Text="Label"></asp:Label> </p>
    </div> <!-- end div row -->

    <!-- ************ Grid View for Coach ************ -->
    <div runat="server" class="row moveInEmma" id="divCoachView" visible="false">
        <div class="adminDgv">
            <h1>Join Us Enquiries Table</h1>
            <asp:GridView CssClass="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
        </div> <!-- end adminDgv -->

        <div class="form-group">
            <label for="txtEnquireID" class="col-sm-2 control-label">Enter Enquire ID to change Reply:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtEnquireID" placeholder="Enquire ID" runat="server"></asp:TextBox>
                </div>
            
            <asp:Button ID="btnReplied" CssClass="btn btn-default EmmasButton" runat="server" Text="Seen" OnClick="btnReplied_Click" />
            <asp:Button ID="btnNotReplied" CssClass="btn btn-default EmmasButton" runat="server" Text="Not Seen" OnClick="btnNotReplied_Click" />    
        </div> <!-- end form-group -->
    </div> <!-- end row -->
    <!-- ************ end Grid View for Coach ************ -->

    <!-- ************ default View ************ -->
    <div class="row moveInEmma" runat="server" id="defaultJoinUs" visible="true">
        <div class="col-md-12 form-horizontal">
            
                <div class="form-group">
                <label for="tbFullName" class="col-sm-2 control-label">Full Name</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="tbFullName" placeholder="Full Name" runat="server"></asp:TextBox>
                        <!-- Field Validation-->
                        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You must fill in Full Name" ControlToValidate="tbFullName"></asp:RequiredFieldValidator></p>
                    </div>
                </div> <!-- end form-group -->

                <div class="form-group">
                <label for="tbPhone" class="col-sm-2 control-label">Phone</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="tbPhone" placeholder="Phone" runat="server"></asp:TextBox>
                        <!-- Field Validation-->
                        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You must fill in Phone Number" ControlToValidate="tbPhone"></asp:RequiredFieldValidator></p>
                        <!-- Regular Expression Validation -->
                        <p><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter a valid phone number in the format (0)00-0000000" ControlToValidate="tbPhone" ValidationExpression="^[0-9]{2,3}[-][0-9]{7}$"></asp:RegularExpressionValidator> </p> 
                    </div>
                </div> <!-- end form-group -->
            
                <div class="form-group">
                <label for="tbEmail" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="tbEmail" placeholder="Email" runat="server"></asp:TextBox>
                        <!-- Field Validation-->
                        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="You must fill in Email" ControlToValidate="tbEmail"></asp:RequiredFieldValidator></p>
                        <!-- Regular Expression Validation -->
                        <p><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email" ControlToValidate="tbEmail" ValidationExpression="([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})"></asp:RegularExpressionValidator> </p>
                    </div>
                </div> <!-- end form-group -->

            <div class="form-group">
                <label for="tbPosition" class="col-sm-2 control-label">Position</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="tbPosition" placeholder="Position" runat="server"></asp:TextBox>
                        <!-- Field Validation-->
                        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="You must fill in Position" ControlToValidate="tbPosition"></asp:RequiredFieldValidator></p>
                    </div>
                </div> <!-- end form-group -->

                <div class="form-group">
                <label for="tbDOB" class="col-sm-2 control-label">Date of Birth</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="tbDOB" placeholder="Date of Birth" runat="server"></asp:TextBox>
                        <!-- Field Validation-->
                        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="You must fill in Date of Birth" ControlToValidate="tbDOB"></asp:RequiredFieldValidator></p>
                    </div>
                </div> <!-- end form-group -->

                <div class="form-group">
                    <asp:Button ID="btnSubmit" CssClass="btn btn-default EmmasButton" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </div> <!-- end form-group -->
            
        </div> <!-- end of col-md-12 form-horizontal -->

     </div> <!-- end of row -->
    <!-- ************ end default View ************ -->
        
    <!-- end ***PLACE HOLDER MAIN CONTENT*** -->
</asp:Content>
