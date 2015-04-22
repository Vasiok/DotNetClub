using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using WebAssignment.Models;

namespace WebAssignment
{
    public partial class JoinUs : System.Web.UI.Page
    {
        // user access level
        public string userAccess = null;
        public string userName = String.Empty;
        public string adminAccess = "level1";
        public string coachAccess = "level2";
        public bool loginStatus;

        protected void Page_Load(object sender, EventArgs e)
        {
            // SEO Meta tag
            HtmlMeta meta = new HtmlMeta();
            meta.Name = "description";
            meta.Content = "Join Us Page - Please provide the required information to register your interest with the Dot Net Football team.";
            MetaPlaceHolder.Controls.Add(meta);

            HtmlMeta meta2 = new HtmlMeta();
            meta2.Name = "keywords";
            meta2.Content = "Join Us Page, Dot Net Football Club, HTML, CSS, XML, JavaScript.";
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

            // view for Admin
            if (userAccess == adminAccess)
            {
                adminOnly.Visible = true;
            }

            // view for Coach
            if (userAccess == coachAccess)
            {
                divCoachView.Visible = true;
                defaultJoinUs.Visible = false;
            }

            // import the table from the DB to the GridView
            Context _db = new Context();
            List<JoinUsForm> enquiriesList = _db.JoinUsS.ToList();
            enquiriesList = enquiriesList.OrderByDescending(x => x.EnquireDate).ToList();

            GridView1.DataSource = enquiriesList;
            GridView1.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            JoinUsForm newEnquiry = new JoinUsForm();

            newEnquiry.FullName = tbFullName.Text;
            newEnquiry.Phone = tbPhone.Text;
            newEnquiry.Email = tbEmail.Text;
            newEnquiry.Position = tbPosition.Text;
            newEnquiry.DOB = DateTime.Parse(tbDOB.Text);
            newEnquiry.EnquireDate = DateTime.Now;
            newEnquiry.Replied = false;

            // add JoinUs record to the database
            Context _db = new Context();
            _db.JoinUsS.Add(newEnquiry);
            _db.SaveChanges();

            // clearing the text boxes
            tbDOB.Text = String.Empty;
            tbEmail.Text = String.Empty;
            tbFullName.Text = String.Empty;
            tbPhone.Text = String.Empty;
            tbPosition.Text = String.Empty;
        }

        protected void btnReplied_Click(object sender, EventArgs e)
        {
            // capturing user input
            int inputEnquiryID;
            inputEnquiryID = int.Parse(txtEnquireID.Text);

            Context _db = new Context();
            JoinUsForm updateJoin = _db.JoinUsS.First(j => j.EnquireID.Equals(inputEnquiryID));
            // chaning the action taken
            updateJoin.Replied = true;

            _db.SaveChanges();

            MessageBox.Show("Replied Updated to Replied Successfully!");

            // reloads the page
            Response.Redirect(Request.RawUrl);
        }

        protected void btnNotReplied_Click(object sender, EventArgs e)
        {
            // capturing user input
            int inputEnquiryID;
            inputEnquiryID = int.Parse(txtEnquireID.Text);

            Context _db = new Context();
            JoinUsForm updateJoin = _db.JoinUsS.First(j => j.EnquireID.Equals(inputEnquiryID));
            // chaning the action taken
            updateJoin.Replied = false;

            _db.SaveChanges();

            MessageBox.Show("Replied Updated to Not Replied Successfully!");

            // reloads the page
            Response.Redirect(Request.RawUrl);
        }
    }
}