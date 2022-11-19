--  query templates for loading tables
insert into leagues (name)
values
    ('Premier League'),
    ('EFL Cup'),
    ('FA Cup'),
    ('Champions League'),
    ('Europa League'),
    ('Europa Conference League');

insert into teams (name)
values ('Tottenham Hotspur'),
       ('Arsenal'),
       ('Aston Villa'),
       ('Bournemouth'),
       ('Brentford'),
       ('Brighton & Hove Albion'),
       ('Chelsea'),
       ('Crystal Palace'),
       ('Everton'),
       ('Fulham'),
       ('Leeds United'),
       ('Leicester City'),
       ('Liverpool'),
       ('Manchester City'),
       ('Manchester United'),
       ('Newcastle United'),
       ('Nottingham Forest'),
       ('Southampton'),
       ('West Ham United'),
       ('Wolverhampton Wanderers'),
       ('Marseille'),
       ('Eintracht Franfurt'),
       ('Sporting CP');

insert into seasons (fk_league_id, fk_team_id, year) values (1, 1, 2022);

insert into players (fk_team_id, first_name, last_name, birthday, primary_pos, second_pos)
values
    (1, 'Hugo', 'Lloris', '1986-12-26', 'GK', NULL),
    (1, 'Fraser', 'Forster', '1988-03-17', 'GK', NULL),
    (1, 'Brandon', 'Austin', '1999-01-08', 'GK', NULL),
    (1, 'Cristian', 'Romero', '1998-04-27', 'CB', NULL),
    (1, 'Eric', 'Dier', '1994-01-15', 'CB', NULL),
    (1, 'Davinson', 'Sánchez', '1996-06-12', 'CB', NULL),
    (1, 'Clément', 'Lenglet', '1995-06-17', 'CB', NULL),
    (1, 'Japhet', 'Tanganga', '1999-03-31', 'CB', 'RB'),
    (1, 'Ben', 'Davies', '1993-04-24','CB', 'LB'),
    (1, 'Emerson', 'Royal', '1999-01-14', 'RWB', 'RB'),
    (1, 'Matt', 'Doherty', '1992-01-16', 'RWB', 'LWB'),
    (1, 'Djed', 'Spence', '2000-08-09', 'RWB', 'RB'),
    (1, 'Ryan', 'Sessegnon', '2000-05-18', 'LWB', 'LW'),
    (1, 'Ivan', 'Perisic', '1989-02-02', 'LWB', 'LM'),
    (1, 'Oliver', 'Skipp', '2000-09-16', 'CDM', 'CM'),
    (1, 'Pierre-Emile', 'Höjbjerg', '1995-08-5', 'CM', 'CDM'),
    (1, 'Rodrigo', 'Bentancur', '1997-06-25', 'CM', 'CDM'),
    (1, 'Yves', 'Bissouma', '1996-08-30', 'CDM', 'CM'),
    (1, 'Pape Matar', 'Sarr', '2002-09-14', 'CM', 'CDM'),
    (1, 'Heung-Min', 'Son', '1992-07-08', 'LW', 'ST'),
    (1, 'Bryan', 'Gil', '2001-02-11', 'RW', 'LW'),
    (1, 'Dejan', 'Kulusevski', '2000-04-25', 'RW', 'CAM'),
    (1, 'Lucas', 'Moura', '1992-08-23', 'RW', 'LW'),
    (1, 'Harry', 'Kane', '1993-07-28', 'ST', 'CAM'),
    (1, 'Richarlison', 'de Andrade', '1997-05-10', 'ST', 'LW'),
    (1, 'Alfie', 'Devine', '2004-08-01', 'CAM', 'LW'),
    (1, 'Harvey', 'White', '2001-09-19', 'CDM', 'CM'),
    (1, 'Dane', 'Scarlett', '2004-03-24', 'ST', NULL),
    (1, 'Troy', 'Parrott', '2002-02-04', 'ST', 'RM'),
    (1, 'Destiny', 'Udogie', '2002-11-28', 'LWB', 'LM'),
    (1, 'Sergio', 'Reguilón', '1996-12-16', 'LWB', 'LB'),
    (1, 'Joe', 'Rodon', '1997-10-22', 'CB', NULL),
    (1, 'Giovani', 'Lo Celso', '1996-04-09', 'CAM', 'LM'),
    (1, 'Tanguy', 'Ndombèlé', '1996-12-28', 'CM', 'CAM'),
    (1, 'Alfie', 'Whiteman', '1998-10-02', 'GK', NULL),
    (1, 'Harry', 'Winks', '1996-02-02', 'CM', 'CDM');


