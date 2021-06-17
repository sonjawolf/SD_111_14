using FluentValidation;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SonjaAsp.Implemantation.Validators
{
    public class CreatePostValidator : AbstractValidator<PostDto>
    {
        public CreatePostValidator(SonjaAspContext context)
        {
            RuleFor(x => x.Title).NotEmpty().WithMessage("Polje naslov je obavezno");
            //    .DependentRules(() =>
            //{
            //    RuleFor(x => x.Title).Must(x =>
            //    {
            //        return context.Posts.Any(y => y.Title == x);
            //    }).WithMessage("Naslov mora biti jedinstven.");
            //});

            RuleFor(x => x.Text).NotEmpty().WithMessage("Polje za tekst je obavezno.");
            RuleFor(x => x.CategoryId).NotEmpty().WithMessage("Polje za kategoriju je obavezno.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.CategoryId).Must(x =>
                    {
                        return context.Categories.Any(y => y.Id == x);
                    }).WithMessage("Takva kategorija ne postoji.");
                });
            
        }
    }
}
