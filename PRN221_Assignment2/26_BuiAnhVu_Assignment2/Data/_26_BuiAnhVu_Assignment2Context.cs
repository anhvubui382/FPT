using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using _26_BuiAnhVu_Assignment2.Models;

namespace _26_BuiAnhVu_Assignment2.Data
{
    public class _26_BuiAnhVu_Assignment2Context : DbContext
    {
        public _26_BuiAnhVu_Assignment2Context (DbContextOptions<_26_BuiAnhVu_Assignment2Context> options)
            : base(options)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<OrderDetail>().HasKey(od => new { od.orderId, od.productId });
            //set username as unique
            modelBuilder.Entity<Customer>().HasIndex(c => c.username).IsUnique();
        }
        public DbSet<_26_BuiAnhVu_Assignment2.Models.Product> Product { get; set; } = default!;
        public DbSet<_26_BuiAnhVu_Assignment2.Models.Customer>? Customer { get; set; }
        public DbSet<_26_BuiAnhVu_Assignment2.Models.Order>? Order { get; set; }
    }
}
