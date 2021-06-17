using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SonjaAsp.Implemantation.Validators
{
   public class CreateCategoryValidator:AbstractValidator<CategoryDto>
    {
        public CreateCategoryValidator(SonjaAspContext context)
        {
            RuleFor(x => x.CategoryName)

                .NotEmpty()
                .WithMessage("Polje je obavezno.").DependentRules(() =>
                {
                    RuleFor(x => x.CategoryName).Must(x =>
                    {
                        return !context.Categories.Any(y => y.CategoryName == x);
                    }).WithMessage("Kategorija sa istim nazivom postoji u bazi.");
                });

                
        }
    }
}
