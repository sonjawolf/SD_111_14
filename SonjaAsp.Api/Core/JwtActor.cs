using SonjaAsp.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SonjaAsp.Api.Core
{
    public class JwtActor : IAplicationActor
    {
        public int Id  { get; set; }

        public string Identity { get; set; }

        public IEnumerable<int> AllowedUseCases { get; set; }
    }
}
