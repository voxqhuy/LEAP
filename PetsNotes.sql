
--Table Creation Files: Complete
--Data inserts: Complete
--Stored Procedure is created and now must be edited


--Triggers to add:
--  Sleep cycles
--  Lonleyness
--  Age
--  Hunger
Declare @Pet as VARCHAR(30) = 'New:Petsadfkjlkjlk';
Select substring(@Pet,5,len(@Pet)-4)

drop table Pets;