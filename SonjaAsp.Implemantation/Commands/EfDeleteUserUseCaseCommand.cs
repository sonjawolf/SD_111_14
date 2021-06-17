using SonjaAsp.Application.Commands;
using SonjaAsp.Application.Exceptions;
using SonjaAsp.DataAccess;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Commands
{
    public class EfDeleteUserUseCaseCommand : IDeleteUserUseCaseCommand
    {
        private readonly SonjaAspContext _context;

        public EfDeleteUserUseCaseCommand(SonjaAspContext context)
        {
            _context = context;
        }

        public int Id => 26;

        public string Name => "Delete userUseCase";

        public void Execute(int request)
        {
            var userusecase = _context.UserUseCases.Find(request);
            if (userusecase == null)
            {
                throw new EntityNotFoundException(request, typeof(UserUseCase));
            }
            _context.UserUseCases.Remove(userusecase);
            _context.SaveChanges();
        }
    }
}
