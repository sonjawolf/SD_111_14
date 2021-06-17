using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Application.Queries
{
   public interface IGetUserQuery:IQuery<UserSearch,PagedResponse<RegisterUserDto>>
    {
    }
}
