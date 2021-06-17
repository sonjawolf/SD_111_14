using AutoMapper;
using SonjaAsp.Application.Commands;
using SonjaAsp.Application.Exceptions;
using SonjaAsp.DataAccess;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Commands
{
    public class EfDeleteCommentCommand : IDeleteCommentCommand
    {
        private readonly SonjaAspContext _context;

        public EfDeleteCommentCommand(SonjaAspContext context)
        {
            _context = context;
        }

        public int Id => 19;

        public string Name => "Delete komentar";

        public void Execute(int request)
        {
            var comment = _context.Comments.Find(request);

            if (comment == null)
            {
                throw new EntityNotFoundException();
            }

            comment.IsActive = false;
            comment.IsDeleted = true;
                                   
            _context.SaveChanges();
        }
    }
}
