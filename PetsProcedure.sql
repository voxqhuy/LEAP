-- Stored Procedure Working File

-- Creation SQL
    -- CREATE PROCEDURE dbo.RunPetSimulator @Feed varchar(10)
    -- AS
    -- SELECT @Feed
    -- GO;

-- Retrive List of stored procedures that have been created
    -- SELECT * 
    --  FROM Pets.INFORMATION_SCHEMA.ROUTINES
    -- WHERE ROUTINE_TYPE = 'PROCEDURE'

-- Make changes to the current procedure
ALTER PROCEDURE dbo.RunPetSimulator
    @Pet  VARCHAR(30)
    ,@Action VARCHAR(20)
    ,@Feed VARCHAR(20)

    AS
    
    If left(@Pet,3) = 'New'
    BEGIN
        insert into Pets values (substring(@Pet,8,len(@Pet)-4), 
                                getdate(), 
                                NULL, 1, 1, 04, 
                                cast(substring(@Pet,5,2) as int));
    END

    If @Feed != 'None'
    BEGIN
        Select GoodEnergyValue
            ,BadEnergyValue
        FROM Foods

        Select *
        From PreferredFood

        SELECT EnergyLevel
        From Pets
    END

    SELECT *
    From Pets

    GO;



-- Execute Pocedure (Update this as you alter the procedure above)
    Exec RunPetSimulator 
        @Pet = 'New:01:Sammy'   
                -- [AnimalTypeID]
                -- 'View'
                -- 'New:[AnimalTypeID]:[Name]'
                
                -- Enter the ID of the Pet you wish to interact with
                -- Enter 'View' to see a list of all Pets (@Action and @Feed will be ignored)
                -- For a new pet enter 'New:[AnimalTypeID]:[Name]'
                        -- Animal Types
                        -- 01 -- Cat    
                        -- 02 -- Dog
                        -- 03 -- Horse
                        -- 04 -- Fish
                        -- 05 -- Snake
        
        ,@Action = 
                     'None'
                    -- 'Walk'
                    -- 'Bath'
                    -- 'Cuddle'
                    -- 'Scold'
                    -- 'Praise'
                    -- 'Play'
        
        ,@Feed =
                     'None'
                    -- 'Tuna'
                    -- 'Kitty Kibble'
                    -- 'Puppy Chow'
                    -- 'Hay'
                    -- 'Apple'
                    -- 'Cricket'
                    -- 'Unfortunate Mouse'
                    -- 'Milk'
                    -- 'Turkey'
                    -- 'Flaky Food'

