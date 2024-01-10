namespace _26_BuiAnhVu_Assignment2.Models
{
    public class OrderDetail
    {
        public int orderId { get; set; }
        public int productId { get; set; }

        public decimal unitPrice { get; set; }
        public int quantity { get; set; }
        public Order Order { get; set; }
        public Product Product { get; set; }
    }
}
