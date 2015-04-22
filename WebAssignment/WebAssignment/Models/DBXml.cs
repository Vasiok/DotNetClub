using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebAssignment.Models
{
    [Table("WebXML")]
    public class DBXml
    {
        [Key]
        public int XmlID { get; set; }
        public string XmlFilename { get; set; }
        public string XmlFile { get; set; }
    }
}