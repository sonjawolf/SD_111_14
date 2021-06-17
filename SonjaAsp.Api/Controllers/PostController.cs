using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SonjaAsp.Application;
using SonjaAsp.Application.Commands;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Application.Queries;
using SonjaAsp.Application.Searches;
using SonjaAsp.DataAccess;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SonjaAsp.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PostController : ControllerBase
    {

        
        private readonly UseCaseExecutor _executor;

        public PostController(UseCaseExecutor executor)
        {

            _executor = executor;
        }

        // GET: api/<PostController>
        [HttpGet]
        public IActionResult Get([FromQuery] PostSearch search,
            [FromServices]IGetPostQuery query)
        {
            return Ok(_executor.ExecuteQuery(query,search));
        }

        // GET api/<PostController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id,[FromServices]IGetOnePostQuery query)
        {
            return Ok(_executor.ExecuteQuery(query,id));
        }
        [Authorize]
        // POST api/<PostController>
        [HttpPost]
        public void Post([FromBody] PostDto dto,
            [FromServices]ICreatePostCommand command)
        {
            _executor.ExecuteCommand(command, dto);
        }
        [Authorize]
        // PUT api/<PostController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] PostDto dto,
            [FromServices]IUpdatePostCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
        }

        // DELETE api/<PostController>/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,[FromServices]IDeletePostCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
