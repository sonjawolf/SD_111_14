using FluentValidation;
using SonjaAsp.Application.Commands;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Application.Email;
using SonjaAsp.DataAccess;
using SonjaAsp.Domain;
using SonjaAsp.Implemantation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Commands
{
    public class EfRegisterUserCommand : IRegisterUserCommand
    {
        public int Id => 4;

        public string Name => "User registration.";

        private readonly SonjaAspContext _context;
        private readonly RegisterUserValidator _validator;
        private readonly IEmailSender _sender;


        public EfRegisterUserCommand(SonjaAspContext context, RegisterUserValidator validator, IEmailSender emailSender)
        {
            _context = context;
            _validator = validator;
            _sender = emailSender;
        }

        public void Execute(RegisterUserDto request)
        {
            _validator.ValidateAndThrow(request);

            _context.Users.Add(new User
            {
                FirstName=request.FirstName,
                LastName=request.LastName,
                Username=request.Username,
                Password=request.Password,
                Email=request.Email
            });
            _context.SaveChanges();

            _sender.Send(new SendEmailDto
            {
                Content="<h1>Successifull registration</h1>",
                SendTo=request.Email,
                Subject="Registration!"
            });
        }
    }
}
