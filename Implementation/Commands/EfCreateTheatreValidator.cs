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
    public class EfCreateTheatreCommand : ICreateTheatreCommand
    {
        private readonly CinemaContext context;
        private readonly CreateTheatreValidator validator;

        public EfCreateTheatreCommand(CinemaContext context, CreateTheatreValidator validator)
        {
            this.context = context;
            this.validator = validator;
        }

        public int Id => 4;

        public string Name => "Create new Theatre.";

        public void Execute(TheatreDTO request)
        {
            validator.ValidateAndThrow(request);

            context.Theatres.Add(new Domain.Theatre
            {
                TheatreName = request.TheatreName
            });

            context.SaveChanges();

        }

    }
}
