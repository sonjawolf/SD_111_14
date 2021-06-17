using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Application.DataTransfer
{
  public class PostDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Text { get; set; }
        public int CategoryId { get; set; }
        public DateTime PostedAt { get; set; }
        public virtual Category Category { get; set; }
    
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<Picture> Pictures { get; set; }

    }
}
