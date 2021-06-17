using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SonjaAsp.Domain
{
   public class Category:Entity

    {
        
        [Required]
        public string CategoryName { get; set; }
        public virtual ICollection<Post> Posts { get; set; }
    }
}
