<%@ Page Title="" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="WebAssignment.Gallery" %>

<asp:Content ID="Content4" ContentPlaceHolderID="NavPlaceHolder" runat="server">
                    <li><a href="Default.aspx">Home</a></li>
                    <li><a href="AboutUs.aspx">About Us</a></li>
                    <li><a href="ResultsNFixtures.aspx">Results and Fixtures</a></li>
                    <li><a href="TeamProfiles.aspx">Team Profiles</a></li>
                    <li><a href="PitchInfo.aspx">Pitch Info</a></li>
                    <li><a href="JoinUs.aspx">Join Us</a></li>
                    <li><a href="ContactUs.aspx">Contact Us</a></li>
                    <li class="active"><a href="Gallery.aspx">Gallery</a></li>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LoginPlaceHolder" runat="server">
                    <li runat="server" id="adminOnly" visible="false"><a href="AdminOnly.aspx">Admin</a></li>
                    <li runat="server" id="loginON"><a href="LoginPage.aspx">Login</a></li>
                    <li runat="server" id="loginOFF"><a href="LoginPage.aspx">Logout</a></li>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="server">
Gallery
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
        </div> <!-- end sidebar css-->
    </div> <!-- end row-->

<!--***END PLACE HOLDER SIDE BAR***-->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<!-- ***PLACE HOLDER MAIN CONTENT*** -->

    <!-- ************* Display Images ************* -->
    <div class="row moveInEmma">
        <p><asp:Label ID="WelcomeLabel" runat="server" Text="Label"></asp:Label> </p>
    </div> <!-- end div row -->

    <div class="row moveInEmma">
            <asp:ListView ID="galleryList"  
                ItemType="WebAssignment.Models.ImageUpload"
                runat="server"
                SelectMethod="GetImages">
                
                <ItemTemplate>
                    <div class="col-md-3 col-sm-6 hero-feature">
                        <div class="thumbnail">
                            <span class="item">
                            <a href="UserImages/<%#: Item.ImageFileName%>" target="_blank">
                            <img src="UserImages/<%#: Item.ImageFileName%>" alt="" width="100" height="75" style="border: solid" /> </a>
                            <p><%#: Item.ImageID%></p>
                            </span> <!-- end span -->
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView> <!-- end asp:ListView ID="galleryList" -->
    </div> <!-- end div row -->

    <!-- ************* Upload Image ************* -->
    <div class="row moveInEmma" id="teamUpload" visible="false" runat="server">
        <h1>Upload Image</h1>
        <div class="form-group">
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <p><asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Profile pictures must be 200 x 200." OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator></p>
        </div> <!-- end form-group -->

        <div class="form-group">
            <label for="checkboxProfile" class="col-sm-2 control-label">Profile Pic:</label>
            <asp:CheckBox ID="checkboxProfile" runat="server" />
        </div> <!-- end form-group -->

        <div class="form-group">
            <asp:Button ID="btnUploadPhoto" runat="server" OnClick="btnUploadPhoto_Click" Text="Upload Photo" />
        </div> <!-- end form-group -->

    </div> <!-- end row -->


    <!-- ************* Delete Image ************* -->
    <div runat="server" class="row moveInEmma" id="divDeleteImage" visible="false">
        <div class="adminDgv">
            <h1>Delete Image</h1>

            <div class="form-group">
                <label for="txtInputImageID" class="col-sm-2 control-label">Image ID:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtInputImageID" placeholder="ImageID" runat="server"></asp:TextBox>
               </div>
            </div> <!-- end form-group -->

           

            <div class="form-group">
                    <asp:Button ID="btnDelete" CssClass="btn btn-default EmmasButton" runat="server" Text="Delete Image" OnClick="btnDelete_Click" />
            </div> <!-- end form-group -->

        </div> <!-- end adminDgv -->
    </div> <!-- end row -->

<!-- end ***PLACE HOLDER MAIN CONTENT*** -->
</asp:Content>
