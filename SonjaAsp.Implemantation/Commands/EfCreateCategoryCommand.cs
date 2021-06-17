
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
    public class EfCreateCategoryCommand : ICreateCategoryCommand
    {
        private readonly SonjaAspContext _context;
        private readonly CreateCategoryValidator _validator;

        public EfCreateCategoryCommand(SonjaAspContext context, CreateCategoryValidator validator)
        {
            _context = context;
            _validator = validator;
          
        }

        public int Id => 5;

        public string Name => "Pravljenje nove kategorije";

        public void Execute(CategoryDto request)
        {
            _validator.ValidateAndThrow(request);
            var category = new Category
            {
                CategoryName = request.CategoryName
            };
               
            _context.Categories.Add(category);
            _context.SaveChanges();

        }
    }
}

