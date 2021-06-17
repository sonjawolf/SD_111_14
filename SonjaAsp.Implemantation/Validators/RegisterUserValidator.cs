using FluentValidation;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SonjaAsp.Implemantation.Validators
{
   public class RegisterUserValidator:AbstractValidator<RegisterUserDto>
    {
        public RegisterUserValidator(SonjaAspContext context)
        {
            RuleFor(x => x.FirstName).NotEmpty().WithMessage("Polje ime je obavezno.");


            RuleFor(x => x.LastName).NotEmpty().WithMessage("Polje prezime je obavezno.");
            RuleFor(x => x.Password)
                .NotEmpty().WithMessage("Polje password je obavezno i mora imati vise od 6 karaktera")
                .MinimumLength(6);

            RuleFor(x => x.Username)
                .NotEmpty()
                .MinimumLength(4).WithMessage("Polje ime je obavezno i mora imati 4 ili vise karaktera.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Username).Must(x =>
                    {
                        return !context.Users.Any(user => user.Username == x);
                    }).WithMessage("Username je zauzet.");
                });
               
            RuleFor(x => x.Email)
                .NotEmpty().WithMessage("Polje Email je obavezno.")
                .EmailAddress();
        }
    }
}
