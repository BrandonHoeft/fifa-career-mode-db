--  query templates for loading tables
insert into leagues (name)
values
    ('Bundesliga'),
    ('DFB-Pokal'),
    ('Champions League'),
    ('Europa League'),
    ('Europa Conference League');

insert into seasons (fk_league_id, fk_team_id, year)
values
    (1, 1, 2022), -- Werder Bremen 1st season Buli
    (2, 1, 2022) -- Werder Bremen 1st season DFB-Pokal

insert into teams (name)
values ('Werder Bremen'),
        ('1. FC Köln'),
        ('1899 Hoffenheim'),
        ('Bayer Leverkusen'),
        ('Bayern Munich'),
        ('Borussia Dortmund'),
        ('Borussia Mönchengladbach'),
        ('Eintracht Frankfurt'),
        ('FC Augsburg'),
        ('Hamburger SV'),
        ('Hannover 96'),
        ('Hertha BSC'),
        ('Mainz 05'),
        ('RB Leipzig'),
        ('SC Freiburg'),
        ('Schalke 04'),
        ('VfB Stuttgart'),
        ('Wolfsburg'),
        ('Arminia Bielefeld'),
        ('Eintracht Braunschweig'),
        ('Darmstadt 98'),
        ('Fortuna Düsseldorf'),
        ('Greuther Fürth'),
        ('Hamburger SV'),
        ('Hannover 96'),
        ('1. FC Heidenheim'),
        ('1. FC Kaiserslautern'),
        ('Karlsruher SC'),
        ('Holstein Kiel'),
        ('1. FC Magdeburg'),
        ('1. FC Nürnberg'),
        ('SC Paderborn'),
        ('Jahn Regensburg'),
        ('Hansa Rostock'),
        ('SV Sandhausen'),
        ('FC St. Pauli')

insert into players (fk_team_id, first_name, last_name, birth_year, primary_pos)
values
    (1, 'Marco', 'Friedl', 1998, 'CB'),
    (1, 'Amos', 'Pieper', 1998, 'CB'),
    (1, 'Milos', 'Veljkovic', 1995, 'CB'),
    (1, 'Niklas', 'Stark', 1995, 'CB'),
    (1, 'Fabio', 'Chiarodia', 2005, 'CB'),
    (1, 'Lee', 'Buchanan', 2001, 'LB'),
    (1, 'Anthony', 'Jung', 1991, 'LB'),
    (1, 'Mitchel', 'Weiser', 1994, 'RB'),
    (1, 'Felix', 'Agu', 1999, 'RB'),
    (1, 'Christian', 'Groß', 1989, 'CM'),
    (1, 'Naby', 'Keita', 1995, 'CM'),
    (1, 'Ilia', 'Gruev', 2000, 'CM'),
    (1, 'Jens', 'Stage', 1996, 'CM'),
    (1, 'Jean Manuel', 'Mbom', 2000, 'CM'),
    (1, 'Dikeni', 'Salifou', 2003, 'CM'),
    (1, 'Tom', 'Berger', 2001, 'CM'),
    (1, 'Romano', 'Schmid', 2000, 'CAM'),
    (1, 'Julian', 'Brandt', 1996, 'CAM'),
    (1, 'Niklas', 'Schmidt', 1998, 'CAM'),
    (1, 'Niclas', 'Füllkrug', 1993, 'ST'),
    (1, 'Dawid', 'Kownacki', 1997, 'ST'),
    (1, 'Eren', 'Dinkci', 2001, 'ST'),

insert into standings_snapshot (fk_season_id, fk_team_id, standings_as_of, points, goal_diff)
values
    (1, 1, '2022-08-01', 0, 0), -- Werder Bremen
    (1, 2, '2022-08-01', 0, 0), -- FC Koln
    (1, 3, '2022-08-01', 0, 0), -- 1899 Hoffenheim
    (1, 4, '2022-08-01', 0, 0), -- Bayer Leverkusen
    (1, 5, '2022-08-01', 0, 0), -- Bayern Munich
    (1, 6, '2022-08-01', 0, 0), -- Borussia Dortmund
    (1, 7, '2022-08-01', 0, 0), -- Borussia Mönchengladbach
    (1, 8, '2022-08-01', 0, 0), -- Eintracht Frankfurt
    (1, 9, '2022-08-01', 0, 0), -- FC Augsburg
    (1, 10, '2022-08-01', 0, 0), -- Vfl Bochum
    (1, 13, '2022-08-01', 0, 0), -- Mainz 05
    (1, 14, '2022-08-01', 0, 0), -- RB Leipzig
    (1, 15, '2022-08-01', 0, 0), -- SC Freiburg
    (1, 17, '2022-08-01', 0, 0), -- VfB Stuttgart
    (1, 18, '2022-08-01', 0, 0), -- Wolfsburg
    (1, 21, '2022-08-01', 0, 0), -- Darmstadt 98
    (1, 24, '2022-08-01', 0, 0), -- Hamburger SV
    (1, 37, '2022-08-01', 0, 0), -- Union Berlin



--------------------------------------------------------------------------------
-- game log 2:  vs RB Leipzig
INSERT INTO player_stats (
    fk_player_id,
    fk_game_id,
    rating,
    minutes,
    poss_won,
    poss_lost,
    goals,
    shots,
    assists,
    key_passes,
    passes_att,
    passes_compl,
    intrcpts_tkls,
    duels_won)
VALUES
(1,2,6.9,91,2,2,0,0,0,0,16,14,3,6),  -- Marco Friedl
(2,2,6.7,71,4,2,0,0,0,0,9,6,4,5),  -- Amos Pieper
(3,2,7.4,91,8,4,0,0,0,0,20,14,5,8),  -- Milos Veljkovic
(7,2,6.4,54,0,3,0,1,0,1,8,6,0,4),  -- Anthony Jung
(8,2,6.5,91,2,3,0,0,0,0,12,10,2,4),  -- Mitchel Weiser
(11,2,6.3,91,1,7,0,0,1,3,18,12,1,2),  -- Naby Keita
(12,2,7.1,91,2,1,0,0,0,0,16,14,2,7),  -- Ilia Gruev
(17,2,5.6,54,1,2,0,1,0,0,5,4,0,2),  -- Romano Schmid
(18,2,5.9,91,0,6,0,1,0,0,13,8,1,4),  -- Julian Brandt
(20,2,7,91,0,1,1,1,0,0,9,8,0,0),  -- Niclas Füllkrug
(6,2,5.7,37,1,2,0,0,0,0,3,2,1,1),  -- Lee Buchanan
(19,2,5.8,37,0,0,0,0,0,0,2,2,0,1), -- Niklas Schmidt
(10,2,5.9,20,3,1,0,0,0,0,5,4,1,2)  -- Christian Groß


