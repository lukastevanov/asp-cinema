using Application.Commands;
using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Implementation.Commands
{
    public class RawSqlCreateCommand : ICreateMovieCommand
    {
        private readonly IDbConnection dbConnection;

        public RawSqlCreateCommand(IDbConnection dbConnection)
        {
            this.dbConnection = dbConnection;
        }

        public int Id => 2;

        public string Name => "Create movie using raw SQL";

        public void Execute(MovieDTO request)
        {
            throw new NotImplementedException();
        }
    }
}
