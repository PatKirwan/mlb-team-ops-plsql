-- Block 7: Player Salary Analysis (Nested Cursors)
-- Techniques: Nested Cursors, Loops
--
-- For each team, show all players and their salaries, then calculate team
-- totals.

-- Requires 01_schema.sql and 02_sample_data.sql to have been run first.

set serveroutput on

DECLARE
CURSOR team_cursor IS
SELECT team_id, team_name
FROM team
WHERE team_id = 1;
CURSOR player_cursor(tid NUMBER) IS
SELECT p.player_name, pc.annual_salary
FROM player p
JOIN player_contract pc ON p.player_id = pc.player_id
WHERE p.team_id = tid
ORDER BY pc.annual_salary DESC;
team_total NUMBER;
BEGIN
FOR team_rec IN team_cursor LOOP
team_total := 0;
DBMS_OUTPUT.PUT_LINE('===============================================');
DBMS_OUTPUT.PUT_LINE('Team: ' || team_rec.team_name);
DBMS_OUTPUT.PUT_LINE('===============================================');
FOR player_rec IN player_cursor(team_rec.team_id) LOOP
team_total := team_total + player_rec.annual_salary;
DBMS_OUTPUT.PUT_LINE('Player: ' || RPAD(player_rec.player_name, 25) || 
'Salary: $' || TO_CHAR(player_rec.annual_salary, '999,999,999'));
END LOOP;
DBMS_OUTPUT.PUT_LINE('- - - - - - - - - - - - - - - - - - - - - - - -');
DBMS_OUTPUT.PUT_LINE('Team Total Payroll: $' || TO_CHAR(team_total, '999,999,999'));
DBMS_OUTPUT.PUT_LINE('===============================================');
END LOOP;
END;
/
