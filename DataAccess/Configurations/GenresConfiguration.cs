using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configurations
{
    public class GenresConfiguration : IEntityTypeConfiguration<Genres>
    {
        public void Configure(EntityTypeBuilder<Genres> builder)
        {
            builder.HasMany(r => r.Movies).WithOne(r => r.Genres).HasForeignKey(u => u.MovieId)
           .OnDelete(DeleteBehavior.Restrict);

            builder.Property(x => x.GenreName).IsRequired().HasMaxLength(30);


        }
    }
}
