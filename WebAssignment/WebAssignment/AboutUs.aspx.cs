using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using WebAssignment.Models;

namespace WebAssignment
{
    public partial class AboutUs : System.Web.UI.Page
    {
        // user access level
        public string userAccess = null;
        public string userName = String.Empty;
        public string adminAccess = "level1";
        public bool loginStatus;

        protected void Page_Load(object sender, EventArgs e)
        {
            // SEO Meta tag s
            HtmlMeta meta = new HtmlMeta();
            meta.Name = "description";
            meta.Content = "About Page - Dot Net Football was founded for a group assignment in Web and Database Application Development.";
            MetaPlaceHolder.Controls.Add(meta);

            HtmlMeta meta2 = new HtmlMeta();
            meta2.Name = "keywords";
            meta2.Content = "About Us Page, Dot Net Football Club, HTML, CSS, XML, JavaScript.";
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
                adminOnly.Visible = true;
            }
        }

        protected void btnCode_Click(object sender, EventArgs e)
        {
            // redirect to Code of Ethics page
            Server.Transfer("CodeOfEthics.aspx");
        }

        protected void btnPrivacy_Click(object sender, EventArgs e)
        {
            // redirect to Privacy Policy page
            Server.Transfer("PrivacyPolicy.aspx");
        }
    }
}