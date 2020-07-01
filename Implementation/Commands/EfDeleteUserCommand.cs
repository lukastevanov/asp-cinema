using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteUserCommand : IDeleteUserCommand
    {
        private readonly CinemaContext _context;

        public EfDeleteUserCommand(CinemaContext context)
        {
            this._context = context;
        }

        public int Id => 4;

        public string Name => "Deleting user";

        public void Execute(int request)
        {
            var user = _context.Users.Find(request);

            if (user == null)
            {
                throw new EntityNotFoundException(request, typeof(User));

            }

            _context.Users.Remove(user);
            _context.SaveChanges();

        }
    }
}
