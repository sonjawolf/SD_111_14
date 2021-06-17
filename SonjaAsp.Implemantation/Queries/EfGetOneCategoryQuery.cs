
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Application.Exceptions;
using SonjaAsp.Application.Queries;
using SonjaAsp.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Queries
{
    public class EfGetOneCategoryQuery : IGetOneCategoryQuery
    {
        private readonly SonjaAspContext _context;
        

        public EfGetOneCategoryQuery(SonjaAspContext context)
        {
            _context = context;
        }

        public int Id => 8;

        public string Name => "Dohvatanje jedne kategorije";

        public CategoryDto Execute(int id)
        {
            var category = _context.Categories.Find(id);
            
            if (category == null)
            {
                throw new EntityNotFoundException();
            }
            
             return new CategoryDto
                {
                    Id=category.Id,
                    CategoryName=category.CategoryName
                };
        }
    }
}