--Testing
--WARNING, will remove all existing data in the Table Pets

TRUNCATE TABLE Pets;

Declare 
    @Expected varchar(20), @Actual varchar(20) 
    ,@ExpectedAnimal varchar(20), @ActualAnimal varchar(20)
    ,@ExpectedName varchar(20), @ActualName varchar(20)
    ,@ExpectedEnergy varchar(20), @ActualEnergy varchar(20)
    ,@ExpectedAffection varchar(20), @ActualAffection varchar(20)
    ,@ExpectedState varchar(20), @ActualState varchar(20)
    ,@ExpectedDeath varchar(20), @ActualDeath varchar(20)

--Test Pet Creation Of Each of the 5 Animal Type
    --Will not test View functionallity becasue it doesn't make actual changes to DB
    --Test Animal Type 1
        TRUNCATE TABLE Pets;
        EXEC RunPetSimulator
                        @Pet = 'New:01:Amber'
                        ,@Action = 'None'
                        ,@Feed = 'None'

        Set @ExpectedName = 'Amber' 
        Set @ActualName = (Select Name From Pets Where PetID = 1)

        Set @ExpectedAnimal = 1 
        Set @ActualAnimal = (Select AnimalID From Pets Where PetID = 1)

        Set @ExpectedAffection = 1
        Set @ActualAffection = (Select AffectionLevel From Pets Where PetID = 1)

        Set @ExpectedEnergy = 1
        Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 1)

        If (@ExpectedName = @ActualName 
            and @ExpectedAnimal = @ActualAnimal 
            and @ExpectedAffection = @ActualAffection
            and @ExpectedEnergy = @ActualEnergy)
        BEGIN
            Print 'Test Pet Creation 1 : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test Pet Creation 1 : FAILED'
        END

    --Test Animal Type 2
        TRUNCATE TABLE Pets;
        EXEC RunPetSimulator
                        @Pet = 'New:02:Amber'
                        ,@Action = 'None'
                        ,@Feed = 'None'

        Set @ExpectedName = 'Amber' 
        Set @ActualName = (Select Name From Pets Where PetID = 1)

        Set @ExpectedAnimal = 2 
        Set @ActualAnimal = (Select AnimalID From Pets Where PetID = 1)

        Set @ExpectedAffection = 1
        Set @ActualAffection = (Select AffectionLevel From Pets Where PetID = 1)

        Set @ExpectedEnergy = 1
        Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 1)

        If (@ExpectedName = @ActualName 
            and @ExpectedAnimal = @ActualAnimal 
            and @ExpectedAffection = @ActualAffection
            and @ExpectedEnergy = @ActualEnergy)
        BEGIN
            Print 'Test Pet Creation 2 : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test Pet Creation 2 : FAILED'
        END

    --Test Animal Type 3
        TRUNCATE TABLE Pets;
        EXEC RunPetSimulator
                        @Pet = 'New:03:Amber'
                        ,@Action = 'None'
                        ,@Feed = 'None'

        Set @ExpectedName = 'Amber' 
        Set @ActualName = (Select Name From Pets Where PetID = 1)

        Set @ExpectedAnimal = 3 
        Set @ActualAnimal = (Select AnimalID From Pets Where PetID = 1)

        Set @ExpectedAffection = 1
        Set @ActualAffection = (Select AffectionLevel From Pets Where PetID = 1)

        Set @ExpectedEnergy = 1
        Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 1)

        If (@ExpectedName = @ActualName 
            and @ExpectedAnimal = @ActualAnimal 
            and @ExpectedAffection = @ActualAffection
            and @ExpectedEnergy = @ActualEnergy)
        BEGIN
            Print 'Test Pet Creation 3 : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test Pet Creation 3 : FAILED'
        END

    --Test Animal Type 4
        TRUNCATE TABLE Pets;
        EXEC RunPetSimulator
                        @Pet = 'New:04:Amber'
                        ,@Action = 'None'
                        ,@Feed = 'None'

        Set @ExpectedName = 'Amber' 
        Set @ActualName = (Select Name From Pets Where PetID = 1)

        Set @ExpectedAnimal = 4 
        Set @ActualAnimal = (Select AnimalID From Pets Where PetID = 1)

        Set @ExpectedAffection = 1
        Set @ActualAffection = (Select AffectionLevel From Pets Where PetID = 1)

        Set @ExpectedEnergy = 1
        Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 1)

        If (@ExpectedName = @ActualName 
            and @ExpectedAnimal = @ActualAnimal 
            and @ExpectedAffection = @ActualAffection
            and @ExpectedEnergy = @ActualEnergy)
        BEGIN
            Print 'Test Pet Creation 4 : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test Pet Creation 4 : FAILED'
        END

    --Test Animal Type 5
        TRUNCATE TABLE Pets;
        EXEC RunPetSimulator
                        @Pet = 'New:05:Amber'
                        ,@Action = 'None'
                        ,@Feed = 'None'

        Set @ExpectedName = 'Amber' 
        Set @ActualName = (Select Name From Pets Where PetID = 1)

        Set @ExpectedAnimal = 5 
        Set @ActualAnimal = (Select AnimalID From Pets Where PetID = 1)

        Set @ExpectedAffection = 1
        Set @ActualAffection = (Select AffectionLevel From Pets Where PetID = 1)

        Set @ExpectedEnergy = 1
        Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 1)

        If (@ExpectedName = @ActualName 
            and @ExpectedAnimal = @ActualAnimal 
            and @ExpectedAffection = @ActualAffection
            and @ExpectedEnergy = @ActualEnergy)
        BEGIN
            Print 'Test Pet Creation 5 : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test Pet Creation 5 : FAILED'
        END


