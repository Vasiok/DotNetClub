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
    public partial class AdminOnly : System.Web.UI.Page
    {
        // user access level
        public string userAccess = null;
        public string userName = String.Empty;
        public int userMemId;
        public string adminAccess = "level1";
        public bool loginStatus;

        protected void Page_Load(object sender, EventArgs e)
        {
            // SEO Meta tag
            HtmlMeta meta = new HtmlMeta();
            meta.Name = "description";
            meta.Content = "Admin Only Page - This page is only viewable for Administration for the Dot Net Football Team.";
            MetaPlaceHolder.Controls.Add(meta);

            HtmlMeta meta2 = new HtmlMeta();
            meta2.Name = "keywords";
            meta2.Content = "Admin Only Page, Dot Net Football Club, HTML, CSS, XML, JavaScript.";
            MetaPlaceHolder.Controls.Add(meta2);

            HtmlMeta meta3 = new HtmlMeta();
            meta3.Name = "author";
            meta3.Content = "Emma Jane Heneghan, Alex Suleac";
            MetaPlaceHolder.Controls.Add(meta3);

            // setting up session variables
            userAccess = (String)Session["AccessLevel"];
            userName = (String)Session["Username"];

            // turn off all validation
            TurnOffAllValidation();

            // ensure that the user has the correct access privilages for this page
            if (userAccess == adminAccess)
            {
                if (userAccess != null)
                {
                    loginStatus = true;
                }

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


                // import the table from the DB to the GridView
                Context _db = new Context();
                List<LoginRegister> loginList = _db.LoginS.ToList();

                GridView1.DataSource = loginList;
                GridView1.DataBind();
            }
                // hide if not admin
            else
            {
                WelcomeLabel.Text = "You do not have the correct Access Level for this page.";
                divAdminView.Visible = false;
                divChangeAccess.Visible = false;
                loginOFF.Visible = false;
                divAddTeamPlayer.Visible = false;
            }
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            // turing off the validation required for adding a team player to the DB
            TurnOffAddTeamProfileValidation();

            // turn on validation
            RequiredFieldValidator8.Enabled = true;

            // capturing user input
            int inputUserID;
            inputUserID = int.Parse(txtInputUserID.Text);

            string inputAccessLevel;
            inputAccessLevel = ddlAccessLevel.SelectedItem.ToString();

            Context _db = new Context();
            // updateUser is an object with the UserID specified by user
            LoginRegister updateUser = _db.LoginS.First(s => s.UserID.Equals(inputUserID));
            // chaning the access level
            updateUser.UserAccessLevel = inputAccessLevel;

            _db.SaveChanges();

            MessageBox.Show("Access Level changed Successfully!");

            // reloads the page
            Response.Redirect(Request.RawUrl);
        }

        protected void btnAddPlayer_Click(object sender, EventArgs e)
        {
            Context _db = new Context();

            // turing off the validation required for changing user access level
            RequiredFieldValidator8.Enabled = false;
            
            // turn on requireed validation
            TurnOnAddTeamProfileValidation();

            TeamInfo newTeamProfile = new TeamInfo();
            int userId = int.Parse(txtTeamUserID.Text);

            newTeamProfile.UserID = int.Parse(txtTeamUserID.Text);

            //check that the player is not on system
            List<TeamInfo> currentTeam = _db.TeamInfos.Where(t => t.UserID.Equals(userId)).ToList();
            if (currentTeam.Count == 0)
            {
                newTeamProfile.FirstName = txtTeamFirstName.Text;
                newTeamProfile.LastName = txtTeamLastName.Text;
                newTeamProfile.DOB = DateTime.Parse(txtTeamDOB.Text);
                newTeamProfile.About = txtTeamAbout.Text;
                newTeamProfile.Email = txtTeamEmail.Text;
                newTeamProfile.Phone = txtTeamPhone.Text;
                newTeamProfile.Address1 = txtTeamadd1.Text;
                newTeamProfile.Address2 = txtTeamadd2.Text;
                newTeamProfile.City = txtTeamCity.Text;

                // add Team player record to the database
                _db.TeamInfos.Add(newTeamProfile);
                _db.SaveChanges();

                // clear the text boxes
                txtTeamAbout.Text = String.Empty;
                txtTeamadd1.Text = String.Empty;
                txtTeamadd2.Text = String.Empty;
                txtTeamCity.Text = String.Empty;
                txtTeamDOB.Text = String.Empty;
                txtTeamEmail.Text = String.Empty;
                txtTeamFirstName.Text = String.Empty;
                txtTeamLastName.Text = String.Empty;
                txtTeamPhone.Text = String.Empty;
                txtTeamUserID.Text = String.Empty;

                MessageBox.Show("Team Profile Added Successfully!");
            }
            else
            {
                MessageBox.Show("There is already a Team Profile in place for this member!");
            }
        }

        private void TurnOffAddTeamProfileValidation()
        {
            RequiredFieldValidator1.Enabled = false;
            RequiredFieldValidator2.Enabled = false;
            RequiredFieldValidator3.Enabled = false;
            RequiredFieldValidator4.Enabled = false;
            RequiredFieldValidator5.Enabled = false;
            RequiredFieldValidator6.Enabled = false;
            RequiredFieldValidator7.Enabled = false;
            RequiredFieldValidator9.Enabled = false;
            RequiredFieldValidator10.Enabled = false;
            RequiredFieldValidator11.Enabled = false;
        }

        private void TurnOnAddTeamProfileValidation()
        {
            RequiredFieldValidator1.Enabled = true;
            RequiredFieldValidator2.Enabled = true;
            RequiredFieldValidator3.Enabled = true;
            RequiredFieldValidator4.Enabled = true;
            RequiredFieldValidator5.Enabled = true;
            RequiredFieldValidator6.Enabled = true;
            RequiredFieldValidator7.Enabled = true;
            RequiredFieldValidator9.Enabled = true;
            RequiredFieldValidator10.Enabled = true;
            RequiredFieldValidator11.Enabled = true;
        }

        private void TurnOffAllValidation()
        {
            RequiredFieldValidator1.Enabled = false;
            RequiredFieldValidator2.Enabled = false;
            RequiredFieldValidator3.Enabled = false;
            RequiredFieldValidator4.Enabled = false;
            RequiredFieldValidator5.Enabled = false;
            RequiredFieldValidator6.Enabled = false;
            RequiredFieldValidator7.Enabled = false;
            RequiredFieldValidator8.Enabled = false;
            RequiredFieldValidator9.Enabled = false;
            RequiredFieldValidator10.Enabled = false;
            RequiredFieldValidator11.Enabled = false;
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

    }
}