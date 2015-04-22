using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebAssignment.Models
{
    [Table("WebImages")]
    public class ImageUpload
    {
        [Key]
        public int ImageID { get; set; }
        public int MemberID { get; set; }
        public string ImageFileName { get; set; }
        public bool ProfilePic { get; set; }
    }
}