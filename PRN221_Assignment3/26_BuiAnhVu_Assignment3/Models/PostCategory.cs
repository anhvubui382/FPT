namespace _26_BuiAnhVu_Assignment3.Models
{
    public class PostCategory
    {
        [Key]
        public int CategoryID { get; set; }

        [Required]
        public string CategoryName { get; set; }

        [Required]
        public string Description { get; set; }
    }
}
