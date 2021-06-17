using SonjaAsp.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SonjaAsp.Api.Core
{
    public class FakeApiActor : IAplicationActor
    {
        public int Id => 1;

        public string Identity => "Test User Actor";
        public IEnumerable<int> AllowedUseCases => new List<int> { 1 };

    }

    public class AdminFakeApiActor : IAplicationActor
    {
        public int Id => 2;

        public string Identity => "Admin";

        public IEnumerable<int> AllowedUseCases => Enumerable.Range(1, 1000);
    }
}
