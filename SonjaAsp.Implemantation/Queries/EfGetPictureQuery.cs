using AutoMapper;
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
    public class EfGetPictureQuery : IGetPictureQuery
    {
        private readonly SonjaAspContext _context;

        public EfGetPictureQuery(SonjaAspContext context)
        {
            _context = context;
        }

        public int Id => 24;

        public string Name => "Prikaz slika";

        public PagedResponse<PictureDto> Execute(PictureSearch search)
        {
            var query = _context.Pictures.AsQueryable();

            if (!string.IsNullOrEmpty(search.Alt) || !string.IsNullOrWhiteSpace(search.Alt))
            {
                query = query.Where(x => x.Alt.ToLower().Contains(search.Alt.ToLower()));
            }
            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<PictureDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new PictureDto
                {
                   Id=x.Id,
                   Alt=x.Alt,
                   PostId=x.PostId
                }).ToList()

            };
            return response;

        }
    }
}
