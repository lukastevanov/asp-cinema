using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries;
using Application.Searches;
using DataAccess;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
     [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class MovieController : ControllerBase
    {
      
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;
       

        public MovieController(IApplicationActor actor, UseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }
        private readonly CinemaContext context;
        // GET: api/Movie
        [HttpGet]
        public IActionResult Get([FromQuery] MovieSearch search,[FromServices] IGetMoviesQuery query)
        {
         
            return Ok(executor.ExecuteQuery(query,search));
            
        }

       

        // POST: api/Movie
        [HttpPost]
        public void Post([FromBody] MovieDTO dto,[FromServices] ICreateMovieCommand command)
        {
            executor.ExecuteCommand(command, dto);   

        }

     
        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,[FromServices] IDeleteMovieCommand command)
        {

            executor.ExecuteCommand(command, id);
            return NoContent();

        }
    }
}
