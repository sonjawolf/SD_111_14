using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Application.Exceptions
{
    public class UnauthorizedUseCaseException:Exception
    {
        public UnauthorizedUseCaseException(IUseCase useCase, IAplicationActor actor)
        : base($"Actor with an id of {actor.Id} - {actor.Identity} tried to execute {useCase.Name}.")
        {
        }
    }

}
