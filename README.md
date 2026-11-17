# MLB Team Operations Database (Oracle PL/SQL)

A relational database for one month of MLB team operations (roster, coaches, staff, contracts, games, stadiums, umpires, tickets, and promotions), plus 10 PL/SQL programs that report on it. I built it as a university database course project (BAIS 408/409) because I want a career in sports analytics.

## What's in it

**12 tables:** `team`, `stadium`, `umpire`, `game`, `player`, `player_game_stats`, `coach`, `player_contract`, `staff`, `game_umpire`, `ticket`, `promotion`. All are linked with primary and foreign keys (for example, `game` points to `team` twice for home and away, and to `stadium`).

**Sample data:** 130 rows. Team, stadium and player names are real. Contracts, stats, staff, tickets and attendance are made-up numbers for the exercise, so don't read anything into them.

## The 10 PL/SQL blocks

Ordered from simple to complex.

| # | Block | Techniques |
|---|---|---|
| 1 | Game attendance report (% of capacity filled) | Cursor FOR loop, calculations |
| 2 | Player hits/RBI summary with a performance rating | Cursor, IF-THEN-ELSE |
| 3 | Cardinals payroll vs. team average salary | Cursor, calculations, comparisons |
| 4 | Ticket revenue per game | Stored function, cursor, loops |
| 5 | Performance bonus eligibility | Cursor, multi-branch IF |
| 6 | Contract insert that handles a missing player | Exception handling, `PRAGMA EXCEPTION_INIT` |
| 7 | Players and salaries per team, with totals | Nested cursors with a parameter |
| 8 | Stadium operations: capacity % and revenue per seat | Package (spec and body) |
| 9 | Monthly financial report (revenue, expenses, profit/loss) | Stored procedure, multiple queries |
| 10 | Salary change audit log | Trigger, sequence, `:OLD`/`:NEW` |

## How to run it

The free option is [Oracle Live SQL](https://livesql.oracle.com), or you can use Oracle SQL Developer.

1. Run `01_schema.sql`, then `02_sample_data.sql`.
2. Run any block file (`03_` to `12_`). Each starts with `set serveroutput on` so the `DBMS_OUTPUT` text shows up. In Live SQL, if a block that creates an object and then runs a separate block prints nothing, run `set serveroutput on` again before the second part.

## Things to know about the sample data

- **Block 5** pays bonuses at 10+ and 15+ total bases (hits plus RBIs). In this small dataset nobody reaches 10 (the max is 7), so it prints a total of $0. Lower the thresholds in the code to see it pay out.
- **Block 6** is meant to fail: it inserts a contract for a player that doesn't exist, to show the exception handler catching the foreign-key error.
- **Block 9** reports a large net loss. That's an artifact of the data: there are only 10 ticket rows (about $505 total) against a full month of player and staff salaries.
- **Block 10** updates a salary and then rolls the change back, so the sample data stays unchanged.

## Changes from the version I submitted

- I added `set serveroutput on` to the top of each block file.
- In Block 8, I qualified the function parameter (`calc_revenue_per_seat.game_id`) so Oracle doesn't read it as the `ticket.game_id` column.
- I split the single submission file into one script per step.
- I left out the pasted output sections, because several of the numbers didn't match the sample data. Run the blocks to see real output.

## Files

| File | Purpose |
|---|---|
| `01_schema.sql` | Drops and creates the 12 tables |
| `02_sample_data.sql` | Inserts the sample data |
| `03_` to `12_block*.sql` | The 10 PL/SQL blocks, one per file |
