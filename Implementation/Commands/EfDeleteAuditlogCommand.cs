using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteAuditlogCommand : IDeleteAuditlogCommand
    {
        private readonly CinemaContext _context;

        public EfDeleteAuditlogCommand(CinemaContext context)
        {
            this._context = context;
        }

        public int Id => 4;

        public string Name => "Deleting auditlog";

        public void Execute(int request)
        {
            var audit = _context.UseCaseLogs.Find(request);

            if (audit == null)
            {
                throw new EntityNotFoundException(request, typeof(UseCaseLog));

            }

            _context.UseCaseLogs.Remove(audit);
            _context.SaveChanges();

        }
    }
}
