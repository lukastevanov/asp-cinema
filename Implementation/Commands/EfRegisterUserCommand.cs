using Application.Commands;
using Application.DataTransfer;
using Application.Email;
using DataAccess;
using FluentValidation;
using Implementation.Validator;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfRegisterUserCommand : IRegisterUserCommand
    {
        public int Id => 4;

        public string Name => "User Registration";

        private readonly CinemaContext _context;
        private readonly RegisterUserValidator _validator;
        private readonly IEmailSender _sender;

        public EfRegisterUserCommand(CinemaContext context, RegisterUserValidator validator, IEmailSender sender)
        {
            _context = context;
            _validator = validator;
            _sender = sender;
        }

        public void Execute(RegisterUserDto request)
        {
            _validator.ValidateAndThrow(request);

            _context.Users.Add(new Domain.User
            {
                FirstName = request.FirstName,
                LastName = request.LastName,
                Username = request.Username,
                Password = request.Password,
                Email = request.Email
            });

            _context.SaveChanges();

            _sender.Send(new SendEmailDto
            {
                Content = "<h1>Successfull registration!</h1>",
                SendTo = request.Email,
                Subject = "Registration"
            });
        }

      
    }
}

