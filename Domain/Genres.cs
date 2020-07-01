using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Genres : Entity
    {
        public int GenreId { get; set; }
        public string GenreName { get; set; }

        public virtual ICollection<Movie> Movies { get; set; }

    }
}
