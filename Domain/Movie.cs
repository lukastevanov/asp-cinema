using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
   public class Movie : Entity
    {
        public int MovieId { get; set; }
        public string Name { get; set; }
        public decimal Duration { get; set; }

        public virtual Theatre Theatre { get; set; }
        public virtual Genres Genres { get; set; }


    }
}
