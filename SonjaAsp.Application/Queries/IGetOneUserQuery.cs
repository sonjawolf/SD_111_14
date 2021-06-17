using SonjaAsp.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Application.Queries
{
   public interface IGetOneUserQuery:IQuery<int, RegisterUserDto>
    {
    }
}
