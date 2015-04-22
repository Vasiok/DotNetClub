using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// adding using directives
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using WebAssignment.Models;
using System.Windows.Forms;
using System.Web.UI.HtmlControls;

namespace WebAssignment
{
    public partial class LoginPage : System.Web.UI.Page
    {
        // user access level
        public string userAccess = null;
        public string adminAccess = "level1";
        public string coachAccess = "level2";
        public string playerAccess = "level3";
        public string guestAccess = "Guest";
        public bool loginStatus;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            // SEO Meta tag
            HtmlMeta meta = new HtmlMeta();
            meta.Name = "description";
            meta.Content = "Login Page - Login here to access the Dot Net Football website. Or to register as a guest.";
            MetaPlaceHolder.Controls.Add(meta);

            HtmlMeta meta2 = new HtmlMeta();
            meta2.Name = "keywords";
            meta2.Content = "Login Page, Register Page, Login and Register, Dot Net Football Club, HTML, CSS, XML, JavaScript.";
            MetaPlaceHolder.Controls.Add(meta2);

            HtmlMeta meta3 = new HtmlMeta();
            meta3.Name = "author";
            meta3.Content = "Emma Jane Heneghan, Alex Suleac";
            MetaPlaceHolder.Controls.Add(meta3);

            // setting up session variables
            userAccess = (String)Session["AccessLevel"];

            // if the userAccess has a value, they have already logged into the system
            if (userAccess != null)
            {
                loginStatus = true;
            }
            else // they need to log in
                loginStatus = false;
            
            // changing login to logout
            if (loginStatus) // equals true -if they are logged in, they come back to logout
            {
                WelcomeLabel.Text = "You are now logged out";

                loginON.Visible = true; // turn on login 
                loginOFF.Visible = false; // turn on logout

                // clearing Session
                Session["Username"] = String.Empty;
                Session["AccessLevel"] = null;
                Session["loginStatus"] = false;
                Session["MemberID"] = null;
            }
            else if (!loginStatus) // equals false
            {
                WelcomeLabel.Text = "Please Login";

                loginON.Visible = true;
                loginOFF.Visible = false;
            }

            // turning off all validation - validation will be set on the button action
            TurnOffValidation();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            LoginValidationEnabler();

            string inputUsername = tbUsername.Text;
            string inputPassword = tbPassword.Text;
            bool success = false;

            Context _db = new Context();
            List<LoginRegister> currentUsers = _db.LoginS.ToList();
            List<TeamInfo> memberIdList = _db.TeamInfos.ToList();
            
            for (int i = 0; i < currentUsers.Count; i++)
            {
                // checking username
                if (currentUsers[i].UserName == inputUsername)
                {
                    // checking password
                    if (currentUsers[i].UserPassword == inputPassword)
                    {
                        MessageBox.Show("Login successful!");
                        success = true;

                        // setting session information
                        Session["Username"] = currentUsers[i].UserName;
                        Session["AccessLevel"] = currentUsers[i].UserAccessLevel;

                        // get users MemberID - only for members, not for guests
                        for (int j = 0; j < memberIdList.Count(); j++)
                        {
                            if (currentUsers[i].UserID == memberIdList[j].UserID)
                            {
                                // need member ID for Gallery upload
                                Session["MemberID"] = memberIdList[j].MemberID;
                                break;
                            }
                        }
                        
                        // clearing the testbox
                        tbUsername.Text = String.Empty;

                        userAccess = currentUsers[i].UserAccessLevel;
                        // sending the user away from the page
                        if (userAccess == adminAccess)
                        {
                            adminOnly.Visible = true;
                            Server.Transfer("AdminOnly.aspx");
                        }
                        else if (userAccess == coachAccess)
                        {
                            Server.Transfer("ResultsNFixtures.aspx");
                        }
                        else if (userAccess == playerAccess)
                        {
                            Server.Transfer("TeamProfiles.aspx");
                        }
                        else if (userAccess == guestAccess)
                        {
                            Server.Transfer("Default.aspx");
                        }

                        // Login successful
                        break;
                    }
                }
            }
            if (!success)
            {
                MessageBox.Show("Login failure!", "Please try again");
                tbUsername.Text = String.Empty;
                tbPassword.Text = String.Empty;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            RegisterValidationEnabler();

            LoginRegister newRegister = new LoginRegister();

            // get list of current users
            Context _db = new Context();
            List<LoginRegister> currentUsers = _db.LoginS.ToList();
            bool UsernameInUse = false;

            for (int i = 0; i < currentUsers.Count; i++)
            {
                if (txtUsername.Text.Equals(currentUsers[i].UserName))
                {
                    UsernameInUse = true;
                    break;
                }
            }

            if (UsernameInUse)
            {
                MessageBox.Show("Username already in use.", "Please try again");
                txtUsername.Text = String.Empty;
            }
            else
            {
                if (txtPassword.Text.Equals(txtPassword2.Text))
                {
                    newRegister.UserName = txtUsername.Text;
                    newRegister.UserFullName = txtFullName.Text;
                    newRegister.UserPosition = txtPosition.Text;
                    // default login access "Guest"
                    newRegister.UserAccessLevel = "Guest";
                    newRegister.UserPassword = txtPassword.Text;

                    // add User record to the database
                    _db.LoginS.Add(newRegister);
                    _db.SaveChanges();

                    MessageBox.Show("Registration Successful!");

                    // clear text boxes
                    txtFullName.Text = String.Empty;
                    txtPassword.Text = String.Empty;
                    txtPassword2.Text = String.Empty;
                    txtPosition.Text = String.Empty;
                    txtUsername.Text = String.Empty;
                }
                else if (!txtPassword.Text.Equals(txtPassword2.Text))
                {
                    txtPassword.Text = String.Empty;
                    txtPassword2.Text = String.Empty;
                    MessageBox.Show("Please ensure your Passwords Match!");
                }
            }
        }

        private void TurnOffValidation()
        {
            // turning required fields off
            RequiredFieldValidator1.Enabled = false;
            RequiredFieldValidator2.Enabled = false;
            RequiredFieldValidator3.Enabled = false;
            RequiredFieldValidator4.Enabled = false;
            RequiredFieldValidator5.Enabled = false;
            RequiredFieldValidator6.Enabled = false;
            RequiredFieldValidator7.Enabled = false;
        }

        private void LoginValidationEnabler()
        {
            // turning required fields on/off
            RequiredFieldValidator1.Enabled = true;
            RequiredFieldValidator2.Enabled = true;
            RequiredFieldValidator3.Enabled = false;
            RequiredFieldValidator4.Enabled = false;
            RequiredFieldValidator5.Enabled = false;
            RequiredFieldValidator6.Enabled = false;
            RequiredFieldValidator7.Enabled = false;
        }

        private void RegisterValidationEnabler()
        {
            // turning required fields on/off
            RequiredFieldValidator1.Enabled = false;
            RequiredFieldValidator2.Enabled = false;
            RequiredFieldValidator3.Enabled = true;
            RequiredFieldValidator4.Enabled = true;
            RequiredFieldValidator5.Enabled = true;
            RequiredFieldValidator6.Enabled = true;
            RequiredFieldValidator7.Enabled = true;
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            // show the register div
            register.Visible = true;
            // hide the register button
            btnShow.Visible = false;
        }

    }
}