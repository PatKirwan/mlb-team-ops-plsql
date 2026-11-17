-- Block 9: Monthly Financial Report
-- Techniques: Procedure, Multiple Queries, IF-THEN-ELSE
--
-- Generate a comprehensive financial report showing ticket revenue, player
-- salaries, staff costs, and calculate profit or loss.

-- Requires 01_schema.sql and 02_sample_data.sql to have been run first.

set serveroutput on

CREATE OR REPLACE PROCEDURE monthly_financial_report
IS
ticket_revenue NUMBER := 0;
player_costs NUMBER := 0;
staff_costs NUMBER := 0;
total_expenses NUMBER := 0;
net_result NUMBER := 0;
BEGIN
SELECT SUM(price)
INTO ticket_revenue
FROM ticket;
SELECT SUM(annual_salary) / 12
INTO player_costs
FROM player_contract;
SELECT SUM(salary) / 12
INTO staff_costs
FROM staff;
total_expenses := player_costs + staff_costs;
net_result := ticket_revenue - total_expenses;
DBMS_OUTPUT.PUT_LINE('===============================================');
DBMS_OUTPUT.PUT_LINE('       MONTHLY FINANCIAL REPORT');
DBMS_OUTPUT.PUT_LINE('       April 2025');
DBMS_OUTPUT.PUT_LINE('===============================================');
DBMS_OUTPUT.PUT_LINE('');
DBMS_OUTPUT.PUT_LINE('REVENUE:');
DBMS_OUTPUT.PUT_LINE('Ticket Sales:        $' || 
TO_CHAR(ticket_revenue, '999,999,999.99'));
DBMS_OUTPUT.PUT_LINE('');
DBMS_OUTPUT.PUT_LINE('EXPENSES:');
DBMS_OUTPUT.PUT_LINE('Player Salaries:     $' || 
TO_CHAR(player_costs, '999,999,999.99'));
DBMS_OUTPUT.PUT_LINE('Staff Salaries:      $' || 
TO_CHAR(staff_costs, '999,999,999.99'));
DBMS_OUTPUT.PUT_LINE('Total Expenses:      $' || 
TO_CHAR(total_expenses, '999,999,999.99'));
DBMS_OUTPUT.PUT_LINE('- - - - - - - - - - - - - - - - - - - - - - - -');
IF net_result > 0 THEN
DBMS_OUTPUT.PUT_LINE('NET PROFIT:          $' || 
TO_CHAR(net_result, '999,999,999.99'));
ELSE
DBMS_OUTPUT.PUT_LINE('NET LOSS:            $' || 
TO_CHAR(ABS(net_result), '999,999,999.99'));
END IF;
DBMS_OUTPUT.PUT_LINE('===============================================');
END monthly_financial_report;
/

BEGIN
monthly_financial_report;
END;
/
