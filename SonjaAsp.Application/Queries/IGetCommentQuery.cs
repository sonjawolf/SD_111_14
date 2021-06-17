using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Application.Queries
{
   public interface IGetCommentQuery:IQuery<CommentSearch,PagedResponse<CommentDto>>
    {
    }
}
