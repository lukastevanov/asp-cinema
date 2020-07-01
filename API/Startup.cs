using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using API.Core;
using Application;
using Application.Commands;
using Application.Email;
using Application.Queries;
using DataAccess;
using Implementation.Commands;
using Implementation.Email;
using Implementation.Logging;
using Implementation.Queries;
using Implementation.Validator;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;

namespace API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var appSettings = new AppSettings();
            Configuration.Bind(appSettings);


            
            services.AddTransient<ICreateMovieCommand, EfCreateMovieCommand>();
            services.AddTransient<IDeleteMovieCommand, EfDeleteMovieCommand>();
            services.AddTransient<IDeleteUserCommand, EfDeleteUserCommand>();

            services.AddTransient<IDeleteGenreCommand, EfDeleteGenreCommand>();
            services.AddTransient<IDeleteReservationCommand, EfDeleteReservationCommand>();
            services.AddTransient<IDeleteAuditlogCommand, EfDeleteAuditlogCommand>();
            services.AddTransient<IDeleteTicketCommand, EfDeleteTicketCommand>();


            services.AddTransient<IRegisterUserCommand, EfRegisterUserCommand>();
            services.AddTransient<IReservationCommand, EfReservationCommand>();
            services.AddTransient<ICreateTheatreCommand, EfCreateTheatreCommand>();
            services.AddTransient<ICreateTickedCommand, EfCreateTicketCommand>();


            services.AddTransient<CinemaContext>();
           // services.AddTransient<IUpdateUserCommand, EfUpdateUserCommand>();

            services.AddUserCases();
            services.AddApplicationActor();
            services.AddJwt(appSettings);

           /// services.AddTransient<IApplicationActor, FakeApiActor>();
            services.AddTransient<IGetMoviesQuery, EfGetMoviesQuery>();
            services.AddTransient<IGetGenreQuery, EfGetGenreQuery>();
            services.AddTransient<IGetReservationQuery, EfGetReservationQuery>();
            services.AddTransient<IGetTheatreQuery, EfGetTheatreQuery>();
            services.AddTransient<IGetTicketsQuery, EfGetTicketsQuery>();

            services.AddTransient<IGetAuditlogQuery, EfGetAuditlogQuery>();

            services.AddTransient<IGetUsersQuery, EfGetUsersQuery>();

            services.AddTransient<IUseCaseLogger, DatabaseUseCaseLogger>();
          

            services.AddTransient<AnonymousActor>();
            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<CreateGenreValidator>();
            services.AddTransient<CreateTheatreValidator>();
            services.AddTransient<CreateTicketValidator>();

            services.AddTransient<ReservationValidator>();

            //   services.AddTransient<UpdateUserValidator>();

            services.AddTransient<IEmailSender, SmtpEmailSender>(x => new SmtpEmailSender(appSettings.EmailFrom, appSettings.EmailPassword));


            services.AddHttpContextAccessor();


            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Cinema", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 12345abcdef'",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                {
                    {
                        new OpenApiSecurityScheme
                          {
                            Reference = new OpenApiReference
                              {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                              },
                              Scheme = "oauth2",
                              Name = "Bearer",
                              In = ParameterLocation.Header,

                            },
                            new List<string>()
                          }
                    });
            });


            services.AddTransient<UseCaseExecutor>();
            services.AddTransient<CreateMovieValidator>();

            services.AddControllers();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();
            app.UseStaticFiles();
            app.UseSwagger();

            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Swagger");
            });
            app.UseMiddleware<GlobalExceptionHandler>();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
