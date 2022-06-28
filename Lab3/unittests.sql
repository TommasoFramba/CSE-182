-- Violates stablefk
INSERT INTO Horses (horseID, stableID) VALUES (69,69);

-- Violates trainerFK
INSERT INTO Horses (horseID, trainerID) VALUES (69,69);

-- Violates horseOwnerFK
INSERT INTO Horses (horseID, horseOwnerID) VALUES (69,69);

-- Meets positiveTrackDistance
UPDATE RaceTracks r 
    SET trackDistance = 20;

-- Violates positiveTrackDistance
UPDATE RaceTracks r 
    SET trackDistance = -20;

-- Meets notBothOwnerTrainer
UPDATE Horses 
    SET horseOwnerID = 6019;

-- Violates notBothOwnerTrainer
UPDATE Horses 
    SET horseOwnerID = 6005;

-- Meets bigChristmasPrize
UPDATE Races 
    SET winningPrize = 12001;

-- Violates bigChristmasPrize
UPDATE Races 
    SET winningPrize = 11999;
