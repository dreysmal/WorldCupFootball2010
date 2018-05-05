create database Championship
go
use Championship
create table groups
(
id int primary key,
name nvarchar(1) unique
)

	create table Cities
	(
	id int primary key,
	name nvarchar(30) unique
	);
create table Stadiums
(
	id int primary key,
	name nvarchar(30) unique,
	capacity int,
	city_FK int,
	constraint stadium_to_city foreign key (city_FK) references Cities(id)
	);

	create table ClothesBrand
	(
	id int primary key, 
	name nvarchar(30) unique
	)
	create table Countries
(
	id int primary key,
	name nvarchar(30) unique,
	Groups_FK int references groups(id) on delete cascade on update cascade,
	clothesBrand_FK int references ClothesBrand(id) on delete cascade on update cascade
	);
	go
	create table Coaches
	(
	id int primary key, 
	name nvarchar(30) unique,
	countries_FK int
	constraint coach_to_countries foreign key (countries_FK) references Countries(id) on delete cascade on update cascade
	);

	create table Positions
	(
	id int primary key, 
	name nvarchar(2) constraint UQ_name_Pos Unique
	)

	create table Players
	(
	id int primary key,
	name nvarchar(30),
	Posititon_FK int,
	Countries_FK int,
	constraint Player_to_Countries foreign key (Countries_FK) references Countries(id) on delete cascade on update cascade,
	constraint Player_to_pos foreign key (Posititon_FK) references Positions(id) on delete cascade on update cascade
	); 
	go
	BULK INSERT [dbo].[Countries] FROM 'C:\Users\User\Documents\SQL Server Management Studio\Championship\Data\countries.txt'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '\n'
);
	go
	BULK INSERT [dbo].[Cities] FROM 'C:\Users\User\Documents\SQL Server Management Studio\Championship\Data\cities.txt'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '\n'
);
	go
	BULK INSERT [dbo].[Stadiums] FROM 'C:\Users\User\Documents\SQL Server Management Studio\Championship\Data\Stadiums.txt'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '\n'
);
	go
	BULK INSERT [dbo].ClothesBrand FROM 'C:\Users\User\Documents\SQL Server Management Studio\Championship\Data\форма.txt'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '\n'
);
go
	BULK INSERT [dbo].Coaches FROM 'C:\Users\User\Documents\SQL Server Management Studio\Championship\Data\Coaches.txt'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '\n'
);
go
	BULK INSERT [dbo].Players FROM 'C:\Users\User\Documents\SQL Server Management Studio\Championship\Data\Players.txt'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '\n'
);
go
	BULK INSERT [dbo].Groups FROM 'C:\Users\User\Documents\SQL Server Management Studio\Championship\Data\Группы.txt'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '\n'
);
go
--delete players from players
create table Group_Matches
(
id int primary key,
	Group_FK int references Groups(id),
	[date] Date,
	Country_FK1 int references Countries(id),
	Goals_1 int,
	Country_FK2 int references Countries(id),
	Goals_2 int,
	constraint CK_Country1_Country2 check(Country_FK1 <> Country_FK2),
	stadium_FK int references Stadiums(id) on delete cascade on update cascade,
	Viewers int
	);

create table GroupMatches_Results
(
id int primary key,
groups_FK int references groups(id) on delete cascade on update cascade,
countriesId_FK int references countries(id),
games int,
wins int, 
draws int,
losses int,
balls nvarchar (15),
delta int,
points int
);

create table PlayOff
(
id int primary key,
[1/8_teams] int references countries(id),
[1/8_goals] int,
[1/4_teams] int references countries(id),
[1/4_goals] int,
[1/2_teams] int references countries(id),
[1/2_goals] int,
Final_teams int references countries(id),
Final_goals int,
Finalist int
)

create table Group_Matches_Players_statistics
(
id int primary key,
Player_FK int references Players(id),
Group_Matches_FK int references Group_Matches(id) on delete cascade on update cascade,
goal_minute int
);

create table Playoff_statistics
(
id int primary key,
Game_part nvarchar(10),
[date] date,
country_1 int,
Goals_1 int, 
country_2 int,
Goals_2 int, 
Stadium_FK int references Stadiums(id) on delete cascade on update cascade,
Viewers int
);

create table PlayOff_Matches_Players_statistics
(
id int primary key,
Player_FK int references Players(id) on delete cascade on update cascade,
Playoff_FK int references Playoff(id) on delete cascade on update cascade,
goal_minute int
);