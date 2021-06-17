using AutoMapper;
using SonjaAsp.Application;
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
    public class EfGetUserQuery : IGetUserQuery
    {
        private readonly SonjaAspContext _context;
       

        public EfGetUserQuery(SonjaAspContext context)
        {
            _context = context;
           
        }


        public int Id => 10;

        public string Name => "Select Svih korisnika";

        public PagedResponse<RegisterUserDto> Execute(UserSearch search)
        {
           
            var query = _context.Users.AsQueryable();

            if (!string.IsNullOrEmpty(search.Username) || !string.IsNullOrWhiteSpace(search.Username))
            {
                query = query.Where(x => x.Username.ToLower().Contains(search.Username.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<RegisterUserDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new RegisterUserDto
                {
                   Id=x.Id,
                   FirstName=x.FirstName,
                   LastName=x.LastName,
                   Username=x.Username,
                   Password=x.Password,
                   Email=x.Email
                }).ToList()

            };
            return response;
        }

       
    }
}
