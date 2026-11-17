-- Block 8: Stadium Operations Package
-- Techniques: Package, Multiple Functions, Cursor
--
-- Create a package with functions to calculate stadium capacity utilization
-- and revenue per seat.

-- Requires 01_schema.sql and 02_sample_data.sql to have been run first.
-- Note: the function parameter is qualified with the function name so Oracle
-- does not read it as the ticket.game_id column.

set serveroutput on

CREATE OR REPLACE PACKAGE stadium_ops AS
FUNCTION calc_capacity_pct(game_att NUMBER, stad_cap NUMBER) RETURN NUMBER;
FUNCTION calc_revenue_per_seat(game_id NUMBER) RETURN NUMBER;
END stadium_ops;
/

CREATE OR REPLACE PACKAGE BODY stadium_ops AS
FUNCTION calc_capacity_pct(game_att NUMBER, stad_cap NUMBER)
RETURN NUMBER
IS
BEGIN
RETURN ROUND((game_att / stad_cap) * 100, 1);
END calc_capacity_pct;
FUNCTION calc_revenue_per_seat(game_id NUMBER)
RETURN NUMBER
IS
total_rev NUMBER;
total_seats NUMBER;
BEGIN
SELECT SUM(price), COUNT(*)
INTO total_rev, total_seats
FROM ticket
WHERE ticket.game_id = calc_revenue_per_seat.game_id;
IF total_seats > 0 THEN
RETURN ROUND(total_rev / total_seats, 2);
ELSE
RETURN 0;
END IF;
END calc_revenue_per_seat;
END stadium_ops;
/

DECLARE
CURSOR game_cursor IS
SELECT g.game_id, g.game_date, g.attendance, s.capacity, s.stadium_name
FROM game g
JOIN stadium s ON g.stadium_id = s.stadium_id;
capacity_pct NUMBER;
rev_per_seat NUMBER;
BEGIN
DBMS_OUTPUT.PUT_LINE('Stadium Operations Report');
DBMS_OUTPUT.PUT_LINE('===============================================');
FOR rec IN game_cursor LOOP
capacity_pct := stadium_ops.calc_capacity_pct(rec.attendance, rec.capacity);
rev_per_seat := stadium_ops.calc_revenue_per_seat(rec.game_id);
DBMS_OUTPUT.PUT_LINE('Game: ' || rec.game_id || ' - ' || 
TO_CHAR(rec.game_date, 'MM/DD/YYYY'));
DBMS_OUTPUT.PUT_LINE('Stadium: ' || rec.stadium_name);
DBMS_OUTPUT.PUT_LINE('Capacity Used: ' || capacity_pct || '%');
DBMS_OUTPUT.PUT_LINE('Revenue Per Seat: $' || TO_CHAR(rev_per_seat, '999.99'));
DBMS_OUTPUT.PUT_LINE('- - - - - - - - - - - - - - - - - - - - - - - -');
END LOOP;
END;
/
