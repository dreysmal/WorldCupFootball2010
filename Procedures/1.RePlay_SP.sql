use Championship
go
create proc RePlay as
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
go

--drop proc RePlay
--drop table #goals 
