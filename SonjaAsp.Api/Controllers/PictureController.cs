using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using SonjaAsp.Application;
using SonjaAsp.Application.Commands;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Application.Queries;
using SonjaAsp.Application.Searches;
using SonjaAsp.DataAccess;
using SonjaAsp.Domain;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SonjaAsp.Api.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class PictureController : ControllerBase
    {
        private readonly SonjaAspContext _context;
        private readonly UseCaseExecutor _executor;
        public PictureController(SonjaAspContext context, UseCaseExecutor executor)
        {
            _context = context;
            _executor = executor;
        }

        // GET: api/<PictureController>
        [Authorize]
        [HttpGet]
        public IActionResult Get([FromQuery]PictureSearch search,
            [FromServices]IGetPictureQuery query)
        {
            return Ok(_executor.ExecuteQuery(query,search));
        }

        //// GET api/<PictureController>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        // POST api/<PictureController>
        [Authorize]
        [HttpPost]
        public void Post([FromForm] PictureDto dto)
        {
           
            var guid = Guid.NewGuid();
            var extension = Path.GetExtension(dto.ImagePicture.FileName);

            var newFileName = guid + extension;

            var path = Path.Combine("wwwroot", "images", newFileName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                dto.ImagePicture.CopyTo(fileStream);
            }
            var picture = new Picture
            {
                PictureName =newFileName,
                Alt = dto.Alt,
                PostId = dto.PostId

            };
            _context.Pictures.Add(picture);
            _context.SaveChanges();

        }

        //// PUT api/<PictureController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        // DELETE api/<PictureController>/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,[FromServices]IDeletePictureCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return Ok("Slika je obrisana");
        }
    }
}
