--  query templates for loading tables
insert into leagues (name)
values
    ('La Liga'),
    ('Copa Del Rey');

insert into teams (name)
values ('Valencia CF'),
       ('Real Madrid'),
       ('Barcelona'),
       ('Athletic Club'),
       ('Atletico Madrid'),
       ('Real Betis'),
       ('Real Sociedad'),
       ('Osasuna'),
       ('Villarreal'),
       ('Rayo Vallecano'),
       ('Celta Vigo'),
       ('Mallorca'),
       ('Girona'),
       ('Almería'),
       ('Real Valladolid'),
       ('Getafe'),
       ('Sevilla'),
       ('Espanyol'),
       ('Cádiz'),
       ('Elche');

insert into seasons (fk_league_id, fk_team_id, year) values (1, 1, 2022);

insert into players (fk_team_id, first_name, last_name, birthday, primary_pos, second_pos)
values
    (1, 'Jaume', 'Doménech', '1990-11-05', 'GK', NULL),
    (1, 'Giorgi', 'Mamardashvili', '2000-09-29', 'GK', NULL),
    (1, 'Cristian', 'Rivero', '1998-03-28', 'GK', NULL),
    (1, 'Mouctar', 'Diakhaby', '1996-12-16', 'CB', NULL),
    (1, 'Gabriel', 'Paulista', '1990-11-26', 'CB', NULL),
    (1, 'Cenk', 'Özkacar', '2000-10-06', 'CB', NULL),
    (1, 'Eray', 'Cömert', '1998-02-04', 'CB', NULL),
    (1, 'Cristhian', 'Mosquera', '2004-06-27', 'CB', NULL),
    (1, 'José', 'Gayà', '1995-05-25','LB', 'LWB'),
    (1, 'Jesús', 'Vázquez', '2003-01-02', 'LB', NULL),
    (1, 'Toni', 'Lato', '1997-11-21', 'LB', 'LM'),
    (1, 'Thierry', 'Correia', '1999-03-09', 'RB', 'RWB'),
    (1, 'Dimitri', 'Foulquier', '1993-03-23', 'RB', NULL),
    (1, 'Hugo', 'Guillamón', '2000-01-31', 'CDM', 'CM'),
    (1, 'Yunus', 'Musah', '2002-11-29', 'CM', 'CDM'),
    (1, 'Nico', 'González', '2002-01-03', 'CM', 'CDM'),
    (1, 'Ilaix', 'Moriba', '2003-01-19', 'CM', NULL),
    (1, 'André', 'Almeida', '2000-05-30', 'CM', 'CAM'),
    (1, 'Justin', 'Kluivert', '1999-05-05', 'LW', 'RW'),
    (1, 'Samuel', 'Lino', '1999-12-23', 'LW', 'ST'),
    (1, 'Samu', 'Castillejo', '1995-01-18', 'RW', 'LW'),
    (1, 'Hugo', 'Duro', '1999-11-10', 'ST', 'RW'),
    (1, 'Marcos', 'André', '1996-10-20', 'ST', 'LW'),
    (1, 'Edinson', 'Cavani', '1987-02-14', 'ST', NULL),
    (1, 'Koba', 'Koindredi', '2001-10-27', 'CM', NULL),
    (1, 'Uroš', 'Račić', '1998-03-17', 'CM', 'CDM'),
    (1, 'Tiago', 'Ribeiro', '2002-03-14', 'CDM', NULL),
    (1, 'Pablo', 'Gozálbez', '2001-04-30', 'CAM', 'CM'),
    (1, 'Vicente', 'Esquerdo', '1999-01-02', 'CM', NULL),
    (1, 'Jorge', 'Sáenz', '1996-11-17', 'CB', NULL);

--------------------------------------------------------------------------------
-- game4 log: away vs. ud almeria
insert into games (fk_season_id, game_num, game_minutes, home_or_away, fk_opp_id, opp_goals, opp_xg, opp_poss_pct, opp_shots, opp_shots_on_targ, my_goals, my_xg, my_shots, my_shots_on_targ)
values (1, 4, 20,'away',14,1,3.1,45,12,8,3,6,18,8);

-- game4 log: away vs. ud almeria
insert into player_stats_overall (
    fk_player_id,
    fk_game_id,
    rating,
    minutes,
    total_dist,
    sprint_dist)
values
    (2, 4, 7.5,92,4.2,0.2), -- Goalie: Mamardashvili
    (9, 4, 8.1,92,11.3,4.2), --gaya
    (4, 4,6.9,92,9.6,1.6), --Diakhaby
    (7,4,6.9,92,10,1.8), -- Comert
    (12,4,7.5,92,10.8,3.3), -- Correia
    (14, 4,7.4,92,10,1.9), -- Guillamon
    (15, 4, 7.1,92,10.9,2.8), -- Musah
    (17, 4,6.3,70,8.2,2.3), -- Iliax Moriba
    (19,4,7.3,70,8.3,2.4), -- Kluivert
    (24, 4,7.2,57,5.6,1.1), -- Cavani
    (20, 4,7.6,92,10.9,3.2), -- Lino


    --(21, 4), -- Castillejo
    (16, 4,5.9,22,2.8,0.7), -- Nico Gonzalez
    --(5, 4), -- Paulista
    --(22, 4,), -- Duro
    (23, 4,7.0,35,3.6,0.8), -- Marcos Andre
    (11, 4,6.0,22,3.3,1.5); -- Lato

