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


insert into standings_snapshot (fk_season_id, fk_team_id, standings_as_of, points, goal_diff)
values
    (1, 1, '2022-08-21', 6, 4), -- Tottenham
    (1, 2, '2022-08-21', 6, 4), -- Arsenal
    (1, 3, '2022-08-21', 6, 4), -- Aston Villa
    (1, 4, '2022-08-21', 0, -3), -- Bournemouth
    (1, 5, '2022-08-21', 1, -3), -- Brentford
    (1, 6, '2022-08-21', 3, 0), -- Brighton & Hove Albion
    (1, 7, '2022-08-21', 4, 2), -- Chelsea
    (1, 8, '2022-08-21', 1, -1), -- Crystal Palace
    (1, 9, '2022-08-21', 0, -5), -- Everton
    (1, 10, '2022-08-21', 2, 0), -- Fulham
    (1, 11, '2022-08-21', 1, -2), -- Leeds United
    (1, 12, '2022-08-21', 1, -2), -- Leicester City
    (1, 13, '2022-08-21', 3, 1), -- Liverpool
    (1, 14, '2022-08-21', 6, 4), -- Manchester City
    (1, 15, '2022-08-21', 3, 0), -- Manchester United
    (1, 16, '2022-08-21', 1, -1), -- Newcastle United
    (1, 17, '2022-08-21', 3, -1), -- Nottingham Forest
    (1, 18, '2022-08-21', 4, 1), -- Southampton
    (1, 19, '2022-08-21', 3, -1), -- West Ham United
    (1, 20, '2022-08-21', 1, -1); -- Wolverhampton Wanderers


--------------------------------------------------------------------------------
-- game log 6: away vs Man City
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
    (1,6,18,'away',14,1,2.9,56,16,2,1.4,9);

insert into player_stats (
    fk_player_id,
    fk_game_id,
    rating,
    minutes,
    poss_won,
    poss_lost,
    dribble_beat,
    goals,
    non_pen_xg,
    shots,
    assists,
    xa,
    second_assists,
    key_passes,
    players_beat_passes,
    passes_att,
    passes_compl,
    passes_compl_press,
    through_balls_compl,
    crosses_att,
    crosses_compl,
    tackles_att,
    tackles_won,
    intrcpts_blocks_clears,
    duels_att,
    duels_won,
    air_duels_att,
    air_duels_won
)
values
    (10,6,7.1,93,6,8,2,0,0,0,0,0,0,0,4,22,15,4,1,1,0,1,1,3,15,5,1,0), -- Emerson Royal
    (4,6,6.8,93,3,5,4,0,0,0,0,0,0,0,7,27,24,4,1,0,0,4,2,3,10,3,0,0), -- Cristian Romero
    (5,6,6.4,81,6,2,0,0,0,0,0,0,0,0,6,15,13,2,1,0,0,5,1,4,12,5,0,0), -- Eric Dier
    (7,6,6.9,93,3,2,1,0,0,0,0,0,0,1,11,16,14,3,3,0,0,1,1,3,7,2,1,0), -- Clement Lenglet
    (13,6,6.9,93,1,1,1,0,0.2,1,0,0,0,0,3,4,4,0,1,0,0,3,1,0,5,2,0,0), -- Ryan Sessegnon
    (16,6,7.2,81,4,2,2,1,0.2,1,0,0,0,0,4,16,15,4,2,0,0,5,1,2,17,10,0,0), -- Hojberg
    (17,6,6.6,93,2,5,3,0,0.15,3,0,0,1,0,7,18,15,8,3,0,0,3,0,1,17,10,2,1), -- Bentancur
    (25,6,5.9,67,0,3,1,0,0,0,0,0,0,0,2,9,6,3,2,0,0,1,0,0,4,0,0,0), -- Richarlison
    (24,6,6.3,93,0,6,0,0,0.5,3,1,0.1,0,2,4,10,9,2,2,0,0,5,0,0,14,7,3,1), -- Kane
    (20,6,7.6,93,2,2,0,1,0.3,1,1,0.2,0,3,7,9,6,0,0,2,1,1,0,1,6,1,2,0), -- Son

    (6,6,5.9,12,1,1,1,0,0,0,0,0,0,0,2,3,3,0,0,0,0,1,1,0,3,2,0,0), -- Davinson Sanchez
    --(9,5,7.2,92,6,2,3,0,0.05,2,0,0.1,0,1,7,12,11,2,1,0,0,6,4,3,12,8,1,0), -- Ben Davies
    (14,6,6,26,0,1,2,0,0,0,0,0.05,0,1,2,4,3,3,1,0,0,1,0,0,4,3,0,0), -- Ivan Perisic

    --(11,5,6.5,47,0,2,2,0,0,0,0,0,0,0,5,12,10,5,3,1,0,0,0,0,7,4,0,0), -- Doherty

    --(12,), -- Djed Spence
    --(18,5,7.1,92,7,4,2,0,0,1,0,0.3,0,2,10,24,21,8,2,1,1,3,3,2,8,5,3,3), -- Bissouma
    (15,6,5.8,12,0,0,0,0,0,0,0,0,0,0,0,4,4,0,1,0,0,0,0,0,0,0,0,0); -- Skipp
    --(23,6,); -- Lucas Moura
    --(21,5,6.0,24,0,2,2,0,0.4,2,0,0,0,0,0,3,3,0,1,0,0,0,0,0,5,4,1,0), -- Gil
    --(22,3,5.9,22,0,3,0,0,0.5,1,0,0,0,0,2,3,1,0,0,0,0,1,0,1,1,0,0,0); -- Deki