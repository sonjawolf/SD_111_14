using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SonjaAsp.Domain
{
   public class Post:Entity
    {
        
        [Required]
        public string Title { get; set; }
        [Required]
        public string Text { get; set; }
        [Required]
        public int CategoryId { get; set; }
        public DateTime PostedAt { get; set; }
        

        public virtual Category Category { get; set; }
        public virtual ICollection<Comment> Comments { get; set; } = new HashSet<Comment>();
        public virtual ICollection<Picture> Pictures { get; set; } = new HashSet<Picture>();

    }
}
