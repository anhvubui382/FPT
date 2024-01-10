using Microsoft.VisualStudio.Debugger.Contracts;
using System.ComponentModel.DataAnnotations;

namespace _26_BuiAnhVu_Assignment2.Models
{
    public class Product
    {
        [Key]
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int SupplierID { get; set; }
        public int CategoryID { get; set; }
        public string quantityPerUnit {  get; set; }
        public decimal unitPrice { get; set; }
        public string productImage { get; set; }
        public Supplier Supplier { get; set; }
        public Category Category { get; set; }
    }
}
