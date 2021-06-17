using AutoMapper;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Application.Queries;
using SonjaAsp.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Queries
{
    public class EfGetOneUserQuery : IGetOneUserQuery
    {
        private readonly SonjaAspContext _context;

        public EfGetOneUserQuery(SonjaAspContext context)
        {
            _context = context;
        }
        public int Id => 11;

        public string Name => "Dohvatanje korisnika po ID";

        public RegisterUserDto Execute(int search)
        {
            var user = _context.Users.Find(search);
            
            if (user == null)
            {
                throw new EntryPointNotFoundException();
            }
            return new RegisterUserDto
            {
                Id = user.Id,
                Username = user.Username,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Email = user.Email,
                Password = user.Password
            };
        }
    }
}
