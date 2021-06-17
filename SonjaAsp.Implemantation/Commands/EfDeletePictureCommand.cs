using SonjaAsp.Application.Commands;
using SonjaAsp.Application.Exceptions;
using SonjaAsp.DataAccess;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Commands
{
    public class EfDeletePictureCommand : IDeletePictureCommand
    {
        private readonly SonjaAspContext _context;

        public EfDeletePictureCommand(SonjaAspContext context)
        {
            _context = context;
        }

        public int Id => 23;

        public string Name => "Delete slike";

        public void Execute(int request)
        {
            var picture = _context.Pictures.Find(request);
            if (picture == null)
            {
                throw new EntityNotFoundException(request,typeof(Picture));
            }
            _context.Pictures.Remove(picture);
            _context.SaveChanges();

        }
    }
}
