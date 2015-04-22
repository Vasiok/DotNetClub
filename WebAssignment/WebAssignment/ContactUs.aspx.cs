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
    public partial class ContactUs : System.Web.UI.Page
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
            meta.Content = "Contact Us Page - Send your querys here to contact the Dot Net Football team.";
            MetaPlaceHolder.Controls.Add(meta);

            HtmlMeta meta2 = new HtmlMeta();
            meta2.Name = "keywords";
            meta2.Content = "Contact Us Page, Dot Net Football Club, HTML, CSS, XML, JavaScript.";
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
                divCoachView.Visible = true;
            }

            // view for Coach
            if (userAccess == coachAccess)
            {
                divCoachView.Visible = true;
                guestView.Visible = false;
            }

            // import the table from the DB to the GridView
            Context _db = new Context();
            List<ContactUsForm> enquiriesList = _db.ContactUsS.ToList();
            enquiriesList = enquiriesList.OrderByDescending(x => x.ContactDate).ToList();

            GridView1.DataSource = enquiriesList;
            GridView1.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ContactUsForm newContact = new ContactUsForm();

            newContact.FullName = tbFullName.Text;
            newContact.Phone = tbPhone.Text;
            newContact.Email = tbEmail.Text;
            newContact.Comment = tbComment.Text;
            newContact.ContactDate = DateTime.Now;
            newContact.ActionTaken = false;

            // add Contact Us record to the database
            var _db = new Context();
            _db.ContactUsS.Add(newContact);
            _db.SaveChanges();

            // clearing the text boxes
            tbComment.Text = String.Empty;
            tbEmail.Text = String.Empty;
            tbFullName.Text = String.Empty;
            tbPhone.Text = String.Empty;
        }

        protected void btnSeen_Click(object sender, EventArgs e)
        {
            // capturing user input
            int inputContactID;
            inputContactID = int.Parse(txtContactID.Text);

            Context _db = new Context();
            ContactUsForm updateContact = _db.ContactUsS.First(c => c.ContactID.Equals(inputContactID));
            // chaning the action taken
            updateContact.ActionTaken = true;

            _db.SaveChanges();

            MessageBox.Show("Action Taken Updated to Seen Successfully!");

            // reloads the page
            Response.Redirect(Request.RawUrl);
        }

        protected void btnNotSeen_Click(object sender, EventArgs e)
        {
            // capturing user input
            int inputContactID;
            inputContactID = int.Parse(txtContactID.Text);

            Context _db = new Context();
            ContactUsForm updateContact = _db.ContactUsS.First(c => c.ContactID.Equals(inputContactID));
            // chaning the action taken
            updateContact.ActionTaken = false;

            _db.SaveChanges();

            MessageBox.Show("Action Taken Updated to UnSeen Successfully!");

            // reloads the page
            Response.Redirect(Request.RawUrl);
        }

    }
}