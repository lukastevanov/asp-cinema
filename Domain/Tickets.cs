using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Tickets : Entity
    {
        public int TicketId {get;set;}

        public decimal TicketPrice { get; set; }

        public virtual Reservation Reservation{ get; set; }

    }
}