--Test Bad Entry for Each stored procedure variable
    --Test Bad Entry Pet  -- Expected to Fail
        Begin Try
        TRUNCATE TABLE Pets;
            EXEC RunPetSimulator
                        @Pet = 'ew:03:Amber'
                        ,@Action = 'None'
                        ,@Feed = 'None'
        Print 'Test Improper Pet Entry Failed : FAILED'
        End Try
        Begin CATCH
            Print 'Test Improper Pet Entry Failed : PASSED'
        End Catch

    --Populating table for next 2 tests
        EXEC RunPetSimulator
                        @Pet = 'New:05:Amber'
                        ,@Action = 'None'
                        ,@Feed = 'None'

    --Test Bad Entry Action  -- Expected to Fail
        Begin Try
            EXEC RunPetSimulator
                        @Pet = '1'
                        ,@Action = 'Nonsae'
                        ,@Feed = 'None'
            Print 'Test Improper Action Entry Failed : FAILED'
        End Try
        Begin CATCH
            Print 'Test Improper Action Entry Failed : PASSED'
        End Catch

    --Test Bad Entry Feed  -- Expected to Fail
        Begin Try
            EXEC RunPetSimulator
                        @Pet = '1'
                        ,@Action = 'None'
                        ,@Feed = 'Noasaane'
            Print 'Test Improper Feed Entry Failed : FAILED'
        End Try
        Begin CATCH
            Print 'Test Improper Feed Entry Failed : PASSED'
        End Catch

    --Clearing Table
        TRUNCATE TABLE Pets;


