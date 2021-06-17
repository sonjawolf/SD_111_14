
using Microsoft.EntityFrameworkCore;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Application.Queries;
using SonjaAsp.Application.Searches;
using SonjaAsp.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SonjaAsp.Implemantation.Queries
{
    public class EfGetCommentQuery : IGetCommentQuery
    {
        private readonly SonjaAspContext _context;

        public EfGetCommentQuery(SonjaAspContext context)
        {
            _context = context;
           
        }

        public int Id => 21;

        public string Name => "Komentari";

        public PagedResponse<CommentDto> Execute(CommentSearch search)
        {
            var query = _context.Comments.Include(x => x.User).AsQueryable();
            if (!string.IsNullOrEmpty(search.Text) || !string.IsNullOrWhiteSpace(search.Text))
                query = query.Where(x => x.Text.ToLower().Contains(search.Text.ToLower()));

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<CommentDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new CommentDto
                {
                   Id=x.Id,
                   Text=x.Text,
                   User=x.User,
                   UserId=x.UserId,
                   PostId=x.PostId
                   
                }).ToList()

            };
            return response;
        }
    }
}
