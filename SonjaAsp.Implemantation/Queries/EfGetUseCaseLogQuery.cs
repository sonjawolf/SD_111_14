using AutoMapper;
using Microsoft.VisualBasic;
using SonjaAsp.Application;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Application.Queries;
using SonjaAsp.Application.Searches;
using SonjaAsp.DataAccess;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Text;

namespace SonjaAsp.Implemantation.Queries
{
    public class EfGetUseCaseLogQuery : IGetUseCaseLogQuery
    {
        private readonly SonjaAspContext _context;        

        public EfGetUseCaseLogQuery(SonjaAspContext context)
        {
            _context = context;           
        }

        public int Id => 25;

        public string Name => "Pretraga UseCaseLogera";

        public PagedResponse<UseCaseLogDto> Execute(LoggerSearch search)
        {
            var query = _context.UseCaseLogs.AsQueryable();

            if (!string.IsNullOrEmpty(search.UseCaseName) || !string.IsNullOrWhiteSpace(search.UseCaseName))
                query = query.Where(x => x.UseCaseName.ToLower().Contains(search.UseCaseName.ToLower()));

            if (!string.IsNullOrEmpty(search.Actor) || !string.IsNullOrWhiteSpace(search.Actor))
                query = query.Where(x => x.Actor.ToLower().Contains(search.Actor.ToLower()));

            if (search.DateFrom != DateTime.MinValue)
            {
                query = query.Where(x => x.Date.Date >= search.DateFrom.Date);
            }
            if (search.DateTo != DateTime.MinValue && search.DateTo >= search.DateFrom)
            {
                query = query.Where(x => x.Date.Date <= search.DateTo.Date);
            }
            if (search.DateFrom > search.DateTo)
            {
                throw new Exception("Greska");
            }
        
            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<UseCaseLogDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new UseCaseLogDto
                {
                   
                    Date = x.Date,
                    UseCaseName = x.UseCaseName,
                    Actor = x.Actor
                }).ToList()
            };
            return response;
        
        }

        
    }
}
