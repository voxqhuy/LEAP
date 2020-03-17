-- Stored Procedure Working File

-- Creation SQL
    CREATE PROCEDURE dbo.RunMazeSimulator @MazeID int, @Action varchar(10)
    AS
    SELECT @MazeID, @Action
    GO;

-- Retrive List of stored procedures that have been created
    -- SELECT * 
    -- FROM Mazes.INFORMATION_SCHEMA.ROUTINES
    -- WHERE ROUTINE_TYPE = 'PROCEDURE'

-- Make changes to the current procedure
ALTER PROCEDURE dbo.RunMazeSimulator
    @MazeID  INT
    ,@Action VARCHAR(10)
    AS
    
    declare @doorToMaze int, @leftMazeID int, @rightMazeID int;

    BEGIN
        SELECT 
            @doorToMaze = DoorMazeID,
            @leftMazeID = LeftMazeID,
            @rightMazeID = RightMazeID
        FROM 
            Mazes
        WHERE 
            MazeID = @MazeID;
    END

    declare @enemyCount int;

    IF @Action = 'left'
    BEGIN
        IF @leftMazeID is NULL
            PRINT "Invalid move" -- TODO
        ELSE 
            SELECT
                @enemyCount = EnemyCount
            FROM
                Mazes
            WHERE
                MazeID = @leftMazeID;

            UPDATE 
                MazeProgress
            SET 
                CurrentMazeID = @leftMazeID, 
                KillCount = KillCount + @enemyCount,
                StepCount = StepCount + 1
            WHERE 
                ProgressID = 1;
    END

    IF @Action = 'right'
    BEGIN
        IF @rightMazeID = -1
            PRINT "Invalid move" -- TODO
        ELSE 
            SELECT
                @enemyCount = EnemyCount
            FROM
                Mazes
            WHERE
                MazeID = @rightMazeID;

            UPDATE 
                MazeProgress
            SET 
                CurrentMazeID = @rightMazeID, 
                KillCount = KillCount + @enemyCount,
                StepCount = StepCount + 1
            WHERE 
                ProgressID = 1;
    END

    IF @Action = 'forward' -- is NULL
    BEGIN
        IF @doorToMaze = -1
            PRINT "Invalid move" -- TODO
        ELSE 
            SELECT
                @enemyCount = EnemyCount
            FROM
                Mazes
            WHERE
                MazeID = @doorToMaze;

            UPDATE 
                MazeProgress
            SET 
                CurrentMazeID = @doorToMaze, 
                KillCount = KillCount + @enemyCount,
                StepCount = StepCount + 1
            WHERE 
                ProgressID = 1;
    END

    IF @Action = 'restart'
    BEGIN
        UPDATE 
            MazeProgress
        SET 
            CurrentMazeID = 5, 
            KillCount = 0,
            StepCount = 0
        WHERE 
            ProgressID = 1;
    END
    
    Select c.Description
        ,mp.KillCount
    From MazeProgress mp
        Left join Mazes m on mp.CurrentMazeID = m.MazeID
        Left join Components c on c.ComponentID = m.ComponentID



    GO;



-- Execute Pocedure (Update this as you alter the procedure above)
    Exec RunMazeSimulator 
        @MazeID = 5
        ,@Action = 'Right';