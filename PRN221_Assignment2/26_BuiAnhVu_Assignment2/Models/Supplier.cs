using System.ComponentModel.DataAnnotations;

namespace _26_BuiAnhVu_Assignment2.Models
{
    public class Supplier
    {
        [Key]
        public int SupplierID { get; set; }
        public string companyName { get; set; }
        public string address { get; set; }
        public string phone { get; set; }
        public ICollection<Product> Products { get; set; }
    }
}
