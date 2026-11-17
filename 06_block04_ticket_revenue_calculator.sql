-- Block 4: Ticket Revenue Calculator
-- Techniques: Function, Cursor, Loops
--
-- Calculate total ticket revenue for each game by multiplying tickets sold
-- times their prices.

-- Requires 01_schema.sql and 02_sample_data.sql to have been run first.

set serveroutput on

CREATE OR REPLACE FUNCTION calc_game_revenue(gid NUMBER)
RETURN NUMBER
IS
total_revenue NUMBER := 0;
BEGIN
SELECT SUM(price)
INTO total_revenue
FROM ticket
WHERE game_id = gid;
RETURN total_revenue;
END;
/

DECLARE
CURSOR game_cursor IS
SELECT game_id, game_date, attendance
FROM game
ORDER BY game_date;
revenue NUMBER;
total_revenue NUMBER := 0;
BEGIN
DBMS_OUTPUT.PUT_LINE('Game Revenue Report');
DBMS_OUTPUT.PUT_LINE('===============================================');
FOR rec IN game_cursor LOOP
revenue := calc_game_revenue(rec.game_id);
total_revenue := total_revenue + revenue;
DBMS_OUTPUT.PUT_LINE('Game ID: ' || rec.game_id);
DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(rec.game_date, 'MM/DD/YYYY'));
DBMS_OUTPUT.PUT_LINE('Attendance: ' || rec.attendance);
DBMS_OUTPUT.PUT_LINE('Revenue: $' || TO_CHAR(revenue, '999,999.99'));
DBMS_OUTPUT.PUT_LINE('- - - - - - - - - - - - - - - - - - - - - - - -');
END LOOP;
DBMS_OUTPUT.PUT_LINE('===============================================');
DBMS_OUTPUT.PUT_LINE('Total Revenue: $' || TO_CHAR(total_revenue, '999,999.99'));
END;
/
