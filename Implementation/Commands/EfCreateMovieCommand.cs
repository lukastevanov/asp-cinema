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
    public class EfCreateMovieCommand : ICreateMovieCommand
    {
        private readonly CinemaContext _context;
        private readonly CreateMovieValidator validator;
        public EfCreateMovieCommand(CinemaContext context, CreateMovieValidator validator)
        {
            _context = context;
            this.validator = validator;
        }

        public int Id => 1;

        public string Name => "Create new movie using Ef";

        public void Execute(MovieDTO request)
        {
            validator.ValidateAndThrow(request);

            var movie = new Movie
            {
                Name=request.Name
            };

            _context.Movies.Add(movie);
            _context.SaveChanges();

        }
    }
}
