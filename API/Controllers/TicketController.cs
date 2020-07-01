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
    public class TicketController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public TicketController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/Ticket
        [HttpGet]
        public IActionResult Get([FromQuery] TicketSearch search, [FromServices] IGetTicketsQuery query)
        {

            return Ok(executor.ExecuteQuery(query, search));

        }

 
        [HttpPost]
        // POST: api/Ticket
        public void Post(
             [FromBody] TicketDTO dto,
             [FromServices] ICreateTickedCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }


        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteTicketCommand command)
        {

            executor.ExecuteCommand(command, id);
            return NoContent();

        }
    }
}
