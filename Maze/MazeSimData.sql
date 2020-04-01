--Vales for Pet Simmulator

--Components: ComponentID, Type, Description
insert into Components values (01, 'deadEnd', 'a dead end');
insert into Components values (02, 'room', 'a room with a door to another maze');
insert into Components values (03, 'fork', 'a fork with a maze on the right and a maze on the left');
insert into Components values (04, 'enemy', 'a maze with an enemy');
insert into Components values (05, 'exit', 'an exit');

--Mazes: MazeID, DoorMazeID, LeftMazeID, RightMazeID, ComponentID, EnemyCount
insert into Mazes values (00, 03, NULL, NULL, 02, 0);
insert into Mazes values (01, NULL, NULL, NULL, 04, 1);
insert into Mazes values (02, 07, NULL, NULL, 02, 0);
insert into Mazes values (03, NULL, 04, 02, 03, 0);
insert into Mazes values (04, 05, NULL, NULL, 02, 0);
insert into Mazes values (05, 10, NULL, NULL, 02, 0);
insert into Mazes values (06, 01, NULL, NULL, 02, 0);
insert into Mazes values (07, 12, NULL, NULL, 02, 0);
insert into Mazes values (08, 13, NULL, NULL, 02, 1);
insert into Mazes values (09, 09, NULL, NULL, 02, 0);
insert into Mazes values (10, 15, NULL, NULL, 02, 0);
insert into Mazes values (11, 06, NULL, NULL, 02, 0);
insert into Mazes values (12, 11, NULL, NULL, 02, 0);
insert into Mazes values (13, NULL, NULL, NULL, 05, 0);
insert into Mazes values (14, 09, NULL, NULL, 02, 0);
insert into Mazes values (15, 14, NULL, NULL, 02, 1);

--MazeProgress: ProgressID, StepCount, KillCount, CurrentMazeID
insert into MazeProgress values (01, 0, 0, 00);

select * from Components;
select * from Mazes;
select * from MazeProgress;