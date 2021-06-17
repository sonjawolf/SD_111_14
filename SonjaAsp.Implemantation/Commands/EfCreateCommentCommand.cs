using AutoMapper;
using SonjaAsp.Application.Commands;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.DataAccess;
using SonjaAsp.Domain;
using SonjaAsp.Implemantation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Commands
{
    public class EfCreateCommentCommand : ICreateCommentCommand
    {
        private readonly SonjaAspContext _context;
        private readonly CommentValidator _validator;

        public EfCreateCommentCommand(SonjaAspContext context, CommentValidator validator)
        {
            _context = context;           
            _validator = validator;
        }

        public int Id => 18;

        public string Name => "Dodavanje komentara";

        public void Execute(CommentDto request)
        {
            _validator.Validate(request);
            var comment = new Comment
            {
                Text = request.Text,
                UserId = request.UserId,
                PostId = request.PostId
            };

            _context.Add(comment);
            _context.SaveChanges();
        }
    }
}
