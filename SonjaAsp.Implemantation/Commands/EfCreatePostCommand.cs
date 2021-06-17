using AutoMapper;
using FluentValidation;
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
    public class EfCreatePostCommand : ICreatePostCommand
    {
        private readonly SonjaAspContext _context;
        private readonly CreatePostValidator _validator;
      

        public EfCreatePostCommand(SonjaAspContext context, CreatePostValidator validator)
        {
            _context = context;
            _validator = validator;
            
        }

        public int Id => 13;

        public string Name => "Dodavanje novog posta";

        public void Execute(PostDto request)
        {
            _validator.ValidateAndThrow(request);
            var post = new Post
            {
                Title = request.Title,
                Text = request.Text,
                CategoryId = request.CategoryId,
                PostedAt = DateTime.UtcNow
            };
            //var post = _mapper.Map<Post>(request);
            _context.Posts.Add(post);
            _context.SaveChanges();
        }
    }
}


