using Newtonsoft.Json;
using SonjaAsp.Application;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Logging
{
    public class ConsoleUseCaseLogger: IUseCaseLogger
    {
        public void Log(IUseCase useCase, IAplicationActor actor,object data)
        {
            Console.WriteLine($"{DateTime.Now}: {actor.Identity} pokusava da izvrsi komandu {useCase.Name} koristeci podatke: " +
                $"{JsonConvert.SerializeObject(data)}");
        }
    }
}
