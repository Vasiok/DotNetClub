<%@ Page Title="" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="PitchInfo.aspx.cs" Inherits="WebAssignment.PitchInfo" %>

<asp:Content ID="Content4" ContentPlaceHolderID="NavPlaceHolder" runat="server">
                    <li><a href="Default.aspx">Home</a></li>
                    <li><a href="AboutUs.aspx">About Us</a></li>
                    <li><a href="ResultsNFixtures.aspx">Results and Fixtures</a></li>
                    <li><a href="TeamProfiles.aspx">Team Profiles</a></li>
                    <li class="active"><a href="PitchInfo.aspx">Pitch Info</a></li>
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
Pitch Info
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
                        <li><a href="JoinUs.aspx">Join Us</a></li>
                        <li><a href="ResultsNFixtures.aspx">Results</a></li>
				    </ul>
        </div> <!-- end sidebar-css-->
    </div> <!-- end row-->

     <div class="row" id="weatherRss">
       <script type="text/javascript" src="http://output24.rssinclude.com/output?type=js&amp;id=979625&amp;hash=550401af7cd333c351cc407f297bb0de"></script>
     </div> <!-- end row-->

<!--***END PLACE HOLDER SIDE BAR***-->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<!--***PLACE HOLDER Main Content***-->
    <div class="row moveInEmma">
        <p><asp:Label ID="WelcomeLabel" runat="server" Text="Label"></asp:Label> </p>
    </div> <!-- end div row -->

    <!--*** Images ***-->
    <div class="row moveInEmma" id="pitch_location">
        <div class="">
            <a href="https://goo.gl/maps/zgqT0" target="_blank" ><img src="Images/location.gif" alt="Location in Google Maps" title="Location in Google Maps" /></a>
            <img src="Images/pitch.png" alt="Home Pitch" title="Home Pitch" />
        </div> <!-- end col-md-12-->
    </div> <!-- end row-->

    <div class="row moveInEmma">
        <ul class="pitchAddress">
			<li class="pitchTitle">Dot Net Football Club Address</li>
			<li>13-14 Aungier Street</li>
			<li>Dublin 2</li>
        </ul>
    </div> <!-- end row-->

    <div class="row moveInEmma" id="soccerIreland">
        <p>Need to check a pitch in a hurry?</p>
        <a href="http://www.soccer-ireland.com/football-grounds/pitch-check.htm" target="_blank" ><img src="Images/soccer-ireland-logo.gif" alt="Soccer Ireland Pitch Information" title="Soccer Ireland Pitch Information" /></a>
    </div> <!-- end row-->
<!--***END PLACE HOLDER Main Content***-->
</asp:Content>
