USE [master]
GO
/****** Object:  Database [Championship]    Script Date: 05-Mar-18 23:29:43 ******/
CREATE DATABASE [Championship]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Championship', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Championship.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Championship_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Championship_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Championship] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Championship].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Championship] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Championship] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Championship] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Championship] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Championship] SET ARITHABORT OFF 
GO
ALTER DATABASE [Championship] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Championship] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Championship] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Championship] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Championship] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Championship] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Championship] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Championship] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Championship] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Championship] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Championship] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Championship] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Championship] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Championship] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Championship] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Championship] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Championship] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Championship] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Championship] SET  MULTI_USER 
GO
ALTER DATABASE [Championship] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Championship] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Championship] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Championship] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Championship] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Championship]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[id] [int] NOT NULL,
	[name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClothesBrand]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClothesBrand](
	[id] [int] NOT NULL,
	[name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Coaches]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coaches](
	[id] [int] NOT NULL,
	[name] [nvarchar](30) NULL,
	[countries_FK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[id] [int] NOT NULL,
	[name] [nvarchar](30) NULL,
	[Groups_FK] [int] NULL,
	[clothesBrand_FK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group_Matches]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Matches](
	[id] [int] NOT NULL,
	[Group_FK] [int] NULL,
	[date] [date] NULL,
	[Country_FK1] [int] NULL,
	[Goals_1] [int] NULL,
	[Country_FK2] [int] NULL,
	[Goals_2] [int] NULL,
	[stadium_FK] [int] NULL,
	[Viewers] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group_Matches_Players_statistics]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Matches_Players_statistics](
	[id] [int] NOT NULL,
	[Player_FK] [int] NULL,
	[Group_Matches_FK] [int] NULL,
	[goal_minute] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupMatches_Results]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMatches_Results](
	[id] [int] NOT NULL,
	[groups_FK] [int] NULL,
	[countriesId_FK] [int] NULL,
	[games] [int] NULL,
	[wins] [int] NULL,
	[draws] [int] NULL,
	[losses] [int] NULL,
	[balls] [nvarchar](15) NULL,
	[delta] [int] NULL,
	[points] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[groups]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groups](
	[id] [int] NOT NULL,
	[name] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Players]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[id] [int] NOT NULL,
	[name] [nvarchar](30) NULL,
	[Posititon_FK] [int] NULL,
	[Countries_FK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlayOff]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayOff](
	[id] [int] NOT NULL,
	[1/8_teams] [int] NULL,
	[1/8_goals] [int] NULL,
	[1/4_teams] [int] NULL,
	[1/4_goals] [int] NULL,
	[1/2_teams] [int] NULL,
	[1/2_goals] [int] NULL,
	[Final_teams] [int] NULL,
	[Final_goals] [int] NULL,
	[Finalist] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlayOff_Matches_Players_statistics]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayOff_Matches_Players_statistics](
	[id] [int] NOT NULL,
	[Player_FK] [int] NULL,
	[Playoff_FK] [int] NULL,
	[goal_minute] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Playoff_statistics]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playoff_statistics](
	[id] [int] NOT NULL,
	[Game_part] [nvarchar](10) NULL,
	[date] [date] NULL,
	[country_1] [int] NULL,
	[Goals_1] [int] NULL,
	[country_2] [int] NULL,
	[Goals_2] [int] NULL,
	[Stadium_FK] [int] NULL,
	[Viewers] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Positions]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[id] [int] NOT NULL,
	[name] [nvarchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stadiums]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stadiums](
	[id] [int] NOT NULL,
	[name] [nvarchar](30) NULL,
	[capacity] [int] NULL,
	[city_FK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Cities] ([id], [name]) VALUES (1, N'Bloemfontein')
INSERT [dbo].[Cities] ([id], [name]) VALUES (2, N'Cape Town')
INSERT [dbo].[Cities] ([id], [name]) VALUES (3, N'Durban')
INSERT [dbo].[Cities] ([id], [name]) VALUES (4, N'Johannesburg')
INSERT [dbo].[Cities] ([id], [name]) VALUES (5, N'Kimberley')
INSERT [dbo].[Cities] ([id], [name]) VALUES (6, N'Klerksdorp')
INSERT [dbo].[Cities] ([id], [name]) VALUES (7, N'Nelspruit')
INSERT [dbo].[Cities] ([id], [name]) VALUES (8, N'Orkney')
INSERT [dbo].[Cities] ([id], [name]) VALUES (9, N'Polokwane')
INSERT [dbo].[Cities] ([id], [name]) VALUES (10, N'Port Elizabeth')
INSERT [dbo].[Cities] ([id], [name]) VALUES (11, N'Pretoria')
INSERT [dbo].[Cities] ([id], [name]) VALUES (12, N'Rustenburg')
INSERT [dbo].[ClothesBrand] ([id], [name]) VALUES (1, N'Adidas')
INSERT [dbo].[ClothesBrand] ([id], [name]) VALUES (6, N'Brooks')
INSERT [dbo].[ClothesBrand] ([id], [name]) VALUES (5, N'Joma')
INSERT [dbo].[ClothesBrand] ([id], [name]) VALUES (7, N'Legea')
INSERT [dbo].[ClothesBrand] ([id], [name]) VALUES (2, N'Nike')
INSERT [dbo].[ClothesBrand] ([id], [name]) VALUES (3, N'Puma')
INSERT [dbo].[ClothesBrand] ([id], [name]) VALUES (4, N'Umbro')
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (1, N'Carlos Alberto Parreira', 1)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (2, N'Javier Aguirre', 2)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (3, N'scar Tabrez', 3)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (4, N'Raymond Domenech', 4)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (5, N'Diego Maradona', 5)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (6, N'Lars Lagerbck', 6)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (7, N'Huh Jung-moo', 7)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (8, N'Otto Rehhagel', 8)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (9, N'Fabio Capello', 9)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (10, N'Bob Bradley', 10)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (11, N'Rabah Sadane', 11)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (12, N'Matja Kek', 12)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (13, N'Joachim Lw', 13)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (14, N'Pim Verbeek', 14)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (15, N'Radomir Anti', 15)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (16, N'Milovan Rajevac', 16)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (17, N'Bert van Marwijk', 17)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (18, N'Morten Olsen', 18)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (19, N'Takeshi Okada', 19)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (20, N'Paul Le Guen', 20)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (21, N'Marcello Lippi', 21)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (22, N'Gerardo Martino', 22)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (23, N'Ricki Herbert', 23)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (24, N'Vladimr Weiss', 24)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (25, N'Dunga', 25)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (26, N'Kim Jong-hun', 26)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (27, N'Sven-Gran Eriksson', 27)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (28, N'Carlos Queiroz', 28)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (29, N'Vicente del Bosque', 29)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (30, N'Ottmar Hitzfeld', 30)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (31, N'Reinaldo Rueda', 31)
INSERT [dbo].[Coaches] ([id], [name], [countries_FK]) VALUES (32, N'Marcelo Bielsa', 32)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (1, N'South Africa', 1, 1)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (2, N'Mexico', 1, 1)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (3, N'Uruguay', 1, 3)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (4, N'France', 1, 1)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (5, N'Argentina', 2, 1)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (6, N'Nigeria', 2, 1)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (7, N'South Korea', 2, 2)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (8, N'Greece', 2, 1)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (9, N'England', 3, 4)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (10, N'United States', 3, 2)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (11, N'Algeria', 3, 3)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (12, N'Slovenia', 3, 2)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (13, N'Germany', 4, 1)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (14, N'Australia', 4, 2)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (15, N'Serbia', 4, 2)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (16, N'Ghana', 4, 3)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (17, N'Netherlands', 5, 2)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (18, N'Denmark', 5, 1)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (19, N'Japan', 5, 1)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (20, N'Cameroon', 5, 3)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (21, N'Italy', 6, 3)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (22, N'Paraguay', 6, 1)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (23, N'New Zealand', 6, 2)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (24, N'Slovakia', 6, 1)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (25, N'Brazil', 7, 2)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (26, N'North Korea', 7, 7)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (27, N'Ivory Coast', 7, 3)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (28, N'Portugal', 7, 2)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (29, N'Spain', 8, 1)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (30, N'Switzerland', 8, 3)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (31, N'Honduras', 8, 5)
INSERT [dbo].[Countries] ([id], [name], [Groups_FK], [clothesBrand_FK]) VALUES (32, N'Chile', 8, 6)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (1, 1, CAST(N'2010-06-20' AS Date), 3, 1, 2, 3, 7, 41524)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (2, 1, CAST(N'2010-06-13' AS Date), 2, 1, 1, 4, 4, 62502)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (3, 1, CAST(N'2010-06-11' AS Date), 3, 2, 1, 3, 5, 42243)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (4, 1, CAST(N'2010-06-11' AS Date), 4, 5, 2, 3, 4, 61880)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (5, 1, CAST(N'2010-06-24' AS Date), 3, 2, 4, 1, 8, 40646)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (6, 1, CAST(N'2010-06-24' AS Date), 1, 2, 4, 1, 9, 40210)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (7, 2, CAST(N'2010-06-20' AS Date), 7, 1, 6, 5, 10, 38439)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (8, 2, CAST(N'2010-06-20' AS Date), 5, 5, 8, 3, 4, 62739)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (9, 2, CAST(N'2010-06-13' AS Date), 8, 3, 6, 1, 1, 83886)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (10, 2, CAST(N'2010-06-19' AS Date), 6, 4, 5, 1, 6, 41976)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (11, 2, CAST(N'2010-06-19' AS Date), 8, 4, 7, 1, 3, 63977)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (12, 2, CAST(N'2010-06-14' AS Date), 7, 5, 5, 3, 10, 38019)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (13, 3, CAST(N'2010-06-16' AS Date), 10, 2, 9, 1, 3, 63283)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (14, 3, CAST(N'2010-06-16' AS Date), 10, 3, 11, 4, 1, 83888)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (15, 3, CAST(N'2010-06-16' AS Date), 11, 1, 12, 5, 7, 40937)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (16, 3, CAST(N'2010-06-18' AS Date), 11, 3, 9, 5, 2, 55051)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (17, 3, CAST(N'2010-06-25' AS Date), 10, 1, 12, 2, 6, 41894)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (18, 3, CAST(N'2010-06-11' AS Date), 9, 1, 12, 2, 2, 55392)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (19, 4, CAST(N'2010-06-12' AS Date), 15, 1, 14, 3, 2, 54855)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (20, 4, CAST(N'2010-06-21' AS Date), 14, 3, 13, 2, 7, 40780)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (21, 4, CAST(N'2010-06-18' AS Date), 15, 3, 16, 5, 7, 40743)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (22, 4, CAST(N'2010-06-18' AS Date), 15, 4, 13, 5, 4, 62430)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (23, 4, CAST(N'2010-06-19' AS Date), 13, 1, 16, 2, 2, 54976)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (24, 4, CAST(N'2010-06-23' AS Date), 16, 1, 14, 4, 9, 40053)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (25, 5, CAST(N'2010-06-23' AS Date), 18, 2, 20, 1, 2, 55084)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (26, 5, CAST(N'2010-06-25' AS Date), 19, 1, 18, 5, 5, 42222)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (27, 5, CAST(N'2010-06-14' AS Date), 20, 3, 19, 1, 3, 63149)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (28, 5, CAST(N'2010-06-13' AS Date), 17, 3, 19, 4, 3, 63757)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (29, 5, CAST(N'2010-06-17' AS Date), 18, 3, 17, 5, 4, 61843)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (30, 5, CAST(N'2010-06-15' AS Date), 20, 1, 17, 5, 8, 40028)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (31, 6, CAST(N'2010-06-17' AS Date), 23, 3, 22, 5, 2, 55029)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (32, 6, CAST(N'2010-06-23' AS Date), 22, 2, 24, 5, 8, 40177)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (33, 6, CAST(N'2010-06-22' AS Date), 23, 5, 21, 3, 2, 55242)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (34, 6, CAST(N'2010-06-14' AS Date), 23, 3, 24, 2, 2, 55445)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (35, 6, CAST(N'2010-06-22' AS Date), 24, 1, 21, 3, 7, 41223)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (36, 6, CAST(N'2010-06-17' AS Date), 21, 2, 22, 3, 3, 63476)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (37, 7, CAST(N'2010-06-25' AS Date), 27, 4, 25, 2, 4, 62383)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (38, 7, CAST(N'2010-06-24' AS Date), 28, 5, 27, 2, 5, 42684)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (39, 7, CAST(N'2010-06-15' AS Date), 27, 5, 26, 2, 2, 55269)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (40, 7, CAST(N'2010-06-15' AS Date), 25, 1, 28, 5, 3, 63863)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (41, 7, CAST(N'2010-06-12' AS Date), 25, 5, 26, 3, 4, 61784)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (42, 7, CAST(N'2010-06-21' AS Date), 26, 5, 28, 2, 9, 40622)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (43, 8, CAST(N'2010-06-22' AS Date), 32, 1, 30, 2, 10, 38120)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (44, 8, CAST(N'2010-06-21' AS Date), 30, 1, 29, 5, 2, 55224)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (45, 8, CAST(N'2010-06-12' AS Date), 31, 3, 30, 1, 7, 41004)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (46, 8, CAST(N'2010-06-23' AS Date), 29, 5, 31, 4, 6, 42215)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (47, 8, CAST(N'2010-06-20' AS Date), 31, 5, 32, 1, 5, 42650)
INSERT [dbo].[Group_Matches] ([id], [Group_FK], [date], [Country_FK1], [Goals_1], [Country_FK2], [Goals_2], [stadium_FK], [Viewers]) VALUES (48, 8, CAST(N'2010-06-13' AS Date), 29, 5, 32, 2, 7, 41422)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (1, 67, 1, 30)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (2, 38, 1, 57)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (3, 30, 1, 80)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (4, 42, 1, 86)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (5, 31, 2, 2)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (6, 22, 2, 59)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (7, 20, 2, 82)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (8, 6, 2, 7)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (9, 16, 2, 45)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (10, 56, 3, 82)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (11, 59, 3, 14)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (12, 3, 3, 29)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (13, 16, 3, 28)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (14, 22, 3, 1)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (15, 81, 4, 32)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (16, 81, 4, 84)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (17, 77, 4, 37)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (18, 81, 4, 77)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (19, 91, 4, 65)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (20, 46, 4, 69)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (21, 31, 4, 54)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (22, 34, 4, 45)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (23, 56, 5, 72)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (24, 69, 5, 19)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (25, 70, 5, 28)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (26, 13, 6, 14)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (27, 10, 6, 49)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (28, 85, 6, 23)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (29, 156, 7, 28)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (30, 125, 7, 10)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (31, 135, 7, 78)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (32, 125, 7, 11)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (33, 130, 7, 7)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (34, 136, 7, 73)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (35, 94, 8, 87)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (36, 106, 8, 24)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (37, 112, 8, 26)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (38, 109, 8, 53)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (39, 99, 8, 80)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (40, 172, 8, 12)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (41, 181, 8, 68)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (42, 182, 8, 4)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (43, 180, 9, 57)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (44, 164, 9, 70)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (45, 181, 9, 14)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (46, 128, 9, 36)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (47, 131, 10, 9)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (48, 130, 10, 54)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (49, 126, 10, 68)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (50, 120, 10, 14)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (51, 104, 10, 55)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (52, 166, 11, 9)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (53, 177, 11, 27)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (54, 180, 11, 20)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (55, 166, 11, 38)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (56, 148, 11, 9)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (57, 154, 12, 32)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (58, 140, 12, 44)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (59, 150, 12, 79)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (60, 142, 12, 14)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (61, 160, 12, 4)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (62, 104, 12, 34)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (63, 110, 12, 41)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (64, 108, 12, 67)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (65, 219, 13, 50)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (66, 229, 13, 17)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (67, 192, 13, 73)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (68, 219, 14, 58)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (69, 221, 14, 59)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (70, 224, 14, 87)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (71, 235, 14, 75)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (72, 253, 14, 55)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (73, 251, 14, 73)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (74, 235, 14, 28)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (75, 246, 15, 27)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (76, 256, 15, 67)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (77, 256, 15, 39)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (78, 262, 15, 64)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (79, 256, 15, 16)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (80, 262, 15, 86)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (81, 251, 16, 60)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (82, 232, 16, 25)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (83, 242, 16, 80)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (84, 186, 16, 75)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (85, 205, 16, 58)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (86, 193, 16, 78)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (87, 193, 16, 9)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (88, 191, 16, 31)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (89, 223, 17, 6)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (90, 271, 17, 56)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (91, 275, 17, 75)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (92, 197, 18, 6)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (93, 256, 18, 74)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (94, 268, 18, 62)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (95, 335, 19, 27)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (96, 312, 19, 39)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (97, 310, 19, 38)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (98, 316, 19, 2)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (99, 310, 20, 84)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (100, 317, 20, 61)
GO
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (101, 321, 20, 60)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (102, 281, 20, 83)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (103, 282, 20, 66)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (104, 345, 21, 82)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (105, 335, 21, 18)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (106, 332, 21, 19)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (107, 351, 21, 38)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (108, 357, 21, 78)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (109, 361, 21, 43)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (110, 356, 21, 19)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (111, 353, 21, 61)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (112, 330, 22, 7)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (113, 326, 22, 58)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (114, 330, 22, 12)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (115, 334, 22, 60)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (116, 281, 22, 54)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (117, 290, 22, 52)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (118, 288, 22, 60)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (119, 283, 22, 36)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (120, 288, 22, 60)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (121, 280, 23, 48)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (122, 366, 23, 13)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (123, 354, 23, 44)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (124, 356, 24, 32)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (125, 322, 24, 57)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (126, 301, 24, 57)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (127, 315, 24, 13)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (128, 315, 24, 14)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (129, 394, 25, 61)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (130, 408, 25, 41)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (131, 441, 25, 83)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (132, 416, 26, 32)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (133, 411, 26, 83)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (134, 414, 26, 45)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (135, 396, 26, 11)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (136, 397, 26, 72)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (137, 411, 26, 28)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (138, 458, 27, 19)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (139, 449, 27, 73)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (140, 448, 27, 39)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (141, 427, 27, 38)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (142, 378, 28, 66)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (143, 372, 28, 28)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (144, 370, 28, 70)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (145, 415, 28, 24)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (146, 436, 28, 20)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (147, 432, 28, 1)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (148, 426, 28, 78)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (149, 403, 29, 78)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (150, 401, 29, 22)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (151, 394, 29, 25)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (152, 387, 29, 26)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (153, 391, 29, 51)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (154, 387, 29, 70)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (155, 389, 29, 16)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (156, 390, 29, 39)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (157, 443, 30, 72)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (158, 384, 30, 3)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (159, 375, 30, 7)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (160, 384, 30, 67)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (161, 370, 30, 18)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (162, 377, 30, 6)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (163, 514, 31, 28)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (164, 518, 31, 50)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (165, 524, 31, 25)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (166, 493, 31, 20)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (167, 485, 31, 35)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (168, 494, 31, 38)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (169, 500, 31, 65)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (170, 489, 31, 59)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (171, 488, 32, 15)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (172, 487, 32, 63)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (173, 543, 32, 32)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (174, 541, 32, 27)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (175, 549, 32, 47)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (176, 537, 32, 70)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (177, 549, 32, 59)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (178, 512, 33, 53)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (179, 511, 33, 26)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (180, 529, 33, 44)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (181, 522, 33, 80)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (182, 523, 33, 72)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (183, 464, 33, 40)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (184, 482, 33, 7)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (185, 481, 33, 61)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (186, 512, 34, 37)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (187, 517, 34, 13)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (188, 510, 34, 75)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (189, 547, 34, 39)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (190, 550, 34, 2)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (191, 544, 35, 45)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (192, 475, 35, 4)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (193, 462, 35, 48)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (194, 462, 35, 15)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (195, 469, 36, 67)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (196, 469, 36, 65)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (197, 504, 36, 32)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (198, 488, 36, 34)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (199, 485, 36, 22)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (200, 602, 37, 28)
GO
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (201, 607, 37, 54)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (202, 605, 37, 5)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (203, 618, 37, 26)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (204, 573, 37, 72)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (205, 555, 37, 77)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (206, 631, 38, 80)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (207, 641, 38, 22)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (208, 624, 38, 56)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (209, 635, 38, 57)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (210, 635, 38, 68)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (211, 616, 38, 30)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (212, 606, 38, 63)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (213, 615, 39, 27)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (214, 603, 39, 51)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (215, 607, 39, 83)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (216, 613, 39, 16)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (217, 612, 39, 28)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (218, 594, 39, 83)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (219, 590, 39, 14)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (220, 574, 40, 5)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (221, 630, 40, 38)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (222, 635, 40, 42)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (223, 628, 40, 80)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (224, 642, 40, 70)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (225, 628, 40, 63)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (226, 567, 41, 17)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (227, 569, 41, 52)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (228, 554, 41, 9)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (229, 564, 41, 74)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (230, 556, 41, 39)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (231, 579, 41, 52)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (232, 584, 41, 28)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (233, 592, 41, 25)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (234, 595, 42, 35)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (235, 577, 42, 6)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (236, 583, 42, 7)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (237, 593, 42, 57)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (238, 578, 42, 43)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (239, 631, 42, 74)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (240, 632, 42, 6)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (241, 731, 43, 25)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (242, 680, 43, 63)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (243, 690, 43, 40)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (244, 677, 44, 84)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (245, 664, 44, 83)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (246, 657, 44, 90)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (247, 647, 44, 28)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (248, 659, 44, 18)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (249, 646, 44, 8)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (250, 711, 45, 30)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (251, 692, 45, 17)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (252, 698, 45, 1)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (253, 683, 45, 55)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (254, 646, 46, 87)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (255, 657, 46, 8)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (256, 655, 46, 76)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (257, 654, 46, 41)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (258, 648, 46, 77)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (259, 713, 46, 84)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (260, 695, 46, 6)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (261, 694, 46, 17)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (262, 706, 46, 49)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (263, 701, 47, 14)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (264, 708, 47, 21)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (265, 701, 47, 18)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (266, 707, 47, 45)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (267, 696, 47, 59)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (268, 733, 47, 73)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (269, 657, 48, 47)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (270, 664, 48, 11)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (271, 662, 48, 88)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (272, 647, 48, 34)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (273, 655, 48, 12)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (274, 733, 48, 84)
INSERT [dbo].[Group_Matches_Players_statistics] ([id], [Player_FK], [Group_Matches_FK], [goal_minute]) VALUES (275, 721, 48, 83)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (1, 1, 1, 3, 3, 0, 0, N'9 - 4', 5, 9)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (2, 1, 2, 3, 1, 0, 2, N'7 - 10', -3, 3)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (3, 1, 3, 3, 1, 0, 2, N'5 - 7', -2, 3)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (4, 1, 4, 3, 1, 0, 2, N'7 - 7', 0, 3)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (5, 2, 5, 3, 1, 0, 2, N'9 - 12', -3, 3)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (6, 2, 6, 3, 2, 0, 1, N'10 - 5', 5, 6)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (7, 2, 7, 3, 1, 0, 2, N'7 - 12', -5, 3)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (8, 2, 8, 3, 2, 0, 1, N'10 - 7', 3, 6)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (9, 3, 9, 3, 1, 0, 2, N'7 - 7', 0, 3)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (10, 3, 10, 3, 1, 0, 2, N'6 - 7', -1, 3)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (11, 3, 11, 3, 1, 0, 2, N'8 - 13', -5, 3)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (12, 3, 12, 3, 3, 0, 0, N'9 - 3', 6, 9)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (13, 4, 13, 3, 1, 0, 2, N'8 - 9', -1, 3)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (14, 4, 14, 3, 3, 0, 0, N'10 - 4', 6, 9)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (15, 4, 15, 3, 0, 0, 3, N'8 - 13', -5, 0)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (16, 4, 16, 3, 2, 0, 1, N'8 - 8', 0, 6)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (17, 5, 17, 3, 2, 0, 1, N'13 - 8', 5, 6)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (18, 5, 18, 3, 2, 0, 1, N'10 - 7', 3, 6)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (19, 5, 19, 3, 1, 0, 2, N'6 - 11', -5, 3)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (20, 5, 20, 3, 1, 0, 2, N'5 - 8', -3, 3)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (21, 6, 21, 3, 1, 0, 2, N'8 - 9', -1, 3)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (22, 6, 22, 3, 2, 0, 1, N'10 - 10', 0, 6)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (23, 6, 23, 3, 2, 0, 1, N'11 - 10', 1, 6)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (24, 6, 24, 3, 1, 0, 2, N'8 - 8', 0, 3)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (25, 7, 25, 3, 1, 0, 2, N'8 - 12', -4, 3)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (26, 7, 26, 3, 1, 0, 2, N'10 - 12', -2, 3)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (27, 7, 27, 3, 2, 0, 1, N'11 - 9', 2, 6)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (28, 7, 28, 3, 2, 0, 1, N'12 - 8', 4, 6)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (29, 8, 29, 3, 3, 0, 0, N'15 - 7', 8, 9)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (30, 8, 30, 3, 1, 0, 2, N'4 - 9', -5, 3)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (31, 8, 31, 3, 2, 0, 1, N'12 - 7', 5, 6)
INSERT [dbo].[GroupMatches_Results] ([id], [groups_FK], [countriesId_FK], [games], [wins], [draws], [losses], [balls], [delta], [points]) VALUES (32, 8, 32, 3, 0, 0, 3, N'4 - 12', -8, 0)
INSERT [dbo].[groups] ([id], [name]) VALUES (1, N'A')
INSERT [dbo].[groups] ([id], [name]) VALUES (2, N'B')
INSERT [dbo].[groups] ([id], [name]) VALUES (3, N'C')
INSERT [dbo].[groups] ([id], [name]) VALUES (4, N'D')
INSERT [dbo].[groups] ([id], [name]) VALUES (5, N'E')
INSERT [dbo].[groups] ([id], [name]) VALUES (6, N'F')
INSERT [dbo].[groups] ([id], [name]) VALUES (7, N'G')
INSERT [dbo].[groups] ([id], [name]) VALUES (8, N'H')
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (1, N'Moeneeb Josephs', 3, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (2, N'Siboniso Gaxa', 1, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (3, N'Tsepo Masilela', 1, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (4, N'Aaron Mokoena (c)', 1, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (5, N'Anele Ngcongca', 1, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (6, N'MacBeth Sibaya', 4, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (7, N'Lance Davids', 4, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (8, N'Siphiwe Tshabalala', 4, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (9, N'Katlego Mphela', 2, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (10, N'Steven Pienaar', 4, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (11, N'Teko Modise', 4, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (12, N'Reneilwe Letsholonyane', 4, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (13, N'Kagisho Dikgacoi', 4, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (14, N'Matthew Booth', 1, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (15, N'Lucas Thwala', 1, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (16, N'Itumeleng Khune', 3, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (17, N'Bernard Parker', 2, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (18, N'Siyabonga Nomvethe', 2, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (19, N'Surprise Moriri', 4, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (20, N'Bongani Khumalo', 1, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (21, N'Siyabonga Sangweni', 1, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (22, N'Shu-Aib Walters', 3, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (23, N'Thanduyise Khuboni', 4, 1)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (24, N'?scar P?rez', 3, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (25, N'Francisco Rodr?guez', 1, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (26, N'Carlos Salcido', 1, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (27, N'Rafael M?rquez', 1, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (28, N'Ricardo Osorio', 1, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (29, N'Gerardo Torrado', 4, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (30, N'Pablo Barrera', 4, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (31, N'Israel Castro', 4, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (32, N'Guillermo Franco', 2, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (33, N'Cuauht?moc Blanco (c)', 2, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (34, N'Carlos Vela', 2, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (35, N'Paul Aguilar', 1, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (36, N'Guillermo Ochoa', 3, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (37, N'Javier Hern?ndez', 2, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (38, N'H?ctor Moreno', 1, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (39, N'Efra?n Ju?rez', 1, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (40, N'Giovani dos Santos', 2, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (41, N'Andr?s Guardado', 4, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (42, N'Jonny Magall?n', 1, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (43, N'Jorge Torres Nilo', 1, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (44, N'Adolfo Bautista', 2, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (45, N'Alberto Medina', 4, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (46, N'Luis Ernesto Michel', 3, 2)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (47, N'Fernando Muslera', 3, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (48, N'Diego Lugano (c)', 1, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (49, N'Diego God?n', 1, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (50, N'Jorge Fucile', 1, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (51, N'Walter Gargano', 4, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (52, N'Mauricio Victorino', 1, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (53, N'Edinson Cavani', 2, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (54, N'Sebasti?n Eguren', 4, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (55, N'Luis Su?rez', 2, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (56, N'Diego Forl?n', 2, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (57, N'?lvaro Pereira', 4, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (58, N'Juan Castillo', 3, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (59, N'Sebasti?n Abreu', 2, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (60, N'Nicol?s Lodeiro', 4, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (61, N'Diego P?rez', 4, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (62, N'Maxi Pereira', 1, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (63, N'Egidio Ar?valo R?os', 4, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (64, N'Ignacio Gonz?lez', 4, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (65, N'Andr?s Scotti', 1, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (66, N'?lvaro Fern?ndez', 4, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (67, N'Sebasti?n Fern?ndez', 2, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (68, N'Mart?n C?ceres', 1, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (69, N'Mart?n Silva', 3, 3)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (70, N'Hugo Lloris', 3, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (71, N'Bacary Sagna', 1, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (72, N'?ric Abidal', 1, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (73, N'Anthony R?veill?re', 1, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (74, N'William Gallas', 1, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (75, N'Marc Planus', 1, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (76, N'Franck Rib?ry', 4, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (77, N'Yoann Gourcuff', 4, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (78, N'Djibril Ciss?', 2, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (79, N'Sidney Govou', 2, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (80, N'Andr?-Pierre Gignac', 2, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (81, N'Thierry Henry', 2, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (82, N'Patrice Evra (c)', 1, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (83, N'J?r?my Toulalan', 4, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (84, N'Florent Malouda', 4, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (85, N'Steve Mandanda', 3, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (86, N'S?bastien Squillaci', 1, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (87, N'Alou Diarra', 4, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (88, N'Abou Diaby', 4, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (89, N'Mathieu Valbuena', 4, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (90, N'Nicolas Anelka', 2, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (91, N'Ga?l Clichy', 1, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (92, N'C?dric Carrasso', 3, 4)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (93, N'Diego Pozo', 3, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (94, N'Mart?n Demichelis', 1, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (95, N'Clemente Rodr?guez', 1, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (96, N'Nicol?s Burdisso', 1, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (97, N'Mario Bolatti', 4, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (98, N'Gabriel Heinze', 1, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (99, N'?ngel Di Mar?a', 4, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (100, N'Juan Sebasti?n Ver?n', 4, 5)
GO
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (101, N'Gonzalo Higua?n', 2, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (102, N'Lionel Messi', 2, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (103, N'Carlos Tevez', 2, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (104, N'Ariel Garc?', 1, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (105, N'Walter Samuel', 1, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (106, N'Javier Mascherano (c)', 4, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (107, N'Nicol?s Otamendi', 1, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (108, N'Sergio Ag?ero', 2, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (109, N'Jon?s Guti?rrez', 4, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (110, N'Mart?n Palermo', 2, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (111, N'Diego Milito', 2, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (112, N'Maxi Rodr?guez', 4, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (113, N'Mariano And?jar', 3, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (114, N'Sergio Romero', 3, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (115, N'Javier Pastore', 4, 5)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (116, N'Vincent Enyeama', 3, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (117, N'Joseph Yobo (c)', 1, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (118, N'Taye Taiwo', 1, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (119, N'Nwankwo Kanu', 2, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (120, N'Rabiu Afolabi', 1, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (121, N'Danny Shittu', 1, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (122, N'John Utaka', 2, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (123, N'Yakubu', 2, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (124, N'Obafemi Martins', 2, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (125, N'Brown Ideye[4]', 2, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (126, N'Peter Odemwingie', 2, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (127, N'Kalu Uche', 2, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (128, N'Ayila Yussuf', 4, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (129, N'Sani Kaita', 4, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (130, N'Lukman Haruna', 4, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (131, N'Austin Ejide', 3, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (132, N'Chidi Odiah', 1, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (133, N'Victor Obinna', 2, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (134, N'Chinedu Obasi', 2, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (135, N'Dickson Etuhu', 4, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (136, N'Elderson Echi?jil?', 1, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (137, N'Dele Adeleye', 1, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (138, N'Dele Aiyenugba', 3, 6)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (139, N'Lee Woon-jae', 3, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (140, N'Oh Beom-seok', 1, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (141, N'Kim Hyung-il', 1, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (142, N'Cho Yong-hyung', 4, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (143, N'Kim Nam-il', 4, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (144, N'Kim Bo-kyung', 4, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (145, N'Park Ji-sung (c)', 4, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (146, N'Kim Jung-woo', 2, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (147, N'Ahn Jung-hwan', 2, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (148, N'Park Chu-young', 2, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (149, N'Lee Seung-yeoul', 2, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (150, N'Lee Young-pyo', 1, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (151, N'Kim Jae-sung', 4, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (152, N'Lee Jung-soo', 1, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (153, N'Kim Dong-jin', 1, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (154, N'Ki Sung-yong', 4, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (155, N'Lee Chung-yong', 4, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (156, N'Jung Sung-ryong', 3, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (157, N'Yeom Ki-hun', 2, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (158, N'Lee Dong-gook', 2, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (159, N'Kim Young-kwang', 3, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (160, N'Cha Du-ri', 1, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (161, N'Kang Min-soo', 1, 7)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (162, N'Kostas Chalkias', 3, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (163, N'Giourkas Seitaridis', 1, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (164, N'Christos Patsatzoglou', 1, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (165, N'Nikos Spiropoulos', 4, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (166, N'Vangelis Moras', 1, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (167, N'Alexandros Tziolis', 4, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (168, N'Georgios Samaras', 2, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (169, N'Avraam Papadopoulos', 1, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (170, N'Angelos Charisteas', 2, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (171, N'Giorgos Karagounis (c)', 4, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (172, N'Loukas Vyntra', 1, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (173, N'Alexandros Tzorvas', 3, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (174, N'Michalis Sifakis', 3, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (175, N'Dimitris Salpingidis', 2, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (176, N'Vasilis Torosidis', 1, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (177, N'Sotirios Kyrgiakos', 1, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (178, N'Theofanis Gekas', 2, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (179, N'Sotiris Ninis', 4, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (180, N'Sokratis Papastathopoulos', 1, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (181, N'Pantelis Kapetanos', 2, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (182, N'Kostas Katsouranis', 4, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (183, N'Stelios Malezas', 1, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (184, N'Sakis Prittas', 4, 8)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (185, N'David James', 3, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (186, N'Glen Johnson', 1, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (187, N'Ashley Cole', 1, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (188, N'Steven Gerrard (c)', 4, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (189, N'Michael Dawson[5]', 1, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (190, N'John Terry', 1, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (191, N'Aaron Lennon', 4, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (192, N'Frank Lampard', 4, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (193, N'Peter Crouch', 2, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (194, N'Wayne Rooney', 2, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (195, N'Joe Cole', 4, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (196, N'Robert Green', 3, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (197, N'Stephen Warnock', 1, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (198, N'Gareth Barry', 4, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (199, N'Matthew Upson', 1, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (200, N'James Milner', 4, 9)
GO
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (201, N'Shaun Wright-Phillips', 4, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (202, N'Jamie Carragher', 1, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (203, N'Jermain Defoe', 2, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (204, N'Ledley King', 1, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (205, N'Emile Heskey', 2, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (206, N'Michael Carrick', 4, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (207, N'Joe Hart', 3, 9)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (208, N'Tim Howard', 3, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (209, N'Jonathan Spector', 1, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (210, N'Carlos Bocanegra (c)', 1, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (211, N'Michael Bradley', 4, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (212, N'Oguchi Onyewu', 1, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (213, N'Steve Cherundolo', 1, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (214, N'DaMarcus Beasley', 4, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (215, N'Clint Dempsey', 4, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (216, N'Herculez Gomez', 2, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (217, N'Landon Donovan', 4, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (218, N'Stuart Holden', 4, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (219, N'Jonathan Bornstein', 1, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (220, N'Ricardo Clark', 4, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (221, N'Edson Buddle', 2, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (222, N'Jay DeMerit', 1, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (223, N'Jos? Francisco Torres', 4, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (224, N'Jozy Altidore', 2, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (225, N'Brad Guzan', 3, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (226, N'Maurice Edu', 4, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (227, N'Robbie Findley', 2, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (228, N'Clarence Goodson', 1, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (229, N'Benny Feilhaber', 4, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (230, N'Marcus Hahnemann', 3, 10)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (231, N'Loun?s Gaouaoui', 3, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (232, N'Madjid Bougherra', 1, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (233, N'Nadir Belhadj', 1, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (234, N'Antar Yahia (c)', 1, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (235, N'Rafik Halliche', 1, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (236, N'Yazid Mansouri', 4, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (237, N'Ryad Boudebouz', 4, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (238, N'Medhi Lacen', 4, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (239, N'Abdelkader Ghezzal', 2, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (240, N'Rafik Sa?fi', 2, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (241, N'Rafik Djebbour', 2, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (242, N'Habib Bella?d', 1, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (243, N'Karim Matmour', 2, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (244, N'Abdelkader La?faoui', 1, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (245, N'Karim Ziani', 4, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (246, N'Faouzi Chaouchi', 3, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (247, N'Adl?ne Guedioura', 4, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (248, N'Carl Medjani', 1, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (249, N'Hassan Yebda', 4, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (250, N'Djamel Mesbah', 1, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (251, N'Foued Kadir', 4, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (252, N'Djamel Abdoun', 4, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (253, N'Ra?s M''Bohli', 3, 11)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (254, N'Samir Handanovi?', 3, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (255, N'Mi?o Bre?ko', 1, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (256, N'Elvedin D?ini?', 1, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (257, N'Marko ?uler', 1, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (258, N'Bo?tjan Cesar', 1, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (259, N'Branko Ili?', 1, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (260, N'Nejc Pe?nik', 2, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (261, N'Robert Koren (c)', 4, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (262, N'Zlatan Ljubijanki?', 2, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (263, N'Valter Birsa', 2, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (264, N'Milivoje Novakovi?', 2, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (265, N'Jasmin Handanovi?', 3, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (266, N'Bojan Joki?', 1, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (267, N'Zlatko Dedi?', 2, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (268, N'Rene Krhin', 4, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (269, N'Aleksander ?eliga', 3, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (270, N'Andra? Kirm', 4, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (271, N'Aleksandar Radosavljevi?', 4, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (272, N'Suad Filekovi?', 1, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (273, N'Andrej Komac', 4, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (274, N'Dalibor Stevanovi?', 4, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (275, N'Matej Mavri?', 1, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (276, N'Tim Matav?', 2, 12)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (277, N'Manuel Neuer', 3, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (278, N'Marcell Jansen', 1, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (279, N'Arne Friedrich', 1, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (280, N'Dennis Aogo', 1, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (281, N'Serdar Tasci', 1, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (282, N'Sami Khedira', 4, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (283, N'Bastian Schweinsteiger', 4, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (284, N'Mesut ?zil', 4, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (285, N'Stefan Kie?ling', 2, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (286, N'Lukas Podolski', 4, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (287, N'Miroslav Klose', 2, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (288, N'Tim Wiese', 3, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (289, N'Thomas M?ller', 4, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (290, N'Holger Badstuber', 1, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (291, N'Piotr Trochowski', 4, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (292, N'Philipp Lahm (c)', 1, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (293, N'Per Mertesacker', 1, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (294, N'Toni Kroos', 4, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (295, N'Cacau', 2, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (296, N'J?r?me Boateng', 1, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (297, N'Marko Marin', 4, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (298, N'Hans-J?rg Butt', 3, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (299, N'Mario G?mez', 2, 13)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (300, N'Mark Schwarzer', 3, 14)
GO
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (301, N'Lucas Neill (c)', 1, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (302, N'Craig Moore', 1, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (303, N'Tim Cahill', 4, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (304, N'Jason Culina', 4, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (305, N'Michael Beauchamp', 1, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (306, N'Brett Emerton', 4, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (307, N'Luke Wilkshire', 1, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (308, N'Joshua Kennedy', 2, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (309, N'Harry Kewell', 2, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (310, N'Scott Chipperfield', 1, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (311, N'Adam Federici', 3, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (312, N'Vince Grella', 4, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (313, N'Brett Holman', 2, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (314, N'Mile Jedinak', 4, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (315, N'Carl Valeri', 4, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (316, N'Nikita Rukavytsya', 2, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (317, N'Eugene Galekovic[6]', 3, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (318, N'Richard Garcia', 4, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (319, N'Mark Milligan', 1, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (320, N'David Carney', 1, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (321, N'Dario Vido?i?', 4, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (322, N'Mark Bresciano', 4, 14)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (323, N'Vladimir Stojkovi?', 3, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (324, N'Antonio Rukavina', 1, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (325, N'Aleksandar Kolarov', 1, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (326, N'Gojko Ka?ar', 4, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (327, N'Nemanja Vidi?', 1, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (328, N'Branislav Ivanovi?', 1, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (329, N'Zoran To?i?', 4, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (330, N'Danko Lazovi?', 2, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (331, N'Marko Panteli?', 2, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (332, N'Dejan Stankovi? (c)', 4, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (333, N'Nenad Milija?', 4, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (334, N'Bojan Isailovi?', 3, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (335, N'Aleksandar Lukovi?', 1, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (336, N'Milan Jovanovi?', 4, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (337, N'Nikola ?igi?', 2, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (338, N'Ivan Obradovi?', 1, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (339, N'Milo? Krasi?', 4, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (340, N'Milo? Ninkovi?', 4, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (341, N'Radosav Petrovi?', 4, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (342, N'Neven Suboti?', 1, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (343, N'Dragan Mr?a', 2, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (344, N'Zdravko Kuzmanovi?', 4, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (345, N'An?elko ?uri?i?', 3, 15)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (346, N'Daniel Adjei', 3, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (347, N'Hans Sarpei', 1, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (348, N'Asamoah Gyan', 2, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (349, N'John Paintsil', 1, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (350, N'John Mensah', 1, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (351, N'Anthony Annan', 4, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (352, N'Samuel Inkoom', 1, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (353, N'Jonathan Mensah', 1, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (354, N'Derek Boateng', 4, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (355, N'Stephen Appiah (c)', 4, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (356, N'Sulley Muntari', 4, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (357, N'Prince Tagoe', 2, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (358, N'Andr? Ayew', 4, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (359, N'Matthew Amoah', 2, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (360, N'Isaac Vorsah', 1, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (361, N'Stephen Ahorlu', 3, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (362, N'Abdul Rahim Ayew', 1, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (363, N'Dominic Adiyiah', 2, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (364, N'Lee Addy', 1, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (365, N'Quincy Owusu-Abeyie', 4, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (366, N'Kwadwo Asamoah', 4, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (367, N'Richard Kingson', 3, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (368, N'Kevin-Prince Boateng', 4, 16)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (369, N'Maarten Stekelenburg', 3, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (370, N'Gregory van der Wiel', 1, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (371, N'John Heitinga', 1, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (372, N'Joris Mathijsen', 1, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (373, N'Giovanni van Bronckhorst (c)', 1, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (374, N'Mark van Bommel', 4, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (375, N'Dirk Kuyt', 2, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (376, N'Nigel de Jong', 4, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (377, N'Robin van Persie', 2, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (378, N'Wesley Sneijder', 4, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (379, N'Arjen Robben', 2, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (380, N'Khalid Boulahrouz', 1, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (381, N'Andr? Ooijer', 1, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (382, N'Demy de Zeeuw', 4, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (383, N'Edson Braafheid', 1, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (384, N'Michel Vorm', 3, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (385, N'Eljero Elia', 2, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (386, N'Stijn Schaars', 4, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (387, N'Ryan Babel', 2, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (388, N'Ibrahim Afellay', 4, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (389, N'Klaas-Jan Huntelaar', 2, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (390, N'Sander Boschker', 3, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (391, N'Rafael van der Vaart', 4, 17)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (392, N'Thomas S?rensen', 3, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (393, N'Christian Poulsen', 4, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (394, N'Simon Kj?r', 1, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (395, N'Daniel Agger', 1, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (396, N'William Kvist', 1, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (397, N'Lars Jacobsen', 1, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (398, N'Daniel Jensen', 4, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (399, N'Jesper Gr?nkj?r', 4, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (400, N'Jon Dahl Tomasson (c)', 2, 18)
GO
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (401, N'Martin J?rgensen', 4, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (402, N'Nicklas Bendtner', 2, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (403, N'Thomas Kahlenberg', 4, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (404, N'Per Kr?ldrup', 1, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (405, N'Jakob Poulsen', 4, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (406, N'Simon Poulsen', 1, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (407, N'Stephan Andersen', 3, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (408, N'Mikkel Beckmann', 4, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (409, N'S?ren Larsen', 2, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (410, N'Dennis Rommedahl', 4, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (411, N'Thomas Enevoldsen', 4, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (412, N'Christian Eriksen', 4, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (413, N'Jesper Christiansen', 3, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (414, N'Patrick Mtiliga', 1, 18)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (415, N'Seigo Narazaki', 3, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (416, N'Yuki Abe', 4, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (417, N'Y?ichi Komano', 1, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (418, N'Marcus Tulio Tanaka', 1, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (419, N'Yuto Nagatomo', 1, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (420, N'Atsuto Uchida', 1, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (421, N'Yasuhito End?', 4, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (422, N'Daisuke Matsui', 2, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (423, N'Shinji Okazaki', 2, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (424, N'Shunsuke Nakamura', 4, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (425, N'Keiji Tamada', 2, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (426, N'Kisho Yano', 2, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (427, N'Daiki Iwamasa', 1, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (428, N'Kengo Nakamura', 4, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (429, N'Yasuyuki Konno', 1, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (430, N'Yoshito ?kubo', 2, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (431, N'Makoto Hasebe', 4, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (432, N'Keisuke Honda', 4, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (433, N'Takayuki Morimoto', 2, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (434, N'Junichi Inamoto', 4, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (435, N'Eiji Kawashima', 3, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (436, N'Yuji Nakazawa', 1, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (437, N'Yoshikatsu Kawaguchi (c)', 3, 19)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (438, N'Carlos Kameni', 3, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (439, N'Beno?t Assou-Ekotto', 1, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (440, N'Nicolas N''Koulou', 1, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (441, N'Rigobert Song', 1, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (442, N'S?bastien Bassong', 1, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (443, N'Alex Song', 4, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (444, N'Landry N''Gu?mo', 4, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (445, N'Geremi', 1, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (446, N'Samuel Eto''o (c)', 2, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (447, N'Achille Emana', 4, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (448, N'Jean Makoun', 4, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (449, N'Ga?tan Bong', 1, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (450, N'Eric Maxim Choupo-Moting', 2, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (451, N'Aur?lien Chedjou', 1, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (452, N'Pierre Web?', 2, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (453, N'Souleymanou Hamidou', 3, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (454, N'Mohammadou Idrissou', 2, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (455, N'Eyong Enoh', 4, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (456, N'St?phane Mbia', 1, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (457, N'Georges Mandjeck', 4, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (458, N'Jo?l Matip', 4, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (459, N'Guy N''dy Assemb?', 3, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (460, N'Vincent Aboubakar', 2, 20)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (461, N'Gianluigi Buffon', 3, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (462, N'Christian Maggio', 1, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (463, N'Domenico Criscito', 1, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (464, N'Giorgio Chiellini', 1, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (465, N'Fabio Cannavaro (c)', 1, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (466, N'Daniele De Rossi', 4, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (467, N'Simone Pepe', 4, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (468, N'Gennaro Gattuso', 4, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (469, N'Vincenzo Iaquinta', 2, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (470, N'Antonio Di Natale', 2, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (471, N'Alberto Gilardino', 2, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (472, N'Federico Marchetti', 3, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (473, N'Salvatore Bocchetti', 1, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (474, N'Morgan De Sanctis', 3, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (475, N'Claudio Marchisio', 4, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (476, N'Mauro Camoranesi', 4, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (477, N'Angelo Palombo', 4, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (478, N'Fabio Quagliarella', 2, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (479, N'Gianluca Zambrotta', 1, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (480, N'Giampaolo Pazzini', 2, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (481, N'Andrea Pirlo', 4, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (482, N'Riccardo Montolivo', 4, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (483, N'Leonardo Bonucci', 1, 21)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (484, N'Justo Villar', 3, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (485, N'Dar?o Ver?n', 1, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (486, N'Claudio Morel', 1, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (487, N'Denis Caniza (c)', 1, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (488, N'Julio C?sar C?ceres', 1, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (489, N'Carlos Bonet', 1, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (490, N'?scar Cardozo', 2, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (491, N'?dgar Barreto', 4, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (492, N'Roque Santa Cruz', 2, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (493, N'?dgar Ben?tez', 2, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (494, N'Jonathan Santana', 4, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (495, N'Diego Barreto', 3, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (496, N'Enrique Vera', 4, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (497, N'Paulo da Silva', 1, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (498, N'V?ctor C?ceres', 4, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (499, N'Cristian Riveros', 4, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (500, N'Aureliano Torres', 1, 22)
GO
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (501, N'Nelson Valdez', 2, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (502, N'Lucas Barrios', 2, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (503, N'N?stor Ortigoza', 4, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (504, N'Antol?n Alcaraz', 1, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (505, N'Aldo Bobadilla', 3, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (506, N'Rodolfo Gamarra', 2, 22)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (507, N'Mark Paston', 3, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (508, N'Ben Sigmund', 1, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (509, N'Tony Lochhead', 1, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (510, N'Winston Reid', 1, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (511, N'Ivan Vicelich', 1, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (512, N'Ryan Nelsen (c)', 1, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (513, N'Simon Elliott', 4, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (514, N'Tim Brown', 4, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (515, N'Shane Smeltz', 2, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (516, N'Chris Killen', 2, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (517, N'Leo Bertos', 4, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (518, N'Glen Moss', 3, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (519, N'Andy Barron', 4, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (520, N'Rory Fallon', 2, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (521, N'Michael McGlinchey', 4, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (522, N'Aaron Clapham', 4, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (523, N'David Mulligan', 4, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (524, N'Andrew Boyens', 1, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (525, N'Tommy Smith', 1, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (526, N'Chris Wood', 2, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (527, N'Jeremy Christie', 4, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (528, N'Jeremy Brockie', 4, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (529, N'James Bannatyne', 3, 23)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (530, N'J?n Mucha', 3, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (531, N'Peter Pekar?k', 1, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (532, N'Martin ?krtel', 1, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (533, N'Marek ?ech', 1, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (534, N'Radoslav Zabavn?k', 1, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (535, N'Zdeno ?trba', 4, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (536, N'Vladim?r Weiss', 4, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (537, N'J?n Koz?k', 4, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (538, N'Stanislav ?est?k', 4, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (539, N'Marek Sapara', 4, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (540, N'R?bert Vittek', 2, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (541, N'Du?an Perni?', 3, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (542, N'Filip Holo?ko', 2, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (543, N'Martin Jakubko', 2, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (544, N'Miroslav Stoch', 4, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (545, N'J?n ?urica', 1, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (546, N'Marek Ham??k (c)', 4, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (547, N'Erik Jendri?ek', 2, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (548, N'Juraj Kucka', 4, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (549, N'Kamil Kop?nek', 4, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (550, N'Kornel Sal?ta', 1, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (551, N'Martin Petr??', 1, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (552, N'Du?an Kuciak', 3, 24)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (553, N'J?lio C?sar', 3, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (554, N'Maicon', 1, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (555, N'L?cio (c)', 1, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (556, N'Juan', 1, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (557, N'Felipe Melo', 4, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (558, N'Michel Bastos', 1, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (559, N'Elano', 4, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (560, N'Gilberto Silva', 4, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (561, N'Lu?s Fabiano', 2, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (562, N'Kak?', 4, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (563, N'Robinho', 2, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (564, N'Heurelho Gomes', 3, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (565, N'Dani Alves', 1, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (566, N'Luis?o', 1, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (567, N'Thiago Silva', 1, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (568, N'Gilberto', 1, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (569, N'Josu?', 4, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (570, N'Ramires', 4, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (571, N'J?lio Baptista', 4, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (572, N'Kl?berson', 4, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (573, N'Nilmar', 2, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (574, N'Doni', 3, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (575, N'Grafite', 2, 25)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (576, N'Ri Myong-guk', 3, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (577, N'Cha Jong-hyok', 1, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (578, N'Ri Jun-il', 1, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (579, N'Pak Nam-chol', 4, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (580, N'Ri Kwang-chon', 1, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (581, N'Kim Kum-il', 4, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (582, N'An Chol-hyok', 2, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (583, N'Ji Yun-nam', 1, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (584, N'Jong Tae-se', 2, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (585, N'Hong Yong-jo', 2, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (586, N'Mun In-guk', 4, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (587, N'Choe Kum-chol', 2, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (588, N'Pak Chol-jin', 1, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (589, N'Pak Nam-Chol', 1, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (590, N'Kim Yong-jun', 4, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (591, N'Nam Song-chol (c)', 1, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (592, N'An Yong-hak', 4, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (593, N'Kim Myong-gil', 3, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (594, N'Ri Chol-myong', 4, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (595, N'Kim Myong-won[8]', 3, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (596, N'Ri Kwang-hyok', 1, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (597, N'Kim Kyong-il', 4, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (598, N'Pak Sung-hyok', 4, 26)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (599, N'Boubacar Barry', 3, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (600, N'Benjamin Angoua', 1, 27)
GO
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (601, N'Arthur Boka', 1, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (602, N'Kolo Tour?', 1, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (603, N'Didier Zokora', 4, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (604, N'Steve Gohouri', 1, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (605, N'Seydou Doumbia', 2, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (606, N'Salomon Kalou', 2, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (607, N'Cheick Tiot?', 4, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (608, N'Gervinho', 2, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (609, N'Didier Drogba (c)', 2, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (610, N'Jean-Jacques Gosso', 4, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (611, N'Romaric', 4, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (612, N'Emmanuel Kon?', 4, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (613, N'Aruna Dindane', 2, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (614, N'Aristide Zogbo', 3, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (615, N'Siaka Ti?n?', 1, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (616, N'Kader Ke?ta', 4, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (617, N'Yaya Tour?', 4, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (618, N'Guy Demel', 1, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (619, N'Emmanuel Ebou?', 1, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (620, N'Sol Bamba', 1, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (621, N'Daniel Yeboah', 3, 27)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (622, N'Eduardo', 3, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (623, N'Bruno Alves', 1, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (624, N'Paulo Ferreira', 1, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (625, N'Rolando', 1, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (626, N'Duda', 4, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (627, N'Ricardo Carvalho', 1, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (628, N'Cristiano Ronaldo (c)', 2, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (629, N'Pedro Mendes', 4, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (630, N'Li?dson', 2, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (631, N'Danny', 4, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (632, N'Sim?o', 4, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (633, N'Beto', 3, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (634, N'Miguel', 1, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (635, N'Miguel Veloso', 4, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (636, N'Pepe', 1, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (637, N'Raul Meireles', 4, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (638, N'R?ben Amorim[9]', 4, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (639, N'Hugo Almeida', 2, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (640, N'Tiago', 4, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (641, N'Deco', 4, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (642, N'Ricardo Costa', 1, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (643, N'Daniel Fernandes', 3, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (644, N'F?bio Coentr?o', 1, 28)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (645, N'Iker Casillas (c)', 3, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (646, N'Ra?l Albiol', 1, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (647, N'Gerard Piqu?', 1, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (648, N'Carlos Marchena', 1, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (649, N'Carles Puyol', 1, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (650, N'Andr?s Iniesta', 4, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (651, N'David Villa', 2, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (652, N'Xavi', 4, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (653, N'Fernando Torres', 2, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (654, N'Cesc F?bregas', 4, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (655, N'Joan Capdevila', 1, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (656, N'V?ctor Vald?s', 3, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (657, N'Juan Mata', 4, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (658, N'Xabi Alonso', 4, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (659, N'Sergio Ramos', 1, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (660, N'Sergio Busquets', 4, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (661, N'?lvaro Arbeloa', 1, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (662, N'Pedro', 2, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (663, N'Fernando Llorente', 2, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (664, N'Javi Mart?nez', 4, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (665, N'David Silva', 4, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (666, N'Jes?s Navas', 4, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (667, N'Pepe Reina', 3, 29)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (668, N'Diego Benaglio', 3, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (669, N'Stephan Lichtsteiner', 1, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (670, N'Ludovic Magnin', 1, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (671, N'Philippe Senderos', 1, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (672, N'Steve von Bergen', 1, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (673, N'Benjamin Huggel', 4, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (674, N'Tranquillo Barnetta', 4, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (675, N'G?khan Inler', 4, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (676, N'Alexander Frei (c)', 2, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (677, N'Blaise Nkufo', 2, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (678, N'Valon Behrami', 4, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (679, N'Marco W?lfli', 3, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (680, N'St?phane Grichting', 1, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (681, N'Marco Padalino', 4, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (682, N'Hakan Yakin', 4, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (683, N'G?lson Fernandes', 4, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (684, N'Reto Ziegler', 1, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (685, N'Albert Bunjaku', 2, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (686, N'Eren Derdiyok', 2, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (687, N'Pirmin Schwegler', 4, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (688, N'Johnny Leoni', 3, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (689, N'Mario Eggimann', 1, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (690, N'Xherdan Shaqiri', 4, 30)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (691, N'Ricardo Canales', 3, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (692, N'Osman Ch?vez', 1, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (693, N'Maynor Figueroa', 1, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (694, N'Johnny Palacios', 1, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (695, N'V?ctor Bern?rdez', 1, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (696, N'Hendry Thomas', 4, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (697, N'Ram?n N??ez', 4, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (698, N'Wilson Palacios', 4, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (699, N'Carlos Pav?n', 2, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (700, N'Jerry Palacios[10]', 2, 31)
GO
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (701, N'David Suazo', 2, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (702, N'Georgie Welcome', 2, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (703, N'Roger Espinoza', 2, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (704, N'Boniek Garc?a', 1, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (705, N'Walter Mart?nez', 2, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (706, N'Mauricio Sabill?n', 1, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (707, N'Edgar ?lvarez', 4, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (708, N'Noel Valladares', 3, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (709, N'Danilo Turcios', 4, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (710, N'Amado Guevara (c)', 4, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (711, N'Emilio Izaguirre', 1, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (712, N'Donis Escober', 3, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (713, N'Sergio Mendoza', 1, 31)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (714, N'Claudio Bravo (c)', 3, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (715, N'Ismael Fuentes', 1, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (716, N'Waldo Ponce', 1, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (717, N'Mauricio Isla', 4, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (718, N'Pablo Contreras', 1, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (719, N'Carlos Carmona', 4, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (720, N'Alexis S?nchez', 2, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (721, N'Arturo Vidal', 1, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (722, N'Humberto Suazo', 2, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (723, N'Jorge Valdivia', 4, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (724, N'Mark Gonz?lez', 2, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (725, N'Miguel Pinto', 3, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (726, N'Marco Estrada', 4, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (727, N'Mat?as Fern?ndez', 4, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (728, N'Jean Beausejour', 2, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (729, N'Fabi?n Orellana', 2, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (730, N'Gary Medel', 1, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (731, N'Gonzalo Jara', 1, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (732, N'Gonzalo Fierro', 4, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (733, N'Rodrigo Millar', 4, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (734, N'Rodrigo Tello', 4, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (735, N'Esteban Paredes', 2, 32)
INSERT [dbo].[Players] ([id], [name], [Posititon_FK], [Countries_FK]) VALUES (736, N'Luis Mar?n', 3, 32)
INSERT [dbo].[PlayOff] ([id], [1/8_teams], [1/8_goals], [1/4_teams], [1/4_goals], [1/2_teams], [1/2_goals], [Final_teams], [Final_goals], [Finalist]) VALUES (1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PlayOff] ([id], [1/8_teams], [1/8_goals], [1/4_teams], [1/4_goals], [1/2_teams], [1/2_goals], [Final_teams], [Final_goals], [Finalist]) VALUES (2, 4, 3, 4, 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PlayOff] ([id], [1/8_teams], [1/8_goals], [1/4_teams], [1/4_goals], [1/2_teams], [1/2_goals], [Final_teams], [Final_goals], [Finalist]) VALUES (3, 6, 3, 6, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PlayOff] ([id], [1/8_teams], [1/8_goals], [1/4_teams], [1/4_goals], [1/2_teams], [1/2_goals], [Final_teams], [Final_goals], [Finalist]) VALUES (4, 8, 2, NULL, NULL, 4, 1, NULL, NULL, NULL)
INSERT [dbo].[PlayOff] ([id], [1/8_teams], [1/8_goals], [1/4_teams], [1/4_goals], [1/2_teams], [1/2_goals], [Final_teams], [Final_goals], [Finalist]) VALUES (5, 9, 2, NULL, NULL, 9, 2, NULL, NULL, NULL)
INSERT [dbo].[PlayOff] ([id], [1/8_teams], [1/8_goals], [1/4_teams], [1/4_goals], [1/2_teams], [1/2_goals], [Final_teams], [Final_goals], [Finalist]) VALUES (6, 12, 1, 9, 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PlayOff] ([id], [1/8_teams], [1/8_goals], [1/4_teams], [1/4_goals], [1/2_teams], [1/2_goals], [Final_teams], [Final_goals], [Finalist]) VALUES (7, 14, 4, 14, 2, NULL, NULL, 9, 5, NULL)
INSERT [dbo].[PlayOff] ([id], [1/8_teams], [1/8_goals], [1/4_teams], [1/4_goals], [1/2_teams], [1/2_goals], [Final_teams], [Final_goals], [Finalist]) VALUES (8, 16, 3, NULL, NULL, NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[PlayOff] ([id], [1/8_teams], [1/8_goals], [1/4_teams], [1/4_goals], [1/2_teams], [1/2_goals], [Final_teams], [Final_goals], [Finalist]) VALUES (9, 17, 3, NULL, NULL, NULL, NULL, 23, 1, NULL)
INSERT [dbo].[PlayOff] ([id], [1/8_teams], [1/8_goals], [1/4_teams], [1/4_goals], [1/2_teams], [1/2_goals], [Final_teams], [Final_goals], [Finalist]) VALUES (10, 18, 1, 17, 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PlayOff] ([id], [1/8_teams], [1/8_goals], [1/4_teams], [1/4_goals], [1/2_teams], [1/2_goals], [Final_teams], [Final_goals], [Finalist]) VALUES (11, 22, 1, 23, 5, 23, 3, NULL, NULL, NULL)
INSERT [dbo].[PlayOff] ([id], [1/8_teams], [1/8_goals], [1/4_teams], [1/4_goals], [1/2_teams], [1/2_goals], [Final_teams], [Final_goals], [Finalist]) VALUES (12, 23, 5, NULL, NULL, 31, 2, NULL, NULL, NULL)
INSERT [dbo].[PlayOff] ([id], [1/8_teams], [1/8_goals], [1/4_teams], [1/4_goals], [1/2_teams], [1/2_goals], [Final_teams], [Final_goals], [Finalist]) VALUES (13, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PlayOff] ([id], [1/8_teams], [1/8_goals], [1/4_teams], [1/4_goals], [1/2_teams], [1/2_goals], [Final_teams], [Final_goals], [Finalist]) VALUES (14, 28, 3, 28, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PlayOff] ([id], [1/8_teams], [1/8_goals], [1/4_teams], [1/4_goals], [1/2_teams], [1/2_goals], [Final_teams], [Final_goals], [Finalist]) VALUES (15, 29, 1, 31, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PlayOff] ([id], [1/8_teams], [1/8_goals], [1/4_teams], [1/4_goals], [1/2_teams], [1/2_goals], [Final_teams], [Final_goals], [Finalist]) VALUES (16, 31, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (1, 19, 1, 60)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (2, 8, 1, 79)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (3, 90, 1, 23)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (4, 71, 1, 49)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (5, 91, 1, 62)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (6, 120, 2, 25)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (7, 117, 2, 74)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (8, 134, 2, 77)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (9, 178, 2, 87)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (10, 174, 2, 88)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (11, 190, 3, 24)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (12, 193, 3, 13)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (13, 255, 3, 63)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (14, 303, 4, 8)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (15, 317, 4, 5)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (16, 317, 4, 27)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (17, 314, 4, 11)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (18, 349, 4, 40)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (19, 364, 4, 83)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (20, 351, 4, 53)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (21, 384, 5, 7)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (22, 384, 5, 9)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (23, 388, 5, 76)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (24, 407, 5, 36)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (25, 491, 6, 26)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (26, 524, 6, 36)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (27, 525, 6, 25)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (28, 519, 6, 51)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (29, 519, 6, 62)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (30, 510, 6, 80)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (31, 619, 7, 35)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (32, 626, 7, 50)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (33, 631, 7, 20)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (34, 637, 7, 58)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (35, 651, 8, 33)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (36, 708, 8, 63)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (37, 707, 8, 8)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (38, 74, 9, 42)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (39, 90, 9, 58)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (40, 80, 9, 90)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (41, 122, 9, 29)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (42, 125, 9, 19)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (43, 205, 10, 28)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (44, 195, 10, 86)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (45, 200, 10, 31)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (46, 203, 10, 58)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (47, 301, 10, 67)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (48, 321, 10, 87)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (49, 389, 11, 2)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (50, 374, 11, 49)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (51, 371, 11, 39)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (52, 514, 11, 7)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (53, 519, 11, 5)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (54, 513, 11, 57)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (55, 518, 11, 67)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (56, 510, 11, 37)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (57, 642, 12, 29)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (58, 699, 12, 80)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (59, 703, 12, 29)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (60, 86, 13, 84)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (61, 190, 13, 25)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (62, 198, 13, 4)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (63, 513, 14, 80)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (64, 509, 14, 1)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (65, 527, 14, 49)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (66, 694, 14, 47)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (67, 695, 14, 74)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (68, 71, 15, 35)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (69, 90, 15, 32)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (70, 72, 15, 29)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (71, 702, 15, 80)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (72, 206, 16, 18)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (73, 206, 16, 47)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (74, 195, 16, 54)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (75, 199, 16, 80)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (76, 205, 16, 87)
INSERT [dbo].[PlayOff_Matches_Players_statistics] ([id], [Player_FK], [Playoff_FK], [goal_minute]) VALUES (77, 527, 16, 3)
INSERT [dbo].[Playoff_statistics] ([id], [Game_part], [date], [country_1], [Goals_1], [country_2], [Goals_2], [Stadium_FK], [Viewers]) VALUES (1, N'1/8', CAST(N'2010-06-26' AS Date), 1, 2, 4, 3, 6, 40530)
INSERT [dbo].[Playoff_statistics] ([id], [Game_part], [date], [country_1], [Goals_1], [country_2], [Goals_2], [Stadium_FK], [Viewers]) VALUES (2, N'1/8', CAST(N'2010-06-26' AS Date), 6, 3, 8, 2, 10, 38006)
INSERT [dbo].[Playoff_statistics] ([id], [Game_part], [date], [country_1], [Goals_1], [country_2], [Goals_2], [Stadium_FK], [Viewers]) VALUES (3, N'1/8', CAST(N'2010-06-28' AS Date), 9, 2, 12, 1, 6, 40499)
INSERT [dbo].[Playoff_statistics] ([id], [Game_part], [date], [country_1], [Goals_1], [country_2], [Goals_2], [Stadium_FK], [Viewers]) VALUES (4, N'1/8', CAST(N'2010-06-28' AS Date), 14, 4, 16, 3, 1, 83662)
INSERT [dbo].[Playoff_statistics] ([id], [Game_part], [date], [country_1], [Goals_1], [country_2], [Goals_2], [Stadium_FK], [Viewers]) VALUES (5, N'1/8', CAST(N'2010-06-27' AS Date), 17, 3, 18, 1, 4, 61815)
INSERT [dbo].[Playoff_statistics] ([id], [Game_part], [date], [country_1], [Goals_1], [country_2], [Goals_2], [Stadium_FK], [Viewers]) VALUES (6, N'1/8', CAST(N'2010-06-27' AS Date), 22, 1, 23, 5, 2, 55509)
INSERT [dbo].[Playoff_statistics] ([id], [Game_part], [date], [country_1], [Goals_1], [country_2], [Goals_2], [Stadium_FK], [Viewers]) VALUES (7, N'1/8', CAST(N'2010-06-29' AS Date), 27, 1, 28, 3, 5, 42760)
INSERT [dbo].[Playoff_statistics] ([id], [Game_part], [date], [country_1], [Goals_1], [country_2], [Goals_2], [Stadium_FK], [Viewers]) VALUES (8, N'1/8', CAST(N'2010-06-29' AS Date), 29, 1, 31, 2, 3, 62124)
INSERT [dbo].[Playoff_statistics] ([id], [Game_part], [date], [country_1], [Goals_1], [country_2], [Goals_2], [Stadium_FK], [Viewers]) VALUES (9, N'1/4', CAST(N'2010-07-02' AS Date), 4, 3, 6, 2, 3, 63373)
INSERT [dbo].[Playoff_statistics] ([id], [Game_part], [date], [country_1], [Goals_1], [country_2], [Goals_2], [Stadium_FK], [Viewers]) VALUES (10, N'1/4', CAST(N'2010-07-02' AS Date), 9, 4, 14, 2, 6, 42102)
INSERT [dbo].[Playoff_statistics] ([id], [Game_part], [date], [country_1], [Goals_1], [country_2], [Goals_2], [Stadium_FK], [Viewers]) VALUES (11, N'1/4', CAST(N'2010-07-03' AS Date), 17, 3, 23, 5, 1, 84440)
INSERT [dbo].[Playoff_statistics] ([id], [Game_part], [date], [country_1], [Goals_1], [country_2], [Goals_2], [Stadium_FK], [Viewers]) VALUES (12, N'1/4', CAST(N'2010-07-03' AS Date), 28, 1, 31, 2, 3, 63266)
INSERT [dbo].[Playoff_statistics] ([id], [Game_part], [date], [country_1], [Goals_1], [country_2], [Goals_2], [Stadium_FK], [Viewers]) VALUES (13, N'1/2', CAST(N'2010-07-06' AS Date), 4, 1, 9, 2, 2, 55646)
INSERT [dbo].[Playoff_statistics] ([id], [Game_part], [date], [country_1], [Goals_1], [country_2], [Goals_2], [Stadium_FK], [Viewers]) VALUES (14, N'1/2', CAST(N'2010-07-07' AS Date), 23, 3, 31, 2, 3, 63962)
INSERT [dbo].[Playoff_statistics] ([id], [Game_part], [date], [country_1], [Goals_1], [country_2], [Goals_2], [Stadium_FK], [Viewers]) VALUES (15, N'THIRD', CAST(N'2010-07-10' AS Date), 4, 3, 31, 1, 6, 42096)
INSERT [dbo].[Playoff_statistics] ([id], [Game_part], [date], [country_1], [Goals_1], [country_2], [Goals_2], [Stadium_FK], [Viewers]) VALUES (16, N'FINAL', CAST(N'2010-07-11' AS Date), 9, 5, 23, 1, 1, 84321)
INSERT [dbo].[Stadiums] ([id], [name], [capacity], [city_FK]) VALUES (1, N'Soccer City', 84490, 4)
INSERT [dbo].[Stadiums] ([id], [name], [capacity], [city_FK]) VALUES (2, N'Ellis Park', 55686, 4)
INSERT [dbo].[Stadiums] ([id], [name], [capacity], [city_FK]) VALUES (3, N'Cape Town', 64100, 2)
INSERT [dbo].[Stadiums] ([id], [name], [capacity], [city_FK]) VALUES (4, N'Moses Mabhida', 62760, 3)
INSERT [dbo].[Stadiums] ([id], [name], [capacity], [city_FK]) VALUES (5, N'Loftus Versfeld', 42858, 11)
INSERT [dbo].[Stadiums] ([id], [name], [capacity], [city_FK]) VALUES (6, N'Nelson Mandela Bay', 42486, 10)
INSERT [dbo].[Stadiums] ([id], [name], [capacity], [city_FK]) VALUES (7, N'Peter Mokaba', 41733, 9)
INSERT [dbo].[Stadiums] ([id], [name], [capacity], [city_FK]) VALUES (8, N'Mbombela', 40929, 7)
INSERT [dbo].[Stadiums] ([id], [name], [capacity], [city_FK]) VALUES (9, N'Free State', 40911, 1)
INSERT [dbo].[Stadiums] ([id], [name], [capacity], [city_FK]) VALUES (10, N'Royal Bafokeng', 38646, 12)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Cities__72E12F1B9FBFD61B]    Script Date: 05-Mar-18 23:29:43 ******/
ALTER TABLE [dbo].[Cities] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__ClothesB__72E12F1BA66B4E24]    Script Date: 05-Mar-18 23:29:43 ******/
ALTER TABLE [dbo].[ClothesBrand] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Coaches__72E12F1BAE5F737E]    Script Date: 05-Mar-18 23:29:43 ******/
ALTER TABLE [dbo].[Coaches] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Countrie__72E12F1B658C8EFE]    Script Date: 05-Mar-18 23:29:43 ******/
ALTER TABLE [dbo].[Countries] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__groups__72E12F1B2E9F3920]    Script Date: 05-Mar-18 23:29:43 ******/
ALTER TABLE [dbo].[groups] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_name_Pos]    Script Date: 05-Mar-18 23:29:43 ******/
ALTER TABLE [dbo].[Positions] ADD  CONSTRAINT [UQ_name_Pos] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Stadiums__72E12F1BE4C4CE1C]    Script Date: 05-Mar-18 23:29:43 ******/
ALTER TABLE [dbo].[Stadiums] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Coaches]  WITH NOCHECK ADD  CONSTRAINT [coach_to_countries] FOREIGN KEY([countries_FK])
REFERENCES [dbo].[Countries] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Coaches] CHECK CONSTRAINT [coach_to_countries]
GO
ALTER TABLE [dbo].[Countries]  WITH NOCHECK ADD FOREIGN KEY([clothesBrand_FK])
REFERENCES [dbo].[ClothesBrand] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Countries]  WITH NOCHECK ADD FOREIGN KEY([Groups_FK])
REFERENCES [dbo].[groups] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Group_Matches]  WITH CHECK ADD FOREIGN KEY([Country_FK1])
REFERENCES [dbo].[Countries] ([id])
GO
ALTER TABLE [dbo].[Group_Matches]  WITH CHECK ADD FOREIGN KEY([Country_FK2])
REFERENCES [dbo].[Countries] ([id])
GO
ALTER TABLE [dbo].[Group_Matches]  WITH CHECK ADD FOREIGN KEY([Group_FK])
REFERENCES [dbo].[groups] ([id])
GO
ALTER TABLE [dbo].[Group_Matches]  WITH CHECK ADD FOREIGN KEY([stadium_FK])
REFERENCES [dbo].[Stadiums] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Group_Matches_Players_statistics]  WITH CHECK ADD FOREIGN KEY([Group_Matches_FK])
REFERENCES [dbo].[Group_Matches] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Group_Matches_Players_statistics]  WITH CHECK ADD FOREIGN KEY([Player_FK])
REFERENCES [dbo].[Players] ([id])
GO
ALTER TABLE [dbo].[GroupMatches_Results]  WITH CHECK ADD FOREIGN KEY([countriesId_FK])
REFERENCES [dbo].[Countries] ([id])
GO
ALTER TABLE [dbo].[GroupMatches_Results]  WITH CHECK ADD FOREIGN KEY([groups_FK])
REFERENCES [dbo].[groups] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Players]  WITH NOCHECK ADD  CONSTRAINT [Player_to_Countries] FOREIGN KEY([Countries_FK])
REFERENCES [dbo].[Countries] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [Player_to_Countries]
GO
ALTER TABLE [dbo].[Players]  WITH NOCHECK ADD  CONSTRAINT [Player_to_pos] FOREIGN KEY([Posititon_FK])
REFERENCES [dbo].[Positions] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [Player_to_pos]
GO
ALTER TABLE [dbo].[PlayOff]  WITH CHECK ADD FOREIGN KEY([1/2_teams])
REFERENCES [dbo].[Countries] ([id])
GO
ALTER TABLE [dbo].[PlayOff]  WITH CHECK ADD FOREIGN KEY([1/4_teams])
REFERENCES [dbo].[Countries] ([id])
GO
ALTER TABLE [dbo].[PlayOff]  WITH CHECK ADD FOREIGN KEY([1/8_teams])
REFERENCES [dbo].[Countries] ([id])
GO
ALTER TABLE [dbo].[PlayOff]  WITH CHECK ADD FOREIGN KEY([Final_teams])
REFERENCES [dbo].[Countries] ([id])
GO
ALTER TABLE [dbo].[PlayOff_Matches_Players_statistics]  WITH CHECK ADD FOREIGN KEY([Player_FK])
REFERENCES [dbo].[Players] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayOff_Matches_Players_statistics]  WITH CHECK ADD FOREIGN KEY([Playoff_FK])
REFERENCES [dbo].[PlayOff] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Playoff_statistics]  WITH CHECK ADD FOREIGN KEY([Stadium_FK])
REFERENCES [dbo].[Stadiums] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Stadiums]  WITH NOCHECK ADD  CONSTRAINT [stadium_to_city] FOREIGN KEY([city_FK])
REFERENCES [dbo].[Cities] ([id])
GO
ALTER TABLE [dbo].[Stadiums] CHECK CONSTRAINT [stadium_to_city]
GO
ALTER TABLE [dbo].[Group_Matches]  WITH CHECK ADD  CONSTRAINT [CK_Country1_Country2] CHECK  (([Country_FK1]<>[Country_FK2]))
GO
ALTER TABLE [dbo].[Group_Matches] CHECK CONSTRAINT [CK_Country1_Country2]
GO
/****** Object:  StoredProcedure [dbo].[Goals_generate]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Goals_generate] 
 @goals_1 int output,
 @goals_2 int output 
as
begin
declare @rnd_goals int
			set @goals_1 = -1
			set @goals_2 = -1
			--/////для вероятности голов создаем таблицу возможных забитых мячей///
			--////////////////////////////////////////////////////////////////////
			create table #goals (id int identity primary key, result int)
			declare @count int; set @count = 100;
			while(@count>50)
			begin
			--SELECT @Random = ROUND(((@Upper - @Lower -1) * @randomvalue + @Lower), 0)
			insert into #goals(result) values(ROUND(((3 - 1 - 1) * rand() + 1), 0)) set @count = @count - 1
			end
			while(@count>30)
			begin
			insert into #goals(result) values(ROUND(((4 - 3 - 1) * rand() + 3), 0)) set @count = @count - 1
			end
			while(@count>20)
			begin
			insert into #goals(result) values(ROUND(((5 - 3 -1) * rand() + 3), 0)) set @count = @count - 1
			end
			while(@count>10)
			begin
			insert into #goals(result) values(ROUND(((6 - 4 -1) * rand() + 4), 0)) set @count = @count - 1
			end
			while(@count>0)
			begin
			insert into #goals(result) values(ROUND(((6 - 5 -1) * rand() + 5), 0)) set @count = @count - 1
			end
			while @goals_1 = @goals_2 
				begin
					set @rnd_goals = ROUND(((101 - 1 -1) * rand() + 1), 0)
					set @goals_1 = (select result from #goals where id = @rnd_goals)
					set @rnd_goals = ROUND(((101 - 1 -1) * rand() + 1), 0)
					set @goals_2 = (select result from #goals where id = @rnd_goals)
				end
			drop table #goals
			--///////////////////////////////////////////////////////////////
end

GO
/****** Object:  StoredProcedure [dbo].[GroupMatches_Results_SP]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GroupMatches_Results_SP] as
begin
--удаляем предыдущие существующие данные из таблицы результатов
delete GroupMatches_Results from GroupMatches_Results 
declare @id_group_match int
declare @id int
set @id = 1;
set @id_group_match = 1
while @id_group_match<=32
	begin
		declare @ball_goal int, @ball_missed int;
		set @ball_goal = isnull((select sum(Goals_1) from group_Matches where Country_FK1 = @id_group_match),0) + 
		isnull((select sum(Goals_2) from group_Matches where Country_FK2 = @id_group_match),0);
		set @ball_missed = isnull((select sum(Goals_2) from group_Matches where Country_FK1 = @id_group_match),0) + 
		isnull((select sum(Goals_1) from group_Matches where Country_FK2 = @id_group_match),0);
		insert into GroupMatches_Results
		values
		(@id,
		(select Groups_FK from Countries where id = @id_group_match),
		@id_group_match,
		((select count(id) from group_Matches where Country_FK1 = @id_group_match)+(select count(id) from group_Matches where Country_FK2 = @id_group_match)),
		((select count(id) from group_Matches where Country_FK1 = @id_group_match and Goals_1 > Goals_2)+
		 (select count(id) from group_Matches where Country_FK2 = @id_group_match and Goals_2 > Goals_1)),
		((select count(id) from group_Matches where Country_FK1 = @id_group_match and Goals_1 = Goals_2)+
		 (select count(id) from group_Matches where Country_FK2 = @id_group_match and Goals_2 = Goals_1)),
		((select count(id) from group_Matches where Country_FK1 = @id_group_match and Goals_1 < Goals_2)+
		 (select count(id) from group_Matches where Country_FK2 = @id_group_match and Goals_2 < Goals_1)),
		(convert(nvarchar(5), @ball_goal) + ' - ' + convert(nvarchar(5), @ball_missed)),
		(@ball_goal - @ball_missed),
		 (((select count(id) from group_Matches where Country_FK1 = @id_group_match and Goals_1 > Goals_2)+
		 (select count(id) from group_Matches where Country_FK2 = @id_group_match and Goals_2 > Goals_1)) * 3 +
		 ((select count(id) from group_Matches where Country_FK1 = @id_group_match and Goals_1 = Goals_2)+
		 (select count(id) from group_Matches where Country_FK2 = @id_group_match and Goals_2 = Goals_1))) 
		 );
		set @id_group_match = @id_group_match + 1;
		set @id = @id +1;
	end
exec Play_off_matches
end

GO
/****** Object:  StoredProcedure [dbo].[Play_off_matches]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Play_off_matches] as
begin
delete Playoff_statistics from Playoff_statistics
delete PlayOff from PlayOff
	declare @groups int
	declare @id int
	declare @goals_1 int, @goals_2 int
	set @id = 1;
	set @groups = 1;
	while(@groups<=8)
		begin
			exec Goals_generate @goals_1 output, @goals_2 output
			create table #winers 
			(
				id int primary key,
				groups_FK int,
				countriesId_FK int,
				games int,
				wins int, 
				draws int,
				losses int,
				balls nvarchar (15),
				delta int,
				points int
			);
			insert into #winers 
			select top 2 * from GroupMatches_Results where @groups = GroupMatches_Results.groups_FK
			order by points desc, delta desc
			alter table #winers
			add id_new int identity
			insert into PlayOff(id, [1/8_teams], [1/8_goals]) values
			(@id, (select countriesId_FK from #winers where #winers.id_new = 1), @goals_1);
			set @id = @id + 1;
			insert into PlayOff(id, [1/8_teams], [1/8_goals]) values
			(@id, (select countriesId_FK from #winers where #winers.id_new = 2), @goals_2);
			set @id = @id + 1;
			set @groups = @groups + 1;
			drop table #winers
		end
		--////////////////////////////////////////////////////
		--1/4  ////////////////////////////////////////////////
		exec Goals_generate @goals_1 output, @goals_2 output
		update PlayOff 
		set [1/4_teams] = (select [1/8_teams] from PlayOff where PlayOff.id in (1,2) and [1/8_goals] = 
						  (select max([1/8_goals]) from PlayOff where PlayOff.id in (1,2))),
			[1/4_goals] = @goals_1 where PlayOff.id = 2
		update PlayOff 
		set [1/4_teams] = (select [1/8_teams] from PlayOff where PlayOff.id in (3,4) and [1/8_goals] = 
						  (select max([1/8_goals]) from PlayOff where PlayOff.id in (3,4))),
			[1/4_goals] = @goals_2 where PlayOff.id = 3
		---------------------------------------------------------
		exec Goals_generate @goals_1 output, @goals_2 output
		update PlayOff 
		set [1/4_teams] = (select [1/8_teams] from PlayOff where PlayOff.id in (5,6) and [1/8_goals] = 
						  (select max([1/8_goals]) from PlayOff where PlayOff.id in (5,6))),
			[1/4_goals] = @goals_1 where PlayOff.id = 6
		update PlayOff 
		set [1/4_teams] = (select [1/8_teams] from PlayOff where PlayOff.id in (7,8) and [1/8_goals] = 
						  (select max([1/8_goals]) from PlayOff where PlayOff.id in (7,8))),
			[1/4_goals] = @goals_2 where PlayOff.id = 7
		---------------------------------------------------------
		exec Goals_generate @goals_1 output, @goals_2 output
		update PlayOff 
		set [1/4_teams] = (select [1/8_teams] from PlayOff where PlayOff.id in (9,10) and [1/8_goals] = 
						  (select max([1/8_goals]) from PlayOff where PlayOff.id in (9,10))),
			[1/4_goals] = @goals_1 where PlayOff.id = 10
		update PlayOff 
		set [1/4_teams] = (select [1/8_teams] from PlayOff where PlayOff.id in (11,12) and [1/8_goals] = 
						  (select max([1/8_goals]) from PlayOff where PlayOff.id in (11,12))),
			[1/4_goals] = @goals_2 where PlayOff.id = 11
		---------------------------------------------------------
		exec Goals_generate @goals_1 output, @goals_2 output
		update PlayOff 
		set [1/4_teams] = (select [1/8_teams] from PlayOff where PlayOff.id in (13,14) and [1/8_goals] = 
						  (select max([1/8_goals]) from PlayOff where PlayOff.id in (13,14))),
			[1/4_goals] = @goals_1 where PlayOff.id = 14
		update PlayOff 
		set [1/4_teams] = (select [1/8_teams] from PlayOff where PlayOff.id in (15,16) and [1/8_goals] = 
						  (select max([1/8_goals]) from PlayOff where PlayOff.id in (15,16))),
			[1/4_goals] = @goals_2 where PlayOff.id = 15
		--////////////////////////////////////////////////////
		--1/2  ////////////////////////////////////////////////
		exec Goals_generate @goals_1 output, @goals_2 output
		update PlayOff 
		set [1/2_teams] = (select [1/4_teams] from PlayOff where PlayOff.id in (2,3) and [1/4_goals] = 
						  (select max([1/4_goals]) from PlayOff where PlayOff.id in (2,3))),
			[1/2_goals] = @goals_1 where PlayOff.id = 4
		update PlayOff 
		set [1/2_teams] = (select [1/4_teams] from PlayOff where PlayOff.id in (6,7) and [1/4_goals] = 
						  (select max([1/4_goals]) from PlayOff where PlayOff.id in (6,7))),
			[1/2_goals] = @goals_2 where PlayOff.id = 5
		-----------------------------------------------------
		exec Goals_generate @goals_1 output, @goals_2 output
		update PlayOff 
		set [1/2_teams] = (select [1/4_teams] from PlayOff where PlayOff.id in (10,11) and [1/4_goals] = 
						  (select max([1/4_goals]) from PlayOff where PlayOff.id in (10,11))),
			[1/2_goals] = @goals_1 where PlayOff.id = 11
		update PlayOff 
		set [1/2_teams] = (select [1/4_teams] from PlayOff where PlayOff.id in (14,15) and [1/4_goals] = 
						  (select max([1/4_goals]) from PlayOff where PlayOff.id in (14,15))),
			[1/2_goals] = @goals_2 where PlayOff.id = 12
		--////////////////////////////////////////////////////
		--Final  ////////////////////////////////////////////////
		exec Goals_generate @goals_1 output, @goals_2 output
		update PlayOff 
		set Final_teams = (select [1/2_teams] from PlayOff where PlayOff.id in (4,5) and [1/2_goals] = 
						  (select max([1/2_goals]) from PlayOff where PlayOff.id in (4,5))),
			Final_goals = @goals_1 where PlayOff.id = 7
		update PlayOff 
		set Final_teams = (select [1/2_teams] from PlayOff where PlayOff.id in (11,12) and [1/2_goals] = 
						  (select max([1/2_goals]) from PlayOff where PlayOff.id in (11,12))),
			Final_goals = @goals_2 where PlayOff.id = 9
		-----------------------------------------------------
		update PlayOff 
		set Finalist = (select Final_teams from PlayOff where PlayOff.id in (7,9) and Final_goals = 
						  (select max(Final_goals) from PlayOff where PlayOff.id in (7,9)))
						where PlayOff.id = 8
--//////////////////////////////////////////////////////////
--////////////1-8///////////////////////////////////////////
		exec Goals_generate @goals_1 output, @goals_2 output
		insert into Playoff_statistics values
		(1, '1/8', '2010-06-26', (select PlayOff.[1/8_teams] from PlayOff where PlayOff.id = 1),(select [1/8_goals] from PlayOff where PlayOff.id = 1),
		(select [1/8_teams] from PlayOff where PlayOff.id = 2),(select [1/8_goals] from PlayOff where PlayOff.id = 2), 6, 
		(ROUND(((42487 - 40000 -1) * rand() + 40000), 0))),
		-----
		(2, '1/8', '2010-06-26', (select PlayOff.[1/8_teams] from PlayOff where PlayOff.id = 3),(select [1/8_goals] from PlayOff where PlayOff.id = 3),
		(select [1/8_teams] from PlayOff where PlayOff.id = 4),(select [1/8_goals] from PlayOff where PlayOff.id = 4), 10, 
		(ROUND(((38646 - 38000 -1) * rand() + 38000), 0))),
		-----
		(3, '1/8', '2010-06-28', (select PlayOff.[1/8_teams] from PlayOff where PlayOff.id = 5),(select [1/8_goals] from PlayOff where PlayOff.id = 5),
		(select [1/8_teams] from PlayOff where PlayOff.id = 6),(select [1/8_goals] from PlayOff where PlayOff.id = 6), 6, 
		(ROUND(((40911 - 40000 -1) * rand() + 40000), 0))),
		-----
		(4, '1/8', '2010-06-28', (select PlayOff.[1/8_teams] from PlayOff where PlayOff.id = 7),(select [1/8_goals] from PlayOff where PlayOff.id = 7),
		(select [1/8_teams] from PlayOff where PlayOff.id = 8),(select [1/8_goals] from PlayOff where PlayOff.id = 8), 1, 
		(ROUND(((84490 - 83000 -1) * rand() + 83000), 0))),
		------------
		(5, '1/8', '2010-06-27', (select PlayOff.[1/8_teams] from PlayOff where PlayOff.id = 9),(select [1/8_goals] from PlayOff where PlayOff.id = 9),
		(select [1/8_teams] from PlayOff where PlayOff.id = 10),(select [1/8_goals] from PlayOff where PlayOff.id = 10), 4, 
		(ROUND(((62760 - 60000 -1) * rand() + 60000), 0))),
		-----
		(6, '1/8', '2010-06-27', (select PlayOff.[1/8_teams] from PlayOff where PlayOff.id = 11),(select [1/8_goals] from PlayOff where PlayOff.id = 11),
		(select [1/8_teams] from PlayOff where PlayOff.id = 12),(select [1/8_goals] from PlayOff where PlayOff.id = 12), 2, 
		(ROUND(((55686 - 54000 -1) * rand() + 54000), 0))),
		-----
		(7,'1/8', '2010-06-29', (select PlayOff.[1/8_teams] from PlayOff where PlayOff.id = 13),(select [1/8_goals] from PlayOff where PlayOff.id = 13),
		(select [1/8_teams] from PlayOff where PlayOff.id = 14),(select [1/8_goals] from PlayOff where PlayOff.id = 14), 5, 
		(ROUND(((42858 - 40000 -1) * rand() + 40000), 0))),
		-----
		(8, '1/8', '2010-06-29', (select PlayOff.[1/8_teams] from PlayOff where PlayOff.id = 15),(select [1/8_goals] from PlayOff where PlayOff.id = 15),
		(select [1/8_teams] from PlayOff where PlayOff.id = 16),(select [1/8_goals] from PlayOff where PlayOff.id = 16), 3, 
		(ROUND(((64100 - 62000 -1) * rand() + 62000), 0))),
		---------
		---------
--////////////1-4///////////////////////////////////////////
		-----
		(9, '1/4', '2010-07-02', (select [1/4_teams] from PlayOff where PlayOff.id = 2),(select [1/4_goals] from PlayOff where PlayOff.id = 2),
		(select [1/4_teams] from PlayOff where PlayOff.id = 3),(select [1/4_goals] from PlayOff where PlayOff.id = 3), 3, 
		(ROUND(((64100 - 62000 -1) * rand() + 62000), 0))),
		-----
		(10 , '1/4', '2010-07-02', (select PlayOff.[1/4_teams] from PlayOff where PlayOff.id = 6),(select [1/4_goals] from PlayOff where PlayOff.id = 6),
		(select [1/4_teams] from PlayOff where PlayOff.id = 7),(select [1/4_goals] from PlayOff where PlayOff.id = 7), 6, 
		(ROUND(((42486 - 42000 -1) * rand() + 42000), 0))),
		-----
		(11, '1/4', '2010-07-03', (select PlayOff.[1/4_teams] from PlayOff where PlayOff.id = 10),(select [1/4_goals] from PlayOff where PlayOff.id = 10),
		(select [1/4_teams] from PlayOff where PlayOff.id = 11),(select [1/4_goals] from PlayOff where PlayOff.id = 11), 1, 
		(ROUND(((84490 - 84000 -1) * rand() + 84000), 0))),
		-----
		(12, '1/4', '2010-07-03', (select PlayOff.[1/4_teams] from PlayOff where PlayOff.id = 14),(select [1/4_goals] from PlayOff where PlayOff.id = 14),
		(select [1/4_teams] from PlayOff where PlayOff.id = 15),(select [1/4_goals] from PlayOff where PlayOff.id = 15), 3, 
		(ROUND(((64100 - 62000 -1) * rand() + 62000), 0))),
--////////////1-2///////////////////////////////////////////
		-----
		(13, '1/2', '2010-07-06', (select PlayOff.[1/2_teams] from PlayOff where PlayOff.id = 4),(select [1/2_goals] from PlayOff where PlayOff.id = 4),
		(select [1/2_teams] from PlayOff where PlayOff.id = 5),(select [1/2_goals] from PlayOff where PlayOff.id = 5), 2, 
		(ROUND(((55686 - 55000 -1) * rand() + 55000), 0))),
		-----
		(14, '1/2', '2010-07-07', (select PlayOff.[1/2_teams] from PlayOff where PlayOff.id = 11),(select [1/2_goals] from PlayOff where PlayOff.id = 11),
		(select [1/2_teams] from PlayOff where PlayOff.id = 12),(select [1/2_goals] from PlayOff where PlayOff.id = 12), 3, 
		(ROUND(((64100 - 62000 -1) * rand() + 62000), 0))),
--//////////THIRD PLACE////////////////
		(15, 'THIRD', '2010-07-10',
		(select [1/2_teams] from PlayOff where PlayOff.id in (4,5) and [1/2_goals] = (select MIN([1/2_goals]) from PlayOff where PlayOff.id in (4,5))),
		@goals_1,
		(select [1/2_teams] from PlayOff where PlayOff.id in (11,12) and [1/2_goals] = (select MIN([1/2_goals]) from PlayOff where PlayOff.id in (11,12))),
		@goals_2, 6 ,(ROUND(((42486 - 42000 -1) * rand() + 42000), 0))),
--///////FINAL////////////////////////
		(16, 'FINAL', '2010-07-11', (select PlayOff.Final_teams from PlayOff where PlayOff.id = 7),(select Final_goals from PlayOff where PlayOff.id = 7),
		(select Final_teams from PlayOff where PlayOff.id = 9),(select Final_goals from PlayOff where PlayOff.id = 9), 1, 
		(ROUND(((84490 - 84000 -1) * rand() + 84000), 0)))

--/////////////////////////////////////////
		select * from PlayOff
		select 'Champion: ' + (select Countries.name from Countries, PlayOff where Countries.id = PlayOff.Finalist) as [World Cup 2010]
end
exec Player_stat
exec PlayOff_Matches_Players_statistics_SP

GO
/****** Object:  StoredProcedure [dbo].[Player_stat]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Player_stat] as
begin
--удаляем предыдущие данные из таблицы статистики игроков
delete Group_Matches_Players_statistics from Group_Matches_Players_statistics 

declare @id int, @rnd int, @rnd_min int, @matches_FK int, @country_FK1 int, @country_FK2 int
set @id = 1;
set @matches_FK = 1;

while @matches_FK <= 48 
	begin
		declare @goals1 int, @goals2 int
		select @goals1 = (select goals_1 from Group_Matches where id = @matches_FK)
		select @goals2 = (select goals_2 from Group_Matches where id = @matches_FK)
		select @country_FK1 = (select country_FK1 from Group_Matches where id = @matches_FK)
		select @country_FK2 = (select country_FK2 from Group_Matches where id = @matches_FK)

		if @goals1>0
			begin
				while @goals1>0
					begin
						--SELECT @Random = ROUND(((@Upper - @Lower -1) * @randomvalue + @Lower), 0)
						set @rnd = round((((23*@country_FK1 + 1) - (23*@country_FK1-23 +1 ) -1) * rand() + (23*@country_FK1-23 +1 )), 0)
						set @rnd_min = ROUND(((90+1 - 1 -1) * rand() + 1), 0)
						insert into Group_Matches_Players_statistics (id, Player_FK, Group_Matches_FK, goal_minute)
						values (@id , @rnd , @matches_FK , @rnd_min)
						set @id = @id + 1
						set @goals1 = @goals1 - 1
					end
			end
		if @goals2>0
			begin
				while @goals2>0
					begin
						--SELECT @Random = ROUND(((@Upper - @Lower -1) * @randomvalue + @Lower), 0)
						set @rnd = round((((23*@country_FK2 + 1) - (23*@country_FK2-23 +1 ) -1) * rand() + (23*@country_FK2-23 +1 )), 0)
						set @rnd_min = ROUND(((90+1 - 1 -1) * rand() + 1), 0)
						insert into Group_Matches_Players_statistics (id, Player_FK, Group_Matches_FK, goal_minute)
						values (@id , @rnd , @matches_FK , @rnd_min)
						set @id = @id + 1
						set @goals2 = @goals2 - 1
					end
			end
		set @matches_FK = @matches_FK + 1
	end
end

--exec Player_stat
--drop proc Player_stat
GO
/****** Object:  StoredProcedure [dbo].[PlayOff_Matches_Players_statistics_SP]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PlayOff_Matches_Players_statistics_SP] as
begin
--удаляем предыдущие данные из таблицы статистики игроков 
delete PlayOff_Matches_Players_statistics from PlayOff_Matches_Players_statistics 

declare @id int, @rnd int, @rnd_min int, @matches_FK int, @country_FK1 int, @country_FK2 int
set @id = 1;
set @matches_FK = 1;

while @matches_FK <= 16 
	begin
		declare @goals1 int, @goals2 int
		select @goals1 = (select goals_1 from Playoff_statistics where id = @matches_FK)
		select @goals2 = (select goals_2 from Playoff_statistics where id = @matches_FK)
		select @country_FK1 = (select country_1 from Playoff_statistics where id = @matches_FK)
		select @country_FK2 = (select country_2 from Playoff_statistics where id = @matches_FK)

		if @goals1>0
			begin
				while @goals1>0
					begin
						--SELECT @Random = ROUND(((@Upper - @Lower -1) * @randomvalue + @Lower), 0)
						set @rnd = round((((23*@country_FK1 + 1) - (23*@country_FK1-23 +1 ) -1) * rand() + (23*@country_FK1-23 +1 )), 0)
						set @rnd_min = ROUND(((90+1 - 1 -1) * rand() + 1), 0)
						insert into PlayOff_Matches_Players_statistics (id, Player_FK, Playoff_FK, goal_minute)
						values (@id , @rnd , @matches_FK , @rnd_min)
						set @id = @id + 1
						set @goals1 = @goals1 - 1
					end
			end
		if @goals2>0
			begin
				while @goals2>0
					begin
						--SELECT @Random = ROUND(((@Upper - @Lower -1) * @randomvalue + @Lower), 0)
						set @rnd = round((((23*@country_FK2 + 1) - (23*@country_FK2-23 +1 ) -1) * rand() + (23*@country_FK2-23 +1 )), 0)
						set @rnd_min = ROUND(((90+1 - 1 -1) * rand() + 1), 0)
						insert into PlayOff_Matches_Players_statistics (id, Player_FK, Playoff_FK, goal_minute)
						values (@id , @rnd , @matches_FK , @rnd_min)
						set @id = @id + 1
						set @goals2 = @goals2 - 1
					end
			end
		set @matches_FK = @matches_FK + 1
	end
end

--exec PlayOff_Matches_Players_statistics_SP
--drop proc PlayOff_Matches_Players_statistics_SP
GO
/****** Object:  StoredProcedure [dbo].[RePlay]    Script Date: 05-Mar-18 23:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RePlay] as
begin
--удаляем предыдущие данные из таблицы групповых матчей
delete Group_Matches from Group_Matches 
--создаем временную таблицу с датами из диапазона дат проведения групповых матчей
create table #date
(
	id int identity primary key,
	[date] date
);
declare @date date;
set @date = '2010-06-11';
while @date < '2010-06-26'
begin 
insert into #date
values(@date)
set @date = dateadd(day, 1, @date);
end
-------------------------------------------------
--генерирование даты для таблицы групповых матчей
declare @dateInGrooupMatch date;
declare @rnd int;
declare @count_matches int;
set @count_matches=0;
declare @group_id int;
set @group_id = 1;
while 1 <> 0
begin
if @count_matches = 48
break
select @rnd = FLOOR(1 + (RAND() * 15))
select @dateInGrooupMatch = (select [date] from #date where id = @rnd)
if ((select count([date]) from Championship.dbo.Group_Matches where [date] = @dateInGrooupMatch) < 3)
	begin
		if(@count_matches > 0 and @count_matches%6=0)
		set @group_id = @group_id+1;
		insert into Group_Matches(id, Group_FK, [date])
		values(@count_matches + 1,@group_id, @dateInGrooupMatch)
		set @count_matches=@count_matches+1;
	end
	else
	if @count_matches >= 45
	begin
if(@count_matches > 0 and @count_matches%6=0)
		set @group_id = @group_id+1;
		insert into Group_Matches(id, Group_FK, [date]) 
		values(@count_matches + 1, @group_id, @dateInGrooupMatch) 
		set @count_matches = @count_matches + 1;
	end
	else
	continue
end
----------------------------------------------------------------------
--заполняем матчи - команды и их результаты по группам
declare @groupid int, @countryid int, @insert_left int, @insert_right int, @goals_1 int, @goals_2 int
set @groupid = 1;
set @insert_left = 1;
set @insert_right = 1;
while @groupid <= 8
begin
	declare @sixMatches int
	set @sixMatches = 0;
	create table #countryInGroup 
	(
		id int identity primary key,
		country_FK int
	);
	insert into #countryInGroup select id from Countries where @groupid = Groups_FK
	while @sixMatches <> 6
	begin
		--left insert
		select @rnd = ROUND(((5 - 1 -1) * rand() + 1), 0)
		select @countryid = (select country_FK from #countryInGroup where id = @rnd)
		exec Goals_generate @goals_1 output, @goals_2 output

		if ((select count(country_fk1) from Group_Matches where Group_FK = @groupid and country_fk1 = @countryid) + 
			(select count(country_fk2) from Group_Matches where Group_FK = @groupid and country_fk2 = @countryid) < 3)
		begin
				--stadium and viewers
				---------------------
				declare @id_stadium int
				declare @rnd_stadium int
				set @id_stadium = 1
				declare @viewers int
				declare @capacity int
				while 1<>0
					begin
						select @rnd_stadium = ROUND(((11 - 1 -1) * rand() + 1), 0)
						if((select count(Group_Matches.id) from Group_Matches where stadium_FK = 
						(select Stadiums.id from Stadiums where Stadiums.id = @rnd_stadium)
						and (select [date] from Group_Matches where Group_Matches.id = @insert_left) in (select [date] from Group_Matches where stadium_FK = 
						(select Stadiums.id from Stadiums where Stadiums.id = @rnd_stadium)))>0) 
						continue
						else
						break
					end
				set @capacity = (select capacity from Stadiums where Stadiums.id = @rnd_stadium)
				select @viewers = ROUND(((@capacity - (@capacity-1000) -1) * rand() + (@capacity-1000)), 0)		
				------------------------

				update Group_Matches set Country_FK1 = @countryid, Goals_1 = @goals_1, stadium_FK = @rnd_stadium, Viewers = @viewers  where id = @insert_left
				set @insert_left = @insert_left + 1;
				

		end
		else
		continue
					--right insert
					declare @flag bit
						declare @collision bit
						set @collision = 0;
						while(@collision = 0)
						begin
						set @flag = 0;
							select @rnd = ROUND(((5 - 1 -1) * rand() + 1), 0)
							select @countryid = (select country_FK from #countryInGroup where id = @rnd)
							if ((select count(country_fk1) from Group_Matches where Group_FK = @groupid and country_fk1 = @countryid) + 
								(select count(country_fk2) from Group_Matches where Group_FK = @groupid and country_fk2 = @countryid) < 3)
							begin
								if((select country_fk1 from Group_Matches where Group_FK = @groupid and id = @insert_right) = @countryid) 
								continue

									declare @id int
									set @id = 1;
									while(@id<=48)
									begin
										if((select country_fk1 from Group_Matches where id = @id) = (select country_fk1 from Group_Matches where id = @insert_right)
										and ((select country_fk2 from Group_Matches where id = @id) = @countryid))
										begin
										set @flag = 1;
										break
										end
										else
												begin	
												if((select country_fk1 from Group_Matches where id = @id) = @countryid
												and ((select country_fk2 from Group_Matches where id = @id) = (select country_fk1 from Group_Matches where id = @insert_right)))
												begin
												set @flag = 1;
												break
												end

												else
												begin
												set @id = @id + 1;
												continue
												end
												end

									end
									if(@flag = 1)
										continue;
										else
										begin
										update Group_Matches set Country_FK2 = @countryid, Goals_2 = @goals_2 where id = @insert_right
										set @insert_right = @insert_right + 1;
										set @collision = 1;
										break;
										end
							end
							else
							continue
						end
		set @sixMatches = @sixMatches + 1;
	end
set @groupid = @groupid + 1;
drop table #countryInGroup
end
exec GroupMatches_Results_SP
end

GO
USE [master]
GO
ALTER DATABASE [Championship] SET  READ_WRITE 
GO
