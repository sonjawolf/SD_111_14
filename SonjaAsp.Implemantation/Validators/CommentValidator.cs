using FluentValidation;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Validators
{
    public class CommentValidator : AbstractValidator<CommentDto>
    {
        public CommentValidator(SonjaAspContext context)
        {
            RuleFor(x => x.Text)
                .NotEmpty().WithMessage("Polje je obavezno.")
                .MaximumLength(160);
        }
    }
}
