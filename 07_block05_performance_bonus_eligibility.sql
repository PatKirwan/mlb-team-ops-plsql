-- Block 5: Performance Bonus Eligibility
-- Techniques: Cursor, Complex IF-THEN-ELSE, Calculations
--
-- Determine which players qualify for performance bonuses based on their
-- stats. Players with 10+ total bases (hits + RBIs) get a $5000 bonus, 15+ get
-- $10000.

-- Requires 01_schema.sql and 02_sample_data.sql to have been run first.

set serveroutput on

DECLARE
CURSOR player_cursor IS
SELECT p.player_id, p.player_name,
SUM(pgs.hits) AS total_hits,
SUM(pgs.runs_batted_in) AS total_rbi
FROM player p
JOIN player_game_stats pgs ON p.player_id = pgs.player_id
GROUP BY p.player_id, p.player_name;
total_bases NUMBER;
bonus NUMBER;
total_bonus NUMBER := 0;
BEGIN
DBMS_OUTPUT.PUT_LINE('Performance Bonus Report');
DBMS_OUTPUT.PUT_LINE('===============================================');
FOR rec IN player_cursor LOOP
total_bases := rec.total_hits + rec.total_rbi;
IF total_bases >= 15 THEN
bonus := 10000;
ELSIF total_bases >= 10 THEN
bonus := 5000;
ELSE
bonus := 0;
END IF;
IF bonus > 0 THEN
total_bonus := total_bonus + bonus;
DBMS_OUTPUT.PUT_LINE('Player: ' || rec.player_name);
DBMS_OUTPUT.PUT_LINE('Total Hits: ' || rec.total_hits);
DBMS_OUTPUT.PUT_LINE('Total RBI: ' || rec.total_rbi);
DBMS_OUTPUT.PUT_LINE('Total Bases: ' || total_bases);
DBMS_OUTPUT.PUT_LINE('Bonus: $' || TO_CHAR(bonus, '99,999'));
DBMS_OUTPUT.PUT_LINE('- - - - - - - - - - - - - - - - - - - - - - - -');
END IF;
END LOOP;
DBMS_OUTPUT.PUT_LINE('===============================================');
DBMS_OUTPUT.PUT_LINE('Total Bonuses: $' || TO_CHAR(total_bonus, '999,999'));
END;
/
