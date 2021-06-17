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
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class CommentController : ControllerBase
    {
        
        private readonly UseCaseExecutor _executor;

        public CommentController(UseCaseExecutor executor)
        {
           
            _executor = executor;
        }

        // GET: api/<CommentController>
        [HttpGet]
        public IActionResult Get([FromQuery]CommentSearch search,
            [FromServices]IGetCommentQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        //// GET api/<CommentController>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        // POST api/<CommentController>
        [HttpPost]
        public void Post([FromBody] CommentDto dto,
            [FromServices]ICreateCommentCommand command)
        {
            _executor.ExecuteCommand(command, dto);
        }

        // PUT api/<CommentController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] CommentDto dto,
            [FromServices]IUpdateCommentCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
        }

        // DELETE api/<CommentController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,[FromServices]IDeleteCommentCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return Ok("Deleted from db");
        }
    }
}
