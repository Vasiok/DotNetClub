<%@ Page Title="" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="WebAssignment.AboutUs" %>

<asp:Content ID="Content4" ContentPlaceHolderID="NavPlaceHolder" runat="server">
                    <li><a href="Default.aspx">Home</a></li>
                    <li class="active"><a href="AboutUs.aspx">About Us</a></li>
                    <li><a href="ResultsNFixtures.aspx">Results and Fixtures</a></li>
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
About Us
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
                        <li><a href="CodeOfEthics.aspx">Code Of Ethics</a></li>
                        <li><a href="PrivacyPolicy.aspx">Privacy Policy</a></li>
                        <li><a href="ContactUs.aspx">Contact Us</a></li>
                        <li><a href="JoinUs.aspx">Join Us</a></li>
				    </ul>
        </div> <!-- end sidebar-css-->
    </div> <!-- end row-->

<!--***END PLACE HOLDER SIDE BAR***-->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<!--***PLACE HOLDER MAIN CONTENT***-->
    <div class="row moveInEmma">
        <p><asp:Label ID="WelcomeLabel" runat="server" Text="Label"></asp:Label> </p>
    </div> <!-- end div row -->

    <div class="row moveInEmma">
        <h1>Club History</h1>
        <p>Dot Net is a north Dublin soccer football club that competes in the Amateur Football League. The football club was formed in 1917 (probably) by British soldiers that were students in DBS. The club disappeared for a number of years and it not re-emerge until 1969. Following an appearance in the Dublin District Final Clontarf FC disappeared again until 1980. Since then the club has won silverware at a variety of levels.</p>
    </div>
    <div class="row moveInEmma">
        <div class="form-group">
             <asp:Button ID="btnCode" CssClass="btn btn-default EmmasButton" runat="server" Text="Code of Ethics" OnClick="btnCode_Click" />
        </div> <!-- end form-group -->
    </div> <!-- end div row -->

    <div class="row moveInEmma">
        <div class="form-group">
             <asp:Button ID="btnPrivacy" CssClass="btn btn-default EmmasButton" runat="server" Text="Privacy Policy" OnClick="btnPrivacy_Click" />
        </div> <!-- end form-group -->
    </div> <!-- end div row -->

<!--***END PLACE HOLDER MAIN CONTENT***-->
</asp:Content>
