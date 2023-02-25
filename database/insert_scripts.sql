--  query templates for loading tables
insert into leagues (name)
values
    ('Bundesliga 2'),
    ('DFB-Pokal'),
    ('Champions League'),
    ('Europa League'),
    ('Europa Conference League');

insert into seasons (fk_league_id, fk_team_id, year)
values
    (1, 1, 2022), -- Werder Bremen 1st season Buli 2
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
    (1, 'Kim Kee', 'Hee', 1989, 'CB'),
    (1, 'Lee', 'Buchanan', 2001, 'LB'),
    (1, 'Anthony', 'Jung', 1991, 'LB'),
    (1, 'Mitchel', 'Weiser', 1994, 'RB'),
    (1, 'Felix', 'Agu', 1999, 'RB'),
    (1, 'Christian', 'Groß', 1989, 'CM'),
    (1, 'Ilia', 'Gruev', 2000, 'CM'),
    (1, 'Jens', 'Stage', 1996, 'CM'),
    (1, 'Jean Manuel', 'Mbom', 2000, 'CM'),
    (1, 'Dikeni', 'Salifou', 2003, 'CM'),
    (1, 'Tom', 'Berger', 2001, 'CM'),
    (1, 'Romano', 'Schmid', 2000, 'CM'),
    (1, 'Leonardo', 'Bittencourt', 1993, 'CM'),
    (1, 'Niklas', 'Schmidt', 1998, 'CM'),
    (1, 'Niclas', 'Füllkrug', 1993, 'ST'),
    (1, 'Marvin', 'Ducksch', 1994, 'ST'),
    (1, 'Oliver', 'Burke', 1997, 'ST'),
    (1, 'Eren', 'Dinkci', 2001, 'ST'),
    (1, 'Maximilian', 'Philipp', 1994, 'ST')

insert into standings_snapshot (fk_season_id, fk_team_id, standings_as_of, points, goal_diff)
values
    (1, 1, '2022-08-01', 0, 0), -- Werder Bremen
    (1, 19, '2022-08-01', 0, 0), -- Arminia Bielefeld
    (1, 20, '2022-08-01', 0, 0), -- Eintracht Braunschweig
    (1, 21, '2022-08-01', 0, 0), -- Darmstadt 98
    (1, 22, '2022-08-01', 0, 0), -- Fortuna Düsseldorf
    (1, 24, '2022-08-01', 0, 0), -- Hamburger SV
    (1, 25, '2022-08-01', 0, 0), -- Hannover 96
    (1, 26, '2022-08-01', 0, 0), -- 1. FC Heidenheim
    (1, 27, '2022-08-01', 0, 0), -- 1. FC Kaiserslautern
    (1, 28, '2022-08-01', 0, 0), -- Karlsruher SC
    (1, 29, '2022-08-01', 0, 0), -- Holstein Kiel
    (1, 30, '2022-08-01', 0, 0), -- 1. FC Magdeburg
    (1, 31, '2022-08-01', 0, 0), -- 1. FC Nürnberg
    (1, 32, '2022-08-01', 0, 0), -- SC Paderborn
    (1, 33, '2022-08-01', 0, 0), -- Jahn Regensburg
    (1, 34, '2022-08-01', 0, 0), -- Hansa Rostock
    (1, 35, '2022-08-01', 0, 0), -- SV Sandhausen
    (1, 36, '2022-08-01', 0, 0) -- FC St Pauli


--------------------------------------------------------------------------------
-- game log 7:  vs 1. Kaiserslautern
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
    (1, 7, 12, 'home', 27,0,1,46,4,0,2.8,11);

insert into player_stats (
    fk_player_id,
    fk_game_id,
    rating,
    minutes,
    poss_won,
    poss_lost,
    goals,
    non_pen_xg,
    shots,
    assists,
    xa,
    second_assists,
    players_beat_passes,
    passes_att,
    passes_compl,
    interceptions,
    duels_att,
    duels_won
)
values
    (8,7,7.7,91,2,2,0,0.5,2,0,1.2,0,6,11,10,2,6,3), --Anthony Jung
    (5,7,7.1,91,3,3,0,0,1,0,0,0,4,16,14,3,9,5), -- Fabio Chiarodia
    (3,7,6.6,91,4,2,0,0,0,0,0,0,3,10,5,3,7,6), --Milos Veljkovic
    (4,7,7.1,91,5,2,0,0,0,0,0,0,6,12,10,3,2,1), --Niklas Stark
    (9,7,7,61,0,4,0,0,0,0,0.2,0,8,12,8,0,3,1), --Mitchel Weiser
    (11,7,6.8,91,9,1,0,0,0,0,0,0,6,11,10,4,11,5), --Christian Groß
    (19,7,6.8,45,2,3,0,0.2,1,0,0.5,0,9,11,9,1,4,1), --Niklas Schmidt
    (17,7,6.5,91,1,6,0,0.4,1,0,0,0,6,13,9,0,6,4), --Romano Schmid
    (20,7,6.7,91,0,1,0,0.4,2,0,0.4,0,4,10,9,0,3,3), --Niclas Füllkrug
    (24,7,6.8,61,0,2,0,0.6,2,0,0.5,0,3,12,9,0,3,2), --Maximilian Philipp

    --(7,6,7.1,93,2,2,0,0,0,0,0,0,8,14,10,1,6,4), --Lee Buchanan
    --(1,7,), --Marco Friedl
    --(6,6,6,28,1,1,0,0,0,0,0,0,0,2,1,0,1,0), --Georg Margreitter
    --(10,1,), --Felix Agu
    --(12,7,), --Ilia Gruev
    (14,7,6.3,30,1,0,0,0,0,0,0,0,0,2,2,0,3,2), --Jean Manuel Mbom
    (13,7,6.1,46,0,2,0,0.8,2,0,0,0,2,4,3,0,4,2), --Jens Stage
    --(15,6,5.8,28,1,2,0,0,1,0,0,0,0,1,1,1,3,1), --Dikeni Salifou
    --(16,6,7,33,0,2,0,0.8,2,1,0.5,1,4,6,5,0,6,4), --Zidan Sertdemir
    --(22,6,8.8,48,2,1,2,1,3,1,0.5,0,4,6,6,1,5,3), --Oliver Burke
    (23,7,6,30,0,2,0,0,0,0,0,0,1,4,2,0,1,0) --Eren Dinkci

    --(2,1,), --Amos Pieper
    --(18,1,), --Leonardo Bittencourt
    --(21,1,), --Marvin Ducksch