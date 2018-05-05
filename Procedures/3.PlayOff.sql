use Championship
go
create proc Play_off_matches as
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
go
--drop proc Play_off_matches
--exec Play_off_matches
