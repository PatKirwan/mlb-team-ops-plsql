-- Block 10: Salary Update Audit Trigger
-- Techniques: Trigger, Sequence, :OLD and :NEW references
--
-- Create a trigger that automatically logs any salary changes to an audit
-- table whenever a player contract is updated.

-- Requires 01_schema.sql and 02_sample_data.sql to have been run first.
-- Creates a new table, sequence and trigger, so re-running needs them dropped first.

set serveroutput on

CREATE TABLE salary_audit (
audit_id NUMBER PRIMARY KEY,
contract_id NUMBER,
old_salary NUMBER,
new_salary NUMBER,
change_date DATE,
change_amount NUMBER
);

CREATE SEQUENCE audit_seq START WITH 1;

CREATE OR REPLACE TRIGGER salary_audit_trigger
BEFORE UPDATE OF annual_salary ON player_contract
FOR EACH ROW
BEGIN
INSERT INTO salary_audit VALUES (
audit_seq.NEXTVAL,
:OLD.contract_id,
:OLD.annual_salary,
:NEW.annual_salary,
SYSDATE,
:NEW.annual_salary - :OLD.annual_salary
);
END;
/

DECLARE
old_sal NUMBER;
new_sal NUMBER;
BEGIN
DBMS_OUTPUT.PUT_LINE('Testing Salary Audit Trigger');
DBMS_OUTPUT.PUT_LINE('===============================================');
SELECT annual_salary INTO old_sal
FROM player_contract WHERE contract_id = 1;
DBMS_OUTPUT.PUT_LINE('Current salary for contract 1: $' || 
TO_CHAR(old_sal, '999,999,999'));
UPDATE player_contract 
SET annual_salary = 27000000
WHERE contract_id = 1;
SELECT annual_salary INTO new_sal
FROM player_contract WHERE contract_id = 1;
DBMS_OUTPUT.PUT_LINE('Updated salary for contract 1: $' || 
TO_CHAR(new_sal, '999,999,999'));
DBMS_OUTPUT.PUT_LINE('');
DBMS_OUTPUT.PUT_LINE('Audit Log:');
FOR rec IN (SELECT * FROM salary_audit ORDER BY audit_id DESC FETCH FIRST 1 ROW ONLY) LOOP
DBMS_OUTPUT.PUT_LINE('Contract ID: ' || rec.contract_id);
DBMS_OUTPUT.PUT_LINE('Old Salary: $' || TO_CHAR(rec.old_salary, '999,999,999'));
DBMS_OUTPUT.PUT_LINE('New Salary: $' || TO_CHAR(rec.new_salary, '999,999,999'));
DBMS_OUTPUT.PUT_LINE('Change: $' || TO_CHAR(rec.change_amount, '999,999,999'));
DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(rec.change_date, 'MM/DD/YYYY HH24:MI'));
END LOOP;
ROLLBACK;
END;
/
