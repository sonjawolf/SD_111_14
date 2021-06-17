using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SonjaAsp.Domain
{
   public class User:Entity
    {
       
        [Required]
        public string Username { get; set; }
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        public string Email { get; set; }

        public virtual ICollection<UserUseCase> UserUseCases { get; set; } = new HashSet<UserUseCase>();
        public virtual ICollection<Comment> Comments { get; set; } = new HashSet<Comment>();
    }
}
