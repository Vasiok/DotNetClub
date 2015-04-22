using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.Net;
using Newtonsoft.Json;
using System.IO;
using WebAssignment.Models;
using System.Xml.Serialization;
using System.Windows.Forms;
using System.Web.UI.HtmlControls;


namespace WebAssignment
{
    public partial class TeamProfiles : System.Web.UI.Page
    {

        List<TeamInfoDisplayJSON> dropDownSource = new List<TeamInfoDisplayJSON>();
        private int selectedIndex = 1; //Setting this to zero initialy as this will change when the selection will be made


        // user access level
        public string userAccess = null;
        public string userName = String.Empty;
        public string adminAccess = "level1";
        public string coachAccess = "level2";
        public string playersAccess = "level3";
        public bool loginStatus;

        protected void Page_Load(object sender, EventArgs e)
        {
            // SEO Meta tag
            HtmlMeta meta = new HtmlMeta();
            meta.Name = "description";
            meta.Content = "Team Profiles Page - This page displays inforamtion about the Dot Net Football players.";
            MetaPlaceHolder.Controls.Add(meta);

            HtmlMeta meta2 = new HtmlMeta();
            meta2.Name = "keywords";
            meta2.Content = "Team Profiles Page, Dot Net Football Club, HTML, CSS, XML, JavaScript.";
            MetaPlaceHolder.Controls.Add(meta2);

            HtmlMeta meta3 = new HtmlMeta();
            meta3.Name = "author";
            meta3.Content = "Emma Jane Heneghan, Alex Suleac";
            MetaPlaceHolder.Controls.Add(meta3);

            // setting up session variables
            userAccess = (String)Session["AccessLevel"];
            userName = (String)Session["Username"];
            if (IsPostBack)
            {
                selectedIndex = ddlNames.SelectedIndex;
                //ddlNames
            }

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

            // content visiable only to admin
            if (userAccess == adminAccess)
            {
                adminOnly.Visible = true;
            }

            // content viewable only by coach
            if (userAccess == coachAccess)
            {
                btn4CoachXML.Visible = true;
            }
            
            dropDownSource = GetSource();

            dropDownSource = dropDownSource.Where(d => d.Position != "Admin" && d.Position != "Coach").ToList();

            ddlNames.DataSource = dropDownSource;
            ddlNames.DataTextField = "DropDownDisplay";
            // ddlNames.DataValueField = 
            ddlNames.DataBind();
            if (IsPostBack)
            {
                ddlNames.SelectedIndex = selectedIndex;             
            }
            else
            {
                ddlNames.SelectedIndex = 0;
            }
             
            // allowing admin, coach and players view
            if ((userAccess == adminAccess) || (userAccess == coachAccess) || (userAccess == playersAccess))
            {
                playersOnly.Visible = true;
            }

        }//end of Page_Load


        private List<TeamInfoDisplayJSON> GetSource()
        {
            List<TeamInfoDisplayJSON> listForTeamInfo = new List<TeamInfoDisplayJSON>();
            Context _db = new Context();


            List<LoginRegister> positions = _db.LoginS.ToList();
            List<TeamInfo> teamInfo = _db.TeamInfos.ToList();

            var join = positions.Join(teamInfo, (p) => p.UserID, (t) => t.UserID, (p, t) =>
                                new
                                {
                                    t.UserID,
                                    t.FirstName,
                                    t.LastName,
                                    p.UserPosition,
                                    t.Phone,
                                    t.Email
                                });
            //iterating trough anonymouse collection to get the list
            foreach (var item in join)
            {
                TeamInfoDisplayJSON displayObj = new TeamInfoDisplayJSON();
                displayObj.UserId = item.UserID;
                displayObj.FirstName = item.FirstName;
                displayObj.LastName = item.LastName;
                displayObj.Position = item.UserPosition;
                displayObj.Telephone = item.Phone;
                displayObj.Email = item.Email;

                listForTeamInfo.Add(displayObj);
            }

            return listForTeamInfo;
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            
            detailsView.Visible = true;
            Context _db = new Context();
            List<TeamInfo> team = _db.TeamInfos.ToList();


            TeamInfoDisplayJSON memberInJson = dropDownSource[selectedIndex];
            int id = memberInJson.UserId;
            string pos = memberInJson.Position;

            var images = _db.ImageUploadS;

            string url;
            

            TeamInfo member = new TeamInfo();
            var anonMember = team.Where(t => t.UserID == id);

            
            foreach (var item in anonMember)
            {
                member = item;
            }

            //Alex
            //var userImages = images.Where(i => i.MemberID == member.MemberID).ToList();
            //url = "UserImages/" + userImages[0].ImageFileName;

            //Emma
            var userImages = images.Where(i => i.MemberID == member.MemberID && i.ProfilePic == true).ToList();

            // defensive programming if no image is available
            if (userImages.Count == 0)
            {
                url = "Images/sorry_no_image_available.jpg";
            }
            else
            {
                url = "UserImages/" + userImages[0].ImageFileName;
            }

            Image1.ImageUrl = url;


            lblName.Text = "Name: " + member.FirstName + " " + member.LastName;
            lblPosition.Text = "Position: " + pos;
            lblAbout.Text = "About: " + member.About;

        }

        protected void ddlNames_SelectedIndexChanged(object sender, EventArgs e)
        {
            //selectedIndex = ddlNames.SelectedIndex;
            ddlNames.SelectedItem.Selected = true;
        }

        protected void btnXML_Click(object sender, EventArgs e)
        {
            try
            {
                Context _db = new Context();
                List<TeamInfo> teamList = _db.TeamInfos.ToList();

                // to get rid of any special characters
                string date = DateTime.Now.ToString();
                date = date.Replace(@"/", "_");
                date = date.Replace(@" ", "_TIME_");
                date = date.Replace(@":", "_");

                // give the file a unique file name
                string newfileName = @"\TeamListXML_DATE_" + date + ".txt";

                string myXML = Serialize(teamList).ToString();
                string fullDir = Path.Combine(Request.PhysicalApplicationPath) + @"XMLFiles\";

                // Write the stream contents to a new file named "AllTxtFiles.txt".
                using (StreamWriter outfile = new StreamWriter(fullDir + newfileName))
                {
                    outfile.Write(myXML);
                }

                // save the XML to the DB
                DBXml saveXml = new DBXml();
                saveXml.XmlFilename = newfileName;
                saveXml.XmlFile = myXML;

                _db.DBXMLS.Add(saveXml);
                _db.SaveChanges();

                MessageBox.Show("Xml saved successfully!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        public static StringWriter Serialize(object o)
        {
            var xs = new XmlSerializer(o.GetType());
            var xml = new StringWriter();
            xs.Serialize(xml, o);

            return xml;
        }
    }
}