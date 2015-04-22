using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace WebAssignment.Models
{
    [Table("WebContactUs")]
    public class ContactUsForm
    {
        [Key]
        public int ContactID { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Comment { get; set; }
        public DateTime ContactDate { get; set; }
        public bool ActionTaken { get; set; }
    }
}