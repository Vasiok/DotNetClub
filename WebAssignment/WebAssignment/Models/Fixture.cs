using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebAssignment.Models
{
    [Table("WebFixtures")]
    public class Fixture
    {
        [Key]
        public int FixturesId { get; set; }
        public string HomeTeam { get; set; }
        public string AwayTeam { get; set; }
        public string PitchName { get; set; }
        public DateTime FutureMatchDate { get; set; }
    }
}