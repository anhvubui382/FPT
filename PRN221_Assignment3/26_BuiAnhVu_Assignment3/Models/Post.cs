using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace _26_BuiAnhVu_Assignment3.Models
{
    public class Post
    {
        [Key]
        public int PostID { get; set; }

        [ForeignKey("AppUser")]
        public int AuthorID { get; set; }

        public DateTime CreatedDate { get; set; }


        public DateTime UpdatedDate { get; set; }


        public string Title { get; set; }


        public string Content { get; set; }


        public Boolean PublicStatus { get; set; }


        [ForeignKey("PostCategory")]
        public int CategoryID { get; set; }

        public virtual AppUser AppUser { get; set; }
        public virtual PostCategory PostCategory { get; set; }
    }
}
