--  query templates for loading tables
insert into leagues (name)
values
    ('Liga Portugal'),
    ('Taça de Portugal'),
    ('Supertaça'),
    ('Champions League'),
    ('Europa League'),
    ('Europa Conference League');

insert into teams (name)
values ('FC Porto'),
       ('Arouca'),
       ('Benfica'),
       ('Boavista'),
       ('Braga'),
       ('Casa Pia'),
       ('Chaves'),
       ('Estoril'),
       ('Famalicão'),
       ('Gil Vicente'),
       ('Marítimo'),
       ('Paços de Ferreira'),
       ('Portimonense'),
       ('Rio Ave'),
       ('Santa Clara'),
       ('Sporting CP'),
       ('Vitória de Guimarães'),
       ('Vizela'),
       ('Club Brugge'),
       ('Bayer Leverkusen'),
       ('Atlético Madrid')

insert into seasons (fk_league_id, fk_team_id, year)
values
    (1, 1, 2022),
    (2, 1, 2022),
    (4, 1, 2022);

insert into players (fk_team_id, first_name, last_name, birthday, primary_pos, second_pos)
values
    (1, 'Diogo', 'Costa', '1999-09-19', 'GK', NULL),
    (1, 'Cláudio', 'Ramos', '1991-11-16', 'GK', NULL),
    (1, 'Samuel', 'Portugal', '1994-03-29', 'GK', NULL),
    (1, 'Carmo', 'David', '1999-07-19', 'CB', NULL),
    (1, 'Fábio', 'Cardoso', '1994-04-19', 'CB', NULL),
    (1, 'Pepe', 'Laveran Lima Ferreira', '1983-02-26', 'CB', NULL),
    (1, 'Iván', 'Marcano', '1987-06-23', 'CB', NULL),
    (1, 'Zaidu', 'Sanusi', '1997-06-13', 'LB', NULL),
    (1, 'Wendell', 'Nascimento Borges', '1993-07-20', 'LB', NULL),
    (1, 'João', 'Mário', '2000-01-03', 'RB', NULL),
    (1, 'Wilson', 'Manafá', '1994-07-24', 'RB', 'RM'),
    (1, 'Rodrigo', 'Conceição', '2000-01-02', 'RB', 'RM'),
    (1, 'Mateus', 'Uribe', '1991-03-21', 'CM', 'CDM'),
    (1, 'Marko', 'Grujić', '1996-04-13', 'CM', 'CDM'),
    (1, 'Stephen', 'Eustaquio', '1996-12-21', 'CM', 'CDM'),
    (1, 'Bruno', 'Costa', '1997-04-19', 'CM', NULL),
    (1, 'Otávio', 'Edmilson da Silva Monteiro', '1995-02-09', 'RM', 'LM'),
    (1, 'Pepê', 'Gabriel Aquino Cossa', '1997-02-24', 'LM', 'RM'),
    (1, 'André', 'Franco', '1998-04-12', 'CAM', 'CM'),
    (1, 'Wenderson', 'Galeno', '1997-10-22', 'LM', NULL),
    (1, 'Gabriel', 'Veron', '2002-09-03', 'LM', 'RM'),
    (1, 'Gonçalo', 'Borges', '2001-03-29', 'RM', NULL),
    (1, 'Francisco', 'Evanilson', '1999-10-06', 'ST', NULL),
    (1, 'Mehdi', 'Taremi', '1992-07-18', 'ST', 'LW'),
    (1, 'Toni', 'Martínez', '1997-06-30', 'ST', NULL),
    (1, 'Daniel', 'Namaso Loader', '2000-08-28', 'ST', 'CAM');


