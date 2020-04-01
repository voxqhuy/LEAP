-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-03-17 02:13:56.383

-- tables
-- Table: Components
CREATE TABLE Components (
    ComponentID int  NOT NULL,
    Type varchar(10)  NOT NULL,
    Description varchar(100)  NOT NULL,
    CONSTRAINT Components_pk PRIMARY KEY  (ComponentID)
);

-- Table: MazeProgress
CREATE TABLE MazeProgress (
    ProgressID int  NOT NULL,
    StepCount int  NOT NULL,
    KillCount int  NOT NULL,
    CurrentMazeID int  NOT NULL,
    CONSTRAINT MazeProgress_pk PRIMARY KEY  (ProgressID)
);

-- Table: Mazes
CREATE TABLE Mazes (
    MazeID int  NOT NULL,
    DoorMazeID int  NULL,
    LeftMazeID int  NULL,
    RightMazeID int  NULL,
    ComponentID int  NOT NULL,
    EnemyCount int  NOT NULL,
    CONSTRAINT MazeID PRIMARY KEY  (MazeID)
);

-- foreign keys
-- Reference: MazeProgress_Mazes (table: MazeProgress)
ALTER TABLE MazeProgress ADD CONSTRAINT MazeProgress_Mazes
    FOREIGN KEY (CurrentMazeID)
    REFERENCES Mazes (MazeID);

-- Reference: Mazes_Components (table: Mazes)
ALTER TABLE Mazes ADD CONSTRAINT Mazes_Components
    FOREIGN KEY (ComponentID)
    REFERENCES Components (ComponentID);

-- End of file.
