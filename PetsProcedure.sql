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
                                NULL, 0, 0, 04, RAND(5), 
                                cast(substring(@Pet,5,2) as int));
    END

    SELECT *
    From Pets

    GO;



-- Execute Pocedure (Update this as you alter the procedure above)
    Exec RunPetSimulator 
        @Pet = 'New:01:Kitty'   -- For a new pet enter 'New:[ID]:[Name]', Else enter the name of the Pet you wish to interact with
        ,@Action = 'Walk'       -- Available actions: View, Walk, Bath, Cuddle, Scold, Praise, Play
        ,@Feed = 'None';        -- Available foods:
                                -- None
                                -- Tuna
                                -- Kitty Kibble
                                -- Puppy Chow
                                -- Hay
                                -- Apple
                                -- Cricket
                                -- Unfortunate Mouse
                                -- Milk
                                -- Turkey
                                -- Flaky Food

