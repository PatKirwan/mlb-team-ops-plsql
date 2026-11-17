-- Block 6: Contract Management With Exception Handling
-- Techniques: Exception Handling, PRAGMA EXCEPTION_INIT
--
-- Try to insert a new player contract and handle errors if the player doesn't
-- exist (foreign key violation) or other database errors occur.

-- Requires 01_schema.sql and 02_sample_data.sql to have been run first.

set serveroutput on

DECLARE
new_player_id NUMBER := 99;
ex_fk_violation EXCEPTION;
ex_check_violation EXCEPTION;
PRAGMA EXCEPTION_INIT(ex_fk_violation, -2291);
PRAGMA EXCEPTION_INIT(ex_check_violation, -2290);
BEGIN
DBMS_OUTPUT.PUT_LINE('Contract Management System');
DBMS_OUTPUT.PUT_LINE('===============================================');
DBMS_OUTPUT.PUT_LINE('Attempting to insert contract for player ID: ' || new_player_id);
INSERT INTO player_contract VALUES (99, new_player_id, 2026, 2029, 5000000);
DBMS_OUTPUT.PUT_LINE('Contract inserted successfully!');
COMMIT;
EXCEPTION
WHEN ex_fk_violation THEN
DBMS_OUTPUT.PUT_LINE('ERROR: Player ID ' || new_player_id || ' does not exist');
DBMS_OUTPUT.PUT_LINE('Cannot create contract for non-existent player');
ROLLBACK;
WHEN ex_check_violation THEN
DBMS_OUTPUT.PUT_LINE('ERROR: Contract data violates business rules');
ROLLBACK;
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
ROLLBACK;
END;
/
