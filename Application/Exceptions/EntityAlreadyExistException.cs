using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Exceptions
{
    public class EntityAlreadyExistException : Exception
    {
        public EntityAlreadyExistException() { }
        public EntityAlreadyExistException(int id, Type type)
            : base($"Entity of type {type.Name} with an id {id} already exist") { }
    }
}