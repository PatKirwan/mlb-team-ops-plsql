-- MLB Team Operations Database: sample data (130 rows across 12 tables)
-- Illustrative values: team, stadium and player names are real, but contracts,
-- stats, staff, tickets and attendance figures are made up for the exercise.


-- team
INSERT INTO team VALUES (1, 'St. Louis Cardinals', 'St. Louis', 'MO', 'NL');
INSERT INTO team VALUES (2, 'Chicago Cubs', 'Chicago', 'IL', 'NL');
INSERT INTO team VALUES (3, 'Milwaukee Brewers', 'Milwaukee', 'WI', 'NL');
INSERT INTO team VALUES (4, 'Cincinnati Reds', 'Cincinnati', 'OH', 'NL');
INSERT INTO team VALUES (5, 'Pittsburgh Pirates', 'Pittsburgh', 'PA', 'NL');
INSERT INTO team VALUES (6, 'Atlanta Braves', 'Atlanta', 'GA', 'NL');
INSERT INTO team VALUES (7, 'Los Angeles Dodgers', 'Los Angeles', 'CA', 'NL');
INSERT INTO team VALUES (8, 'New York Mets', 'New York', 'NY', 'NL');
INSERT INTO team VALUES (9, 'San Diego Padres', 'San Diego', 'CA', 'NL');
INSERT INTO team VALUES (10, 'Houston Astros', 'Houston', 'TX', 'AL');

-- stadium
INSERT INTO stadium VALUES (1, 'Busch Stadium', 'St. Louis', 'MO', 45500);
INSERT INTO stadium VALUES (2, 'Wrigley Field', 'Chicago', 'IL', 41649);
INSERT INTO stadium VALUES (3, 'American Family Field', 'Milwaukee', 'WI', 41900);
INSERT INTO stadium VALUES (4, 'Great American Ball Park', 'Cincinnati', 'OH', 42319);
INSERT INTO stadium VALUES (5, 'PNC Park', 'Pittsburgh', 'PA', 38362);
INSERT INTO stadium VALUES (6, 'Truist Park', 'Atlanta', 'GA', 41149);
INSERT INTO stadium VALUES (7, 'Dodger Stadium', 'Los Angeles', 'CA', 56000);
INSERT INTO stadium VALUES (8, 'Citi Field', 'New York', 'NY', 41922);
INSERT INTO stadium VALUES (9, 'Petco Park', 'San Diego', 'CA', 40209);
INSERT INTO stadium VALUES (10, 'Minute Maid Park', 'Houston', 'TX', 41676);

-- umpire
INSERT INTO umpire VALUES (1, 'James', 'Hobson', 12, 'Y', 'USA');
INSERT INTO umpire VALUES (2, 'Carlos', 'Ramirez', 9, 'N', 'Mexico');
INSERT INTO umpire VALUES (3, 'Mike', 'Thompson', 15, 'Y', 'USA');
INSERT INTO umpire VALUES (4, 'Hiro', 'Tanaka', 7, 'N', 'Japan');
INSERT INTO umpire VALUES (5, 'Alex', 'Martinez', 5, 'N', 'USA');
INSERT INTO umpire VALUES (6, 'Robert', 'Lewis', 20, 'Y', 'USA');
INSERT INTO umpire VALUES (7, 'David', 'Nguyen', 8, 'N', 'Canada');
INSERT INTO umpire VALUES (8, 'Sean', 'OBrien', 11, 'N', 'Ireland');
INSERT INTO umpire VALUES (9, 'Victor', 'Santos', 6, 'N', 'Dominican Republic');
INSERT INTO umpire VALUES (10, 'Peter', 'Wilson', 18, 'Y', 'USA');

-- game
INSERT INTO game VALUES (1, TO_DATE('2025-04-01','YYYY-MM-DD'), 1, 2, 1, 43000);
INSERT INTO game VALUES (2, TO_DATE('2025-04-02','YYYY-MM-DD'), 1, 2, 1, 44000);
INSERT INTO game VALUES (3, TO_DATE('2025-04-05','YYYY-MM-DD'), 1, 3, 1, 42000);
INSERT INTO game VALUES (4, TO_DATE('2025-04-10','YYYY-MM-DD'), 4, 1, 4, 39500);
INSERT INTO game VALUES (5, TO_DATE('2025-04-11','YYYY-MM-DD'), 4, 1, 4, 40000);
INSERT INTO game VALUES (6, TO_DATE('2025-04-15','YYYY-MM-DD'), 5, 1, 5, 38000);
INSERT INTO game VALUES (7, TO_DATE('2025-04-18','YYYY-MM-DD'), 1, 6, 1, 45000);
INSERT INTO game VALUES (8, TO_DATE('2025-04-20','YYYY-MM-DD'), 1, 7, 1, 45500);
INSERT INTO game VALUES (9, TO_DATE('2025-04-25','YYYY-MM-DD'), 8, 1, 8, 41000);
INSERT INTO game VALUES (10, TO_DATE('2025-04-28','YYYY-MM-DD'), 9, 1, 9, 39000);

