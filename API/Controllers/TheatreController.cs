using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.DataTransfer;
using Application.Queries;
using Application.Searches;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TheatreController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public TheatreController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/Theatre
        [HttpGet]
        public IActionResult Get([FromQuery] TheatreSearch search, [FromServices] IGetTheatreQuery query)
        {

            return Ok(executor.ExecuteQuery(query, search));

        }
     

        // POST: api/Theatre
        [HttpPost]
        public void Post(
            [FromBody] TheatreDTO dto,
            [FromServices] ICreateTheatreCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }
    

     
    }
}
