using Newtonsoft.Json;
using SonjaAsp.Application;
using SonjaAsp.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Logging
{
    public class DatabaseUseCaseLogger : IUseCaseLogger
    {
        private readonly SonjaAspContext _context;

        public DatabaseUseCaseLogger(SonjaAspContext context)
        {
            _context = context;
        }

        public void Log(IUseCase useCase, IAplicationActor actor, object useCaseData)
        {
            _context.UseCaseLogs.Add(new Domain.UseCaseLog
            {
                Actor=actor.Identity,
                Data=JsonConvert.SerializeObject(useCaseData),
                Date=DateTime.UtcNow,
                UseCaseName=useCase.Name
            });
            _context.SaveChanges();
        }
    }
}
