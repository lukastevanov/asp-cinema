using Application.Commands;
using Application.DataTransfer;
using DataAccess;
using Domain;
using FluentValidation;
using Implementation.Validator;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfCreateGenreCommand : ICreateGenreCommand
    {
        private readonly CinemaContext context;
        private readonly CreateGenreValidator validator;

        public EfCreateGenreCommand(CinemaContext context, CreateGenreValidator validator)
        {
            this.context = context;
            this.validator = validator;
        }

        public int Id => 4;

        public string Name => "Create new Genre using Ef";

        public void Execute(GenreDTO request)
        {
            validator.ValidateAndThrow(request);

            context.Genres.Add(new Domain.Genres
            {
                GenreName = request.GenreName
            });

            context.SaveChanges();

        }

    }
}