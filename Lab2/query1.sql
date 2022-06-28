-- Query 1

SELECT Horses.horseOwnerID, Horses.horseName, RacingPersons.personName 
FROM Horses, RacingPersons
WHERE 
Horses.horseOwnerID = Horses.trainerID
AND Horses.horseName IS NOT NULL 
AND Horses.horseOwnerID = RacingPersons.personID;