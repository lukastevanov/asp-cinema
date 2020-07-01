using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
   public class Reservation : Entity
    {
        public int ReservationId { get; set; }
        public string MovieName { get; set; }
        public int TheatreId { get; set; }
        public int TicketId { get; set; }

        public int UserId { get; set; }
    }
}
