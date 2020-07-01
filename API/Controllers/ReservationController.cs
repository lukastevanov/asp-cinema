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
    public class ReservationController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public ReservationController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/Reservation
        [HttpGet]
        public IActionResult Get([FromQuery] ReservationSearch search, [FromServices] IGetReservationQuery query)
        {

            return Ok(executor.ExecuteQuery(query, search));

        }
      

        // POST: api/Reservation
        [HttpPost]
        public void Post(
            [FromBody] ReservationDTO dto,
            [FromServices] IReservationCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }

      

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteReservationCommand command)
        {

            executor.ExecuteCommand(command, id);
            return NoContent();

        }
    }
}
