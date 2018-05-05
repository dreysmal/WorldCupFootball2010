use Championship
go
create proc Player_stat as
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