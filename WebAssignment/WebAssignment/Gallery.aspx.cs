using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAssignment.Models;
// add using directives
using System.IO;
using System.Web.ModelBinding;
using System.Windows.Forms;
using System.Reflection;
using System.Web.UI.HtmlControls;
using System.Drawing; // Path

namespace WebAssignment
{
    public partial class Gallery : System.Web.UI.Page
    {
        // user access level
        public string userAccess = null;
        public string userName = String.Empty;
        public int userMemId;
        public string adminAccess = "level1";
        public string coachAccess = "level2";
        public string playerAccess = "level3";
        public string guestAccess = "Guest";
        public bool loginStatus;

        // for validating the size of the uploaded profile image
        bool profilePicCorrectSize = false;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            // SEO Meta tag
            HtmlMeta meta = new HtmlMeta();
            meta.Name = "description";
            meta.Content = "Gallery Page - Dot Net Football images can be found here. PLayers can upload images and profile pictures.";
            MetaPlaceHolder.Controls.Add(meta);

            HtmlMeta meta2 = new HtmlMeta();
            meta2.Name = "keywords";
            meta2.Content = "Gallery Page, Dot Net Football Club, HTML, CSS, XML, JavaScript.";
            MetaPlaceHolder.Controls.Add(meta2);

            HtmlMeta meta3 = new HtmlMeta();
            meta3.Name = "author";
            meta3.Content = "Emma Jane Heneghan, Alex Suleac";
            MetaPlaceHolder.Controls.Add(meta3);

            // setting up session variables
            userAccess = (String)Session["AccessLevel"];
            userName = (String)Session["Username"];
            
            if (userAccess != null)
            {
                loginStatus = true;
            }
            else
                loginStatus = false;

            // changing login to logout
            if (loginStatus) // equals true -if they are logged in
            {
                loginON.Visible = false; // turn off login 
                loginOFF.Visible = true; // turn on logout
            }
            else if (!loginStatus) // equals false
            {
                loginON.Visible = true;
                loginOFF.Visible = false;
            }

            WelcomeLabel.Text = "Hello " + (String)Session["Username"] + " your Access Level is: " + (String)Session["AccessLevel"];

            if (userAccess == adminAccess)
            {
                divDeleteImage.Visible = true;
                adminOnly.Visible = true;
            }

            // turning on the upload option
            if ((userAccess != guestAccess) && (userAccess != null))
            {
                teamUpload.Visible = true;
            }

        }

        protected void btnUploadPhoto_Click(object sender, EventArgs e)
        {
            bool canWeCompleteAction = true;

                try
                {
                    userMemId = (Int32)Session["MemberID"];

                    string filename = Path.GetFileName(FileUpload1.FileName);

                    // check the length of the filename
                    if (filename.Length < 15)
                    {
                        bool profilePix = false;

                        if (checkboxProfile.Checked)
                        {
                            profilePix = true;
                            // need to check if previous profile pic has been uploaded, and change that profile column to false
                            Context _dd = new Context();
                            List<ImageUpload> checkList = _dd.ImageUploadS.Where(i => i.ProfilePic == true).ToList();
                            foreach (ImageUpload img in checkList)
                            {
                                if (img.MemberID == userMemId)
                                {
                                    // setting the profile to false
                                    img.ProfilePic = false;
                                    // saving changes
                                    _dd.SaveChanges();
                                    break;
                                }
                            }

                            // validating if image is correct size
                            if (profilePicCorrectSize == true)
                            {
                                //we can complete the transaction
                                canWeCompleteAction = true;
                            }
                            else if(profilePicCorrectSize == false)
                            {
                                canWeCompleteAction = false;
                            }
                        }
                        else
                        {
                            profilePix = false;
                        }

                        //
                        if (canWeCompleteAction)
                        {

                            // give the file a unique file name
                            string newfileName = Guid.NewGuid().ToString() + "-" + filename;

                            // send the files to the UserImages Folder
                            FileUpload1.SaveAs(Server.MapPath("~/UserImages/") + newfileName);

                            Context _db = new Context();
                            // need to add image upload class 
                            ImageUpload upload = new ImageUpload { ImageFileName = newfileName, MemberID = userMemId, ProfilePic = profilePix };
                            _db.ImageUploadS.Add(upload);
                            _db.SaveChanges();

                            MessageBox.Show("Image Uploaded Successfully");
                        }
                        else
                        {
                            MessageBox.Show("Profile pictures must be 200 x 200.", "Please try again");
                        }
                    }
                    else
                    {
                        MessageBox.Show("Please try renaming your image to a smaller file name.", "Filename Length Too Long");
                    }

                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error on upload: " + ex.Message, "Please try again.");
                }

                // reload the page
                Response.Redirect(Request.RawUrl);
        }
        
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Bitmap bmIP = new Bitmap(FileUpload1.PostedFile.InputStream);
            // if the profile pic is 200 x 200
            if (bmIP.Width == 200 | bmIP.Height == 200)
            {
                profilePicCorrectSize = true;
            }
            else
            {
                profilePicCorrectSize = false;
            }
        }

        public IQueryable<ImageUpload> GetImages([QueryString("id")] int? ImageID)
        {
            var _db = new Context();
            IQueryable<ImageUpload> query = _db.ImageUploadS;
            if (ImageID.HasValue && ImageID > 0)
            {
                query = query.Where(p => p.ImageID == ImageID);
            }
            return query;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            // for deleteing files
            string sourceDir = Path.Combine(Request.PhysicalApplicationPath) + @"UserImages";

            string fileToDelete;
            string[] picList = Directory.GetFiles(sourceDir, "*.jpg");

            try
            {
                // capturing user input
                int inputImageID;
                inputImageID = int.Parse(txtInputImageID.Text);

                Context _db = new Context();
                // get the image row from db
                ImageUpload imageToDelete = _db.ImageUploadS.First(i => i.ImageID.Equals(inputImageID));
                fileToDelete = imageToDelete.ImageFileName;
                string fullDir = Path.Combine(Request.PhysicalApplicationPath) + @"UserImages\" + fileToDelete;

                foreach (string f in picList)
                {
                    if(f.Equals(fullDir))
                    {
                        // delete actual file
                        File.Delete(f);
                    }
                }

                // delete from DB
                _db.ImageUploadS.Remove(imageToDelete);
                _db.SaveChanges();

                MessageBox.Show("Deleted Successfully!");

                // reloads the page
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error on delete " + ex.Message);
            }
        }

       
    }
}