<%@ Page Title="" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="CodeOfEthics.aspx.cs" Inherits="WebAssignment.CodeOfEthics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="server">
    Code of Ethics
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="MetaDescriptionPlaceHolder" runat="server">
    <asp:PlaceHolder id="MetaPlaceHolder" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="NavPlaceHolder" runat="server">
                    <li><a href="Default.aspx">Home</a></li>
                    <li class="active"><a href="AboutUs.aspx">About Us</a></li>
                    <li><a href="ResultsNFixtures.aspx">Results and Fixtures</a></li>
                    <li><a href="TeamProfiles.aspx">Team Profiles</a></li>
                    <li><a href="PitchInfo.aspx">Pitch Info</a></li>
                    <li><a href="JoinUs.aspx">Join Us</a></li>
                    <li><a href="ContactUs.aspx">Contact Us</a></li>
                    <li><a href="Gallery.aspx">Gallery</a></li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LoginPlaceHolder" runat="server">
                    <li runat="server" id="adminOnly" visible="false"><a href="AdminOnly.aspx">Admin</a></li>
                    <li runat="server" id="loginON"><a href="LoginPage.aspx">Login</a></li>
                    <li runat="server" id="loginOFF"><a href="LoginPage.aspx">Logout</a></li>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SideBarPlaceHolder" runat="server">
<!--***PLACE HOLDER SIDE BAR***-->
    <div class="row extraLength"> 
        <div class="sidebar-css">
                    <ul>
                        <li class="sidebar-label"><span class="underline">Quick Links</span></li>
                        <li><a href="AboutUs.aspx">About Us</a></li>
                        <li><a href="PrivacyPolicy.aspx">Privacy Policy</a></li>
                        <li><a href="ContactUs.aspx">Contact Us</a></li>
                        <li><a href="JoinUs.aspx">Join Us</a></li>
				    </ul>
        </div> <!-- end sidebar-css-->
    </div> <!-- end row-->

<!--***END PLACE HOLDER SIDE BAR***-->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<!--***PLACE HOLDER MAIN CONTENT***-->
    <div class="row moveInEmma">
        <p><asp:Label ID="WelcomeLabel" runat="server" Text="Label"></asp:Label> </p>
    </div> <!-- end row-->

    
        <div class="row codeofethics" >
            <p><strong>1. For Everyone</strong></p>
                <ul>
                    <li>No abusive language or behaviour towards;
                        <ul>
                            <li>Dot Net players</li>
                            <li>Opposition Players</li>
                            <li>Spectators or coaches</li>
                            <li>Referees</li>
                        </ul>
                    </li>
                    <li>Think about where you park &#8211; do not obstruct driveways and areas provided for emergency vehicles</li>
                    <li>Never ridicule or criticize players at any time</li>
                    <li>Respect the authority of officials during training and games</li>
                    <li>Never question, discuss or confront officials at training or games</li>
                    <li>Agree a suitable time to discuss any grievance you have with officials</li>
                </ul>
        </div> <!-- end row -->

        <div class="row codeofethics">
            <p><strong>2. For Players</strong></p>
                <ul>
                    <li>Try your best</li>
                    <li>Always be positive</li>
                    <li>Do what your coaches tell you</li>
                    <li>Respect your team-mates &#8211; no bullying &#8211; no teasing &#8211; no name calling &#8211; no bad language</li>
                    <li>Behave &#8211; Bad behaviour is not allowed</li>
                    <li>Make sure you have the correct gear</li>
                    <li>Never leave the pitch without telling your coach</li>
                    <li>Never ever leave the club/grounds without an adult you trust</li>
                    <li>Most of all &#8211; HAVE FUN !!</li>
                </ul>
        </div> <!-- end row -->

        <div class="row codeofethics">
            <p><strong>3. For The Coaches</strong></p>
                <ul>
                    <li>Respect the dignity, self esteem and rights of all the children</li>
                    <li>Be punctual and organized for training/games</li>
                    <li>All children must be involved in training and games</li>
                    <li>Positive encouragement only at all times</li>
                    <li>Clear communication of fixtures to children/parents</li>
                    <li>Bring any matters of concern quickly to the attention of Parents/Guardians</li>
                </ul>
        </div> <!-- end row -->
    
 <!--***END PLACE HOLDER MAIN CONTENT***-->
</asp:Content>
