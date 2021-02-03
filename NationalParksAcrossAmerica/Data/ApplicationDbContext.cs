using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using NationalParksAcrossAmerica.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace NationalParksAcrossAmerica.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
        public DbSet<ParkModel> Parks { get; set; }
        public DbSet<UserAccount> Users { get; set; }
    } 
}
