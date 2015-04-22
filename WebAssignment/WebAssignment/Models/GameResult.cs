using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebAssignment.Models
{
    [Table("WebGameResults")]
    public class GameResult
    {
        [Key]
        public int GameID { get; set; }
        public string HomeTeam { get; set; }
        public string AwayTeam { get; set; }
        public int ScoreHome { get; set; }
        public int ScoreAway { get; set; }
        public DateTime MatchDate { get; set; }
    }
}