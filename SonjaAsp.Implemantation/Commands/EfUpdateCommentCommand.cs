using FluentValidation;
using SonjaAsp.Application.Commands;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Application.Exceptions;
using SonjaAsp.DataAccess;
using SonjaAsp.Implemantation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Commands
{
    public class EfUpdateCommentCommand : IUpdateCommentCommand
    {
        private readonly SonjaAspContext _context;
        private readonly CommentValidator _validator;

        public EfUpdateCommentCommand(SonjaAspContext context, CommentValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 20;

        public string Name =>"Update komentara";

        public void Execute(CommentDto request)
        {
            _validator.ValidateAndThrow(request);

            var comment = _context.Comments.Find(request.Id);

            if (comment == null)
            {
                throw new EntityNotFoundException();
            }
            comment.Text = request.Text;
            comment.ModifiedAt = DateTime.UtcNow;
            
            _context.SaveChanges();
        }
    }
}
