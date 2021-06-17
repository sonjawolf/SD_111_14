using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Domain
{
   public class Picture:Entity
    {
        public string PictureName { get; set; }
        public int PostId { get; set; }
        public string Alt { get; set; }
        public virtual Post Post { get; set; }
    }
}
