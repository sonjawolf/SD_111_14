using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;


// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SonjaAsp.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    {
       

        // POST api/<UploadController>
        [HttpPost]
        public void Post([FromForm] UploadDto dto)
        {
            //id = dto.PostId;
            var guid = Guid.NewGuid();
            var extension = Path.GetExtension(dto.Image.FileName);

            var newFileName = guid + extension;

            var path = Path.Combine("wwwroot", "images", newFileName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                dto.Image.CopyTo(fileStream);
            }
        }
        public class UploadDto
        {
            public IFormFile Image { get; set; }
           // public int PostId { get; set; }

        }
    }
}