-- player
INSERT INTO player VALUES (1, 'Paul Goldschmidt', '1B', 46, 1);
INSERT INTO player VALUES (2, 'Nolan Arenado', '3B', 28, 1);
INSERT INTO player VALUES (3, 'Willson Contreras', 'C', 40, 1);
INSERT INTO player VALUES (4, 'Lars Nootbaar', 'OF', 21, 1);
INSERT INTO player VALUES (5, 'Tommy Edman', '2B', 19, 1);
INSERT INTO player VALUES (6, 'Jordan Walker', 'OF', 18, 1);
INSERT INTO player VALUES (7, 'Brendan Donovan', 'UT', 33, 1);
INSERT INTO player VALUES (8, 'Masyn Winn', 'SS', 0, 1);
INSERT INTO player VALUES (9, 'Miles Mikolas', 'P', 39, 1);
INSERT INTO player VALUES (10, 'Ryan Helsley', 'P', 56, 1);

-- player_game_stats
INSERT INTO player_game_stats VALUES (1, 1, 1, 2, 1);
INSERT INTO player_game_stats VALUES (2, 1, 2, 1, 0);
INSERT INTO player_game_stats VALUES (3, 2, 1, 1, 2);
INSERT INTO player_game_stats VALUES (4, 2, 3, 3, 1);
INSERT INTO player_game_stats VALUES (5, 3, 1, 1, 1);
INSERT INTO player_game_stats VALUES (6, 3, 2, 2, 2);
INSERT INTO player_game_stats VALUES (7, 4, 3, 2, 1);
INSERT INTO player_game_stats VALUES (8, 4, 4, 1, 0);
INSERT INTO player_game_stats VALUES (9, 5, 1, 1, 1);
INSERT INTO player_game_stats VALUES (10, 5, 2, 2, 0);

-- coach
INSERT INTO coach VALUES (1, 'Oli Marmol', 'Manager', 2022, 1);
INSERT INTO coach VALUES (2, 'Joe McEwing', 'Bench Coach', 2023, 1);
INSERT INTO coach VALUES (3, 'Turner Ward', 'Hitting Coach', 2022, 1);
INSERT INTO coach VALUES (4, 'Dusty Blake', 'Pitching Coach', 2023, 1);
INSERT INTO coach VALUES (5, 'Willie McGee', 'Coach', 2018, 1);
INSERT INTO coach VALUES (6, 'Stubby Clapp', 'First Base Coach', 2019, 1);
INSERT INTO coach VALUES (7, 'Pop Warner', 'Third Base Coach', 2017, 1);
INSERT INTO coach VALUES (8, 'Jamie Pogue', 'Bullpen Catcher', 2012, 1);
INSERT INTO coach VALUES (9, 'Bryan Eversgerd', 'Bullpen Coach', 2018, 1);
INSERT INTO coach VALUES (10, 'Ron Popovich', 'Assistant Coach', 2024, 1);

-- staff
INSERT INTO staff VALUES (1, 'John Smith', 'Head Trainer', 2020, 85000);
INSERT INTO staff VALUES (2, 'Sarah Johnson', 'Assistant Trainer', 2021, 65000);
INSERT INTO staff VALUES (3, 'Mike Brown', 'Clubhouse Manager', 2018, 70000);
INSERT INTO staff VALUES (4, 'Emily Davis', 'Video Analyst', 2022, 60000);
INSERT INTO staff VALUES (5, 'Chris Wilson', 'Data Analyst', 2023, 65000);
INSERT INTO staff VALUES (6, 'Anna Lee', 'Team Doctor', 2019, 150000);
INSERT INTO staff VALUES (7, 'David Clark', 'Strength Coach', 2020, 72000);
INSERT INTO staff VALUES (8, 'Rachel Green', 'Nutritionist', 2021, 68000);
INSERT INTO staff VALUES (9, 'Kevin White', 'Equipment Manager', 2017, 62000);
INSERT INTO staff VALUES (10, 'Laura Young', 'Travel Coordinator', 2016, 64000);

