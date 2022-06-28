SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRANSACTION;

    UPDATE RacingPersons r 
    SET personName = c.personName,
    registryDate = c.registryDate,
    canBeTrainer = TRUE 
    FROM ChangeRacingPersons c
    WHERE r.personID = c.personID;

    INSERT INTO RacingPersons (personID, personName, registryDate, 
            canBeJockey, canBeTrainer)
            SELECT c.personID, c.personName, c.registryDate, TRUE, TRUE
            FROM ChangeRacingPersons c
            WHERE c.personID NOT IN (SELECT personID FROM RacingPersons);

COMMIT TRANSACTION;



