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
    (1, 1, '2022-08-30', 3, -1), -- FC Porto
    (1, 2, '2022-08-30', 2, -3), -- Arouca
    (1, 3, '2022-08-30', 7, 2), -- Benfica
    (1, 4, '2022-08-30', 7, 1), -- Boavista
    (1, 5, '2022-08-30', 7, 1), -- Braga
    (1, 6, '2022-08-30', 3, -2), -- Casa Pia
    (1, 7, '2022-08-30', 4, -1), -- Chaves
    (1, 8, '2022-08-30', 5, -1), -- Estoril
    (1, 9, '2022-08-30', 9, 1), -- Famalicão
    (1, 10, '2022-08-30', 7, 2), -- Gi Vicente
    (1, 11, '2022-08-30', 7, 1), -- Marítimo
    (1, 12, '2022-08-30', 2, -2), -- Paços de Ferreira
    (1, 13, '2022-08-30', 1, -4), -- Portimonense
    (1, 14, '2022-08-30', 4, -1), -- Rio Ave
    (1, 15, '2022-08-30', 6, 1), -- Santa Clara
    (1, 16, '2022-08-30', 10, 4), -- Sporting CP
    (1, 17, '2022-08-30', 8, 2), -- Vitória de Guimarães
    (1, 18, '2022-08-30', 4, 0); -- Vizela



--------------------------------------------------------------------------------
-- game log 9 (CL): away vs club brugge
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
    (3,9,20,'away',19,1,1.2,53,15,4,3.0,18);

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
    (10, 9,6.7,65,2,1,1,0,0,0,0,0,0,1,8,12,11,1,2,1,1,5,3,3,0,6,1,0,0), -- João Mário
    (5, 9,7.2,92,6,1,0,0,0,0,0,0,0,0,4,14,10,2,1,0,0,7,3,5,0,10,7,4,2), -- Fábio Cardoso
    (6,9,7.3,92,6,1,2,0,0,0,0,0,0,0,3,14,13,2,1,0,0,2,1,4,0,13,11,1,0), -- Pepe CB
    (8, 9,6.8,02,7,5,1,0,0,0,0,0,0,0,9,17,11,3,0,0,0,3,1,3,0,7,4,3,2), -- Zaidu Sanusi
    (13, 9,7.1,92,3,3,3,0,0,1,1,0.3,1,4,10,20,18,3,4,0,0,4,0,3,0,9,6,2,1), -- Mateus Uribe
    (14, 9,6.4,72,3,2,2,0,0.2,1,0,0,0,0,5,10,10,2,1,0,0,3,2,1,0,9,4,2,0), -- Marko Grujic
    (17, 9,8,92,3,6,1,1,0.5,3,1,0.7,0,6,16,24,17,5,4,2,1,2,0,7,0,8,3,2,2), -- Otávio Edmilson da Silva Monteiro
    (23, 9,7.7,92,2,5,3,1,0.75,4,1,0.2,1,1,2,13,10,0,1,0,0,0,0,0,0,8,6,1,0), -- Francisco Evanilson
    (24, 9,7.9,65,3,7,2,1,1.15,6,1,0.1,0,1,2,8,5,2,2,0,0,2,2,2,0,9,4,4,4), -- Mehdi Taremi
    (19,9,7.1,92,1,8,2,1,0.5,3,0,0.1,1,3,4,17,11,3,4,0,0,2,0,2,0,5,2,1,0), -- André Franco


    --(11, 8,), -- Wilson Manafá
    --(12,8, 6.4, 32,1,1,0,0,0,0,0,0,0,0,1,3,3,2,1,0,0,0,0,1,0,3,2,1,1), -- Rodrigo Conceição
    --(9, 8,6.4,92,3,5,1,0,0,0,0,0,0,0,1,9,4,2,1,1,0,1,0,3,0,12,5,2,2), -- Wendell Nascimento Borges
    --(7,8,6.7,92,6,2,0,0,0,0,0,0,0,0,4,9,7,2,0,0,0,3,0,6,0,10,6,7,2), --Iván Marcano
    --(4, 8,7.7,92,8,3,1,0,0.01,1,0,0.1,0,1,4,14,9,2,1,0,0,6,4,1,0,12,7,2,1), -- David Carmo
    (16, 9,6.1,20,4,0,1,0,0,0,0,0,0,0,2,3,3,2,0,0,0,2,1,2,0,2,2,2,1), -- Bruno Costa
    --(15, 9,), -- Stephen Eustaquio
    --(20, 5,6.1,26,0,2,0,0,0,0,1,0.6,0,1,4,2,2,0,0,1,1,0,0,0,0,4,0,1,0), -- Galeno
    --(19,8,), -- André Franco
    --(21, 8,6.2,45,0,3,4,0,0.1,2,0,0,0,0,0,6,3,0,0,2,0,0,0,1,0,5,4,1,0), -- Gabriel Veron
    (18, 9,5.9,27,0,2,0,0,0,0,0,0,1,0,1,5,3,1,1,1,0,2,0,2,0,3,1,2,2), -- Pepê Gabriel Aquino Cossa
    (25, 9,6,27,1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,1,0,0,0); -- Toni Martinez
    --(26, 8,); -- Danny Namaso Loader