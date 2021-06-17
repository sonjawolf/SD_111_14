using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Application.DataTransfer
{
   public class UseCaseLogDto
    {
        
        public DateTime Date { get; set; }
        public string UseCaseName { get; set; }
        public string Actor { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
    }
}
