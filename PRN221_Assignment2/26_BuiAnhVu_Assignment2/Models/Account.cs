using System.ComponentModel.DataAnnotations;

namespace _26_BuiAnhVu_Assignment2.Models
{
    public class Account
    {
        [Key]
        public int accountID { get; set; }
        public string? userName { get; set; }
        public string? password { get; set; }
        public string? fullName { get; set; }
        public int type { get; set; } = 0;
        public ICollection<Order> Orders { get; set;} 
    }
}
