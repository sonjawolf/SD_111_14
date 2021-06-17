using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Application.Searches;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Application.Queries
{
   public interface IGetUseCaseLogQuery:IQuery<LoggerSearch,PagedResponse<UseCaseLogDto>>
    {
    }
}
