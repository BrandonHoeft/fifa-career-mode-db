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
    (1, 'Jorge', 'Sáenz', '1996-11-17', 'CB', NULL),
    (1, 'Diego', 'López Noguerol', '2002-05-13', 'RW', 'ST'),
    (1,'Luis', 'Chávez','1996-01-15', 'CM', 'CDM'); -- joined as free agent signing on 2023-01-04

--------------------------------------------------------------------------------
-- NOTE: transition script frmo player_stats_{ovr,off,def} to player_stats table 2022-12-17

with player_stats_cte as (
    select --ovr_id,
           ovr.fk_player_id,
           ovr.fk_game_id,
           --p.full_name,
           --p.primary_pos,
           ovr.rating,
           ovr.minutes,
           0 as poss_won, -- NOTE: new columns not modeled in prior tables
           0 as poss_lost, -- NOTE: new columns not modeled in prior tables
           --possession_pct,
           --dribble_att,
           --dribble_compl,
           --dribble_dist,
           dribble_beat,
           --dribble_knock_on,
           goals,
           non_pen_xg,
           shots,
           --shots_on_targ,
           assists,
           xa,
           second_assists,
           key_passes,
           players_beat_by_passes as players_beat_passes,
           passes_att,
           passes_compl,
           0 as passes_compl_press, -- NOTE: new columns not modeled in prior tables
           --lobs_compl,
           --through_balls_compl,
           crosses_att,
           crosses_compl,
           -- DEFENSE
           stand_tkl_att + slide_tkl_att       as tackles_att,
           stand_tkl_won + slide_tkl_won       as tackles_won,
           interceptions + blocks + clearances as intrcpts_blocks_clears,
           off_duels_att + def_duels_att       as duels_att,
           off_duels_won + def_duels_won       as duels_won,
           air_duels_att,
           air_duels_won
    from player_stats_overall ovr
             inner join player_stats_off off
    on ovr.fk_player_id = off.fk_player_id
        and ovr.fk_game_id = off.fk_game_id
        inner join player_stats_def def on ovr.fk_player_id = def.fk_player_id
        and ovr.fk_game_id = def.fk_game_id
        inner join players p on ovr.fk_player_id = p.player_id
)


insert into player_stats (fk_player_id, fk_game_id, rating, minutes, poss_won, poss_lost, dribble_beat, goals, non_pen_xg, shots, assists, xa, second_assists, key_passes, players_beat_passes, passes_att, passes_compl, passes_compl_press, crosses_att, crosses_compl, tackles_att, tackles_won, intrcpts_blocks_clears, duels_att, duels_won, air_duels_att, air_duels_won)
select * from player_stats_cte;




--------------------------------------------------------------------------------
-- Standings 2022-01-04
insert into standings_snapshot (fk_season_id, fk_team_id, standings_as_of, points, goal_diff, games_played)
values
    (1, 1, '2022-01-04', 23, 0, 19), -- valencia
    (1, 2, '2022-01-04', 47, 27, 19), -- Real Madrid
    (1,3, '2022-01-04', 50, 27, 19), -- Barcelona                                                                                                          15), -- Barcelona
    (1, 4, '2022-01-04', 34, 6, 19), -- Athletic Club Bilbao
    (1,5, '2022-01-04', 35, 11, 19), -- Atletico Madrid
    (1,6, '2022-01-04', 29, 6, 19), -- Real Betis
    (1,7, '2022-01-04', 28, -2, 19), -- Real Sociedad
    (1,8, '2022-01-04', 28, -4, 19), -- CA Osasuna
    (1,9, '2022-01-04', 37, 14, 19), -- Villarreal
    (1, 10, '2022-01-04', 15, -9, 19), -- Rayo Vallecano
    (1, 11, '2022-01-04', 27, -1, 19), -- RC Celta Vigo
    (1, 12, '2022-01-04', 16, -13, 19), -- Mallorca
    (1, 13, '2022-01-04', 12, -18, 19), -- Girona
    (1, 14, '2022-01-04', 15, -13, 19), -- Almeria
    (1, 15, '2022-01-04', 23, -7, 19), -- R. Valladolid CF
    (1, 16, '2022-01-04', 24, -2, 19), -- Getafe
    (1, 17, '2022-01-04', 28, 4, 19), -- Sevilla
    (1, 18, '2022-01-04', 29, 4, 19), -- Espanyol
    (1, 19, '2022-01-04', 16, -11, 19), -- Cadiz CF
    (1, 20, '2022-01-04', 13, -17, 19); -- Elche CF


