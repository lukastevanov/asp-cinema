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
    public class EfCreateTicketCommand : ICreateTickedCommand
    {
        private readonly CinemaContext context;
        private readonly CreateTicketValidator validator;

        public EfCreateTicketCommand(CinemaContext context, CreateTicketValidator validator)
        {
            this.context = context;
            this.validator = validator;
        }

        public int Id => 4;

        public string Name => "Create new ticket.";

        public void Execute(TicketDTO request)
        {
            validator.ValidateAndThrow(request);

            context.Tickets.Add(new Domain.Tickets
            {
                TicketPrice = request.TicketPrice
            });

            context.SaveChanges();

        }

    }
}