using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.Queries;
using Application.Searches;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuditlogController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public AuditlogController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/Auditlog
        [HttpGet]
        public IActionResult Get([FromQuery] AuditlogSearch search, [FromServices] IGetAuditlogQuery query)
        {

            return Ok(executor.ExecuteQuery(query, search));

        }
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteAuditlogCommand command)
        {

            executor.ExecuteCommand(command, id);
            return NoContent();

        }
    }
}
