using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Application
{
   public interface IAplicationActor
    {
        int Id { get; }
        string Identity { get; }
        IEnumerable<int> AllowedUseCases { get; } 
    }
}