-- game4 log: away vs. ud almeria
insert into player_stats_off (
    fk_player_id,
    fk_game_id,
    possession_pct,
    dribble_att,
    dribble_compl,
    dribble_dist,
    dribble_beat,
    dribble_knock_on,
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
    lobs_compl,
    through_balls_compl,
    crosses_att,
    crosses_compl)
values
    (9, 4, 6,18,18,0.5,0,5,0,0,0,0,0,1.2,0,5,18,21,18,0,3,4,2), --gaya
    (4, 4,3,10,10,0.2,1,0,0,0,0,0,0,0,0,0,5,13,12,1,0,0,0), --Diakhaby
    (7,4,2,11,11,0.2,1,0,0,0,0,0,0,0,0,0,5,15,12,0,0,0,0), -- Comert
    (12,4,4,16,14,0.3,0,6,0,0.2,1,1,0,0,0,0,5,15,13,1,2,1,0), -- Correia
    (14, 4,6,23,19,0.4,4,6,0,0,0,0,0,0,0,0,15,23,21,1,1,0,0), -- Guillamon
    (15, 4,5,18,18,0.4,4,5,0,0.5,1,1,0,0.3,0,2,10,20,19,0,4,1,1), -- Musah
    (17, 4,6,21,20,0.4,1,9,0,0.4,2,1,0,0.3,0,2,11,21,14,0,3,4,0), -- Iliax Moriba
    (19,4,2,8,7,0.2,0,4,1,1.2,2,1,1,0.9,0,3,9,13,8,0,1,1,0), -- Kluivert
    (24, 4,5,13,11,0.3,1,8,1,1.6,3,2,0,0.8,1,2,5,12,9,1,4,0,0), -- Cavani
    (20, 4,7,18,15,0.6,3,12,0,0.5,6,1,1,1,0,1,11,14,13,0,3,1,1), -- Lino


    --(21, 4), -- Castillejo
    (16, 4,1,6,5,0.1,0,2,0,0.2,1,0,0,0,0,1,7,5,5,0,1,1,1), -- Nico Gonzalez
    --(5, 4), -- Paulista
    --(22, 4,), -- Duro
    (23, 4,2,6,4,0.1,0,1,1,1.5,2,1,0,0,0,0,0,5,5,0,0,0,0), -- Marcos Andre
    (11, 4,1,4,3,0.1,0,1,0,0,0,0,0,0,0,0,1,3,3,0,0,0,0); -- Lato


-- game4 log: away vs. ud almeria
insert into player_stats_def (fk_player_id, fk_game_id, stand_tkl_att, stand_tkl_won, slide_tkl_att, slide_tkl_won, interceptions, blocks, clearances, off_duels_att, off_duels_won, def_duels_att, def_duels_won, air_duels_att, air_duels_won, beaten_by_opp, fouls_committed)
values
    (9,4,1,1,2,0,2,0,0,2,1,4,1,0,0,3,1), --gaya
    (4,4,1,1,0,0,1,0,0,1,0,3,1,2,1,1,0), --Diakhaby
    (7,4,6,1,2,0,3,0,0,1,1,5,1,1,1,2,0), -- Comert
    (12,4,1,1,1,1,2,0,0,2,1,2,1,0,0,0,0), -- Correia
    (14,4,4,2,1,1,3,0,0,8,3,8,7,4,13,0,0), -- Guillamon
    (15,4,3,1,0,0,1,0,0,3,3,4,3,1,0,1,0), -- Musah
    (17,4,1,0,0,0,4,0,0,9,5,1,0,1,0,4,0), -- Iliax Moriba
    (19,4,1,0,0,0,0,0,0,2,0,0,0,1,0,1,0), -- Kluivert
    (24,4,0,0,0,0,1,0,0,6,3,4,2,1,0,1,0), -- Cavani
    (20,4,1,0,0,0,2,0,0,8,6,2,1,3,1,0,0), -- Lino


    --(21, 4), -- Castillejo
    (16, 4,2,1,0,0,0,0,0,2,0,1,1,0,0,1,0), -- Nico Gonzalez
    --(5, 4), -- Paulista
    --(22, 4,), -- Duro
    (23, 4,1,0,0,0,0,0,0,3,0,3,1,2,1,1,0), -- Marcos Andre
    (11, 4,0,0,0,0,0,0,0,1,0,1,1,0,0,1,0); -- Lato