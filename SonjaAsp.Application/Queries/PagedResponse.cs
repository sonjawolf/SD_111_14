using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Application.Queries
{
    public class PagedResponse<T> where T:class
    {
        public int TotalCount { get; set; }
        public int CurrentPage { get; set; }
        public int ItemsPerPage { get; set; }
        public IEnumerable<T> Items { get; set; }

        public int PageCount =>(int)Math.Ceiling((float)TotalCount / ItemsPerPage);
    }
}
