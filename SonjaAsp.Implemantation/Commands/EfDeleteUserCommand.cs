using SonjaAsp.Application.Commands;
using SonjaAsp.Application.Exceptions;
using SonjaAsp.DataAccess;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Commands
{
   public class EfDeleteUserCommand : IDeleteUserCommand
    {
        private readonly SonjaAspContext _context;

        public EfDeleteUserCommand(SonjaAspContext context)
        {
            _context = context;
        }

        public int Id => 9;

        public string Name => "Brisanje korisnika iz baze";

        public void Execute(int request)
        {
            var user = _context.Users.Find(request);
            if (user == null)
            {
                throw new EntityNotFoundException(request, typeof(User));
            }
            user.IsActive = false;
            user.IsDeleted = true;
            user.ModifiedAt = DateTime.UtcNow;

            _context.SaveChanges();
        }
    }
}