-- player_contract
INSERT INTO player_contract VALUES (1, 1, 2023, 2026, 26000000);
INSERT INTO player_contract VALUES (2, 2, 2023, 2027, 28000000);
INSERT INTO player_contract VALUES (3, 3, 2023, 2025, 18000000);
INSERT INTO player_contract VALUES (4, 4, 2023, 2026, 5000000);
INSERT INTO player_contract VALUES (5, 5, 2022, 2025, 6000000);
INSERT INTO player_contract VALUES (6, 6, 2023, 2028, 4000000);
INSERT INTO player_contract VALUES (7, 7, 2022, 2025, 4500000);
INSERT INTO player_contract VALUES (8, 8, 2024, 2029, 3500000);
INSERT INTO player_contract VALUES (9, 9, 2022, 2024, 17000000);
INSERT INTO player_contract VALUES (10, 10, 2023, 2025, 8000000);

-- game_umpire
INSERT INTO game_umpire VALUES (1, 1, 1, 'HP', 2, 'N');
INSERT INTO game_umpire VALUES (2, 1, 2, '1B', 1, 'N');
INSERT INTO game_umpire VALUES (3, 2, 3, 'HP', 3, 'N');
INSERT INTO game_umpire VALUES (4, 2, 4, '1B', 1, 'N');
INSERT INTO game_umpire VALUES (5, 3, 5, 'HP', 1, 'N');
INSERT INTO game_umpire VALUES (6, 3, 6, '1B', 2, 'N');
INSERT INTO game_umpire VALUES (7, 4, 7, 'HP', 2, 'Y');
INSERT INTO game_umpire VALUES (8, 4, 8, '1B', 0, 'N');
INSERT INTO game_umpire VALUES (9, 5, 9, 'HP', 1, 'N');
INSERT INTO game_umpire VALUES (10, 5, 10, '1B', 0, 'N');
INSERT INTO game_umpire VALUES (11, 6, 1, 'HP', 2, 'N');
INSERT INTO game_umpire VALUES (12, 6, 3, '1B', 1, 'N');
INSERT INTO game_umpire VALUES (13, 7, 4, 'HP', 3, 'N');
INSERT INTO game_umpire VALUES (14, 7, 6, '1B', 1, 'N');
INSERT INTO game_umpire VALUES (15, 8, 2, 'HP', 1, 'N');
INSERT INTO game_umpire VALUES (16, 8, 5, '1B', 0, 'N');
INSERT INTO game_umpire VALUES (17, 9, 7, 'HP', 2, 'N');
INSERT INTO game_umpire VALUES (18, 9, 8, '1B', 1, 'N');
INSERT INTO game_umpire VALUES (19, 10, 9, 'HP', 1, 'N');
INSERT INTO game_umpire VALUES (20, 10, 10, '1B', 0, 'N');

-- ticket
INSERT INTO ticket VALUES (1, 1, 'LBOX', 'A', 75.00);
INSERT INTO ticket VALUES (2, 1, 'LBOX', 'B', 65.00);
INSERT INTO ticket VALUES (3, 2, 'LBOX', 'A', 80.00);
INSERT INTO ticket VALUES (4, 2, 'UPPER', 'C', 35.00);
INSERT INTO ticket VALUES (5, 3, 'BLEACH', 'D', 25.00);
INSERT INTO ticket VALUES (6, 4, 'LBOX', 'A', 70.00);
INSERT INTO ticket VALUES (7, 5, 'UPPER', 'E', 30.00);
INSERT INTO ticket VALUES (8, 6, 'BLEACH', 'F', 20.00);
INSERT INTO ticket VALUES (9, 7, 'LBOX', 'B', 65.00);
INSERT INTO ticket VALUES (10, 8, 'UPPER', 'C', 40.00);

-- promotion
INSERT INTO promotion VALUES (1, 1, 'Opening Day T-Shirt Giveaway', 'Giveaway', 'T-Shirt');
INSERT INTO promotion VALUES (2, 2, 'Magnet Schedule Night', 'Giveaway', 'Fridge Magnet');
INSERT INTO promotion VALUES (3, 3, 'Fireworks Night', 'Event', 'Postgame Fireworks');
INSERT INTO promotion VALUES (4, 4, 'Bobblehead Night', 'Giveaway', 'Player Bobblehead');
INSERT INTO promotion VALUES (5, 5, 'Family Day', 'Event', 'Kids Run the Bases');
INSERT INTO promotion VALUES (6, 6, 'College Night', 'Theme', 'Discount Tickets');
INSERT INTO promotion VALUES (7, 7, 'Star Wars Night', 'Theme', 'Themed Jersey');
INSERT INTO promotion VALUES (8, 8, 'Camo Hat Giveaway', 'Giveaway', 'Camo Hat');
INSERT INTO promotion VALUES (9, 9, 'Pride Night', 'Theme', 'Pride Towel');
INSERT INTO promotion VALUES (10, 10, 'Fan Appreciation Day', 'Event', 'Prize Giveaways');

COMMIT;