--Test Feed Effects
    --Populate Pets Table
        Select * From Pets
        -- Name, null, null,0,0,1, AnimalID
        insert into Pets values ('Bad1',GETDATE(), null,0,0,1,04)
        insert into Pets values ('Good1',GETDATE(), null,0,0,1,01)
        insert into Pets values ('Bad2',GETDATE(), null,0,0,1,02)
        insert into Pets values ('Good2',GETDATE(), null,0,0,1,01)
        insert into Pets values ('Bad3',GETDATE(), null,0,0,1,01)
        insert into Pets values ('Good3',GETDATE(), null,0,0,1,02)
        insert into Pets values ('Bad4',GETDATE(), null,0,0,1,02)
        insert into Pets values ('Good4',GETDATE(), null,0,0,1,04)
        insert into Pets values ('Bad5',GETDATE(), null,0,0,1,02)
        insert into Pets values ('Good5',GETDATE(), null,0,0,1,04)
        insert into Pets values ('Bad6',GETDATE(), null,0,0,1,02)
        insert into Pets values ('Good6',GETDATE(), null,0,0,1,05)
        insert into Pets values ('Bad7',GETDATE(), null,0,0,1,02)
        insert into Pets values ('Good7',GETDATE(), null,0,0,1,05)
        insert into Pets values ('Bad8',GETDATE(), null,0,0,1,05)
        insert into Pets values ('Good8',GETDATE(), null,0,0,1,01)
        insert into Pets values ('Bad9',GETDATE(), null,0,0,1,01)
        insert into Pets values ('Good9',GETDATE(), null,0,0,1,02)
        insert into Pets values ('Bad10',GETDATE(), null,0,0,1,02)
        insert into Pets values ('Good10',GETDATE(), null,0,0,1,03)
    -- 'None'
            EXEC RunPetSimulator
                        @Pet = '1'
                        ,@Action = 'None'
                        ,@Feed = 'None'
            Set @ExpectedEnergy = 0
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 1)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy None : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy None : FAILED'
            END
    -- 'Tuna'
        --Bad
            EXEC RunPetSimulator
                        @Pet = '1'
                        ,@Action = 'None'
                        ,@Feed = 'Tuna'
            Set @ExpectedEnergy = 5
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 1)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Bad Tuna : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Bad Tuna  : FAILED'
            END
        --Good
            EXEC RunPetSimulator
                        @Pet = '2'
                        ,@Action = 'None'
                        ,@Feed = 'Tuna'
            Set @ExpectedEnergy = 10
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 2)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Good Tuna : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Good Tuna  : FAILED'
            END
    -- 'Kitty Kibble'
        --Bad
            EXEC RunPetSimulator
                        @Pet = '3'
                        ,@Action = 'None'
                        ,@Feed = 'Kitty Kibble'
            Set @ExpectedEnergy = 2
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 3)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Bad Kitty Kibble : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Bad Kitty Kibble  : FAILED'
            END
        --Good
            EXEC RunPetSimulator
                        @Pet = '4'
                        ,@Action = 'None'
                        ,@Feed = 'Kitty Kibble'
            Set @ExpectedEnergy = 8
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 4)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Good Kitty Kibble : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Good Kitty Kibble  : FAILED'
            END
    -- 'Puppy Chow'
            EXEC RunPetSimulator
                        @Pet = '5'
                        ,@Action = 'None'
                        ,@Feed = 'Puppy Chow'
            Set @ExpectedEnergy = 3
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 5)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Bad Puppy Chow : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Bad Puppy Chow  : FAILED'
            END
        --Good
            EXEC RunPetSimulator
                        @Pet = '6'
                        ,@Action = 'None'
                        ,@Feed = 'Puppy Chow'
            Set @ExpectedEnergy = 9
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 6)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Good Puppy Chow : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Good Puppy Chow  : FAILED'
            END
    -- 'Hay'
            EXEC RunPetSimulator
                        @Pet = '7'
                        ,@Action = 'None'
                        ,@Feed = 'Hay'
            Set @ExpectedEnergy = 3
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 7)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Bad Hay : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Bad Hay  : FAILED'
            END
        --Good
            EXEC RunPetSimulator
                        @Pet = '8'
                        ,@Action = 'None'
                        ,@Feed = 'Hay'
            Set @ExpectedEnergy = 12
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 8)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Good Hay : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Good Hay  : FAILED'
            END
    -- 'Apple'
            EXEC RunPetSimulator
                        @Pet = '9'
                        ,@Action = 'None'
                        ,@Feed = 'Apple'
            Set @ExpectedEnergy = 5
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 9)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Bad Apple : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Bad Apple  : FAILED'
            END
        --Good
            EXEC RunPetSimulator
                        @Pet = '10'
                        ,@Action = 'None'
                        ,@Feed = 'Apple'
            Set @ExpectedEnergy = 6
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 10)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Good Apple : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Good Apple  : FAILED'
            END
    -- 'Cricket'
            EXEC RunPetSimulator
                        @Pet = '11'
                        ,@Action = 'None'
                        ,@Feed = 'Cricket'
            Set @ExpectedEnergy = 2
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 11)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Bad Cricket : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Bad Cricket  : FAILED'
            END
        --Good
            EXEC RunPetSimulator
                        @Pet = '12'
                        ,@Action = 'None'
                        ,@Feed = 'Cricket'
            Set @ExpectedEnergy = 5
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 12)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Good Cricket : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Good Cricket  : FAILED'
            END
    -- 'Unfortunate Mouse'
            EXEC RunPetSimulator
                        @Pet = '13'
                        ,@Action = 'None'
                        ,@Feed = 'Unfortunate Mouse'
            Set @ExpectedEnergy = 5
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 13)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Bad Unfortunate Mouse : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Bad Unfortunate Mouse  : FAILED'
            END
        --Good
            EXEC RunPetSimulator
                        @Pet = '14'
                        ,@Action = 'None'
                        ,@Feed = 'Unfortunate Mouse'
            Set @ExpectedEnergy = 10
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 14)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Good Unfortunate Mouse : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Good Unfortunate Mouse  : FAILED'
            END
    -- 'Milk'
            EXEC RunPetSimulator
                        @Pet = '15'
                        ,@Action = 'None'
                        ,@Feed = 'Milk'
            Set @ExpectedEnergy = 1
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 15)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Bad Milk : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Bad Milk  : FAILED'
            END
        --Good
            EXEC RunPetSimulator
                        @Pet = '16'
                        ,@Action = 'None'
                        ,@Feed = 'Milk'
            Set @ExpectedEnergy = 4
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 16)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Good Milk : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Good Milk  : FAILED'
            END
    -- 'Turkey'
            EXEC RunPetSimulator
                        @Pet = '17'
                        ,@Action = 'None'
                        ,@Feed = 'Turkey'
            Set @ExpectedEnergy = 4
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 17)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Bad Turkey : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Bad Turkey  : FAILED'
            END
        --Good
            EXEC RunPetSimulator
                        @Pet = '18'
                        ,@Action = 'None'
                        ,@Feed = 'Turkey'
            Set @ExpectedEnergy = 10
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 18)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Good Turkey : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Good Turkey  : FAILED'
            END
    -- 'Flaky Food'
            EXEC RunPetSimulator
                        @Pet = '19'
                        ,@Action = 'None'
                        ,@Feed = 'Flaky Food'
            Set @ExpectedEnergy = 1
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 19)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Bad Flaky Food : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Bad Flaky Food  : FAILED'
            END
        --Good
            EXEC RunPetSimulator
                        @Pet = '20'
                        ,@Action = 'None'
                        ,@Feed = 'Flaky Food'
            Set @ExpectedEnergy = 4
            Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 20)

            If (@ExpectedEnergy = @ActualEnergy)
            BEGIN
                Print 'Test Energy Good Flaky Food : PASSED'
            END
            ELSE
            BEGIN
                Print 'Test Energy Good Flaky Food  : FAILED'
            END

