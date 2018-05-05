use Championship
go
create proc Goals_generate 
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
