using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteTicketCommand : IDeleteTicketCommand
    {
        private readonly CinemaContext _context;

        public EfDeleteTicketCommand(CinemaContext context)
        {
            this._context = context;
        }

        public int Id => 4;

        public string Name => "Deleting TICKET";

        public void Execute(int request)
        {
            var ticket = _context.Tickets.Find(request);

            if (ticket == null)
            {
                throw new EntityNotFoundException(request, typeof(Tickets));

            }

            _context.Tickets.Remove(ticket);
            _context.SaveChanges();

        }
    }
}
