using SonjaAsp.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Application.Searches
{
   public class CommentSearch:PagedSearch
    {
        public string Text { get; set; }
    }
}
