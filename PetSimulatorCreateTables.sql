-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-03-09 01:30:43.356

-- tables
-- Table: Actions
CREATE TABLE Actions (
    ActionID int  NOT NULL,
    Name varchar(20)  NOT NULL,
    Description varchar(100)  NOT NULL,
    AffectionValue int  NOT NULL,
    EnergyValue int  NOT NULL,
    CONSTRAINT Actions_pk PRIMARY KEY  (ActionID)
);

-- Table: Animals
CREATE TABLE Animals (
    AnimalID int  NOT NULL,
    Name varchar(20)  NOT NULL,
    AverageLifespanDays int  NOT NULL,
    CONSTRAINT Animals_pk PRIMARY KEY  (AnimalID)
);

-- Table: Foods
CREATE TABLE Foods (
    FoodID int  NOT NULL,
    Name varchar(20)  NOT NULL,
    GoodEnergyValue int  NOT NULL,
    BadEnergyValue int  NOT NULL,
    CONSTRAINT Foods_pk PRIMARY KEY  (FoodID)
);

-- Table: Personalities
CREATE TABLE Personalities (
    PerID int  NOT NULL,
    Name varchar(50)  NOT NULL,
    CONSTRAINT Personalities_pk PRIMARY KEY  (PerID)
);

-- Table: Pets
CREATE TABLE Pets (
    PetID int  NOT NULL Identity,
    Name varchar(30)  NOT NULL,
    DateTimeCreated datetime  NOT NULL,
    DateTimeDeath datetime,
    EnergyLevel int  NOT NULL,
    AffectionLevel int  NOT NULL,
    StateID int  NOT NULL,
    PerID int  NOT NULL,
    AnimalID int  NOT NULL,
    CONSTRAINT Pets_pk PRIMARY KEY  (PetID)
);

-- Table: PreferredFood
CREATE TABLE PreferredFood (
    AnimalID int  NOT NULL,
    FoodID int  NOT NULL,
    CONSTRAINT PreferredFood_pk PRIMARY KEY  (AnimalID,FoodID)
);

-- Table: States
CREATE TABLE States (
    StateID int  NOT NULL,
    Description varchar(100)  NOT NULL,
    CONSTRAINT States_pk PRIMARY KEY  (StateID)
);

-- foreign keys
-- Reference: Pets_Animals (table: Pets)
ALTER TABLE Pets ADD CONSTRAINT Pets_Animals
    FOREIGN KEY (AnimalID)
    REFERENCES Animals (AnimalID);

-- Reference: Pets_Personalities (table: Pets)
ALTER TABLE Pets ADD CONSTRAINT Pets_Personalities
    FOREIGN KEY (PerID)
    REFERENCES Personalities (PerID);

-- Reference: Pets_States (table: Pets)
ALTER TABLE Pets ADD CONSTRAINT Pets_States
    FOREIGN KEY (StateID)
    REFERENCES States (StateID);

-- Reference: PreferredFood_Animals (table: PreferredFood)
ALTER TABLE PreferredFood ADD CONSTRAINT PreferredFood_Animals
    FOREIGN KEY (AnimalID)
    REFERENCES Animals (AnimalID);

-- Reference: PreferredFood_Foods (table: PreferredFood)
ALTER TABLE PreferredFood ADD CONSTRAINT PreferredFood_Foods
    FOREIGN KEY (FoodID)
    REFERENCES Foods (FoodID);

-- End of file.

