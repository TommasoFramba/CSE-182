CREATE VIEW LastPlaceHorsesView As
    SELECT mt.horseid, mt.racetrackid, mt.racedate, mt.racenum, mt.finishposition FROM
    HorseRaceResults mt INNER JOIN(
        SELECT racetrackid, racedate, racenum, MAX(finishposition) AS finishpos
            FROM HorseRaceResults
            GROUP BY racetrackid, racedate, racenum
        ) t ON mt.racetrackid = t.racetrackid
    AND mt.racedate = t.racedate
    AND mt.racenum = t.racenum
    AND mt.finishposition = t.finishpos;
   

