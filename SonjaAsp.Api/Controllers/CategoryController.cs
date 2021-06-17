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
    public class CategoryController : ControllerBase
    {
        
        private readonly UseCaseExecutor executor;

        public CategoryController(UseCaseExecutor executor)
        {
           
            this.executor = executor;
        }

        // GET: api/<CategoryController>
        [HttpGet]
        public IActionResult Get([FromQuery] CategorySearch search,
            [FromServices] IGetCategoryQuery query)
        {
            return Ok(executor.ExecuteQuery(query,search));
        }

        // GET api/<CategoryController>
        [HttpGet("{id}",Name ="Dohvati kategoriju")]
        public IActionResult Get(int id,
            [FromServices] IGetOneCategoryQuery query)
        {
            return Ok(executor.ExecuteQuery(query,id));
        }
        [Authorize]
        // POST api/<CategoryController>
        [HttpPost]
        public void Post([FromBody] CategoryDto dto, 
            [FromServices] ICreateCategoryCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }


        [Authorize]
        // DELETE api/<CategoryController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,[FromServices]IDeleteCategoryCommand command)
        {
            executor.ExecuteCommand(command, id);
            return Ok("Deleted from db");
        }
    }
}
