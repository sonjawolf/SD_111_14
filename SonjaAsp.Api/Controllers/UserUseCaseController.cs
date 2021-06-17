using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SonjaAsp.Application;
using SonjaAsp.Application.Commands;
using SonjaAsp.Application.DataTransfer;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SonjaAsp.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserUseCaseController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public UserUseCaseController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }


        //// GET: api/<UserUseCaseController>
        //[HttpGet]
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

        //// GET api/<UserUseCaseController>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        // POST api/<UserUseCaseController>
        [HttpPost]
        public void Post([FromBody] UserUseCaseDto dto,
            [FromServices] ICreateUserUseCase command)
        {
            executor.ExecuteCommand(command, dto);
        }

        //// PUT api/<UserUseCaseController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        // DELETE api/<UserUseCaseController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,[FromServices]IDeleteUserUseCaseCommand command)
        {
            executor.ExecuteCommand(command, id);
            return Ok("Deleted from db");
        }
    }
}
