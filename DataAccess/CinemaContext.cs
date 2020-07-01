using DataAccess.Configurations;
using Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;


namespace DataAccess
{
    public class CinemaContext : DbContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {


            modelBuilder.ApplyConfiguration(new MovieConfiguration());

            modelBuilder.ApplyConfiguration(new GenresConfiguration());

            modelBuilder.ApplyConfiguration(new ReservationConfiguration());

            modelBuilder.ApplyConfiguration(new TheatreConfiguration());

            modelBuilder.ApplyConfiguration(new TicketsConfiguration());

            modelBuilder.ApplyConfiguration(new UserConfiguration());




            base.OnModelCreating(modelBuilder);
        }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=.\SQLEXPRESS;Initial Catalog=Cinema;Integrated Security=True");
            base.OnConfiguring(optionsBuilder);
        }
        public DbSet<Movie> Movies{get;set;}
        public DbSet<Genres> Genres { get; set; }


        public DbSet<Reservation> Reservation { get; set; }

        public DbSet<Theatre> Theatres { get; set; }

        public DbSet<Tickets> Tickets { get; set; }


        public DbSet<User> Users { get; set; }
        public DbSet<UseCaseLog> UseCaseLogs { get; set; }

    }

}
