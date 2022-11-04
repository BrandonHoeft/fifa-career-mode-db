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
-- game5 log: home vs. ca osasuna
insert into games (fk_season_id, game_num, game_minutes, home_or_away, fk_opp_id, opp_goals, opp_xg, opp_poss_pct, opp_shots, opp_shots_on_targ, my_goals, my_xg, my_shots, my_shots_on_targ)
values (1, 5, 20,'home',8,1,2.7,42,17,11,3,2.4,8,4);

-- game5 log: home vs. ca osasuna
insert into player_stats_overall (
    fk_player_id,
    fk_game_id,
    rating,
    minutes,
    total_dist,
    sprint_dist)
values
    (2, 5,7.5,92,4.5,0.2), -- Goalie: Mamardashvili
    (13,5,6.3,92,11.0,3.4), -- Dmitri Foulquier
    (9, 5,8.5,92, 11.2,3.7), --gaya
    (4, 5,7.0,92,9.8,1.6), --Diakhaby
    (5, 5,6.5,92,9.4,1.4), -- Paulista
    (14, 5,6.6,65,7.0,1.4), -- Guillamon
    (16, 5,6.7,86,10.1,2.1), -- Nico Gonzalez
    (18,5,7.7,92,10.7,2.8), -- Andre Almeida
    (21, 5,7.4,92,10.6,2.8), -- Castillejo
    (23, 5,6.5,71,6.8,1.6), -- Marcos Andre
    (20, 5,7.1,92,11,2.7), -- Lino

    --(24, 5,), -- Cavani
    --(19, 5), -- Kluivert
    --(17, 5,), -- Iliax Moriba
    (15, 5,6.5,27,3.1,0.7), -- Musah
    --(7,5,), -- Comert
    --(12,5), -- Correia
    --(16, 5), -- Nico Gonzalez
    (22, 5,5.9,21,1.8,0.5), -- Duro
    (11, 5,6.0,6,0.8,0.2); -- Lato

-- game5 log: home vs. ca osasuna
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
    (9, 5,6,15,14,0.4,1,2,0,0,0,0,1,1,0,2,10,15,13,1,2,1,1), --gaya
    (4, 5,3,8,7,0.2,0,2,0,0,0,0,0,0,0,0,4,11,7,1,1,0,0), --Diakhaby
    (5, 5,2,9,9,0.1,0,1,0,0,0,0,0,0,0,0,3,13,11,0,0,0,0), -- Paulista
    (13,5,4,11,10,0.3,2,1,0,0,0,0,0,0,0,0,4,12,10,0,0,0,0), -- Dmitri Foulquier
    (14, 5,7,23,22,04,1,3,0,0,0,0,0,0,0,0,8,22,21,1,2,0,0), -- Guillamon
    (16, 5,7,21,17,0.5,4,7,0,0,1,0,1,0.2,1,2,6,17,15,0,2,0,0), -- Nico Gonzalez
    (18,5,9,25,24,0.7,3,6,1,0.6,2,2,0,0.1,0,1,15,28,23,0,5,0,0), -- Andre Almeida
    (21, 5,4,10,10,0.3,2,6,1,1,1,1,0,0,0,0,4,10,4,0,1,1,0), -- Castillejo
    (23, 5,4,15,14,0.3,0,5,0,0.5,2,0,1,0.6,1,1,10,16,10,0,3,0,0), -- Marcos Andre
    (20, 5,4,12,10,0.3,0,2,1,0.3,2,1,0,0,0,0,3,9,6,0,2,1,0), -- Lino

    --(24, 5,), -- Cavani
    --(19, 5), -- Kluivert
    --(17, 5,), -- Iliax Moriba
    (15, 5,3,10,10,0.2,1,2,0,0,0,0,0,0,0,1,5,10,6,0,1,0,0), -- Musah
    --(7,5,), -- Comert
    --(12,5), -- Correia
    --(16, 5), -- Nico Gonzalez
    (22, 5,1,2,2,0.1,0,2,0,0,0,0,0,0,0,0,1,3,2,0,0,0,0), -- Duro
    (11, 5,1,1,1,0.1,0,2,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0); -- Lato


-- game5 log: home vs. ca osasuna
insert into player_stats_def (fk_player_id, fk_game_id, stand_tkl_att, stand_tkl_won, slide_tkl_att, slide_tkl_won, interceptions, blocks, clearances, off_duels_att, off_duels_won, def_duels_att, def_duels_won, air_duels_att, air_duels_won, beaten_by_opp, fouls_committed)
values
    (9, 5,4,2,0,0,2,1,0,5,4,6,5,1,0,0,0), --gaya
    (4, 5,2,1,4,1,3,1,1,2,2,9,5,5,2,2,0), --Diakhaby
    (5, 5,1,0,3,0,4,0,0,1,0,9,3,2,2,3,0), -- Paulista
    (13,5,2,1,2,1,2,1,1,4,2,4,2,2,1,2,0), -- Dmitri Foulquier
    (14, 5,5,1,2,0,3,0,1,2,1,9,4,2,1,4,0), -- Guillamon
    (16, 5,0,0,0,0,1,0,0,12,8,0,0,0,0,0,0), -- Nico Gonzalez
    (18,5,4,1,0,0,2,0,0,10,6,3,2,2,1,3,0), -- Andre Almeida
    (21, 5,0,0,1,0,1,0,0,2,2,1,0,2,0,0,0), -- Castillejo
    (23, 5,0,0,0,0,1,0,0,6,3,2,1,0,0,2,0), -- Marcos Andre
    (20, 5,0,0,1,0,0,0,1,6,2,2,0,3,2,1,0), -- Lino

    --(24, 5,), -- Cavani
    --(19, 5), -- Kluivert
    --(17, 5,), -- Iliax Moriba
    (15, 5,3,2,2,0,3,0,0,3,2,5,2,0,0,0,0), -- Musah
    --(7,5,), -- Comert
    --(12,5), -- Correia
    --(16, 5), -- Nico Gonzalez
    (22, 5,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0), -- Duro
    (11, 5,0,0,2,1,0,0,0,0,0,0,0,0,0,0,0); -- Lato