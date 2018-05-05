use Championship
go
create proc PlayOff_Matches_Players_statistics_SP as
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