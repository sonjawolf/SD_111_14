
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
    public class EfGetCategoryQuery : IGetCategoryQuery
    {
        private readonly SonjaAspContext _context;
        

        public EfGetCategoryQuery(SonjaAspContext context)
        {
            _context = context;
           
        }

        public int Id => 7;

        public string Name => "Select kategorija";

        public PagedResponse<CategoryDto> Execute(CategorySearch search)
        {
            var query = _context.Categories.AsQueryable();
            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.CategoryName.ToLower().Contains(search.Name.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<CategoryDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new CategoryDto
                {
                    Id=x.Id,
                    CategoryName=x.CategoryName

                }).ToList()

            };
            return response;
        }

    }
}
