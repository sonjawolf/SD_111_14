using SonjaAsp.Application.Commands;
using SonjaAsp.Application.Exceptions;
using SonjaAsp.DataAccess;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Commands
{
    public class EfDeletePostCommand : IDeletePostCommand
    {
        private readonly SonjaAspContext _context;

        public EfDeletePostCommand(SonjaAspContext context)
        {
            _context = context;
        }

        public int Id => 14;

        public string Name =>"Delete post";

        public void Execute(int request)
        {
            var post = _context.Posts.Find(request);
            if (post == null)
            {
                throw new EntityNotFoundException(request,typeof(Post));
            }
            post.IsActive = false;
            post.IsDeleted = true;
            post.ModifiedAt = DateTime.UtcNow;

            _context.SaveChanges();
        }
    }
}
