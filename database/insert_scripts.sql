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

-- game2 log: away vs. vallecano
insert into games (fk_season_id, game_num, game_minutes, home_or_away, fk_opp_id, opp_goals, opp_xg, opp_poss_pct, opp_shots, opp_shots_on_targ, my_goals, my_xg, my_shots, my_shots_on_targ)
values (1, 2, 20,'away', '10', 2, 3.4, 57, 15, 8, 2, 2.8, 12, 4);

-- game2 log: away vs. vallecano
insert into player_stats_overall (
    fk_player_id,
    fk_game_id,
    rating,
    minutes,
    total_dist,
    sprint_dist)
values
    (2, 2, 7.1,92,4,0.1), -- Goalie: Mamardashvili
    (20, 2,6.2,92,10.3,2.7), -- Lino
    (24, 2,6.8, 72,6.7,1.4), -- Cavani
    (21, 2,6.2,64,6.7,1.7), -- Castillejo
    (15, 2,7.9,88,10.2,2.7), -- Musah
    (18, 2,7.0,92,10.2,2.2), --Almeida
    (14, 2,7.1,92,10.3,2.3), -- Guillamon
    (9, 2,7.0,92, 10.7,3.3), --gaya
    (4, 2,5.7,64,6.4,1.0), --Diakhaby
    (7, 2,6.7,92,9.2,1.5), -- Comert
    (12, 2, 7.5,88,10.4,2.9), -- Correia
    (19,2,6.0,28, 3.7,1.1), -- Kluivert
    (5, 2, 5.8, 28,2.9,0.5), -- Paulista
    (22, 2,5.8, 20,2.3,0.6), -- Duro
    (16, 2,6.0,4,0.4,0.1), -- Nico Gonzalez
    (13, 2,6.0,4,0.5,0.1); -- Foulquier

-- game2 log: away vs. vallecano
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
    (20, 2, 4,12,11,0.3,0,.8,0,0.8,4,2,0,0,0,0,4,8,5,0,2,0,0), -- Lino
    (24, 2,4,16,16,0.4,2,6,0,0.6,3,0,1,0.4,0,2,10,15,13,0,7,1,1), -- Cavani
    (21, 2,2,8,7,0.1,0,6,0,0,0,0,0,0,1,0,4,9,7,0,2,0,0), -- Castillejo
    (15, 2,8,24,23,0.6,4,8,1,0.9,1,1,0,0.3,1,5,12,25,19,0,4,0,0), -- Musah
    (18, 2,5,20,17,0.3,1,5,1,0.4,1,1,0,0.1,0,2,7,20,17,0,4,0,0), --Almeida
    (14, 2,4,18,14,0.3,3,2,0,0,1,0,0,0,0,0,10,17,14,0,0,0,0), -- Guillamon
    (9, 2,2,8,7,0.1,0,2,0,0,0,0,0,0,0,0,12,12,11,1,0,0,0), --gaya
    (4, 2,1,4,4,0.1,0,0,0,0,0,0,0,0,0,0,3,6,3,0,0,0,0), --Diakhaby
    (7, 2,3,14,11,0.2,0,2,0,0,0,0,0,0,0,0,3,14,11,1,0,0,0), -- Comert
    (12, 2,3,12,12,0.3,1,2,0,0,0,0,1,0.9,0,1,12,16,12,4,0,1,1), -- Correia
    (19,2,3,5,5,0.3,4,6,0,0.1,1,0,0,0,0,0,1,4,1,0,0,0,0), -- Kluivert
    (5, 2,0,2,1,0,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0), -- Paulista
    (22, 2,1,5,5,0.1,0,0,0,0,0,0,0,0,0,0,1,7,5,0,1,0,0), -- Duro
    (16, 2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), -- Nico Gonzalez
    (13, 2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); -- Foulquier


insert into player_stats_def (fk_player_id, fk_game_id, stand_tkl_att, stand_tkl_won, slide_tkl_att, slide_tkl_won, interceptions, blocks, clearances, off_duels_att, off_duels_won, def_duels_att, def_duels_won, air_duels_att, air_duels_won, beaten_by_opp, fouls_committed)
values
    (20, 2,2,0,0,0,1,0,0,4,3,2,0,1,0,2,0), -- Lino
    (24, 2,1,0,0,0,1,0,0,7,6,0,0,0,0,0,0), -- Cavani
    (21, 2,1,0,0,0,1,0,0,1,1,1,1,0,0,0,0), -- Castillejo
    (15, 2,3,2,1,0,2,0,0,9,7,6,3,2,1,2,0), -- Musah
    (18, 2,5,0,0,0,3,0,0,2,0,8,2,2,1,4,0), --Almeida
    (14, 2,5,1,3,2,6,2,0,6,2,13,6,4,1,4,0), -- Guillamon
    (9, 2,3,0,2,0,2,0,1,3,1,10,6,2,1,2,0), --gaya
    (4, 2,0,0,0,0,1,0,0,0,0,1,1,1,0,0,0), --Diakhaby
    (7, 2,2,0,0,0,8,1,0,4,3,5,2,2,1,2,0), -- Comert
    (12, 2,3,1,2,0,5,0,0,0,0,9,5,1,0,3,0), -- Correia
    (19,2,1,0,0,0,2,0,0,4,3,2,1,0,0,0,0), -- Kluivert
    (5, 2,0,0,1,0,1,0,0,2,1,1,0,0,0,1,0), -- Paulista
    (22, 2,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0), -- Duro
    (16, 2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), -- Nico Gonzalez
    (13, 2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); -- Foulquier
