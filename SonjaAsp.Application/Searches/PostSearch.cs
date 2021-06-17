using SonjaAsp.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Application.Searches
{
    public class PostSearch:PagedSearch
    {
        public string Title { get; set; }
        public string Text { get; set; }
        public int CategoryId { get; set; }

    }
}
