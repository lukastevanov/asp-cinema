using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
   public class Theatre : Entity
    {
        public int TheatreId { get; set; }
        public string TheatreName { get; set; }
        public int NumberOfSeats { get; set; }

        public virtual ICollection<Movie> Movies { get; set; }

    }
}
