using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteReservationCommand : IDeleteReservationCommand
    {
        private readonly CinemaContext _context;

        public EfDeleteReservationCommand(CinemaContext context)
        {
            this._context = context;
        }

        public int Id => 4;

        public string Name => "Deleting reservation";

        public void Execute(int request)
        {
            var reserv = _context.Reservation.Find(request);

            if (reserv == null)
            {
                throw new EntityNotFoundException(request, typeof(Genres));

            }

            _context.Reservation.Remove(reserv);
            _context.SaveChanges();

        }
    }
}
