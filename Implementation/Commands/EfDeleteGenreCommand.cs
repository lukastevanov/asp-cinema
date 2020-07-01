using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteGenreCommand : IDeleteGenreCommand
    {
        private readonly CinemaContext _context;

        public EfDeleteGenreCommand(CinemaContext context)
        {
            this._context = context;
        }

        public int Id => 4;

        public string Name => "Deleting genre";

        public void Execute(int request)
        {
            var genre = _context.Genres.Find(request);

            if (genre == null)
            {
                throw new EntityNotFoundException(request, typeof(Genres));

            }

            _context.Genres.Remove(genre);
            _context.SaveChanges();

        }
    }
}
