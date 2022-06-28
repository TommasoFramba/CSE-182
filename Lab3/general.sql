ALTER TABLE RaceTracks ADD CONSTRAINT positiveTrackDistance
CHECK (trackDistance > 0);

ALTER TABLE Horses ADD CONSTRAINT notBothOwnerTrainer
CHECK (trainerID != horseOwnerID);

ALTER TABLE Races ADD CONSTRAINT bigChristmasPrize
CHECK (raceDate != DATE '2021-12-25' OR winningPrize > 12000);
