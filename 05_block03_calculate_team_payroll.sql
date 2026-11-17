-- Block 3: Calculate Team Payroll
-- Techniques: Cursor, Calculations, Comparisons
--
-- Calculate the total payroll for the St. Louis Cardinals and show how each
-- player's salary compares to the team average.

-- Requires 01_schema.sql and 02_sample_data.sql to have been run first.

set serveroutput on

DECLARE
total_payroll NUMBER := 0;
avg_salary NUMBER;
player_count NUMBER := 0;
CURSOR salary_cursor IS
SELECT p.player_name, pc.annual_salary
FROM player p
JOIN player_contract pc ON p.player_id = pc.player_id
WHERE p.team_id = 1;
BEGIN
SELECT SUM(pc.annual_salary), COUNT(*)
INTO total_payroll, player_count
FROM player p
JOIN player_contract pc ON p.player_id = pc.player_id
WHERE p.team_id = 1;
avg_salary := total_payroll / player_count;
DBMS_OUTPUT.PUT_LINE('St. Louis Cardinals Payroll Report');
DBMS_OUTPUT.PUT_LINE('===============================================');
DBMS_OUTPUT.PUT_LINE('Total Payroll: $' || TO_CHAR(total_payroll, '999,999,999'));
DBMS_OUTPUT.PUT_LINE('Average Salary: $' || TO_CHAR(avg_salary, '999,999,999'));
DBMS_OUTPUT.PUT_LINE('Number of Players: ' || player_count);
DBMS_OUTPUT.PUT_LINE('===============================================');
FOR rec IN salary_cursor LOOP
DBMS_OUTPUT.PUT_LINE('Player: ' || rec.player_name);
DBMS_OUTPUT.PUT_LINE('Salary: $' || TO_CHAR(rec.annual_salary, '999,999,999'));
IF rec.annual_salary > avg_salary THEN
DBMS_OUTPUT.PUT_LINE('Status: Above Team Average');
ELSE
DBMS_OUTPUT.PUT_LINE('Status: Below Team Average');
END IF;
DBMS_OUTPUT.PUT_LINE('- - - - - - - - - - - - - - - - - - - - - - - -');
END LOOP;
END;
/
