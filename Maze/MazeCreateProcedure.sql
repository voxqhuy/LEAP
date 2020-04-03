--Create the stored proceudre for Maze Simulator

Create PROCEDURE dbo.RunMazeSimulator
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
