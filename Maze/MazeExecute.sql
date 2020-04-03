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