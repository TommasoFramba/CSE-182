-- CSE 182 Spring 2022 Lab2 create.sql 

-- The following two lines are not needed in your solution
DROP SCHEMA lab2 CASCADE;
CREATE SCHEMA lab2;


-- RacingPersons(personID, personName, registryDate, canBeJockey, canBeTrainer)
CREATE TABLE RacingPersons (
    personID INTEGER,
    personName VARCHAR(30) NOT NULL,
    registryDate DATE,
    canBeJockey BOOLEAN,
    canBeTrainer BOOLEAN,
    PRIMARY KEY (personID)
);


-- Stables(stableID, stableName, address, stableOwnerID)
CREATE TABLE Stables (
    stableID INTEGER,
    stableName VARCHAR(30),
    address VARCHAR(50),
    stableOwnerID INTEGER,
    PRIMARY KEY (stableID),
    FOREIGN KEY (stableOwnerID) REFERENCES RacingPersons(personID)
);


-- Horses(horseID, horseName, horseBreed, birthDate, stableID, trainerID, horseOwnerID)
CREATE TABLE Horses (
    horseID INTEGER,
    horseName VARCHAR(30) UNIQUE,
    horseBreed CHAR(1),
    birthDate DATE,
    stableID INTEGER,
    trainerID INTEGER,
    horseOwnerID INTEGER,
    PRIMARY KEY (horseID),
    FOREIGN KEY (stableID) REFERENCES Stables,
    FOREIGN KEY (trainerID) REFERENCES RacingPersons(personID),
    FOREIGN KEY (horseOwnerID) REFERENCES RacingPersons(personID)
);


-- Racetracks(racetrackID, trackName, address, trackDistance)
CREATE TABLE Racetracks (
    racetrackID INTEGER,
    trackName VARCHAR(30) UNIQUE,
    address VARCHAR(50),
    trackDistance NUMERIC(3,1) NOT NULL,
    PRIMARY KEY (racetrackID)
);


-- Races(racetrackID, raceDate, raceNum, raceStartTime, winningPrize)
CREATE TABLE Races (
    racetrackID INTEGER,
    raceDate DATE,
    raceNum INTEGER,
    raceStartTime TIME,
    winningPrize NUMERIC(7,2) NOT NULL,
    PRIMARY KEY (racetrackID, raceDate, raceNum),
    FOREIGN KEY (racetrackID) REFERENCES Racetracks
);


-- HorseRaceResults(racetrackID, raceDate, raceNum, horseID, jockeyID, finishPosition, raceFinishTime)
CREATE TABLE HorseRaceResults (
    racetrackID INTEGER,
    raceDate DATE,
    raceNum INTEGER,
    horseID INTEGER,
    jockeyID INTEGER,
    finishPosition INTEGER,
    raceFinishTime TIME,
    UNIQUE(racetrackID, raceDate, raceNum, finishPosition),
    PRIMARY KEY (racetrackID, raceDate, raceNum, horseID),
    FOREIGN KEY (racetrackID, raceDate, raceNum) REFERENCES Races,
    FOREIGN KEY (horseID) REFERENCES Horses,
    FOREIGN KEY (jockeyID) REFERENCES RacingPersons(personID)
);