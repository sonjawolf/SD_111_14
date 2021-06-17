using AutoMapper;
using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using SonjaAsp.Application;
using SonjaAsp.Application.Commands;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Application.Exceptions;
using SonjaAsp.DataAccess;
using SonjaAsp.Domain;
using SonjaAsp.Implemantation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SonjaAsp.Implemantation.Commands
{
    public class EfUpdateUserCommand : IUpdateUserCommand
    {
        private readonly SonjaAspContext _context;
        
        private readonly RegisterUserValidator _validator;

        public EfUpdateUserCommand(SonjaAspContext context,  RegisterUserValidator validator)
        {
            _context = context;
           
            _validator = validator;
        }

        public int Id => 12;

        public string Name => "Update korisnika";

        public void Execute(RegisterUserDto request)
        {
            _validator.ValidateAndThrow(request);
            var user = _context.Users.Find(request.Id);
           
            if (user == null)
            {
                throw new EntityNotFoundException();
            }
            _context.Users.Update(new User
            {
                FirstName = request.FirstName,
                LastName = request.LastName,
                Username = request.Username,
                Password = request.Password,
                Email = request.Email,                
                ModifiedAt = DateTime.UtcNow
        });           
            _context.SaveChanges();
        }
    }
}
