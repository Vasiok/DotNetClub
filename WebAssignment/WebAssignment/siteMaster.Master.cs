using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using WebAssignment.Models;

namespace WebAssignment
{
    public partial class siteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // load the information for the sidebar slider
            GetForSlider();
        }

        public void GetForSlider()
        {
            try
            {
                Context _db = new Context();
                List<GameResult> listOfResults = _db.GameResults.ToList();
                // sort the list for the most recent games are at the top
                listOfResults = listOfResults.OrderByDescending(x => x.MatchDate).ToList();

                // most recent game values
                lblSliderTitle1.Text = listOfResults[0].HomeTeam + " Vs " + listOfResults[0].AwayTeam;
                lblSliderResult1.Text = listOfResults[0].ScoreHome + " - " + listOfResults[0].ScoreAway;
                lblSliderDate1.Text = listOfResults[0].MatchDate.ToString();

                // second most recent game values
                lblSliderTitle2.Text = listOfResults[1].HomeTeam + " Vs " + listOfResults[1].AwayTeam;
                lblSliderResult2.Text = listOfResults[1].ScoreHome + " - " + listOfResults[1].ScoreAway;
                lblSliderDate2.Text = listOfResults[1].MatchDate.ToString();

                // third most recent game values
                lblSliderTitle3.Text = listOfResults[2].HomeTeam + " Vs " + listOfResults[2].AwayTeam;
                lblSliderResult3.Text = listOfResults[2].ScoreHome + " - " + listOfResults[2].ScoreAway;
                lblSliderDate3.Text = listOfResults[2].MatchDate.ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}