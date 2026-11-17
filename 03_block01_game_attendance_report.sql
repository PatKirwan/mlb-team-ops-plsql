-- Block 1: Game Attendance Report
-- Techniques: Cursor FOR LOOP, Calculations
--
-- Display each game with its attendance and calculate what percentage of
-- stadium capacity was filled.

-- Requires 01_schema.sql and 02_sample_data.sql to have been run first.

set serveroutput on

DECLARE
CURSOR game_cursor IS
SELECT g.game_id, g.game_date, g.attendance, s.stadium_name, s.capacity
FROM game g
JOIN stadium s ON g.stadium_id = s.stadium_id
ORDER BY g.game_date;
pct NUMBER;
BEGIN
DBMS_OUTPUT.PUT_LINE('Game Attendance Report');
DBMS_OUTPUT.PUT_LINE('===============================================');
FOR rec IN game_cursor LOOP
pct := ROUND((rec.attendance / rec.capacity) * 100, 1);
DBMS_OUTPUT.PUT_LINE('Game ID: ' || rec.game_id);
DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(rec.game_date, 'MM/DD/YYYY'));
DBMS_OUTPUT.PUT_LINE('Stadium: ' || rec.stadium_name);
DBMS_OUTPUT.PUT_LINE('Attendance: ' || rec.attendance || ' / ' || rec.capacity);
DBMS_OUTPUT.PUT_LINE('Capacity: ' || pct || '%');
DBMS_OUTPUT.PUT_LINE('- - - - - - - - - - - - - - - - - - - - - - - -');
END LOOP;
END;
/
