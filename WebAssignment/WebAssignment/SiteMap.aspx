<%@ Page Title="Site Map" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="SiteMap.aspx.cs" Inherits="WebAssignment.SiteMap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="server">
    Site Map
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MetaDescriptionPlaceHolder" runat="server">
    <asp:PlaceHolder id="MetaPlaceHolder" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="NavPlaceHolder" runat="server">
                    <li><a href="Default.aspx">Home</a></li>
                    <li><a href="AboutUs.aspx">About Us</a></li>
                    <li><a href="ResultsNFixtures.aspx">Results and Fixtures</a></li>
                    <li><a href="TeamProfiles.aspx">Team Profiles</a></li>
                    <li><a href="PitchInfo.aspx">Pitch Info</a></li>
                    <li><a href="JoinUs.aspx">Join Us</a></li>
                    <li><a href="ContactUs.aspx">Contact Us</a></li>
                    <li><a href="Gallery.aspx">Gallery</a></li>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="LoginPlaceHolder" runat="server">
                    <li runat="server" id="adminOnly" visible="false"><a href="AdminOnly.aspx">Admin</a></li>
                    <li runat="server" id="loginON"><a href="LoginPage.aspx">Login</a></li>
                    <li runat="server" id="loginOFF"><a href="LoginPage.aspx">Logout</a></li>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="SideBarPlaceHolder" runat="server">
    <!--***PLACE HOLDER SIDE BAR***-->
    <div class="row extraLength"> 
        <div class="sidebar-css">
                    <ul>
                        <li class="sidebar-label"><span class="underline">Quick Links</span></li>
                        <li><a href="AboutUs.aspx">About Us</a></li>
                        <li><a href="CodeOfEthics.aspx">Code Of Ethics</a></li>
                        <li><a href="PrivacyPolicy.aspx">Privacy Policy</a></li>
                        <li><a href="ContactUs.aspx">Contact Us</a></li>
                        <li><a href="JoinUs.aspx">Join Us</a></li>
				    </ul>
        </div> <!-- end sidebar-css-->
    </div> <!-- end row-->

<!--***END PLACE HOLDER SIDE BAR***-->
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <!--***PLACE HOLDER MAIN CONTENT***-->
    <div class="row moveInEmma">
        <p><asp:Label ID="WelcomeLabel" runat="server" Text="Label"></asp:Label> </p>
    </div> <!-- end div row -->

    <!--**List of all site CONTENT***-->
    <div class="row moveInEmma"> 
        <ul>
            <li class="sidebar-label"><span class="underline">Site Map</span></li>
            <li><a href="AboutUs.aspx">About Us</a>
                <ul>
                    <li><a href="CodeOfEthics.aspx">Code Of Ethics</a></li>
                    <li><a href="PrivacyPolicy.aspx">Privacy Policy</a></li>
                </ul>
            </li>
            <li><a href="ContactUs.aspx">Contact Us</a></li>
            <li><a href="Default.aspx">Home</a></li>
            <li><a href="Gallery.aspx">Gallery</a></li>
            <li><a href="JoinUs.aspx">Join Us</a></li>
            <li><a href="LoginPage.aspx">Login Page</a></li>
            <li><a href="PitchInfo.aspx">Pitch Infomation</a></li>
            <li><a href="ResultsNFixtures.aspx">Results and Fixtures</a></li>
            <li><a href="TeamProfiles.aspx">Team Profiles</a></li>
		</ul>

    </div> <!-- end div row-->
 <!--***END PLACE HOLDER MAIN CONTENT***-->     
</asp:Content>
