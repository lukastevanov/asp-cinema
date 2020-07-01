using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteMovieCommand : IDeleteMovieCommand
    {
        private readonly CinemaContext _context;

        public EfDeleteMovieCommand(CinemaContext context)
        {
            this._context = context;
        }

        public int Id => 4;

        public string Name => "Deleting movie";

        public void Execute(int request)
        {
            var movie = _context.Movies.Find(request);

            if (movie == null) {
                throw new EntityNotFoundException(request, typeof(Movie));
            
            }

            _context.Movies.Remove(movie);
            _context.SaveChanges();

        }
    }
}
