using Application.Commands;
using Application.DataTransfer;
using Application.Exceptions;
using DataAccess;
using FluentValidation;
using Implementation.Validator;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands
{
    public class EfUpdateUserCommand : IUpdateUserCommand
    {
        private readonly CinemaContext _context;
        private readonly IUpdateUserCommand _updateUser;
        private readonly UpdateUserValidator _validator;

        public EfUpdateUserCommand(CinemaContext context, UpdateUserValidator validator, IUpdateUserCommand updateUser)
        {
            _context = context;
            _validator = validator;
            _updateUser = updateUser;
        }

        public int Id => 2;

        public string Name => "User update";

        public void Execute(RegisterUserDto request)
        {

            var category = _context.Users.Find(request.Rid);

            if (category == null)
            {
                throw new EntityNotFoundException();
            }

            if (category.Username != request.Username)
            {
                if (_context.Users.Any(c => c.Username == request.Username))
                {
                    throw new EntityAlreadyExistException();
                }
                _validator.ValidateAndThrow(request);

                category.Username = request.Username;

                _context.SaveChanges();



            }
        }
    }
}
