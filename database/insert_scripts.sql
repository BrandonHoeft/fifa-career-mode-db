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
-- game7 log: home vs. cadiz
insert into games (fk_season_id, game_num, game_minutes, home_or_away, fk_opp_id, opp_goals, opp_xg, opp_poss_pct, opp_shots, opp_shots_on_targ, my_goals, my_xg, my_shots, my_shots_on_targ)
values (1, 7, 20,'home',19,1,1.6,36,8,3,2,1.6,12,5);

-- game7 log: home vs. cadiz
insert into player_stats_overall (
    fk_player_id,
    fk_game_id,
    rating,
    minutes)
values
    (2, 7,7.1,92), -- Goalie: Mamardashvili
    (12,7,6.0,66), -- Correia
    (4, 7,7.5,92), --Diakhaby
    (7,7,7.6,92), -- Comert
    (9, 7,7,92), --gaya
    (14, 7,7.4,92), -- Guillamon
    (16, 7,6.8,92), -- Nico Gonzalez
    (18,7,6.7,92), -- Andre Almeida
    (20, 7,6.9,92), -- Lino
    (24,7,6.9,45), -- Cavani
    (19,7,6.2,66), -- Kluivert

    --(5, 7), -- Paulista
    --(6,7), --ozkacar
    --(11, 7), -- Lato
    --(19,7,), -- Kluivert
    --(10,7), -- vazquez
    --(17,7), -- Iliax Moriba
    --(15,7), -- Musah
    (13,7,6.1,26), -- Dmitri Foulquier
    (21,7,6.6,26), -- Castillejo
    --(22, 7) -- Duro
    (23, 7,6.2,47) -- Marcos Andre



-- game7 log: home vs. cadiz
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
    (12,7,4,10,10,0.3,0,3,0,0,0,0,0,0,0,0,3,11,6,0,3,1,1), -- Correia
    (4, 7,3,9,9,0.2,1,2,1,0.3,1,1,0,0,0,0,2,9,7,1,0,0,0), --Diakhaby
    (7,7,4,13,13,0.3,1,3,0,0,0,0,0,0,0,0,4,14,12,0,2,0,0), -- Comert
    (9, 7,7,21,21,0.5,2,6,0,0.2,1,0,0,0,0,1,5,24,17,0,1,4,0), --gaya
    (14, 7,12,28,26,0.9,4,11,0,0,0,0,0,0,0,0,19,29,24,0,1,1,0), -- Guillamon
    (16, 7,6,23,22,0.4,0,5,0,0,0,0,0,0.2,1,4,14,25,23,0,6,0,0), -- Nico Gonzalez
    (18,7,8,22,20,0.6,1,7,0,0,0,0,0,0,0,0,6,23,20,2,3,0,0), -- Andre Almeida
    (20, 7,4,14,12,0.3,0,8,0,0.3,3,1,1,0.2,0,2,4,11,10,0,5,0,0), -- Lino
    (24,7,3,10,9,0.2,0,4,1,0.6,2,1,0,0,0,2,0,8,5,0,2,0,0), -- Cavani
    (19,7,3,9,8,0.2,0,6,0,0.2,2,1,0,0,0,1,6,9,6,0,3,1,0), -- Kluivert

    --(5, 7), -- Paulista
    --(6,7), --ozkacar
    --(11, 7), -- Lato
    --(19,7,), -- Kluivert
    --(10,7), -- vazquez
    --(17,7), -- Iliax Moriba
    --(15,7), -- Musah
    (13,7,1,3,3,0,0,0,0,0,0,0,0,0.1,0,1,1,3,2,0,1,0,0), -- Dmitri Foulquier
    (21,7,4,10,9,0.4,1,8,0,0,2,1,0,0,0,0,2,7,5,0,0,0,0), -- Castillejo
    --(22, 7) -- Duro
    (23, 7,3,10,9,0.2,0,4,0,0,1,0,0,0,0,0,5,9,8,0,4,0,0) -- Marcos Andre


-- game7 log: home vs. cadiz
insert into player_stats_def (fk_player_id, fk_game_id, stand_tkl_att, stand_tkl_won, slide_tkl_att, slide_tkl_won, interceptions, blocks, clearances, off_duels_att, off_duels_won, def_duels_att, def_duels_won, air_duels_att, air_duels_won, beaten_by_opp, fouls_committed)
values
    (12,7,1,0,1,0,2,0,0,2,0,1,0,0,0,1,0), -- Correia
    (4, 7,2,1,1,0,2,0,0,2,1,8,6,2,1,3,0), --Diakhaby
    (7,7,3,3,3,1,2,1,0,2,2,4,3,2,0,0,1), -- Comert
    (9, 7,1,0,2,0,4,0,0,3,2,8,5,0,0,4,0), --gaya
    (14, 7,7,0,0,0,1,1,1,8,4,11,4,1,1,1,0), -- Guillamon
    (16, 7,2,0,0,0,3,0,0,4,2,2,0,1,1,1,0), -- Nico Gonzalez
    (18,7,3,1,0,0,1,0,0,6,1,4,4,1,0,2,0), -- Andre Almeida
    (20, 7,2,0,0,0,1,0,0,6,3,3,2,2,1,2,0), -- Lino
    (24,7,0,0,0,0,0,0,0,05,2,2,2,1,0,0,0), -- Cavani
    (19,7,0,0,2,0,0,0,0,2,2,4,1,1,0,2,0), -- Kluivert

    --(5, 7), -- Paulista
    --(6,7), --ozkacar
    --(11, 7), -- Lato
    --(19,7,), -- Kluivert
    --(10,7), -- vazquez
    --(17,7), -- Iliax Moriba
    --(15,7), -- Musah
    (13,7,1,0,1,0,0,0,0,1,1,2,0,1,0,1,0), -- Dmitri Foulquier
    (21,7,1,1,1,0,1,0,0,3,2,1,1,0,0,0,0), -- Castillejo
    --(22, 7) -- Duro
    (23, 7,0,0,0,0,0,0,1,6,4,0,0,1,1,0,0) -- Marcos Andre