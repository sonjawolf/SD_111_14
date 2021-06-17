using AutoMapper;
using Microsoft.EntityFrameworkCore;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Application.Queries;
using SonjaAsp.Application.Searches;
using SonjaAsp.DataAccess;
using SonjaAsp.Domain;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SonjaAsp.Implemantation.Queries
{
    public class EfGetPostQuery : IGetPostQuery
    {
        private readonly SonjaAspContext _context;

        public EfGetPostQuery(SonjaAspContext context)
        {
            _context = context;
        }

        public int Id => 15;

        public string Name => "Dohvatanje postova";

        public PagedResponse<PostDto> Execute(PostSearch search)
        {
            var query = _context.Posts.AsQueryable();

            if (!string.IsNullOrEmpty(search.Title) || !string.IsNullOrWhiteSpace(search.Title))
                query = query.Where(x => x.Title.ToLower().Contains(search.Title.ToLower()));

            if (!string.IsNullOrEmpty(search.Text) || !string.IsNullOrWhiteSpace(search.Text))
                query = query.Where(x => x.Text.ToLower().Contains(search.Text.ToLower()));

            

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<PostDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new PostDto
                {
                    Id=x.Id,
                    Title = x.Title,
                    Text = x.Text,
                    PostedAt = x.PostedAt,
                    CategoryId = x.CategoryId
                }).ToList()

            };
            return response;
        }
    }
}