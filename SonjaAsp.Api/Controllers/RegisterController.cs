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

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SonjaAsp.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegisterController : ControllerBase
    {
        
        private readonly UseCaseExecutor _executor;

        public RegisterController(UseCaseExecutor executor)
        {
          
            _executor = executor;
        }

        // GET: api/<RegisterController>
        [Authorize]
        [HttpGet]
        public IActionResult Get([FromQuery] UserSearch search,
            [FromServices] IGetUserQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<REgisterController>
        [HttpGet("{id}", Name = "Dohvati korisnika po ID-u")]
        public IActionResult Get(int id,
            [FromServices] IGetOneUserQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }
        // PUT: api/<REgisterController>
        [Authorize]
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] RegisterUserDto dto, 
            [FromServices] IUpdateUserCommand command)
        {
            dto.Id = id;

            _executor.ExecuteCommand(command, dto);
        }


        // POST api/<RegisterController>

        [HttpPost]
        public void Post(
            [FromBody] RegisterUserDto dto,
            [FromServices]IRegisterUserCommand command )
        {
            _executor.ExecuteCommand(command, dto);
        }

        // DELETE api/<RegisterController>/
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteUserCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }

    }
}
