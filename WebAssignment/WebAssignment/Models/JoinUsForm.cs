using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebAssignment.Models
{
    [Table("WebJoinUs")]
    public class JoinUsForm
    {
        [Key]
        public int EnquireID { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Position { get; set; }
        public DateTime DOB { get; set; }
        public DateTime EnquireDate { get; set; }
        public bool Replied { get; set; }
    }
}