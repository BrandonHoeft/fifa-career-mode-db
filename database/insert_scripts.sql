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
-- game log 1:  vs Hamburg
insert into games (
    fk_season_id,
    game_num,
    game_minutes,
    home_or_away,
    fk_opp_id,
    opp_goals,
    opp_xg,
    opp_poss_pct,
    opp_shots,
    my_goals,
    my_xg,
    my_shots
)
values
    (1, 1, 14, 'away', 24,0,1.6,56,9,0,0.6,5);


INSERT INTO player_stats (
    fk_player_id,
    fk_game_id,
    rating,
    minutes,
    poss_won,
    poss_lost,
    dribble_compl, goals, shots, assists, key_passes, passes_att, passes_compl, intrcpts_tkls)
VALUES
(1,1,7.7,91,5,0,11,0,0,0,1,15,13,4),  -- Marco Friedl
(2,1,6.8,91,3,3,10,0,0,0,0,11,8,5),  -- Amos Pieper
(4,1,6.3,91,2,0,6,0,0,0,0,10,10,2),  -- Niklas Stark
(7,1,7.1,91,1,2,8,0,1,0,0,12,7,1),  -- Anthony Jung
(8,1,6.4,91,4,4,7,0,0,0,2,12,9,4),  -- Mitchel Weiser
(11,1,6.8,91,4,3,8,0,0,0,0,11,8,5),  -- Naby Keita
(13,1,5.6,60,1,7,9,0,2,0,0,8,4,2),  -- Jens Stage
(17,1,5.7,31,0,0,1,0,0,0,0,1,1,0),  -- Romano Schmid
(18,1,5.8,60,0,2,7,0,0,0,0,8,6,1),  -- Julian Brandt
(19,1,5.6,31,0,3,0,0,0,0,0,2,0,0),  -- Niklas Schmidt
(20,1,5.9,91,0,2,4,0,1,0,0,6,5,0),  -- Niclas Füllkrug
(21,1,6,76,0,2,6,0,1,0,1,5,4,0),  -- Dawid Kownacki
(22,1,6,15,1,1,1,0,0,0,0,1,0,0)  -- Eren Dinkci
