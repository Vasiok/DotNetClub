<%@ Page Title="" Language="C#" MasterPageFile="~/defaultMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebAssignment.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="server">
Home
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="NavPlaceHolder" runat="server">
                    <li class="active"><a href="Default.aspx">Home</a></li>
                    <li><a href="AboutUs.aspx">About Us</a></li>
                    <li><a href="ResultsNFixtures.aspx">Results and Fixtures</a></li>
                    <li><a href="TeamProfiles.aspx">Team Profiles</a></li>
                    <li><a href="PitchInfo.aspx">Pitch Info</a></li>
                    <li><a href="JoinUs.aspx">Join Us</a></li>
                    <li><a href="ContactUs.aspx">Contact Us</a></li>
                    <li><a href="Gallery.aspx">Gallery</a></li>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="LoginPlaceHolder" runat="server">
                    <li runat="server" id="adminOnly" visible="false"><a href="AdminOnly.aspx">Admin</a></li>
                    <li runat="server" id="loginON"><a href="LoginPage.aspx">Login</a></li>
                    <li runat="server" id="loginOFF"><a href="LoginPage.aspx">Logout</a></li>
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="MetaDescriptionPlaceHolder" runat="server">
    <asp:PlaceHolder id="MetaPlaceHolder" runat="server" />
</asp:Content>

<asp:Content ID="Content2"  ContentPlaceHolderID="SliderPlaceHolder" runat="server">
<%--***PLACE HOLDER SLIDER***--%>
    <div class="row" id="sliderMain">  
        <div class="col-md-9 col-md-9" id="mainSlidesContainer">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                  <li data-target="#myCarousel" data-slide-to="0" class="active" id="active"></li>
                  <li data-target="#myCarousel" data-slide-to="1"></li>
                  <li data-target="#myCarousel" data-slide-to="2"></li>      
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox" id="sliderImagesContainer">
                      <div class="item active">
                        <img src="UserImages/football1.jpg" alt="local team"/>          
                      </div>

                      <div class="item">
                        <img src="UserImages/football2.jpg" alt="training" />                  
                      </div>
    
                      <div class="item">
                        <img src="UserImages/football3.jpg" alt="kids" />
                      </div>
                </div>
      

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev" id="leftControl">
                  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next" id="rightControl">
                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" ></span>
                  <span class="sr-only">Next</span>
                </a>
          </div>
    </div>
</div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="resultsPlaceHolder" runat="server">
<%--***PLACE HOLDER RESULTS***--%>
    <div class="row" id="defaultGird">
        <div class="col-md-12 form-horizontal" id="tableContainer">
            <h2>Games Scores</h2>
            <asp:GridView class="table table-striped table-bordered" ID="dgvResultsMain" runat="server"></asp:GridView>
         </div><!--End of col-md-12-->
    </div><!--End of row-->
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PlayerPlaceHolder" runat="server">
<%--***PLACE HOLDER PLAYER OF THE MONTH***--%>
    <div class="row" id="playerImageDefault">
        <div class="col-md-2"></div>
        <div class="col-md-8" id="imageViewDefaultPage">
            <asp:Image ID="Image1" runat="server" ClientIDMode="Static"/>
        </div>
        <div class="col-md-2"></div>
    </div>

    <div class="row" id="playerContainer">
        <div class="col-md-2"></div>
        <div class="col-md-8" id="memberDetailsDefaultPage">
            <p>Player of the Month</p>
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
        <div class="col-md-2"></div>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="RSSFeedPlaceHolder" runat="server">
<%--***PLACE HOLDER FOOTBALL RSS FEED***--%>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10" id="rssContainerDefault">
            <script type="text/javascript" src="http://output79.rssinclude.com/output?type=js&amp;id=979762&amp;hash=ef00aca1f79180b1e3834102f50e4afc"></script>
        </div>
        <div class="col-md-1"></div>
    </div class="row">
</asp:Content>