insert into standings_snapshot (fk_season_id, fk_team_id, standings_as_of, points, goal_diff)
values
    (1, 1, '2022-08-01', 0, 0), -- FC Porto
    (1, 2, '2022-08-01', 0, 0), -- Arouca
    (1, 3, '2022-08-01', 0, 0), -- Benfica
    (1, 4, '2022-08-01', 0, 0), -- Boavista
    (1, 5, '2022-08-01', 0, 0), -- Braga
    (1, 6, '2022-08-01', 0, 0), -- Casa Pia
    (1, 7, '2022-08-01', 0, 0), -- Chaves
    (1, 8, '2022-08-01', 0, 0), -- Estoril
    (1, 9, '2022-08-01', 0, 0), -- Famalicão
    (1, 10, '2022-08-01', 0, 0), -- Gi Vicente
    (1, 11, '2022-08-01', 0, 0), -- Marítimo
    (1, 12, '2022-08-01', 0, 0), -- Paços de Ferreira
    (1, 13, '2022-08-01', 0, 0), -- Portimonense
    (1, 14, '2022-08-01', 0, 0), -- Rio Ave
    (1, 15, '2022-08-01', 0, 0), -- Santa Clara
    (1, 16, '2022-08-01', 0, 0), -- Sporting CP
    (1, 17, '2022-08-01', 0, 0), -- Vitória de Guimarães
    (1, 18, '2022-08-01', 0, 0); -- Vizela



--------------------------------------------------------------------------------
-- game log 2: home vs Portimonense
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
    (1,2,20,'home',13, 0, 1.8,46,6,2,3.4,15);

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
    offsides_caused,
    duels_att,
    duels_won,
    air_duels_att,
    air_duels_won
)
values
    (10, 2,7.0,92,3,1,0,0,0,0,0,0,0,0,3,17,13,0,1,1,0,4,3,2,0,10,8,1,1), -- João Mário
    (5, 2, 7,92,5,3,2,0,0.1,1,0,0,0,0,2,15,13,2,0,0,0,3,3,4,0,13,7,2,1), -- Fábio Cardoso
    (4, 2,6.8,92,7,3,0,0,0,0,0,0,0,0,1,16,11,1,0,0,0,6,4,7,0,10,4,2,2), -- David Carmo
    (8, 2,7.6, 80, 4,0,1,0,0,0,1,0.6,0,3,6,17,16,4,2,1,0,2,1,2,0,12,7,1,1), -- Zaidu Sanusi
    (13, 2,6.8,92,6,6,0,0,0.8,1,0,0,0,0,2,18,12,0,4,1,0,8,3,2,0,13,8,2,1), -- Mateus Uribe
    (15, 2, 6.5,70,8,8,1,0,0.01,1,0,0.2,0,3,8,18,11,1,3,0,0,7,2,6,0,13,6,1,1), -- Stephen Eustaquio
    (17, 2,6.4,58,1,0,0,0,0,0,0,0,0,1,6,7,7,3,1,1,1,1,0,0,0,3,3,4,1), -- Otávio Edmilson da Silva Monteiro
    (18, 2, 7.8,80,2,4,2,1,0.3,2,0,0.8,0,3,11,15,12,2,2,2,1,2,1,1,0,7,4,0,0), -- Pepê Gabriel Aquino Cossa
    (23, 2,6.9,92,3,7,4,0,1.3,5,1,0.01,0,1,5,14,12,4,5,0,0,1,0,3,0,11,7,2,0), -- Francisco Evanilson
    (24, 2, 6.7,70,0,7,0,1,0.6,3,0,0,0,1,3,7,3,1,2,1,0,2,0,0,0,6,2,1,1), -- Mehdi Taremi

    --(6,), -- Pepe CB
    --(7,), --Iván Marcano

    --(4, 1, ...), -- David Carmo
    (9, 2, 5.9, 12,1,0,0,0,0,0,0,0,0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0), -- Wendell Nascimento Borges
    --(11, 1, ), -- Wilson Manafá
    (14, 2, 6.1,22,2,3,1,0,0.2,1,0,0,0,0,3,3,1,0,1,0,0,3,2,1,0,4,3,1,1), -- Marko Grujic
    (16, 2, 5.6,12,0,3,0,0,0,0,0,0,0,0,1,4,1,1,0,2,0,0,0,0,0,1,0,0,0), -- Bruno Costa
    --(19, 1), -- André Franco
    (20, 2,5.4,34,2,5,0,0,0.1,1,0,0,0,1,0,3,2,0,0,0,0,0,0,1,0,5,2,2,0), -- Galeno
    --(21, 1, ), -- Gabriel Veron
    (25, 2,6,22,0,1,0,0,0,0,0,0,0,0,2,4,3,2,2,0,0,0,0,0,0,2,1,0,0); -- Toni Martinez
    --(26, 1, ), -- Danny Namaso Loader