insert into standings_snapshot (fk_season_id, fk_team_id, standings_as_of, points)
values
    (1, 1, '2022-08-01', 0), -- Tottenham
    (1, 2, '2022-08-01', 0), -- Arsenal
    (1, 3, '2022-08-01', 0), -- Aston Villa
    (1, 4, '2022-08-01', 0), -- Bournemouth
    (1, 5, '2022-08-01', 0), -- Brentford
    (1, 6, '2022-08-01', 0), -- Brighton & Hove Albion
    (1, 7, '2022-08-01', 0), -- Chelsea
    (1, 8, '2022-08-01', 0), -- Crystal Palace
    (1, 9, '2022-08-01', 0), -- Everton
    (1, 10, '2022-08-01', 0), -- Fulham
    (1, 11, '2022-08-01', 0), -- Leeds United
    (1, 12, '2022-08-01', 0), -- Leicester City
    (1, 13, '2022-08-01', 0), -- Liverpool
    (1, 14, '2022-08-01', 0), -- Manchester City
    (1, 15, '2022-08-01', 0), -- Manchester United
    (1, 16, '2022-08-01', 0), -- Newcastle United
    (1, 17, '2022-08-01', 0), -- Nottingham Forest
    (1, 18, '2022-08-01', 0), -- Southampton
    (1, 19, '2022-08-01', 0), -- West Ham United
    (1, 20, '2022-08-01', 0); -- Wolverhampton Wanderers



--------------------------------------------------------------------------------
-- game1 log: Away vs. Brighton & Hove Albion
insert into games (fk_season_id, game_num, game_minutes, home_or_away, fk_opp_id, opp_goals, opp_xg, opp_poss_pct, opp_shots, opp_shots_on_targ, my_goals, my_xg, my_shots, my_shots_on_targ)
values (1, 1, 20,'away',6,1,3.2,42,17,7,2,2.7,11,7);

-- game1 log: Away vs. Brighton & Hove Albion
insert into player_stats_overall (
    fk_player_id,
    fk_game_id,
    rating,
    minutes,
    possession_won,
    possession_lost)
values
    (10,1,7.8,79,5,1), -- Emerson Royal
    (4,1,6.3,73,4,1), -- Cristian Romero
    (5,1,6.6,93,4,2), -- Eric Dier
    (9,1,6.6,79,2,1), -- Ben Davies
    (14,1,7.8,93,5,5), -- Ivan Perisic
    (16,1,7,93,3,4), -- Hojberg
    (17,1,7.1,93,2,7), -- Bentancur
    (20,1,6.5,93,1,8), -- Son
    (24,1,7.4,93,0,8), -- Kane
    (22,1,6.8,73,0,3), -- Deki

    (6,1,5.8,20,2,1), -- Davinson Sanchez
    (7,1,6.4,14,1,0), -- Clement Lenglet
    (11,1,6.8,14,0,1), -- Doherty
--     (12,), -- Djed Spence
--     (13,), -- Ryan Sessegnon
--     (15,), -- Skipp
--     (18,), -- Bissouma
--     (21,), -- Gil
--     (23,), -- Lucas Moura
    (25,1,6.4,20,1,1); -- Richarlison

-- game1 log: Away vs. Brighton & Hove Albion
insert into player_stats_off (
    fk_player_id,
    fk_game_id,
    possession_pct,
    dribble_beat,
    goals,
    non_pen_xg,
    shots,
    shots_on_targ,
    assists,
    xa,
    second_assists,
    key_passes,
    players_beat_by_passes,
    passes_att,
    passes_compl,
    passes_compl_press,
    lobs_compl,
    through_balls_compl,
    crosses_att,
    crosses_compl)
