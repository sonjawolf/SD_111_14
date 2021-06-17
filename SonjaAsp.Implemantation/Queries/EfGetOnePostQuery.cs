using AutoMapper;
using FluentValidation.Validators;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Application.Exceptions;
using SonjaAsp.Application.Queries;
using SonjaAsp.DataAccess;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Queries
{
    public class EfGetOnePostQuery : IGetOnePostQuery
    {
        private readonly SonjaAspContext _context;
        
        public EfGetOnePostQuery(SonjaAspContext context)
        {
            _context = context;
        }

        public int Id =>16;

        public string Name => "Dohvatanje jednog posta po id-ju";

        public PostDto Execute(int search)
        {
            var post = _context.Posts.Find(search);
            if (post == null)
            {
                throw new EntityNotFoundException();
            }

            return new PostDto
            {
                Id = post.Id,
                Title = post.Title,
                Text = post.Text,
                CategoryId = post.CategoryId,
                Category = post.Category,
                PostedAt = post.PostedAt
            };
        }
    }
}
