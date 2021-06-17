using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authorization.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using SonjaAsp.Application;
using SonjaAsp.Application.Queries;
using SonjaAsp.Application.Searches;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SonjaAsp.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class AuditLoggerController : ControllerBase
    {
       
        private readonly UseCaseExecutor _executor;

        public AuditLoggerController(UseCaseExecutor executor)
        {
           
            _executor = executor;
        }


        // GET: api/<AuditLoggerController>
        [HttpGet]
        public IActionResult Get([FromQuery]LoggerSearch search,
            [FromServices]IGetUseCaseLogQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }



        //// GET api/<AuditLoggerController>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        //// POST api/<AuditLoggerController>
        //[HttpPost]
        //public void Post([FromBody] string value)
        //{
        //}

        //// PUT api/<AuditLoggerController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE api/<AuditLoggerController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
