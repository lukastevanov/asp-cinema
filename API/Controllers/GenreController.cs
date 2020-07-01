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
    [Route("api/[controller]")]
    [ApiController]
    public class GenreController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public GenreController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/Genre
        [HttpGet]
        public IActionResult Get([FromQuery] GenreSearch search, [FromServices] IGetGenreQuery query)
        {

            return Ok(executor.ExecuteQuery(query, search));

        }

        // GET: api/Genre/5
        [HttpGet("{id}", Name = "GetGenre")]
        public IActionResult Get(int id, [FromQuery] GenreSearch search, [FromServices] IGetGenreQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));

        }

        // POST: api/Genre
        [HttpPost]
        public void Post(
            [FromBody] GenreDTO dto,
            [FromServices] ICreateGenreCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }


        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteGenreCommand command)
        {

            executor.ExecuteCommand(command, id);
            return NoContent();

        }
    }
}
