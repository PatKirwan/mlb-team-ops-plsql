-- Block 2: Player Statistics Summary
-- Techniques: Cursor, IF-THEN-ELSE
--
-- Show total hits and RBIs for each player with a simple performance rating.

-- Requires 01_schema.sql and 02_sample_data.sql to have been run first.

set serveroutput on

DECLARE
CURSOR player_cursor IS
SELECT p.player_name, SUM(pgs.hits) AS total_hits, 
SUM(pgs.runs_batted_in) AS total_rbi
FROM player p
JOIN player_game_stats pgs ON p.player_id = pgs.player_id
GROUP BY p.player_name
ORDER BY total_hits DESC;
rating VARCHAR2(20);
BEGIN
DBMS_OUTPUT.PUT_LINE('Player Statistics Summary');
DBMS_OUTPUT.PUT_LINE('===============================================');
FOR rec IN player_cursor LOOP
IF rec.total_hits >= 3 THEN
rating := 'Excellent';
ELSIF rec.total_hits >= 2 THEN
rating := 'Good';
ELSE
rating := 'Average';
END IF;
DBMS_OUTPUT.PUT_LINE('Player: ' || rec.player_name);
DBMS_OUTPUT.PUT_LINE('Total Hits: ' || rec.total_hits);
DBMS_OUTPUT.PUT_LINE('Total RBI: ' || rec.total_rbi);
DBMS_OUTPUT.PUT_LINE('Rating: ' || rating);
DBMS_OUTPUT.PUT_LINE('- - - - - - - - - - - - - - - - - - - - - - - -');
END LOOP;
END;
/
