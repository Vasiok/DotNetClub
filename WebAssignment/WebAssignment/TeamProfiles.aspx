<%@ Page Title="" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="TeamProfiles.aspx.cs" Inherits="WebAssignment.TeamProfiles" EnableViewState="True"%>

<asp:Content ID="Content4" ContentPlaceHolderID="NavPlaceHolder" runat="server">
                    <li><a href="Default.aspx">Home</a></li>
                    <li><a href="AboutUs.aspx">About Us</a></li>
                    <li><a href="ResultsNFixtures.aspx">Results and Fixtures</a></li>
                    <li class="active"><a href="TeamProfiles.aspx">Team Profiles</a></li>
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
Team Profiles
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

    <div class="row" id="timesSide">
        <div class="col-md-1"></div>

        <div class="col-md-10">
            <div class="row">
                <h2 class="">Training times: </h2>
            </div>
            <div class="row">
                Mon - Thu:  18:30 - 21:00
            </div>
            <div class="row">
                Sat - Sun:  11:00 - 18:00
            </div>
        </div>
        <div class="col-md-1"></div>

    </div>

<!--***END PLACE HOLDER SIDE BAR***-->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">    
<!--***PLACE HOLDER MAIN CONTENT***-->   

    <div class="row moveInEmma">
        <p><asp:Label ID="WelcomeLabel" runat="server" Text="Label"></asp:Label> </p>
    </div> <!-- end div row -->

    <!--*** JSON OBJECT ***-->
    <div runat="server" class="row moveInEmma" id="playersOnly" visible="false">
        <h1 class="h1">List of current members</h1>
        <div id="displayJson">
        </div>
    </div> <!-- end playersOnly-->
    <!--*** END JSON OBJECT ***-->

    <!--***XML BUTTON ***-->
    <div runat="server" id="btn4CoachXML" visible="false" class="row moveInEmma">
        <div class="form-group">
            <asp:Button ID="btnXML" CssClass="btn btn-default EmmasButton" runat="server" Text="Export Team List to XML" OnClick="btnXML_Click" />
        </div> <!-- end form-group -->
    </div><!-- end row -->
    <!--***END XML BUTTON ***-->

    <div class="row moveInEmma" id="playerListViewer">
        <div class="col-md-12" id="pickerPlaceholder">
            <div class="col-md-4" id="pick">
                <asp:DropDownList ID="ddlNames" runat="server" Height="30px" Width="154px" EnableViewState="True" OnSelectedIndexChanged="ddlNames_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="col-md-push-6" id="viewDetailsButton">
                <asp:Button ID="btnView" runat="server" Text="View Details" Height="34px" OnClick="btnView_Click"/> 
            </div>
        </div>
    </div>

    <!-- ASK ALEX IS THIS FOR SHOWING DETAILS??  YES THIS FOR SHOWING THE DETAILS AND PICTURE-->
    <div class="row moveInEmma" id="detailsView" runat="server" visible="false">
        <%--<h2>Some text</h2>--%>

        <div class="col-md-4" id="imageView">
            <asp:Image ID="Image1" runat="server" ImageUrl=""/>
        </div>
        <div class="col-md-8" id="memberDetails">
            <div class="row label-primary" id="divLblName">                   
                    <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>                                
            </div>
            <div class="row label-primary" id="divLblPosition">                
                    <asp:Label ID="lblPosition" runat="server" Text="Label"></asp:Label>                
            </div>
            <div class="row label-primary" id="divLblAbout">                
                    <asp:Label ID="lblAbout" runat="server" Text="Label"></asp:Label>                
            </div>
        </div>
    </div>

<!--***END PLACE HOLDER MAIN CONTENT***-->  
</asp:Content>
