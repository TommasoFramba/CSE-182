SELECT v.horseID, h.horseName, count(v.horseID) AS lastCount, MAX(v.finishPosition) AS maxLastPlaceFinish
FROM Horses h, LastPlaceHorsesView v
WHERE h.horseid = v.horseid
GROUP BY v.horseID, h.horseName
HAVING MAX(v.finishPosition) >= 3;

-- Output from query above 
--  horseid |     horsename     | lastcount | maxlastplacefinish
-- ---------+-------------------+-----------+--------------------
--      530 | Easy Rider        |         1 |                  5
--      550 | Tiz the Law       |         2 |                  3
--      551 |                   |         4 |                  5
--      555 | Essential Quality |         4 |                  7
--      575 |                   |         2 |                  3

DELETE FROM HorseRaceResults WHERE
racetrackID = 3008 AND
raceDate = DATE '2022-02-26' AND 
raceNum = 2 AND
horseID = 555;

DELETE FROM HorseRaceResults WHERE
racetrackID = 3001 AND
raceDate = DATE '2021-08-11' AND 
raceNum = 1 AND
horseID = 551;

SELECT v.horseID, h.horseName, count(v.horseID) AS lastCount, MAX(v.finishPosition) AS maxLastPlaceFinish
FROM Horses h, LastPlaceHorsesView v
WHERE h.horseid = v.horseid
GROUP BY v.horseID, h.horseName
HAVING MAX(v.finishPosition) >= 3;

-- Output from query above after deletes
--  horseid |     horsename     | lastcount | maxlastplacefinish
-- ---------+-------------------+-----------+--------------------
--      530 | Easy Rider        |         1 |                  5
--      550 | Tiz the Law       |         2 |                  3
--      553 | Night Rider       |         1 |                  6
--      555 | Essential Quality |         3 |                  5
--      575 |                   |         2 |                  3
--      589 |                   |         2 |                  4