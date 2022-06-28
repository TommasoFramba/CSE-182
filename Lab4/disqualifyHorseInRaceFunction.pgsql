CREATE OR REPLACE FUNCTION
disqualifyHorseInRaceFunction(horse INTEGER, race INTEGER,
raceD DATE, raceN INTEGER)
RETURNS INTEGER AS $$

    DECLARE horseIn INTEGER;
    DECLARE finishP INTEGER;
    DECLARE res INTEGER;

    BEGIN
        
        SELECT horseID, finishPosition INTO horseIn, finishP
        FROM HorseRaceResults
        WHERE horseID = horse
        AND racetrackID = race
        AND raceDate = raceD
        AND raceN = raceNum;

        IF horseIn IS NULL THEN
            RETURN -1;
            END IF;
        
        IF finishP IS NULL THEN
            RETURN -2;
            END IF; 

        SELECT COUNT(finishPosition) INTO res
        FROM HorseRaceResults
        WHERE horseID != horse
        AND racetrackID = race
        AND raceDate = raceD
        AND raceN = raceNum
        AND finishPosition > finishP;  

        UPDATE HorseRaceResults
        SET finishPosition = finishPosition - 1
        WHERE horseID != horse
        AND racetrackID = race
        AND raceDate = raceD
        AND raceN = raceNum
        AND finishPosition > finishP; 

        UPDATE HorseRaceResults 
        SET finishPosition = NULL
        WHERE horseID = horse
        AND racetrackID = race
        AND raceDate = raceD
        AND raceN = raceNum;

        RETURN res;

    END;

$$ LANGUAGE plpgsql;