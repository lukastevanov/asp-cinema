USE [master]
GO
/****** Object:  Database [Cinema]    Script Date: 1.7.2020. 15:57:00 ******/
CREATE DATABASE [Cinema]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cinema', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Cinema.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cinema_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Cinema_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Cinema] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cinema].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cinema] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cinema] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cinema] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cinema] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cinema] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cinema] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cinema] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cinema] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cinema] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cinema] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cinema] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cinema] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cinema] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cinema] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cinema] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cinema] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cinema] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cinema] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cinema] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cinema] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cinema] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cinema] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cinema] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cinema] SET  MULTI_USER 
GO
ALTER DATABASE [Cinema] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cinema] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cinema] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cinema] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cinema] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cinema', N'ON'
GO
ALTER DATABASE [Cinema] SET QUERY_STORE = OFF
GO
USE [Cinema]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1.7.2020. 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 1.7.2020. 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[GenreId] [int] NOT NULL,
	[GenreName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 1.7.2020. 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[Duration] [decimal](18, 2) NOT NULL,
	[GenresId] [int] NULL,
	[MovieId] [int] NOT NULL,
	[TheatreId] [int] NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 1.7.2020. 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[ReservationId] [int] NOT NULL,
	[TheatreId] [int] NULL,
	[TicketId] [int] NULL,
	[UserId] [int] NULL,
	[MovieId] [int] NULL,
	[MovieName] [text] NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Theatre]    Script Date: 1.7.2020. 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theatre](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[TheatreId] [int] NOT NULL,
	[TheatreName] [nvarchar](max) NULL,
	[NumberOfSeats] [int] NOT NULL,
	[ProductionTime] [datetime] NULL,
 CONSTRAINT [PK_Theatre] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 1.7.2020. 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[TicketId] [int] NOT NULL,
	[TicketPrice] [decimal](18, 2) NOT NULL,
	[ReservationId] [int] NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 1.7.2020. 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1.7.2020. 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[ReservationId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUserCase]    Script Date: 1.7.2020. 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUserCase](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUserCase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627232606_initial2', N'3.1.5')
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [GenreId], [GenreName]) VALUES (5, CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), 0, NULL, 1, 1, N'SiFi')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [GenreId], [GenreName]) VALUES (6, CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), 0, NULL, 1, 2, N'History')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [GenreId], [GenreName]) VALUES (7, CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), 0, NULL, 1, 3, N'Romance')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [GenreId], [GenreName]) VALUES (8, CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), 0, NULL, 1, 4, N'Action')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [GenreId], [GenreName]) VALUES (9, CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), 0, NULL, 1, 5, N'Horror')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [GenreId], [GenreName]) VALUES (10, CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), 0, NULL, 1, 6, N'Drama')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [GenreId], [GenreName]) VALUES (11, CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), 0, NULL, 1, 7, N'Travel')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [GenreId], [GenreName]) VALUES (12, CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), 0, NULL, 1, 8, N'Adventure')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [GenreId], [GenreName]) VALUES (13, CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), 0, NULL, 1, 9, N'Western')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [GenreId], [GenreName]) VALUES (14, CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), 0, NULL, 1, 10, N'Mystery')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [GenreId], [GenreName]) VALUES (15, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, N'Epic scifi')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [GenreId], [GenreName]) VALUES (16, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, N'string')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [GenreId], [GenreName]) VALUES (17, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, N'Epic scifi 2')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [GenreId], [GenreName]) VALUES (18, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, N'Crime')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (3, N'LOTR', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 1, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (4, N'Avengers', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 1, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (5, N'Titanic', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 1, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (6, N'The Godfather', CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (10, N'Inception', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (11, N'FightClub', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (12, N'Forrest Gump', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (13, N'The Matrix', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (14, N'GoodFellas', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (15, N'StarWars I', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (16, N'StarWars II', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (17, N'StarWars III', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (18, N'StarWars IV', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (19, N'StarWars V', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (20, N'StarWars VI', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (21, N'Harakiri', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (22, N'Parasite', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (23, N'Interstellar', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (24, N'The silence of the lambs', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (25, N'Anand', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (26, N'Seven Samurai', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (27, N'Joker', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (28, N'Whiplash', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (29, N'The intouchables', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (30, N'The presitge', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (31, N'The Pianist', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (32, N'Gladiator', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
INSERT [dbo].[Movies] ([Id], [Name], [CreatedAt], [DeletedAt], [IsActive], [IsDeleted], [ModifiedAt], [Duration], [GenresId], [MovieId], [TheatreId]) VALUES (33, N'The Usual Suspects', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ReservationId], [TheatreId], [TicketId], [UserId], [MovieId], [MovieName]) VALUES (7, CAST(N'2020-05-06T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservation] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ReservationId], [TheatreId], [TicketId], [UserId], [MovieId], [MovieName]) VALUES (9, CAST(N'2020-06-18T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservation] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ReservationId], [TheatreId], [TicketId], [UserId], [MovieId], [MovieName]) VALUES (10, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, N'Avengers')
INSERT [dbo].[Reservation] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ReservationId], [TheatreId], [TicketId], [UserId], [MovieId], [MovieName]) VALUES (11, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, N'Inception')
INSERT [dbo].[Reservation] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ReservationId], [TheatreId], [TicketId], [UserId], [MovieId], [MovieName]) VALUES (12, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, N'Lotr')
INSERT [dbo].[Reservation] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ReservationId], [TheatreId], [TicketId], [UserId], [MovieId], [MovieName]) VALUES (13, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, N'StarWars I')
INSERT [dbo].[Reservation] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ReservationId], [TheatreId], [TicketId], [UserId], [MovieId], [MovieName]) VALUES (14, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, N'StarWars II')
INSERT [dbo].[Reservation] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ReservationId], [TheatreId], [TicketId], [UserId], [MovieId], [MovieName]) VALUES (15, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, N'StarWars III')
INSERT [dbo].[Reservation] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ReservationId], [TheatreId], [TicketId], [UserId], [MovieId], [MovieName]) VALUES (16, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, N'StarWars III')
INSERT [dbo].[Reservation] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ReservationId], [TheatreId], [TicketId], [UserId], [MovieId], [MovieName]) VALUES (17, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, N'StarWars IV')
INSERT [dbo].[Reservation] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ReservationId], [TheatreId], [TicketId], [UserId], [MovieId], [MovieName]) VALUES (18, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, N'StarWars V')
INSERT [dbo].[Reservation] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ReservationId], [TheatreId], [TicketId], [UserId], [MovieId], [MovieName]) VALUES (19, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, N'StarWars VI')
INSERT [dbo].[Reservation] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ReservationId], [TheatreId], [TicketId], [UserId], [MovieId], [MovieName]) VALUES (20, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, N'Joker')
INSERT [dbo].[Reservation] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ReservationId], [TheatreId], [TicketId], [UserId], [MovieId], [MovieName]) VALUES (21, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, N'Whiplash')
SET IDENTITY_INSERT [dbo].[Reservation] OFF
GO
SET IDENTITY_INSERT [dbo].[Theatre] ON 

INSERT [dbo].[Theatre] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TheatreId], [TheatreName], [NumberOfSeats], [ProductionTime]) VALUES (3, CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), 0, NULL, 1, 1, N'Sala 1', 200, CAST(N'2020-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Theatre] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TheatreId], [TheatreName], [NumberOfSeats], [ProductionTime]) VALUES (5, CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), 0, NULL, 1, 2, N'Sala 2', 100, CAST(N'2020-10-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Theatre] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TheatreId], [TheatreName], [NumberOfSeats], [ProductionTime]) VALUES (6, CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), 0, NULL, 1, 3, N'Sala 3', 150, CAST(N'2020-10-25T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Theatre] OFF
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TicketId], [TicketPrice], [ReservationId]) VALUES (1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, CAST(20.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Tickets] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TicketId], [TicketPrice], [ReservationId]) VALUES (2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, CAST(10.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Tickets] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TicketId], [TicketPrice], [ReservationId]) VALUES (3, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, CAST(101.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Tickets] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TicketId], [TicketPrice], [ReservationId]) VALUES (4, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, CAST(120.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Tickets] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TicketId], [TicketPrice], [ReservationId]) VALUES (5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, CAST(120.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Tickets] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TicketId], [TicketPrice], [ReservationId]) VALUES (6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, CAST(30.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Tickets] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TicketId], [TicketPrice], [ReservationId]) VALUES (7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Tickets] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TicketId], [TicketPrice], [ReservationId]) VALUES (8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, CAST(23.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Tickets] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TicketId], [TicketPrice], [ReservationId]) VALUES (9, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, CAST(233.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Tickets] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TicketId], [TicketPrice], [ReservationId]) VALUES (10, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, CAST(233.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Tickets] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TicketId], [TicketPrice], [ReservationId]) VALUES (11, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, 0, CAST(231.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'2020-06-27T22:59:28.0199740' AS DateTime2), N'User Registration', N'{"FirstName":null,"LastName":null,"Username":"pera1","Password":"pera1","Email":null}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'2020-06-27T23:09:17.7947932' AS DateTime2), N'User Registration', N'{"FirstName":"Zika","LastName":"Zikic","Username":"zika1","Password":"zika1","Email":"zika@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'2020-06-27T23:09:32.5200522' AS DateTime2), N'User Registration', N'{"FirstName":"Zika","LastName":"Zikic","Username":"zika1","Password":"zika11","Email":"zika@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (4, CAST(N'2020-06-27T23:23:46.8819157' AS DateTime2), N'User Registration', N'{"FirstName":"Zika","LastName":"Zikic","Username":"zika1","Password":"zika11","Email":"zika@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (5, CAST(N'2020-06-27T23:26:48.6414452' AS DateTime2), N'User Registration', N'{"FirstName":"Zika","LastName":"Zikic","Username":"zika1","Password":"zika11","Email":"zika@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (6, CAST(N'2020-06-27T23:27:46.8992355' AS DateTime2), N'User Registration', N'{"FirstName":"Zika","LastName":"Zikic","Username":"zika1","Password":"zika11","Email":"zika@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (7, CAST(N'2020-06-27T23:31:57.6467205' AS DateTime2), N'User Registration', N'{"FirstName":"Zika","LastName":"Zikic","Username":"zika1","Password":"zika11","Email":"zika@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (8, CAST(N'2020-06-27T23:33:31.8104035' AS DateTime2), N'User Registration', N'{"FirstName":"Zika","LastName":"Zikic","Username":"zika1","Password":"zika11","Email":"zika@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (9, CAST(N'2020-06-28T23:05:57.7610196' AS DateTime2), N'Movie search.', N'{"Name":null,"PerPage":10,"Page":1}', N'Test api user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (10, CAST(N'2020-06-30T15:20:19.5725435' AS DateTime2), N'User search.', N'{"Username":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (11, CAST(N'2020-06-30T17:08:17.1386624' AS DateTime2), N'Create new Genre using Ef', N'{"GenreId":0,"GenreName":"Epic Scifi"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (12, CAST(N'2020-06-30T17:09:53.0149453' AS DateTime2), N'Create new Genre using Ef', N'{"GenreId":0,"GenreName":"Epic Scifi"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (13, CAST(N'2020-06-30T17:11:08.3048796' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":null,"LastName":null,"Username":"muftija","Password":null,"Email":null}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (14, CAST(N'2020-06-30T17:12:48.8406688' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"mesa","LastName":"mesic","Username":"muftija","Password":"muftija1","Email":"muftija@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (15, CAST(N'2020-06-30T17:13:32.9637795' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"mesa","LastName":"mesic","Username":"muftija","Password":"muftija1","Email":"muftija@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (16, CAST(N'2020-06-30T17:14:12.2753018' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"mesa","LastName":"mesic","Username":"muftija","Password":"muftija12","Email":"muftija@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (17, CAST(N'2020-06-30T17:15:07.3384728' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"mesa","LastName":"mesic","Username":"muftija12","Password":"muftija12","Email":"muftija@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (18, CAST(N'2020-06-30T17:20:19.2415187' AS DateTime2), N'Create new Genre using Ef', N'{"GenreId":0,"GenreName":"Epic scifi"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (19, CAST(N'2020-06-30T17:25:13.1333138' AS DateTime2), N'Create new Genre using Ef', N'{"GenreId":0,"GenreName":"Epic scifi"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (20, CAST(N'2020-06-30T19:01:45.5365457' AS DateTime2), N'Create new Genre using Ef', N'{"GenreId":0,"GenreName":"string"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (21, CAST(N'2020-06-30T21:27:30.3137563' AS DateTime2), N'Create new Genre using Ef', N'{"GenreId":0,"GenreName":"Epic scifi 2"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (22, CAST(N'2020-06-30T23:01:22.8652837' AS DateTime2), N'User search.', N'{"Username":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (23, CAST(N'2020-06-30T23:02:24.6136276' AS DateTime2), N'User search.', N'{"Username":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (24, CAST(N'2020-06-30T23:07:31.0245696' AS DateTime2), N'User search.', N'{"Username":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (25, CAST(N'2020-06-30T23:10:16.2039186' AS DateTime2), N'User search.', N'{"Username":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (26, CAST(N'2020-06-30T23:17:13.5634075' AS DateTime2), N'Auditog search.', N'{"Date":"0001-01-01T00:00:00","UseCaseName":null,"Data":null,"Actor":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (27, CAST(N'2020-07-01T01:00:58.0242817' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"stefan","LastName":"petrovic","Username":"stefan1","Password":"stefan1","Email":"stefan@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (28, CAST(N'2020-07-01T01:02:09.8385738' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"Lana","LastName":"Hills","Username":"Hills1","Password":"Hills1","Email":"Hills@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (29, CAST(N'2020-07-01T01:02:31.4655128' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"Wheatley","LastName":"Wheatley","Username":"Wheatley1","Password":"Wheatley1","Email":"Wheatley@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (30, CAST(N'2020-07-01T01:02:47.8373746' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"Sanders","LastName":"Sanders","Username":"Sanders1","Password":"Sanders1","Email":"Sanders@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (31, CAST(N'2020-07-01T01:03:03.5220754' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"Pierce","LastName":"Pierce","Username":"Pierce1","Password":"Pierce1","Email":"Pierce@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (32, CAST(N'2020-07-01T01:03:19.6250451' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"Davie","LastName":"Davie","Username":"Davie1","Password":"Davie1","Email":"Davie@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (33, CAST(N'2020-07-01T01:03:41.8159858' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"Mccaffrey","LastName":"Mccaffrey","Username":"Mccaffrey1","Password":"Mccaffrey1","Email":"Mccaffrey@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (34, CAST(N'2020-07-01T01:04:10.5203930' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"Simmons","LastName":"Simmons","Username":"Simmons1","Password":"Simmons1","Email":"Simmons@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (35, CAST(N'2020-07-01T01:04:32.9925639' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"Berger","LastName":"Berger","Username":"Berger1","Password":"Berger1","Email":"Berger@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (36, CAST(N'2020-07-01T01:04:50.1445357' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"Leal","LastName":"Leal","Username":"Leal1","Password":"Leal1","Email":"Leal@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (37, CAST(N'2020-07-01T01:05:13.5358453' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"Leal","LastName":"Leal","Username":"Herman1","Password":"Herman1","Email":"Leal@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (38, CAST(N'2020-07-01T01:05:29.7930841' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"Caldwell","LastName":"Caldwell","Username":"Caldwell1","Password":"Caldwell1","Email":"Caldwell@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (39, CAST(N'2020-07-01T01:05:45.2176352' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"Livingston","LastName":"Livingston","Username":"Livingston1","Password":"Livingston1","Email":"Livingston@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (40, CAST(N'2020-07-01T01:05:58.6811384' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"Lawson","LastName":"Lawson","Username":"Lawson1","Password":"Lawson1","Email":"Lawson@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (41, CAST(N'2020-07-01T01:06:13.8715478' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"Velasquez","LastName":"Velasquez","Username":"Velasquez1","Password":"Velasquez1","Email":"Velasquez@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (42, CAST(N'2020-07-01T01:06:29.8439740' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"Blackwell","LastName":"Blackwell","Username":"Blackwell1","Password":"Blackwell1","Email":"Blackwell@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (43, CAST(N'2020-07-01T01:06:46.2798012' AS DateTime2), N'User Registration', N'{"Rid":0,"FirstName":"Chamberlain","LastName":"Chamberlain","Username":"Chamberlain1","Password":"Chamberlain1","Email":"Chamberlain@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (44, CAST(N'2020-07-01T01:26:40.2954664' AS DateTime2), N'Make new reservation', N'{"MovieName":"Avengers","dateTime":"0001-01-01T00:00:00"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (45, CAST(N'2020-07-01T01:27:29.7688558' AS DateTime2), N'Create new Genre using Ef', N'{"GenreId":0,"GenreName":null}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (46, CAST(N'2020-07-01T01:27:55.2350959' AS DateTime2), N'Create new Genre using Ef', N'{"GenreId":0,"GenreName":"Crime"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (47, CAST(N'2020-07-01T01:27:58.6747481' AS DateTime2), N'Create new Genre using Ef', N'{"GenreId":0,"GenreName":"Crime"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (48, CAST(N'2020-07-01T01:28:11.2042171' AS DateTime2), N'Create new Genre using Ef', N'{"GenreId":0,"GenreName":"Crime2"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (49, CAST(N'2020-07-01T01:29:35.2072425' AS DateTime2), N'Make new reservation', N'{"MovieName":"Avengers","dateTime":"0001-01-01T00:00:00"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (50, CAST(N'2020-07-01T01:30:25.7349993' AS DateTime2), N'Make new reservation', N'{"MovieName":"Avengers","dateTime":"0001-01-01T00:00:00"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (51, CAST(N'2020-07-01T01:30:59.9815008' AS DateTime2), N'Make new reservation', N'{"MovieName":"Avengers","dateTime":"0001-01-01T00:00:00"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (52, CAST(N'2020-07-01T01:37:40.2135338' AS DateTime2), N'Make new reservation', N'{"MovieName":"Avensssgers","dateTime":"0001-01-01T00:00:00"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (53, CAST(N'2020-07-01T01:44:43.0702470' AS DateTime2), N'Make new reservation', N'{"MovieName":"Avensssgers","dateTime":"0001-01-01T00:00:00"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (54, CAST(N'2020-07-01T01:45:09.2564987' AS DateTime2), N'Make new reservation', N'{"MovieName":"Inception","dateTime":"0001-01-01T00:00:00"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (55, CAST(N'2020-07-01T01:45:16.5345081' AS DateTime2), N'Make new reservation', N'{"MovieName":"Inceptionnnn","dateTime":"0001-01-01T00:00:00"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (56, CAST(N'2020-07-01T08:55:31.4651593' AS DateTime2), N'Make new reservation', N'{"MovieName":"Inceptionnnn","Ticket":20}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (57, CAST(N'2020-07-01T08:56:02.0087297' AS DateTime2), N'Make new reservation', N'{"MovieName":"Lotr","Ticket":20}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (58, CAST(N'2020-07-01T08:58:36.7625767' AS DateTime2), N'Make new reservation', N'{"MovieName":"StarWars I","Ticket":10}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (59, CAST(N'2020-07-01T08:58:45.0010362' AS DateTime2), N'Make new reservation', N'{"MovieName":"StarWars II","Ticket":101}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (60, CAST(N'2020-07-01T08:58:54.4233356' AS DateTime2), N'Make new reservation', N'{"MovieName":"StarWars III","Ticket":120}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (61, CAST(N'2020-07-01T08:58:56.5447112' AS DateTime2), N'Make new reservation', N'{"MovieName":"StarWars III","Ticket":120}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (62, CAST(N'2020-07-01T08:59:07.4163363' AS DateTime2), N'Make new reservation', N'{"MovieName":"StarWars IV","Ticket":30}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (63, CAST(N'2020-07-01T08:59:15.2614075' AS DateTime2), N'Make new reservation', N'{"MovieName":"StarWars V","Ticket":50}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (64, CAST(N'2020-07-01T08:59:34.9431794' AS DateTime2), N'Make new reservation', N'{"MovieName":"StarWars VI","Ticket":23}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (65, CAST(N'2020-07-01T09:00:43.4306057' AS DateTime2), N'Make new reservation', N'{"MovieName":"Joker","Ticket":233}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (66, CAST(N'2020-07-01T09:00:49.5462885' AS DateTime2), N'Make new reservation', N'{"MovieName":"Whiplash","Ticket":233}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (67, CAST(N'2020-07-01T09:01:13.4923054' AS DateTime2), N'Make new reservation', N'{"MovieName":"The prestige","Ticket":231}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (68, CAST(N'2020-07-01T09:01:53.7989321' AS DateTime2), N'Make new reservation', N'{"MovieName":"Anand","Ticket":231}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (69, CAST(N'2020-07-01T09:31:36.8017332' AS DateTime2), N'Genre search.', N'{"Id":0,"GenreName":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (70, CAST(N'2020-07-01T10:08:35.1182044' AS DateTime2), N'Reservation search.', N'{"MovieID":0,"MovieName":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (71, CAST(N'2020-07-01T10:22:01.5180308' AS DateTime2), N'Theatre search.', N'{"TheatreId":0,"TheatreName":null,"NumberOfSeats":0,"ProductionTime":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (72, CAST(N'2020-07-01T10:23:14.5117241' AS DateTime2), N'Theatre search.', N'{"TheatreId":0,"TheatreName":null,"NumberOfSeats":0,"ProductionTime":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (73, CAST(N'2020-07-01T10:25:33.3329234' AS DateTime2), N'Theatre search.', N'{"TheatreId":0,"TheatreName":null,"NumberOfSeats":0,"ProductionTime":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (74, CAST(N'2020-07-01T10:29:23.3030444' AS DateTime2), N'Theatre search.', N'{"TheatreId":0,"TheatreName":null,"NumberOfSeats":0,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (75, CAST(N'2020-07-01T10:40:48.3219356' AS DateTime2), N'Ticket search.', N'{"TicketPrice":0,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (76, CAST(N'2020-07-01T11:15:09.3655190' AS DateTime2), N'Create new Theatre.', N'{"TheatreId":0,"TheatreName":"Sala5","NumberOfSeats":0}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (77, CAST(N'2020-07-01T11:32:35.3499405' AS DateTime2), N'Create new ticket.', N'{"TicketPrice":110}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (78, CAST(N'2020-07-01T12:09:48.0042053' AS DateTime2), N'Deleting genre', N'19', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (80, CAST(N'2020-07-01T12:22:03.3692167' AS DateTime2), N'Deleting auditlog', N'79', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (81, CAST(N'2020-07-01T13:39:59.8276341' AS DateTime2), N'Deleting TICKET', N'12', N'Anonymus')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (13, CAST(N'2020-05-06T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'pera', N'peric', N'pera1', N'pera1', N'pera@gmail.com', NULL)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (15, CAST(N'2020-05-06T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'mika', N'mikic', N'mika1', N'mika1', N'mika@gmail.com', NULL)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (20, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'Zika', N'Zikic', N'zika1', N'zika11', N'zika@gmail.com', NULL)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (21, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'mesa', N'mesic', N'muftija', N'muftija1', N'muftija@gmail.com', NULL)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (22, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'mesa', N'mesic', N'muftija12', N'muftija12', N'muftija@gmail.com', NULL)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (23, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'stefan', N'petrovic', N'stefan1', N'stefan1', N'stefan@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (24, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'Lana', N'Hills', N'Hills1', N'Hills1', N'Hills@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (25, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'Wheatley', N'Wheatley', N'Wheatley1', N'Wheatley1', N'Wheatley@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (26, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'Sanders', N'Sanders', N'Sanders1', N'Sanders1', N'Sanders@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (27, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'Pierce', N'Pierce', N'Pierce1', N'Pierce1', N'Pierce@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (28, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'Davie', N'Davie', N'Davie1', N'Davie1', N'Davie@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (29, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'Mccaffrey', N'Mccaffrey', N'Mccaffrey1', N'Mccaffrey1', N'Mccaffrey@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (30, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'Simmons', N'Simmons', N'Simmons1', N'Simmons1', N'Simmons@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (31, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'Berger', N'Berger', N'Berger1', N'Berger1', N'Berger@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (32, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'Leal', N'Leal', N'Herman1', N'Herman1', N'Leal@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (33, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'Caldwell', N'Caldwell', N'Caldwell1', N'Caldwell1', N'Caldwell@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (34, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'Livingston', N'Livingston', N'Livingston1', N'Livingston1', N'Livingston@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (35, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'Lawson', N'Lawson', N'Lawson1', N'Lawson1', N'Lawson@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (36, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'Velasquez', N'Velasquez', N'Velasquez1', N'Velasquez1', N'Velasquez@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (37, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'Blackwell', N'Blackwell', N'Blackwell1', N'Blackwell1', N'Blackwell@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email], [ReservationId]) VALUES (38, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, N'Chamberlain', N'Chamberlain', N'Chamberlain1', N'Chamberlain1', N'Chamberlain@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUserCase] ON 

INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (5, 13, 1)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (6, 13, 2)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (7, 13, 3)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (8, 13, 4)
SET IDENTITY_INSERT [dbo].[UserUserCase] OFF
GO
/****** Object:  Index [IX_Movies_GenresId]    Script Date: 1.7.2020. 15:57:00 ******/
CREATE NONCLUSTERED INDEX [IX_Movies_GenresId] ON [dbo].[Movies]
(
	[GenresId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Movies_Name]    Script Date: 1.7.2020. 15:57:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Movies_Name] ON [dbo].[Movies]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Movies_TheatreId]    Script Date: 1.7.2020. 15:57:00 ******/
CREATE NONCLUSTERED INDEX [IX_Movies_TheatreId] ON [dbo].[Movies]
(
	[TheatreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tickets_ReservationId]    Script Date: 1.7.2020. 15:57:00 ******/
CREATE NONCLUSTERED INDEX [IX_Tickets_ReservationId] ON [dbo].[Tickets]
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUserCase_UserId]    Script Date: 1.7.2020. 15:57:00 ******/
CREATE NONCLUSTERED INDEX [IX_UserUserCase_UserId] ON [dbo].[UserUserCase]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT ((0.0)) FOR [Duration]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT ((0)) FOR [MovieId]
GO
ALTER TABLE [dbo].[Reservation] ADD  DEFAULT ((0)) FOR [ReservationId]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Genres_GenresId] FOREIGN KEY([GenresId])
REFERENCES [dbo].[Genres] ([Id])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Genres_GenresId]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Theatre_TheatreId] FOREIGN KEY([TheatreId])
REFERENCES [dbo].[Theatre] ([Id])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Theatre_TheatreId]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Reservation_ReservationId] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservation] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Reservation_ReservationId]
GO
ALTER TABLE [dbo].[UserUserCase]  WITH CHECK ADD  CONSTRAINT [FK_UserUserCase_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUserCase] CHECK CONSTRAINT [FK_UserUserCase_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [Cinema] SET  READ_WRITE 
GO