--------------------------------------------------------------------------------
-- game22 log: away vs atletico madrid
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
    my_shots)
values (1, 22, 14,'away', 5,2,3.5,55,14,0,2.3,9);

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
    (13,22,6.6,91,2,0,3,0,0,0,0,0,0,0,2,5,4,2,0,0,2,1,1,6,3,0,0), -- Dmitri Foulquier
    (7,22,6.4,91,4,1,3,0,0,0,0,0,0,1,5,11,10,3,0,0,5,1,3,8,4,1,1), -- Eray Cömert
    (4, 22,7.2,91,9,2,6,0,0,0,0,0,0,0,2,8,7,4,0,0,12,6,5,16,11,2,0), --Diakhaby
    (9, 22,6.1,63,0,5,3,0,0.2,1,0,0,0,1,4,10,6,2,0,0,3,0,0,7,3,0,0), --gaya
    (16,22,6.2,91,3,2,0,0,0,1,0,0,0,0,11,12,11,3,0,0,5,1,3,6,1,0,0), -- Nico Gonzalez
    (15,22,6,45,0,1,1,0,0,0,0,0,0,0,3,9,8,3,0,0,2,0,1,5,4,1,0), -- Musah
    (18,22,6.9,91,2,3,0,0,1.2,3,0,0.2,0,1,14,18,15,6,1,1,2,1,1,7,5,2,0), -- Andre Almeida
    (20,22,6.7,63,0,5,3,0,0.3,1,0,0.9,0,1,4,8,5,3,2,1,0,0,0,7,3,0,0), -- Lino
    (24,22,6,63,0,3,0,0,0,0,0,0.3,0,1,2,9,8,1,0,0,2,0,0,2,1,0,0), -- Cavani
    (21,22,7.7,91,4,6,0,0,0,0,0,0.9,0,3,13,13,9,3,1,1,4,2,3,11,7,3,2), -- Castillejo



    --(12,21,8.1,91,3,1,1,0,0,2,0,0.1,0,1,10,15,12,2,0,0,5,2,1,6,5,2,1), -- Correia
    --(11, 21,5.5,45,0,3,0,0,0.1,1,0,0,0,0,1,5,4,1,0,0,0,0,0,4,2,1,0), -- Lato
    (10,22,6.2,46,1,3,0,0,0,0,0,0,0,0,2,5,4,0,0,0,4,1,0,6,3,0,0), -- vazquez
    --(5, 21,7.1,91,4,1,2,0,0,0,0,0,0,0,4,11,9,2,0,0,3,3,1,7,5,0,0), -- Paulista
    --(6,21,6.8,91,5,1,0,0,0,0,0,0,0,0,0,10,9,1,0,0,3,2,2,5,4,0,0), --ozkacar
    --(14, 13,6.5,58,3,4,1,0,0.4,1,0,0.2,0,1,13,14,12,4,0,0,1,1,3,17,7,0,0), -- Guillamon
    --(17,20,5.9,26,1,1,0,0,0.1,1,0,0.2,0,1,1,7,6,2,0,0,0,0,0,1,0,3,2), -- Iliax Moriba
    (32,22,5.7,28,0,1,0,0,0.3,1,0,0,0,0,1,2,1,0,0,0,0,0,0,0,0,1,1), -- Luis Chavez (cm)

    --(27,18,5.7,15,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0), -- Tiago Ribeiro
    --(19,22), -- Kluivert
    (22, 22,5.7,28,0,2,0,0,0.3,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0), -- Duro
    (23,22,6,28,2,1,0,0,0,0,0,0,0,0,2,2,1,1,0,0,2,1,2,2,1,0,0); -- Marcos Andre
    --(31, 18,5.9,26,0,2,0,0,0.1,1,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0,0,0); -- Diego Lopez

