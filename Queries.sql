Use Championship
go

--1. Общее количество голов, забитых на протяжении чемпионата
select ((select sum(goals_1) from Group_Matches) + (select sum(goals_2) from Group_Matches) + 
		(select sum(goals_1) from Playoff_statistics) + (select sum(goals_2) from Playoff_statistics)) as [All goals in Championship]
go

--2. Среднее количество голов в каждом матче
select (((select sum(goals_1) from Group_Matches) + (select sum(goals_2) from Group_Matches) + 
		(select sum(goals_1) from Playoff_statistics) + (select sum(goals_2) from Playoff_statistics))/
		((select count(goals_1) from Group_Matches) + (select sum(goals_1) from Playoff_statistics))) as [Avarage goals]
go

--3. Наибольшее и наименьшее количество мячей, забитых командами (2 команды)
--Max:
select name + ':  ' + convert(nvarchar(4), ready.goals) as [Country with Max result Goals:] from countries, 
(select top 1 united.Country_FK1 as [Country Id], sum(goals) as Goals from
(select country_FK1, sum(Goals_1) as goals from Group_Matches 
group by country_FK1
union 
select country_FK2, sum(Goals_2) from Group_Matches 
group by country_FK2
union
select country_1, sum(Goals_1) from Playoff_statistics 
group by country_1
union
select country_2, sum(Goals_2) from Playoff_statistics 
group by country_2) as united
group by united.Country_FK1
order by 2 desc) as ready
where [Country Id] = Countries.id 
go

--Min:
select name + ':  ' + convert(nvarchar(4), ready.goals) as [Country with Min result Goals:] from countries, 
(select top 1 united.Country_FK1 as [Country Id], sum(goals) as Goals from
(select country_FK1, sum(Goals_1) as goals from Group_Matches 
group by country_FK1
union 
select country_FK2, sum(Goals_2) from Group_Matches 
group by country_FK2
union
select country_1, sum(Goals_1) from Playoff_statistics 
group by country_1
union
select country_2, sum(Goals_2) from Playoff_statistics 
group by country_2) as united
group by united.Country_FK1
order by 2 asc) as ready
where [Country Id] = Countries.id 
go

--4. Наибольшее и наименьшее количество мячей, пропущенных командами (2 команды)
--Max:
select name + ':  ' + convert(nvarchar(4), ready.goals) as [Country with Max missed Goals:] from countries, 
(select top 1 united.Country_FK1 as [Country Id], sum(goals) as Goals from
(select country_FK1, sum(Goals_2) as goals from Group_Matches 
group by country_FK1
union 
select country_FK2, sum(Goals_1) from Group_Matches 
group by country_FK2
union
select country_1, sum(Goals_2) from Playoff_statistics 
group by country_1
union
select country_2, sum(Goals_1) from Playoff_statistics 
group by country_2) as united
group by united.Country_FK1
order by 2 desc) as ready
where [Country Id] = Countries.id 
go

--Min:
select name + ':  ' + convert(nvarchar(4), ready.goals) as [Country with Min missed Goals:] from countries, 
(select top 1 united.Country_FK1 as [Country Id], sum(goals) as Goals from
(select country_FK1, sum(Goals_2) as goals from Group_Matches 
group by country_FK1
union 
select country_FK2, sum(Goals_1) from Group_Matches 
group by country_FK2
union
select country_1, sum(Goals_2) from Playoff_statistics 
group by country_1
union
select country_2, sum(Goals_1) from Playoff_statistics 
group by country_2) as united
group by united.Country_FK1
order by 2 Asc) as ready
where [Country Id] = Countries.id 
go

--5. Суммарная посещаемость всех матчей
select ((select sum(viewers) from Group_Matches) + (select sum(viewers) from Playoff_statistics)) as [Visitors of all matches]
go

--6. Средняя посещаемость одного матча
select (((select sum(viewers) from Group_Matches) + (select sum(viewers) from Playoff_statistics))/ 
(select ((select count(id) from Group_Matches) + (select count(id) from Playoff_statistics)))) as [Avarage visitors of one match]
go

--7. Наибольшее и наименьшее число побед (2 отличившиеся команды)
--max:
select top 1 name as Country, wins from GroupMatches_Results join Countries on countriesId_FK = Countries.id
order by wins desc
--min:
select top 1 name as Country, wins from GroupMatches_Results join Countries on countriesId_FK = Countries.id
order by wins asc

--8. Наибольшее и наименьшее количество поражений (2 команды)
--max:
select top 1 name as Country, losses from GroupMatches_Results join Countries on countriesId_FK = Countries.id
order by wins desc
--min:
select top 1 name as Country, losses from GroupMatches_Results join Countries on countriesId_FK = Countries.id
order by wins asc

--9. Лучшие бомбардиры (игроки, забившие наибольшее количество голов)
select name + ':  ' + convert(nvarchar(4), ready.goals) as [Best Player with most result:] from Players, 
(select top 1 united.player_FK as Player, sum(goals) as Goals from
(select player_FK, count(id) as goals from Group_Matches_Players_statistics 
group by player_FK
union 
select player_FK, count(id) from PlayOff_Matches_Players_statistics 
group by player_FK) as united
group by united.player_FK
order by 2 desc) as ready
where Player = Players.id 

--10. Список команд, занявших призовые места
select 'Champion: ' + name as [Finalists:] from
(select Finalist from PlayOff where Finalist is not null) as finalist_, Countries 
where Countries.id = finalist_.Finalist 
union
select 'Second place: ' + name as [Finalists:] from
(select Final_teams from PlayOff where Final_teams <> (select Finalist from PlayOff where Finalist is not null)) as finalist_, Countries 
where Countries.id = finalist_.Final_teams
union
select 'Third place: ' + name as [Finalists:] from
(select top 1 third.country, third.goals from
(select country_1 as country, goals_1 as goals from Playoff_statistics where Game_part like 'third'
union
select country_2, goals_2 from Playoff_statistics where Game_part like 'third')
as third
order by third.goals desc) as finalist_, Countries 
where Countries.id = finalist_.country
go


