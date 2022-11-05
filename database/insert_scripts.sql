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
-- game6 log: away vs. celta vigo
insert into games (fk_season_id, game_num, game_minutes, home_or_away, fk_opp_id, opp_goals, opp_xg, opp_poss_pct, opp_shots, opp_shots_on_targ, my_goals, my_xg, my_shots, my_shots_on_targ)
values (1, 6, 20,'away',11,2,4.7,48,18,13,1,2.9,18,9);

-- game6 log: away vs. celta vigo
insert into player_stats_overall (
    fk_player_id,
    fk_game_id,
    rating,
    minutes,
    total_dist,
    sprint_dist)
values
    (2, 6,8.0,92,3.9,0.1), -- Goalie: Mamardashvili
    (12,6,7.1,92,10.8,3.5), -- Correia
    (5, 6,6.7,92,9.7,1.7), -- Paulista
    (6,6,6.3,92,9.8,1.5), --ozkacar
    (11, 6,6.6,69,8.5,2.8), -- Lato
    (14, 6,6.8,92,9.6,1.7), -- Guillamon
    (15, 6,6.8,92,10.8,2.9), -- Musah
    (18,6,6.3,59,6.9,1.8), -- Andre Almeida
    (21, 6,6.4,69,8.2,2.0), -- Castillejo
    (24,6,7.2,92,9.0,1.8), -- Cavani
    (19,6,7.8,92,11.2,3.3), -- Kluivert

    --(4, 6,), --Diakhaby
    --(9, 6,), --gaya
    --(19,6,), -- Kluivert
    (10,6,6.4,23,2.5,0.8), -- vazquez
    (17,6,6.1,33,3.6,0.8), -- Iliax Moriba
    --(13,6,), -- Dmitri Foulquier
    --(7,6,), -- Comert
    --(12,6,), -- Correia
    --(16, 6,), -- Nico Gonzalez
    --(20, 6,), -- Lino
    (22, 6,6.1,23,2.3,0.5) -- Duro
    -- (23, 6,), -- Marcos Andre



-- game6 log: away vs. celta vigo
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
    (12,6,6,16,15,0.4,3,7,0,0,0,0,0,0,0,0,7,20,13,0,2,1,0), -- Correia
    (5, 6,3,10,8,0.2,1,1,0,0,0,0,0,0,0,0,3,12,10,1,0,0,0), -- Paulista
    (6,6,1,5,5,0,1,0,0,0,0,0,0,0,0,0,7,7,6,1,0,0,0), --ozkacar
    (11, 6,5,12,11,0.4,0,4,0,0,0,0,0,0.1,0,1,5,16,14,0,1,1,0), -- Lato
    (14, 6,4,17,17,0.3,1,0,0,0,0,0,0,0,0,1,5,20,18,0,1,0,0), -- Guillamon
    (15, 6,7,25,25,0.5,2,6,0,0.8,3,1,0,0.1,1,1,7,24,19,0,4,0,0), -- Musah
    (18,6,2,7,7,0.1,1,2,0,0,1,0,1,0.6,0,2,8,14,14,0,0,0,0), -- Andre Almeida
    (21, 6,3,7,7,0.3,3,2,0,0,0,0,0,0.6,0,1,2,7,5,0,2,1,1), -- Castillejo
    (24,6,3,14,13,0.2,1,1,1,1,5,4,0,0,0,1,3,16,14,0,3,0,0), -- Cavani
    (19,6,12,28,25,1.1,8,18,0,1,6,2,0,0.6,0,4,13,28,19,0,5,4,1), -- Kluivert

    --(4, 6,), --Diakhaby
    --(9, 6,), --gaya
    --(19,6,), -- Kluivert
    (10,6,0,2,2,0,0,1,0,0,0,0,0,0.3,0,1,4,3,1,0,0,1,1), -- vazquez
    (17,6,2,11,9,0.2,1,3,0,0,2,1,0,0.1,0,1,4,8,7,0,2,0,0), -- Iliax Moriba
    --(13,6,), -- Dmitri Foulquier
    --(7,6,), -- Comert
    --(12,6,), -- Correia
    --(16, 6,), -- Nico Gonzalez
    --(20, 6,), -- Lino
    (22, 6,1,7,7,0.1,0,1,0,0.1,1,1,0,0,0,1,1,6,3,0,2,0,0) -- Duro
    -- (23, 6,), -- Marcos Andre


-- game6 log: away vs. celta vigo
insert into player_stats_def (fk_player_id, fk_game_id, stand_tkl_att, stand_tkl_won, slide_tkl_att, slide_tkl_won, interceptions, blocks, clearances, off_duels_att, off_duels_won, def_duels_att, def_duels_won, air_duels_att, air_duels_won, beaten_by_opp, fouls_committed)
values
    (12,6,2,1,3,0,4,0,0,4,3,4,3,1,1,2,0), -- Correia
    (5, 6,3,2,1,0,4,0,0,4,2,9,6,2,1,5,0), -- Paulista
    (6, 6,4,0,4,0,2,1,0,1,1,9,2,0,0,3,2), --ozkacar
    (11, 6,1,0,2,0,1,0,0,3,2,5,2,3,2,3,0), -- Lato
    (14, 6,1,0,5,1,3,0,0,4,4,4,3,0,0,1,0), -- Guillamon
    (15, 6,2,1,0,0,0,0,0,6,4,2,2,4,1,1,0), -- Musah
    (18,6,1,0,2,0,0,1,0,2,1,4,3,3,1,1,1), -- Andre Almeida
    (21, 6,1,0,0,0,0,0,0,3,1,1,0,4,0,0,0), -- Castillejo
    (24,6,0,0,0,0,2,0,0,4,2,0,0,1,1,0,0), -- Cavani
    (19,6,3,1,0,0,3,0,0,13,8,3,3,5,2,0,0), -- Kluivert

    --(4, 6,), --Diakhaby
    --(9, 6,), --gaya
    --(19,6,), -- Kluivert
    (10,6,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0), -- vazquez
    (17,6,0,0,2,0,0,0,0,5,3,0,0,1,0,0,0), -- Iliax Moriba
    --(13,6,), -- Dmitri Foulquier
    --(7,6,), -- Comert
    --(12,6,), -- Correia
    --(16, 6,), -- Nico Gonzalez
    --(20, 6,), -- Lino
    (22, 6,0,0,0,0,1,0,0,2,0,0,0,0,0,0,0) -- Duro
    -- (23, 6,), -- Marcos Andre