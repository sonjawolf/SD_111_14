using SonjaAsp.Application.Commands;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.DataAccess;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Net;
using System.Text;

namespace SonjaAsp.Implemantation.Commands
{
    public class EfCreatePictureCommand : ICreatePictureCommand
    {
        private readonly SonjaAspContext _context;

        public EfCreatePictureCommand(SonjaAspContext context)
        {
            _context = context;
        }

        public int Id => 22;

        public string Name => "Upload slike" ;

        public void Execute(PictureDto request)
        {
          
        }
    }
}