TRUNCATE TABLE Pets;

--Test Action Effects
    -- Populate Pets Table for testing
        insert into Pets values ('Walk',GETDATE(), null,0,0,1,01)
        insert into Pets values ('Bath',GETDATE(), null,0,0,1,01)
        insert into Pets values ('Cuddle',GETDATE(), null,0,0,1,01)
        insert into Pets values ('Scold',GETDATE(), null,0,0,1,01)
        insert into Pets values ('Praise',GETDATE(), null,0,0,1,01)
        insert into Pets values ('Play',GETDATE(), null,0,0,1,01)

    -- 'None'
        EXEC RunPetSimulator
                        @Pet = '1'
                        ,@Action = 'None'
                        ,@Feed = 'None'
        Set @ExpectedAffection = 0
        Set @ActualAffection = (Select AffectionLevel From Pets Where PetID = 1)

        Set @ExpectedEnergy = 0
        Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 1)
        If (@ExpectedEnergy = @ActualEnergy and @ExpectedAffection = @ActualAffection)
        BEGIN
            Print 'Test Action None : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test Action None : FAILED'
        END

    -- 'Walk'
        EXEC RunPetSimulator
                        @Pet = '1'
                        ,@Action = 'Walk'
                        ,@Feed = 'None'
        Set @ExpectedAffection = 5
        Set @ActualAffection = (Select AffectionLevel From Pets Where PetID = 1)

        Set @ExpectedEnergy = -4
        Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 1)
        If (@ExpectedEnergy = @ActualEnergy and @ExpectedAffection = @ActualAffection)
        BEGIN
            Print 'Test Action Walk : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test Action Walk : FAILED'
        END

    -- 'Bath'
        EXEC RunPetSimulator
                        @Pet = '2'
                        ,@Action = 'Bath'
                        ,@Feed = 'None'
        Set @ExpectedAffection = -4
        Set @ActualAffection = (Select AffectionLevel From Pets Where PetID = 2)

        Set @ExpectedEnergy = 2
        Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 2)
        If (@ExpectedEnergy = @ActualEnergy and @ExpectedAffection = @ActualAffection)
        BEGIN
            Print 'Test Action Bath : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test Action Bath : FAILED'
        END
    -- 'Cuddle'
        EXEC RunPetSimulator
                        @Pet = '3'
                        ,@Action = 'Cuddle'
                        ,@Feed = 'None'
        Set @ExpectedAffection = 5
        Set @ActualAffection = (Select AffectionLevel From Pets Where PetID = 3)

        Set @ExpectedEnergy = 3
        Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 3)
        If (@ExpectedEnergy = @ActualEnergy and @ExpectedAffection = @ActualAffection)
        BEGIN
            Print 'Test Action Cuddle : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test Action Cuddle : FAILED'
        END
    -- 'Scold'
        EXEC RunPetSimulator
                        @Pet = '4'
                        ,@Action = 'Scold'
                        ,@Feed = 'None'
        Set @ExpectedAffection = -10
        Set @ActualAffection = (Select AffectionLevel From Pets Where PetID = 4)

        Set @ExpectedEnergy = -2
        Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 4)
        If (@ExpectedEnergy = @ActualEnergy and @ExpectedAffection = @ActualAffection)
        BEGIN
            Print 'Test Action Scold : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test Action Scold : FAILED'
        END
    -- 'Praise'
        EXEC RunPetSimulator
                        @Pet = '5'
                        ,@Action = 'Praise'
                        ,@Feed = 'None'
        Set @ExpectedAffection = 10
        Set @ActualAffection = (Select AffectionLevel From Pets Where PetID = 5)

        Set @ExpectedEnergy = 2
        Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 5)
        If (@ExpectedEnergy = @ActualEnergy and @ExpectedAffection = @ActualAffection)
        BEGIN
            Print 'Test Action Praise : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test Action Praise : FAILED'
        END
    -- 'Play'
        EXEC RunPetSimulator
                        @Pet = '6'
                        ,@Action = 'Play'
                        ,@Feed = 'None'
        Set @ExpectedAffection = 15
        Set @ActualAffection = (Select AffectionLevel From Pets Where PetID = 6)

        Set @ExpectedEnergy = -4
        Set @ActualEnergy = (Select EnergyLevel From Pets Where PetID = 6)
        If (@ExpectedEnergy = @ActualEnergy and @ExpectedAffection = @ActualAffection)
        BEGIN
            Print 'Test Action Play : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test Action Play : FAILED'
        END

