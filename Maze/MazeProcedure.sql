-- Stored Procedure Working File

-- Creation SQL
-- CREATE PROCEDURE dbo.RunMazeSimulator @MazeID int, @Action varchar(10)
-- AS
-- SELECT @MazeID, @Action
-- GO;

-- Retrive List of stored procedures that have been created
    -- SELECT * 
    -- FROM INFORMATION_SCHEMA.ROUTINES
    -- WHERE ROUTINE_TYPE = 'PROCEDURE'

-- Make changes to the current procedure
ALTER PROCEDURE dbo.RunMazeSimulator
@MazeID  INT
,@Action VARCHAR(10)
AS

declare @doorMazeID int, @leftMazeID int, @rightMazeID int;

BEGIN
    SELECT 
        @doorMazeID = DoorMazeID,
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
    BEGIN
        Select 'Invalid move : Game Over' -- TODO
    END
    ELSE 
    BEGIN
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
END

IF @Action = 'right'
BEGIN
    IF @rightMazeID is NULL
    BEGIN
        Select 'Invalid move : Game Over' -- TODO
    END
    ELSE 
    BEGIN
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
END

IF @Action = 'openDoor' -- is NULL
BEGIN
    IF @doorMazeID is NULL
    Begin
        Select 'Invalid move : Game Over' -- TODO
    End
    ELSE 
    Begin
        SELECT
            @enemyCount = EnemyCount
        FROM
            Mazes
        WHERE
            MazeID = @doorMazeID;

        UPDATE 
            MazeProgress
        SET 
            CurrentMazeID = @doorMazeID, 
            KillCount = KillCount + @enemyCount,
            StepCount = StepCount + 1
        WHERE 
            ProgressID = 1;
    End
END

IF @Action = 'restart'
BEGIN
    UPDATE 
        MazeProgress
    SET 
        CurrentMazeID = 2, 
        KillCount = 0,
        StepCount = 0
    WHERE 
        ProgressID = 1;
END

SELECT c.Description
    ,mp.KillCount
FROM MazeProgress mp
    Left join Mazes m on mp.CurrentMazeID = m.MazeID
    Left join Components c on c.ComponentID = m.ComponentID


-- Execute Pocedure (Update this as you alter the procedure above)
-- 1ST PLAY - easier
Exec RunMazeSimulator 
@MazeID = 3
,@Action = 'left';

Exec RunMazeSimulator 
@MazeID = 4
,@Action = 'openDoor';

Exec RunMazeSimulator 
@MazeID = 5
,@Action = 'openDoor';

Exec RunMazeSimulator 
@MazeID = 10
,@Action = 'openDoor';

Exec RunMazeSimulator 
@MazeID = 15
,@Action = 'openDoor';

Exec RunMazeSimulator 
@MazeID = 14
,@Action = 'openDoor';

Exec RunMazeSimulator 
@MazeID = 9
,@Action = 'openDoor';

Exec RunMazeSimulator 
@MazeID = 8
,@Action = 'openDoor';

Exec RunMazeSimulator 
@MazeID = 13
,@Action = 'openDoor';


-- RESTART
Exec RunMazeSimulator 
@MazeID = 0
,@Action = 'restart';


-- 2ND PLAY - LOSE
Exec RunMazeSimulator 
@MazeID = 3
,@Action = 'right';

Exec RunMazeSimulator 
@MazeID = 2
,@Action = 'openDoor';

Exec RunMazeSimulator 
@MazeID = 7
,@Action = 'openDoor';

Exec RunMazeSimulator 
@MazeID = 12
,@Action = 'openDoor';

Exec RunMazeSimulator 
@MazeID = 11
,@Action = 'openDoor';

Exec RunMazeSimulator 
@MazeID = 6
,@Action = 'openDoor';

Exec RunMazeSimulator 
@MazeID = 1
,@Action = 'openDoor';