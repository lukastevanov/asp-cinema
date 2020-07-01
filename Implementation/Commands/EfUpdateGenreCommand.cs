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
    public class EfUpdateGenreCommand : IUpdateGenreCommand
    {
        private readonly CinemaContext _context;
        private readonly UpdateGenreValidator validator;
        public EfUpdateGenreCommand(CinemaContext context, UpdateGenreValidator validator)
        {
            _context = context;
            this.validator = validator;
        }

        public int Id => 1;

        public string Name => "Create new movie using Ef";

        public void Execute(GenreDTO request)
        {
            validator.ValidateAndThrow(request);

            var genre = new GenreDTO
            {
                GenreName = request.GenreName
            };

         //   _context.Genres.Add(movie);
           // _context.SaveChanges();

        }

   
    }
}