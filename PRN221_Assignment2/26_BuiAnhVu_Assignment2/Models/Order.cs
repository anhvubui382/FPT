using System.ComponentModel.DataAnnotations;

namespace _26_BuiAnhVu_Assignment2.Models
{
    public class Order
    {
        [Key]
        public int orderId { get; set; }
        public int customerId { get; set; }
        public DateTime orderDate { get; set; }
        public DateTime RequiredDate { get; set; }
        public DateTime ShippedDate { get; set; }
        public decimal freight { get; set; }
        public Customer customer;
        public ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
