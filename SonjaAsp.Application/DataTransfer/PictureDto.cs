using Microsoft.AspNetCore.Http;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Application.DataTransfer
{
    public class PictureDto
    {
        public int Id { get; set; }
        public IFormFile ImagePicture { get; set; }
        public string Alt { get; set; }
        public int PostId { get; set; }
        public virtual Post Post { get; set; }
    }
}
