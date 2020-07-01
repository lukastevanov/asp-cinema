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
    public class RegisterController : ControllerBase
    {
     
        private readonly UseCaseExecutor executor;

        public RegisterController(UseCaseExecutor executor)
        {
            this.executor = executor;
           
        }
                [HttpGet]

        public IActionResult Get([FromQuery] UserSearch search, [FromServices] IGetUsersQuery query)
        {

            return Ok(executor.ExecuteQuery(query, search));

        }


        [HttpGet("{id}", Name = "GetUsers")]
        public IActionResult Get([FromQuery]int id, [FromServices] IGetSingleUserQuery query)
        {
            return null; 
        }


        [HttpPut("{id}")]
        public void Put(int id, [FromBody] RegisterUserDto dto, [FromServices] IUpdateUserCommand command)
        {
            dto.Rid = id;

            executor.ExecuteCommand(command, dto);
        }

        // POST: api/Register
        [HttpPost]
        public void Post(
            [FromBody] RegisterUserDto dto,
            [FromServices] IRegisterUserCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }

        public IActionResult Delete(int id, [FromServices] IDeleteUserCommand command)
        {

            executor.ExecuteCommand(command, id);
            return NoContent();

        }
    }
}
