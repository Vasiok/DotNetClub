using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace WebAssignment.Models
{
    public class Context : DbContext
    {
        public Context()
            : base("connString") // connection string as defined in web.config
        {

        }

        // declaring a property of type DBSet (collection) nad of object type "X"
        public DbSet<ContactUsForm> ContactUsS { get; set; }
        public DbSet<JoinUsForm> JoinUsS { get; set; }
        public DbSet<ImageUpload> ImageUploadS { get; set; }
        public DbSet<LoginRegister> LoginS { get; set; }
        public DbSet<Fixture> Fixtures { get; set; }
        public DbSet<GameResult> GameResults { get; set; }
        public DbSet<TeamInfo> TeamInfos { get; set; }
        public DbSet<DBXml> DBXMLS { get; set; }

    }
}