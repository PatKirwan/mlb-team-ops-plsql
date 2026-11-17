-- MLB Team Operations Database: schema
-- Run on a fresh Oracle schema (Oracle Live SQL or SQL Developer).
-- The DROP statements error harmlessly the first time, before the tables exist.

DROP TABLE promotion;
DROP TABLE ticket;
DROP TABLE game_umpire;
DROP TABLE staff;
DROP TABLE player_contract;
DROP TABLE coach;
DROP TABLE player_game_stats;
DROP TABLE player;
DROP TABLE game;
DROP TABLE umpire;
DROP TABLE stadium;
DROP TABLE team;

CREATE TABLE team (
team_id   NUMBER PRIMARY KEY,
team_name VARCHAR2(100) NOT NULL,
city      VARCHAR2(50),
state     VARCHAR2(2),
league    VARCHAR2(10)
);

CREATE TABLE stadium (
stadium_id   NUMBER PRIMARY KEY,
stadium_name VARCHAR2(100) NOT NULL,
city         VARCHAR2(50),
state        VARCHAR2(2),
capacity     NUMBER
);

CREATE TABLE umpire (
umpire_id        NUMBER PRIMARY KEY,
first_name       VARCHAR2(50) NOT NULL,
last_name        VARCHAR2(50) NOT NULL,
experience_years NUMBER,
crew_chief_flag  CHAR(1),
country          VARCHAR2(50)
);

CREATE TABLE game (
game_id        NUMBER PRIMARY KEY,
game_date      DATE NOT NULL,
home_team_id   NUMBER NOT NULL,
away_team_id   NUMBER NOT NULL,
stadium_id     NUMBER NOT NULL,
attendance     NUMBER,
CONSTRAINT fk_game_home_team FOREIGN KEY (home_team_id) REFERENCES team(team_id),
CONSTRAINT fk_game_away_team FOREIGN KEY (away_team_id) REFERENCES team(team_id),
CONSTRAINT fk_game_stadium FOREIGN KEY (stadium_id) REFERENCES stadium(stadium_id)
);

CREATE TABLE player (
player_id     NUMBER PRIMARY KEY,
player_name   VARCHAR2(100),
position      VARCHAR2(5),
jersey_number NUMBER,
team_id       NUMBER,
CONSTRAINT fk_player_team FOREIGN KEY (team_id) REFERENCES team(team_id)
);

CREATE TABLE player_game_stats (
player_game_stats_id NUMBER PRIMARY KEY,
player_id            NUMBER,
game_id              NUMBER,
hits                 NUMBER,
runs_batted_in       NUMBER,
CONSTRAINT fk_pgs_player FOREIGN KEY (player_id) REFERENCES player(player_id),
CONSTRAINT fk_pgs_game FOREIGN KEY (game_id) REFERENCES game(game_id)
);

CREATE TABLE coach (
coach_id   NUMBER PRIMARY KEY,
coach_name VARCHAR2(100),
role       VARCHAR2(50),
start_year NUMBER,
team_id    NUMBER,
CONSTRAINT fk_coach_team FOREIGN KEY (team_id) REFERENCES team(team_id)
);

CREATE TABLE player_contract (
contract_id    NUMBER PRIMARY KEY,
player_id      NUMBER,
start_year     NUMBER,
end_year       NUMBER,
annual_salary  NUMBER(12,2),
CONSTRAINT fk_contract_player FOREIGN KEY (player_id) REFERENCES player(player_id)
);

CREATE TABLE staff (
staff_id   NUMBER PRIMARY KEY,
staff_name VARCHAR2(100),
role       VARCHAR2(50),
hire_year  NUMBER,
salary     NUMBER(12,2)
);

CREATE TABLE game_umpire (
game_umpire_id NUMBER PRIMARY KEY,
game_id        NUMBER NOT NULL,
umpire_id      NUMBER NOT NULL,
position       VARCHAR2(10),
review_calls   NUMBER,
ejection_flag  CHAR(1),
CONSTRAINT fk_gu_game FOREIGN KEY (game_id) REFERENCES game(game_id),
CONSTRAINT fk_gu_umpire FOREIGN KEY (umpire_id) REFERENCES umpire(umpire_id)
);

CREATE TABLE ticket (
ticket_id    NUMBER PRIMARY KEY,
game_id      NUMBER,
seat_section VARCHAR2(10),
seat_row     VARCHAR2(5),
price        NUMBER(8,2),
CONSTRAINT fk_ticket_game FOREIGN KEY (game_id) REFERENCES game(game_id)
);

CREATE TABLE promotion (
promotion_id  NUMBER PRIMARY KEY,
game_id       NUMBER,
promo_name    VARCHAR2(100),
promo_type    VARCHAR2(50),
giveaway_item VARCHAR2(100),
CONSTRAINT fk_promo_game FOREIGN KEY (game_id) REFERENCES game(game_id)
);
