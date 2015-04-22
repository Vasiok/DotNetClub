<%@ Page Title="" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="PrivacyPolicy.aspx.cs" Inherits="WebAssignment.PrivacyPolicy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="server">
    Privacy Policy
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
                        <li><a href="CodeOfEthics.aspx">Code Of Ethics</a></li>
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

    <div class="row moveInEmma" id="pPolicy">
         
        <h1>Privacy Policy</h1>
        <h2>Introduction</h2>
        <p>Dot Net FC respect your right to privacy and comply with our obligations under the Data Protection Acts 1988 and 2002. The purpose of this Website Privacy Policy is to outline how we deal with any personal data you provide to us while visiting this website. Naturally, if you are not happy with this Website Privacy Policy you should not use this website.</p>
        <p>By visiting this website, you are accepting the terms of this Website Privacy Policy. Any external links to other websites are clearly identifiable as such, and we are not responsible for the content or the privacy policies of these other websites.</p>
        <h2>Types of Information Collected</h2>
        <h3>We retain two types of information:</h3>
        <p>Personal Data</p>
        <p>This is data that identifies you or can be used to identify or contact you and may include your name, address, email address, user IP addresses in circumstances where they have not been deleted, clipped or anonymised, telephone number. Such information is only collected from you if you voluntarily submit it to us.</p>
        <p>Non-Personal Data<br />
         Like most websites, we gather statistical and other analytical information collected on an aggregate basis of all visitors to our website. This Non-Personal Data comprises information that cannot be used to identify or contact you, such as demographic information regarding, for example, user IP addresses where they have been clipped or anonymised, browser types and other anonymous statistical data involving the use of our website.</p>
        <h2>Purposes for which we hold your Information</h2>
        <h3>Non-Personal Data</h3>
        <p>We use the Non-Personal Data gathered from visitors to our website in an aggregate form to get a better understanding of where our visitors come from and to help us better design and organise our website.</p>
        <h2> Personal Data</h2>
        <h3>We will process any Personal Data you provide to us for the following purposes:</h3>
        <p>a. To contact you if required in connection with your order or to respond to any communications you might send to us;</p>
        <p>b. To inform you of any special offers we might periodically have available;</p>
        <h2>Disclosure of Information to Third Parties</h2>
        <p>We will not disclose your Personal Data to third parties unless you have consented to this disclosure or unless the third party is required to fulfil your order (in such circumstances, the third party is bound by similar data protection requirements). We will disclose your Personal Data if we believe in good faith that we are required to disclose it in order to comply with any applicable law, a summons, a search warrant, a court or regulatory order, or other statutory requirement.</p>
        <h2>Sale of Business</h2>
        <p>We reserve the right to transfer information (including your Personal Data) to a third party in the event of a sale, merger, liquidation, receivership or transfer of all or substantially all of the assets of our company provided that the third party agrees to adhere to the terms of the Website Privacy Policy and provided that the third party only uses your Personal Data for the purposes that you provided it to us. You will be notified in the event of any such transfer and you will be afforded an opportunity to opt-out.</p>
        <h2>Security</h2>
        <p>Your Personal Data is held on secure servers. The nature of the Internet is such that we cannot guarantee or warrant the security of any information you transmit to us via the Internet. No data transmission over the Internet can be guaranteed to be 100% secure. However, we will take all reasonable steps (including appropriate technical and organisational measures) to protect your Personal Data.</p>
        <h2>Changes to the Website Privacy Policy</h2>
        <p>Any changes to this Website Privacy Policy will be posted on this website so you are always aware of what information we collect, how we use it, and under what circumstances, if any, we disclose it. If at any time we decide to use Personal Data in a manner significantly different from that stated in this Website Privacy Policy, or otherwise disclosed to you at the time it was collected, we will notify you by email, and you will have a choice as to whether or not we use your information in the new manner.</p>
    
    </div> <!-- end div row -->
<!--*** END PLACE HOLDER MAIN CONTENT***-->
</asp:Content>
