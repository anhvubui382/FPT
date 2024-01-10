using System.ComponentModel.DataAnnotations;

namespace _26_BuiAnhVu_Assignment2.Models
{
    public class Customer
    {
        [Key]
        public int customerId { get; set; }
        public string fullName { get; set; }
        public string address { get; set; }
        [StringLength(10, MinimumLength = 10)]
        public string phone { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public int type { get; set; } = 0; 
        public ICollection<Order> Orders { get; set; }
    }
}
