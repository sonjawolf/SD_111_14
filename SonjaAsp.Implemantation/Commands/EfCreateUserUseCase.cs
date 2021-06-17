using SonjaAsp.Application.Commands;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.DataAccess;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Commands
{
    public class EfCreateUserUseCase : ICreateUserUseCase
    {
        private readonly SonjaAspContext _context;

        public EfCreateUserUseCase(SonjaAspContext context)
        {
            _context = context;
        }

        public int Id => 25;

        public string Name => "Insert userusecase";

        public void Execute(UserUseCaseDto request)
        {
            var userusecase = new UserUseCase
            {
                UseCaseId = request.UseCaseId,
                Id=request.Id
            };

           

            _context.UserUseCases.Add(userusecase);
            _context.SaveChanges();
        }
    }
}
