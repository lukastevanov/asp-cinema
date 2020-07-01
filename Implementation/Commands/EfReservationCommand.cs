using Application.Commands;
using Application.DataTransfer;
using DataAccess;
using FluentValidation;
using Implementation.Validator;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfReservationCommand : IReservationCommand
    {
        private readonly CinemaContext _context;
        private readonly ReservationValidator validator;

        public EfReservationCommand(CinemaContext context, ReservationValidator validator)
        {
            _context = context;
            this.validator = validator;
        }

        public int Id => 4;

        public string Name => "Make new reservation";

        public void Execute(ReservationDTO request)
        {
            validator.ValidateAndThrow(request);

            _context.Reservation.Add(new Domain.Reservation
            {
               MovieName=request.MovieName
            });
            _context.Tickets.Add(new Domain.Tickets
            {
                TicketPrice = request.Ticket
            });
            _context.SaveChanges();

        }

    
    }
}
