using AutoMapper;
using FluentValidation;
using SonjaAsp.Application.Commands;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Application.Exceptions;
using SonjaAsp.DataAccess;
using SonjaAsp.Domain;
using SonjaAsp.Implemantation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Commands
{
    public class EfUpdatePostCommand : IUpdatePostCommand
    {
        private readonly SonjaAspContext _context;
        private readonly CreatePostValidator _validator;

        public EfUpdatePostCommand(SonjaAspContext context, CreatePostValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 17;

        public string Name => "Update posta";

        public void Execute(PostDto request)
        {
            _validator.ValidateAndThrow(request);

            var post = _context.Posts.Find(request.Id);
            
            if (post == null)
            {
                throw new EntityNotFoundException();
            }
            _context.Posts.Update(new Post
            {
                Title=request.Title,
                Text=request.Text,
                CategoryId=request.CategoryId,
                ModifiedAt=DateTime.UtcNow
            });
            _context.SaveChanges();
        }
    }
}
