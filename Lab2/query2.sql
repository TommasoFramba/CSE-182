-- Query 2

SELECT DISTINCT RacingPersons.personID, RacingPersons.personName, 
RacingPersons.registryDate
FROM RacingPersons, HorseRaceResults
WHERE 
RacingPersons.canBeJockey = '0'
AND HorseRaceResults.jockeyID = RacingPersons.personID
ORDER BY 
RacingPersons.personName ASC,
RacingPersons.registryDate DESC;