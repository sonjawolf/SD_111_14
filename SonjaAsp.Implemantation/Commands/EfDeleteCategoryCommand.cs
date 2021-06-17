using SonjaAsp.Application.Commands;
using SonjaAsp.Application.Exceptions;
using SonjaAsp.DataAccess;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Commands
{
    public class EfDeleteCategoryCommand : IDeleteCategoryCommand
    {
        private readonly SonjaAspContext _context;

        public EfDeleteCategoryCommand(SonjaAspContext context)
        {
            _context = context;
        }

        public int Id => 6;

        public string Name => "Brisanje kategorije";

        public void Execute(int request)
        {
            var category = _context.Categories.Find(request);
            if (category == null)
            {
                throw new EntityNotFoundException(request, typeof(Category));
            }
            _context.Categories.Remove(category);
            _context.SaveChanges();
        }
    }
}
