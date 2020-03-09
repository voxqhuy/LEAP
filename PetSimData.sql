--Vales for Pet Simmulator

--Actions: ID, Name, Description, AffectionValue, EnergyValue
insert into Actions values (01,'Walk','Take your friend for a lovely walk in the park',5,-4);
insert into Actions values (02,'Bath','Your animal pall is looking grimy, this bath should help',-5,2);
insert into Actions values (03,'Cuddle','You and you spirit animal cozy up',-5,2);
insert into Actions values (04,'Scold','You scold your pet, they question the meaning of life',-10,-2);
insert into Actions values (05,'Praise','You praise your pet, they are elated',10,2);
insert into Actions values (06,'Play','Fun is everything',15,-4);

--Animals: ID, Name, AverageLifespandays
insert into Animals values (01, 'Cat', 6);
insert into Animals values (02, 'Dog', 5);
insert into Animals values (03, 'Fish', 2);
insert into Animals values (04, 'Horse', 10);
insert into Animals values (05, 'Snake', 4);

--Foods: ID, Name, GoodEnergyValue, BadEnergyValue
insert into Foods values (01, 'Tuna', 10, 5);
insert into Foods values (02, 'Kitty Kibble', 8, 2);
insert into Foods values (03, 'Puppy Chow', 9, 3);
insert into Foods values (04, 'Hay', 12, 3);
insert into Foods values (05, 'Apple', 6, 5);
insert into Foods values (06, 'Cricket', 5, 2);
insert into Foods values (07, 'Unfortunate Mouse', 10, 5);
insert into Foods values (08, 'Milk', 4, 1);
insert into Foods values (09, 'Turkey', 10, 4);
insert into Foods values (10, 'Flaky Food', 4, 1);

--PreferredFood: AnimalID, FoodID
insert into PreferredFood values (01,01);
insert into PreferredFood values (01,02);
insert into PreferredFood values (01,08);
insert into PreferredFood values (02,08);
insert into PreferredFood values (02,03);
insert into PreferredFood values (02,09);
insert into PreferredFood values (03,10);
insert into PreferredFood values (03,01);
insert into PreferredFood values (04,04);
insert into PreferredFood values (04,05);
insert into PreferredFood values (05,06);
insert into PreferredFood values (05,07);

--Personalities: ID, Name
insert into Personalities values (01,'Moody');
insert into Personalities values (02,'Loyal');
insert into Personalities values (03,'Mischievous');
insert into Personalities values (04,'Playful');
insert into Personalities values (05,'Chill');


--States: ID, Description
insert into States values (01,'Starving');
insert into States values (02,'Lonley');
insert into States values (03,'Restless');
insert into States values (04,'Satisfied');
insert into States values (05,'Hungry');
insert into States values (06,'Tooooooo FUll');
insert into States values (07,'Sad');
insert into States values (08,'Happy');
insert into States values (09,'Ready to be left alone!!!');

--Pets: Created by stored procedure only
--insert into Pets values ();

