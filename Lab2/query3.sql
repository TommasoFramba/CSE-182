-- Query 3

SELECT HorseRaceResults.horseID, HorseRaceResults.raceDate, 
HorseRaceResults.finishPosition,  
(HorseRaceResults.raceFinishTime -Races.raceStartTime ) AS horseRaceInterval
FROM HorseRaceResults, Races
WHERE HorseRaceResults.racetrackID = Races.racetrackID
AND HorseRaceResults.raceDate = Races.raceDate
AND HorseRaceResults.raceNum = Races.raceNum
AND EXTRACT(EPOCH FROM 
(HorseRaceResults.raceFinishTime -Races.raceStartTime ))/60 > 2
AND HorseRaceResults.raceDate < '2021-12-14';