values
    (10,1,5,2,0,0,0,0,0,0.2,0,1,7,18,16,4,0,1,3,1), -- Emerson Royal
    (4,1,2,0,0,0,0,0,0,0,0,0,1,9,8,1,0,0,0,0), -- Cristian Romero
    (5,1,3,0,0,0,0,0,0,0,0,0,4,14,12,0,0,0,0,0), -- Eric Dier
    (9,1,3,0,0,0,0,0,0,0,0,0,3,13,12,1,0,0,1,0), -- Ben Davies
    (14,1,5,0,0,0,1,1,0,0.1,0,2,14,26,22,2,0,2,1,0), -- Ivan Perisic
    (16,1,7,0,0,0,0,0,1,0.2,1,2,10,22,19,5,0,2,0,0), -- Hojberg
    (17,1,9,2,0,0.8,2,1,0,0.5,0,1,12,29,26,4,0,4,0,0), -- Bentancur
    (20,1,6,1,0,0.2,3,1,0,0,0,1,4,18,16,2,1,3,1,0), -- Son
    (24,1,5,1,1,1.2,2,2,0,0.3,1,1,8,21,17,4,1,7,0,0), -- Kane
    (22,1,4,0,1,0.6,3,2,0,0,0,1,6,13,12,5,1,3,0,0), -- Deki

    (6,1,0,0,0,0,0,0,0,0,0,0,3,3,2,1,0,0,0,0), -- Davinson Sanchez
    (7,1,2,0,0,0,0,0,0,0,0,0,1,3,3,0,0,0,0,0), -- Clement Lenglet
    (11,1,3,0,0,0,0,0,1,0.7,0,2,4,6,4,2,0,0,1,0), -- Doherty
--     (12,), -- Djed Spence
--     (13,), -- Ryan Sessegnon
--     (15,), -- Skipp
--     (18,), -- Bissouma
--     (21,), -- Gil
--     (23,), -- Lucas Moura
    (25,1,1,1,0,0,0,0,0,0,0,0,3,4,3,0,0,1,0,0); -- Richarlison


-- game1 log: Away vs. Brighton & Hove Albion
insert into player_stats_def (
    fk_player_id,
    fk_game_id,
    tackle_att, -- standing + sliding
    tackle_won, -- standing + sliding
    interceptions,
    blocks,
    clearances,
    offsides_caused,
    duels_att, -- off + def duels att
    duels_won, -- off + def duels won
    air_duels_att,
    air_duels_won,
    beaten_by_opp)
values
    (10,1,2,2,3,0,0,0,6,2,2,2,0), -- Emerson Royal
    (4,1,2,0,2,2,0,0,6,2,2,1,1), -- Cristian Romero
    (5,1,2,1,4,0,0,0,6,3,3,2,3), -- Eric Dier
    (9,1,1,0,1,0,2,0,7,4,4,3,1), -- Ben Davies
    (14,1,5,3,2,0,0,0,8,3,1,1,2), -- Ivan Perisic
    (16,1,6,2,1,0,0,0,11,7,1,0,2), -- Hojberg
    (17,1,7,1,3,1,0,0,15,5,1,0,2), -- Bentancur
    (20,1,0,0,1,0,0,0,8,3,2,0,2), -- Son
    (24,1,2,0,0,0,0,0,9,2,0,0,0), -- Kane
    (22,1,0,0,0,0,0,0,6,4,1,1,0), -- Deki

    (6,1,1,0,3,0,0,0,2,1,1,1,0), -- Davinson Sanchez
    (7,1,1,1,0,0,0,1,1,0,0,0,0), -- Clement Lenglet
    (11,1,1,0,0,0,0,0,3,1,1,1,1), -- Doherty
--     (12,), -- Djed Spence
--     (13,), -- Ryan Sessegnon
--     (15,), -- Skipp
--     (18,), -- Bissouma
--     (21,), -- Gil
--     (23,), -- Lucas Moura
    (25,1,1,0,0,0,1,0,1,0,1,1,0); -- Richarlison