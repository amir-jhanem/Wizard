using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Wizard.Models;

namespace Wizard.Data.EFCore
{
    public class WizardDbContext : DbContext
    {
        public DbSet<Step> Step { get; set; }
        public DbSet<Item> Item { get; set; }

        public WizardDbContext(DbContextOptions<WizardDbContext> options) 
            : base(options)
        {

        }
    }
}
