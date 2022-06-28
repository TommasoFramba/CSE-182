-- Query 5

SELECT DISTINCT HorseRaceResults.horseID AS theHorseID, 
Horses.horseName AS theHorseName,
a1.personName AS theOwnerName,
Stables.stableName AS theStableName,
a2.personName AS theStableOwnerName

FROM HorseRaceResults, Horses, Stables, RacingPersons AS a1,
RacingPersons as a2

WHERE HorseRaceResults.finishPosition = 1
AND HorseRaceResults.horseID = Horses.horseID
AND Horses.horseOwnerID = a1.personID
AND Stables.stableOwnerID = a2.personID
AND Horses.stableID = Stables.stableID
ORDER BY HorseRaceResults.horseID ASC;
