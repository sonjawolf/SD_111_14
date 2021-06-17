using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Application
{
   public interface IUseCaseLogger
    {
        void Log(IUseCase useCase, IAplicationActor actor,object useCaseData);
    }
}
