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
-- game log 4: home vs man united
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
    (1,4,16,'home',15,2,4.7,50,19,1,1.8,10);

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
    (10,4,6.8,94,1,2,0,0,0,0,0,0,0,0,5,14,13,2,1,0,0,0,0,1,3,1,0,0), -- Emerson Royal
    (4,4,7.1,94,7,3,1,0,0,1,0,0,0,0,11,13,11,4,0,0,0,3,2,3,11,8,1,1), -- Cristian Romero
    (5,4,6.6,94,5,5,3,0,0,0,0,0,0,0,7,13,8,4,1,0,0,0,0,3,15,6,1,0), -- Eric Dier
    (9,4,6.3,94,4,3,2,0,0,0,0,0,0,0,1,10,6,1,0,0,0,2,1,6,4,1,3,2), -- Ben Davies
    (14,4,6.3,71,3,3,1,0,0,0,0,0,0,0,1,7,3,1,1,1,0,0,0,3,4,1,1,1), -- Ivan Perisic
    (16,4,6.6,94,3,1,1,0,0,0,0,0.05,0,1,6,19,17,2,2,0,0,7,2,1,13,8,0,0), -- Hojberg
    (17,4,5.9,84,2,5,1,0,0.4,2,0,0,0,1,4,18,15,1,0,0,0,1,0,2,8,3,0,0), -- Bentancur
    (25,4,6,56,0,2,1,0,0.2,2,0,0,0,0,0,3,2,0,0,1,0,1,1,0,6,3,1,0), -- Richarlison
    (24,4,6.8,94,1,5,1,0,0.5,2,0,0.15,0,3,6,14,10,6,2,0,0,0,0,2,3,2,1,1), -- Kane
    (20,4,7.3,94,0,5,1,1,0.2,2,0,0.8,0,1,5,6,3,0,0,0,0,0,0,0,6,3,1,0), -- Son

    --(6,4), -- Davinson Sanchez
    --(7,3,7.4,93,7,1,1,0,0,0,0,0,0,0,7,22,19,4,1,0,0,7,5,1,12,11,2,2), -- Clement Lenglet

    --(11,3,5.9,69,3,4,1,0,0.1,1,0,0,0,0,3,10,8,4,1,2,0,4,2,1,11,5,1,0), -- Doherty

    --(12,), -- Djed Spence
    (13,4,6.5,23,0,0,0,0,0,0,0,0.3,0,1,3,4,4,1,1,0,0,0,0,0,1,1,0,0), -- Ryan Sessegnon
    --(15,4), -- Skipp
    (18,4,6,38,0,1,0,0,0.4,1,0,0,0,0,1,3,2,0,0,0,0,0,0,0,3,1,0,0), -- Bissouma
    (21,4,5.9,10,0,1,0,0,0,0,0,0,0,0,1,3,2,1,1,0,0,0,0,0,2,1,0,0); -- Gil
    --(23,), -- Lucas Moura
    --(22,3,5.9,22,0,3,0,0,0.5,1,0,0,0,0,2,3,1,0,0,0,0,1,0,1,1,0,0,0); -- Deki