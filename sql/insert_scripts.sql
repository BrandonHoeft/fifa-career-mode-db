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


insert into games (fk_season_id, game_num, game_minutes, home_or_away, fk_opp_id, opp_goals, opp_xg, opp_poss_pct, opp_shots, opp_shots_on_targ, my_goals, my_xg, my_shots, my_shots_on_targ)
values (1, 1, 8,'home', '13', 1, 3.8, 54, 16, 13, 3, 1.8, 9, 4);


insert into player_stats_overall (
    fk_player_id,
    fk_game_id,
    rating,
    minutes,
    total_dist,
    sprint_dist)
values
    (2, 1, 8.1, 93, 1, 0), -- Goalie: Mamardashvili
    (20, 1, 7, 93, 10.3, 2), -- Lino
    (22, 1, 7.3, 27, 2.6, 0.7), -- Duro
    (24, 1, 7.4, 66, 6.8, 1.3), -- Cavani
    (11, 1, 5.9, 12, 1.2, 0.5), -- Lato
    (21, 1, 7.4, 81, 9.6, 2.3), -- Castillejo
    (16, 1, 6, 16, 1.8, 0.6), -- Nico Gonzalez
    (15, 1, 7, 77, 8.9, 1.7), -- Musah
    (18, 1, 6.3, 93, 11.1, 3.1), --Almeida
    (14, 1, 6.7, 93, 9.9, 1.6), -- Guillamon
    (9, 1, 6.9, 93, 10.4, 3.1), --gaya
    (4, 1, 6.9, 93, 10, 1.7), --Diakhaby
    (7, 1, 5.7, 27, 2.7, 0.5), -- Comert
    (5, 1, 6.3, 66, 6.4, 0.5), -- Paulista
    (12, 1, 6.6, 93, 10.7, 3) -- Correia


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
    (20, 1, 3, 12, 12, 0.3, 1, 4, 0, 0, 1, 0,0,0.1,2, 2, 6, 12,11, 0, 3, 1, 0), -- Lino
    (22, 1, 2, 4, 4, 0.1, 0, 2, 1, 0.8, 2,2, 0,0,0,0,1, 3,3,0,0,0,0), -- Duro
    (24, 1, 6, 14, 13, 0.3, 2, 5, 2, 1.0, 3, 2, 0,0,0,0, 4, 15, 14,0, 3, 0, 0), -- Cavani
    (11, 1, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), -- Lato
    (21, 1, 6, 15, 11, 0.5, 1, 8, 0, 0, 0, 0, 0, 0.5, 0, 0, 2, 13, 9, 0, 2, 3, 0), -- Castillejo
    (16, 1, 0, 1, 1,0, 0,0,0,0,0,0,1,0.1,0,1, 5, 2, 1,0, 1,0, 0), -- Nico Gonzalez
    (15, 1, 5, 20, 19, 0.4, 2, 2, 0,0,0,0,1, 0.5, 0, 2, 15, 23, 19, 1, 4, 0,0), -- Musah
    (18, 1, 3, 14, 13, 0.3, 0, 2, 0, 0, 0,0,0,0,0,0,0,16, 12, 0,1,1,0), --Almeida
    (14, 1, 3, 14,11,0.2,0,1,0,0,1,0,0,0.1,0,1,8, 12,12,0,2,0,0), -- Guillamon
    (9, 1, 6,10,10,0.6, 2, 7,0,0,2,0,0,0,0,0,3,12,7,0,0,1,0), --gaya
    (4, 1, 2,7,7,0.1,3,0,0,0,0,0,0,0,0,0,2,9,8,0, 2,0,0), --Diakhaby
    (7, 1, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), -- Comert
    (5, 1, 1, 2,2,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,0,0), -- Paulista
    (12, 1, 5,11,10,0.5,0,7,0,0,0,0,0,0,0,0,4,12,10,0,2,0,0) -- Correia


insert into player_stats_def (fk_player_id, fk_game_id, stand_tkl_att, stand_tkl_won, slide_tkl_att, slide_tkl_won, interceptions, blocks, clearances, off_duels_att, off_duels_won, def_duels_att, def_duels_won, air_duels_att, air_duels_won, beaten_by_opp, fouls_committed)
values
    (20, 1,0,0,2,0,0,0,0,1,0,0,0,5,1,0,0), -- Lino
    (22, 1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0), -- Duro
    (24, 1,2,0,2,0,0,0,0,4,2,2,0,2,0,1,1), -- Cavani
    (11, 1, 0,0,0,0,0,0,0,0,0,1,0,1,0,0,0), -- Lato
    (21, 1, 4,1,1,0,1,0,0,11,4,3,3,0,0,1,0), -- Castillejo
    (16, 1, 0,0,0,0,1,0,0,1,0,0,0,0,0,0,0), -- Nico Gonzalez
    (15, 1, 3,0,0,0,3,0,0,4,1,5,2,1,1,2,0), -- Musah
    (18, 1, 7,1,0,0,0,0,1,2,0,13,4,3,1,4,0), --Almeida
    (14, 1, 6,0,1,0,6,0,0,1,0,12,4,0,0,3,0), -- Guillamon
    (9, 1, 1,1,1,0,0,0,0,2,1,5,3,0,0,2,0), --gaya
    (4, 1, 2,0,0,0,3,0,0,2,2,4,2,2,0,0,0), --Diakhaby
    (7, 1, 0,0,1,0,0,0,0,0,0,2,1,0,0,1,0), -- Comert
    (5, 1, 2,1,0,0,0,0,0,0,0,6,3,0,0,2,0), -- Paulista
    (12, 1,1,0,0,0,0,0,0,1,1,3,1,0,0,3,0) -- Correia
