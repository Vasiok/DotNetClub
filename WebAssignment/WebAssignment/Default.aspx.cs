using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using WebAssignment.Models;

namespace WebAssignment
{    

    public partial class Default : System.Web.UI.Page
    {
        // user access level
        public string userAccess = null;
        public string userName = String.Empty;
        public bool loginStatus;

        // for player of the month - Messi
        public int currentPlayerID = 10204;


        protected void Page_Load(object sender, EventArgs e)
        {
            // SEO Meta tag
            HtmlMeta meta = new HtmlMeta();
            meta.Name = "description";
            meta.Content = "Home Page - This is the website for the Dot Net Football team.";
            MetaPlaceHolder.Controls.Add(meta);

            HtmlMeta meta2 = new HtmlMeta();
            meta2.Name = "keywords";
            meta2.Content = "Default Page, Home Page, Home, Dot Net Football Club, HTML, CSS, XML, JavaScript.";
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

            Context _db = new Context();
            List<GameResult> gameResults = _db.GameResults.ToList();
            List<GameResult> outputOnlyThree = new List<GameResult>(3);
            //Please note that I am only getting last 3 results here
            for (int i = gameResults.Count - 1; i > gameResults.Count-4; i--)
            {
                outputOnlyThree.Add(gameResults[i]);
            }

            var outputResult = outputOnlyThree.Select(gr => new { gr.HomeTeam, gr.AwayTeam, gr.ScoreHome, gr.ScoreAway, gr.MatchDate });

            dgvResultsMain.DataSource = outputResult;
            dgvResultsMain.DataBind();

            //Start

            List<TeamInfo> team = _db.TeamInfos.ToList();


            List<LoginRegister> membersPostions = _db.LoginS.ToList();
          
            var positions = membersPostions.Where(m => m.UserID == currentPlayerID);
            string pos ="";

            foreach (var item in positions)
            {
                pos = item.UserPosition;
            }

            var images = _db.ImageUploadS;

            string url;


            TeamInfo member = new TeamInfo();
            var anonMember = team.Where(t => t.UserID == currentPlayerID);


            foreach (var item in anonMember)
            {
                member = item;
            }

            //Alex
            // var userImages = images.Where(i => i.MemberID == member.MemberID).ToList();
            // url = "UserImages/" + userImages[0].ImageFileName;
            
            // ** Emma
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
            // ** end Emma

            Image1.ImageUrl = url;

            lblName.Text = "Name: " + member.FirstName + " " + member.LastName;
            lblPosition.Text = "Position: " + pos;
            lblAbout.Text = "About: " + member.About;


            //End


        }
    }
}