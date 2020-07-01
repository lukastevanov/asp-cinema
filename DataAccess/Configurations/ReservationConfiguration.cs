using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configurations
{
    public class ReservationConfiguration : IEntityTypeConfiguration<Reservation>
    {
        public void Configure(EntityTypeBuilder<Reservation> builder)
        {
            //   builder.HasMany(r => r.Tickets).WithOne(r => r.Reservation).HasForeignKey(u=>u.TicketId)
            //      .OnDelete(DeleteBehavior.Restrict);
            builder.Property(x => x.ReservationId).IsRequired();


        }
    }
}
