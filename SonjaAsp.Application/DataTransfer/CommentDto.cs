using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Application.DataTransfer
{
   public class CommentDto
    {
        public int Id { get; set; }
        public string Text { get; set; }
        
        public int UserId { get; set; }
        public int PostId { get; set; }
        public virtual Post Post { get; set; }
        public virtual User User { get; set; }
    }
}
