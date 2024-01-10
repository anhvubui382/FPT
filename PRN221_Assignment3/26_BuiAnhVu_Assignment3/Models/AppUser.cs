using System.ComponentModel.DataAnnotations;

namespace _26_BuiAnhVu_Assignment3.Models
{
    public class AppUser
    {
        [Key]
        public int UserID { get; set; }


        public string FullName { get; set; }


        public string Address { get; set; }


        public string Email { get; set; }


        public string Password { get; set; }

        public ICollection<Post> Posts { get; set; }
    }
}