--Test Deaths
    --Populate Pets Table
        TRUNCATE TABLE Pets;
        insert into Pets values ('Death1',GETDATE(), null,0,0,1,01)
        insert into Pets values ('Death2',GETDATE(), null,0,0,1,01)
        insert into Pets values ('Death3',GETDATE(), null,0,0,1,01)

    --Test Death By low affection
        While ( -50 <= (Select AffectionLevel From Pets Where PetID = 1))
        BEGIN 
            EXEC RunPetSimulator
                @Pet = '1'
                ,@Action = 'Scold'
                ,@Feed = 'None'
        End
        Set @ActualDeath = (Select Case When DateTimeDeath is null Then 'Empty' Else 'Dead' End From Pets Where PetID = 1)
        IF (@ActualDeath = 'Dead')
        BEGIN
            Print 'Test Death Low Affection : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test Death Low Affection: FAILED'
        END

    --Test Death By low energy
        While ( -50 <= (Select EnergyLevel From Pets Where PetID = 2))
        BEGIN 
            EXEC RunPetSimulator
                @Pet = '2'
                ,@Action = 'Walk'
                ,@Feed = 'None'
        End
        Set @ActualDeath = (Select Case When DateTimeDeath is null Then 'Empty' Else 'Dead' End From Pets Where PetID = 2)
        IF (@ActualDeath = 'Dead')
        BEGIN
            Print 'Test Death low energy : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test Death low energy : FAILED'
        END

    --Test Death By high energy
        While ( 50 >= (Select EnergyLevel From Pets Where PetID = 3))
        BEGIN 
            EXEC RunPetSimulator
                @Pet = '3'
                ,@Action = 'None'
                ,@Feed = 'Tuna'
        End
        Set @ActualDeath = (Select Case When DateTimeDeath is null Then 'Empty' Else 'Dead' End From Pets Where PetID = 3)
        IF (@ActualDeath = 'Dead')
        BEGIN
            Print 'Test Death high energy : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test Death high energy: FAILED'
        END

