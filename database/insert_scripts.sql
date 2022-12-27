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
    (1, 'Diego', 'López Noguerol', '2002-05-13', 'RW', 'ST');

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
-- Standings 2022-12-01
insert into standings_snapshot (fk_season_id, fk_team_id, standings_as_of, points, goal_diff, games_played)
values
    (1, 1, '2022-12-01', 18, -1, 15), -- valencia
    (1, 2, '2022-12-01', 43, 24, 15), -- Real Madrid
    (1,3, '2022-12-01', 38, 20, 15), -- Barcelona
    (1, 4, '2022-12-01', 30, 10, 15), -- Athletic Club Bilbao
    (1,5, '2022-12-01', 30, 12, 15), -- Atletico Madrid
    (1,6, '2022-12-01', 24, 7, 15), -- Real Betis
    (1,7, '2022-12-01', 25, 2, 15), -- Real Sociedad
    (1,8, '2022-12-01', 19, -7, 15), -- CA Osasuna
    (1,9, '2022-12-01', 27, 9, 15), -- Villarreal
    (1, 10, '2022-12-01', 11, -7, 15), -- Rayo Vallecano
    (1, 11, '2022-12-01', 20, -2, 15), -- RC Celta Vigo
    (1, 12, '2022-12-01', 10, -14, 15), -- Mallorca
    (1, 13, '2022-12-01', 11, -15, 15), -- Girona
    (1, 14, '2022-12-01', 11, -11, 15), -- Almeria
    (1, 15, '2022-12-01', 17, -6, 15), -- R. Valladolid CF
    (1, 16, '2022-12-01', 15, -7, 15), -- Getafe
    (1, 17, '2022-12-01', 24, 5, 15), -- Sevilla
    (1, 18, '2022-12-01', 22, 1, 15), -- Espanyol
    (1, 19, '2022-12-01', 9, -10, 15), -- Cadiz CF
    (1, 20, '2022-12-01', 13, -10, 15); -- Elche CF


--------------------------------------------------------------------------------
-- game15 log: home vs. real betis
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
values (1, 15, 18,'away',6,2,2.9,55,11,2,3.9,19);

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

    (12,15,7.2,92,4,5,1,0,0,0,0,0.4,0,1,9,14,13,3,2,1,6,3,1,16,6,0,0), -- Correia
    (5, 15,6.5,92,1,1,0,0,0,0,0,0,0,0,2,8,7,2,0,0,2,1,1,8,5,0,0), -- Paulista
    (4, 15,6.1,56,4,2,1,0,0.3,1,0,0,0,0,4,8,6,1,0,0,2,1,4,6,5,1,0), --Diakhaby
    (9, 15,7.4,92,10,4,5,0,0,0,0,0,0,1,7,17,15,3,0,0,3,1,6,10,8,0,0), --gaya
    (16,15,7.6,92,9,3,3,0,0.1,2,1,1.1,1,2,12,23,20,6,0,0,2,0,7,21,8,3,3), -- Nico Gonzalez
    (15,15,6.6,92,2,5,6,0,0.1,1,0,0.5,0,1,6,20,15,5,1,1,3,0,1,14,6,0,0), -- Musah
    (18, 15,6.8,78,1,3,3,1,0.8,4,0,0.3,0,3,6,16,13,1,0,0,1,0,1,6,4,0,0), -- Andre Almeida
    (20,15,6.8,78,1,3,1,0,0.3,2,0,0,0,0,2,6,5,1,0,0,1,1,0,3,3,1,1), -- Lino
    (23,15,6.6,65,1,1,0,0,0.5,3,1,0.5,0,2,4,8,8,2,0,0,4,0,1,2,1,3,1), -- Marcos Andre
    (21,15,7.4,92,1,7,2,0,0.6,2,0,0.6,0,5,13,20,14,8,1,1,0,0,1,9,4,3,2), -- Castillejo

    --(11, 13,6.5,16,2,0,1,0,0,0,0,0,0,0,1,2,2,0,0,0,2,2,0,3,1,0,0), -- Lato
    --(10,14,6.8,83,3,5,0,0,0,0,0,0,0,1,3,17,11,0,5,0,2,1,2,8,4,0,0), -- vazquez
    --(13,14,5.7,9,0,1,0,0,0,0,0,0,0,0,1,2,1,0,0,0,0,0,0,0,0,0,0), -- Dmitri Foulquier
    (7,15,6.6,36,2,2,0,0,0.1,1,0,0,0,0,2,5,5,1,0,0,1,1,0,4,3,4,2), -- Eray Cömert
    --(6,14,5.8,23,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,2,0,0,2,2,1,0), --ozkacar
    --(14, 13,6.5,58,3,4,1,0,0.4,1,0,0.2,0,1,13,14,12,4,0,0,1,1,3,17,7,0,0), -- Guillamon
    --(17,14,6.2,45,1,3,0,0,0,1,0,0,0,0,2,8,5,1,0,0,1,1,0,4,3,1,1), -- Iliax Moriba
    (27,15,7.1,14,1,1,0,1,1.0,2,0,0,0,0,1,6,5,1,1,0,1,0,0,4,1,0,0), -- Tiago Ribeiro
    (19,15,6,14,0,0,0,0,0,0,0,0,0,0,2,2,2,1,0,0,0,0,0,1,1,0,0), -- Kluivert
    --(22, 14,6.3,23,1,0,2,0,0,0,0,0,0,0,3,6,6,2,0,0,1,0,1,2,2,0,0); -- Duro
    (24,15,5.9,27,0,3,0,0,0.3,1,0,0,1,0,2,7,6,0,0,0,1,0,0,4,0,0,0); -- Cavani
    --(31, 13,5.8,16,0,1,0,0,0,0,0,0,0,0,3,6,5,1,0,0,0,0,0,1,1,0,0); -- Diego Lopez