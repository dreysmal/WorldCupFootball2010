--Процедура заполнения результатов групповых матчей на основе таблицы Group_Matches
use Championship
go
create proc GroupMatches_Results_SP as
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
go
--drop proc GroupMatches_Results_SP