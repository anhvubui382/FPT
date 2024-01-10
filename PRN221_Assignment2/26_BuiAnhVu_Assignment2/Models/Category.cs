using System.ComponentModel.DataAnnotations;

namespace _26_BuiAnhVu_Assignment2.Models
{
    public class Category
    {
        [Key]
        public int categoryId { get; set; }
        public string CategoryName { get; set; }
        public string Description { get; set; }
        public ICollection<Product> Products { get; set; }
    }
}
