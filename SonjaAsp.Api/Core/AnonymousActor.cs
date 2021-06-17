using SonjaAsp.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SonjaAsp.Api.Core
{
    public class AnonymousActor : IAplicationActor
    {
        public int Id => 0;

        public string Identity => "AnonymousActor";

    
        public IEnumerable<int> AllowedUseCases => new List<int> { 4,15,16,8 };
    }

  
}