--Test State Changes
    --Populate Pets Table
        TRUNCATE TABLE Pets;
        insert into Pets values ('State1',GETDATE(), null,0,0,1,04)
        insert into Pets values ('State2',GETDATE(), null,1,1,1,01)
        insert into Pets values ('State3',GETDATE(), null,1,1,1,01)
        insert into Pets values ('State4',GETDATE(), null,1,1,1,01)
        insert into Pets values ('State5',GETDATE(), null,1,1,1,01)
    --Test State change to 'Living its Best life'
        While ((Select EnergyLevel From Pets Where PetID = 1) < 1 
                or (Select AffectionLevel From Pets Where PetID = 1) < 1)
        BEGIN 
            EXEC RunPetSimulator
                @Pet = '1'
                ,@Action = 'Cuddle'
                ,@Feed = 'None'
        End

        Set @ExpectedState = 1
        Set @ActualState = (Select StateID From Pets Where PetID = 1)

        IF (@ExpectedState = @ActualState)
        BEGIN
            Print 'Test State 1 : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test State 1 : FAILED'
        END
    --Test State change to 'Ready to be left alone!!!'
        While ((Select AffectionLevel From Pets Where PetID = 2) < 50)
        BEGIN 
            EXEC RunPetSimulator
                @Pet = '2'
                ,@Action = 'Praise'
                ,@Feed = 'None'
        End

        Set @ExpectedState = 2
        Set @ActualState = (Select StateID From Pets Where PetID = 2)

        IF (@ExpectedState = @ActualState)
        BEGIN
            Print 'Test State 2 : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test State 2 : FAILED'
        END
    --Test State change to 'Overly Energized'
        While ((Select EnergyLevel From Pets Where PetID = 3) < 40)
        BEGIN 
            EXEC RunPetSimulator
                @Pet = '3'
                ,@Action = 'None'
                ,@Feed = 'Tuna'
        End

        Set @ExpectedState = 3
        Set @ActualState = (Select StateID From Pets Where PetID = 3)

        IF (@ExpectedState = @ActualState)
        BEGIN
            Print 'Test State 3 : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test State 3 : FAILED'
        END
    --Test State change to 'Low Energy'
        While ((Select EnergyLevel From Pets Where PetID = 4) > 0)
        BEGIN 
            EXEC RunPetSimulator
                @Pet = '4'
                ,@Action = 'Walk'
                ,@Feed = 'None'
        End

        Set @ExpectedState = 4
        Set @ActualState = (Select StateID From Pets Where PetID = 4)

        IF (@ExpectedState = @ActualState)
        BEGIN
            Print 'Test State 4 : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test State 4 : FAILED'
        END
    --Test State change to 'The abandonment is getting real'
        While ((Select AffectionLevel From Pets Where PetID = 5) > 0)
        BEGIN 
            EXEC RunPetSimulator
                @Pet = '5'
                ,@Action = 'Scold'
                ,@Feed = 'None'
        End

        Set @ExpectedState = 5
        Set @ActualState = (Select StateID From Pets Where PetID = 5)

        IF (@ExpectedState = @ActualState)
        BEGIN
            Print 'Test State 5 : PASSED'
        END
        ELSE
        BEGIN
            Print 'Test State 5 : FAILED'
        END

    --Clear Test Data from Pets
    TRUNCATE TABLE Pets;
