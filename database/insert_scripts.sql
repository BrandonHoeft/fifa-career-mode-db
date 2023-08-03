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
    (1, 'Daniel', 'Namaso Loader', '2000-08-28', 'ST', 'CAM'),
    (1, 'Nico', 'González', '2022-01-03', 'CM', 'CDM');


insert into standings_snapshot (fk_season_id, fk_team_id, standings_as_of, points, goal_diff)
values
    (1, 1, '2022-10-02', 8, 2), -- FC Porto
    (1, 2, '2022-10-02', 6, -6), -- Arouca
    (1, 3, '2022-10-02', 11, 4), -- Benfica
    (1, 4, '2022-10-02', 9, 0), -- Boavista
    (1, 5, '2022-10-02', 14, 4), -- Braga
    (1, 6, '2022-10-02', 10, 0), -- Casa Pia
    (1, 7, '2022-10-02', 8, -1), -- Chaves
    (1, 8, '2022-10-02', 7, -2), -- Estoril
    (1, 9, '2022-10-02', 14, 3), -- Famalicão
    (1, 10, '2022-10-02', 9, -2), -- Gi Vicente
    (1, 11, '2022-10-02', 12, 1), -- Marítimo
    (1, 12, '2022-10-02', 6, -3), -- Paços de Ferreira
    (1, 13, '2022-10-02', 2, -6), -- Portimonense
    (1, 14, '2022-10-02', 5, -4), -- Rio Ave
    (1, 15, '2022-10-02', 9, 1), -- Santa Clara
    (1, 16, '2022-10-02', 17, 6), -- Sporting CP
    (1, 17, '2022-10-02', 13, 3), -- Vitória de Guimarães
    (1, 18, '2022-10-02', 8, 0); -- Vizela



--------------------------------------------------------------------------------
-- game log 10: home vs fc Vizela
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
    (1,10,18,'home',18,1,1.3,48,10,4,3.0,17);

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
    (18, 10,7.7,93,0,3,1,0,0,0,0,0.9,1,2,12,16,12,1,3,2,4,2,1,4,2,0,0), -- Pepê Gabriel Aquino Cossa
    (6,10,8.1,93,5,0,0,0,0,0,0,0.1,1,1,9,11,10,2,0,0,3,3,3,6,5,1,1), -- Pepe CB
    (7,10,7,93,8,3,1,0,0,0,0,0,0,0,7,12,7,2,0,0,5,3,5,14,8,0,0), --Iván Marcano
    (8, 10,6.4,93,2,2,2,0,0,0,0,0,0,0,4,7,5,1,0,0,0,0,1,5,2,0,0), -- Zaidu Sanusi
    (13, 10,7.9,93,9,7,6,1,0.5,1,0,0.1,1,1,6,19,15,5,0,0,5,3,6,18,12,2,0), -- Mateus Uribe
    (14, 10,5.8,59,4,3,0,0,0,1,0,0.1,0,1,2,7,5,3,0,0,3,0,2,5,1,4,3), -- Marko Grujic
    (17, 10,6.7,93,4,4,0,0,0.2,1,0,0,0,2,7,13,10,4,0,0,1,0,1,7,6,4,2), -- Otávio Edmilson da Silva Monteiro
    (25, 10,7.1,79,3,6,3,0,0.8,5,1,0.3,0,2,6,13,13,4,0,0,1,0,1,7,4,2,2), -- Toni Martinez
    (24, 10,7.5,50,0,3,2,1,0.5,3,0,0.8,0,2,1,10,8,2,1,0,1,0,0,7,5,2,1), -- Mehdi Taremi
    (21, 10,7.2,79,1,4,1,1,0.6,3,0,0.1,0,2,9,12,9,2,2,0,1,0,0,9,4,1,1), -- Gabriel Veron


    --(11, 8,), -- Wilson Manafá
    --(10, 10,), -- João Mário
    --(12,8, 6.4, 32,1,1,0,0,0,0,0,0,0,0,1,3,3,2,1,0,0,0,0,1,0,3,2,1,1), -- Rodrigo Conceição
    (9, 10,5.9,14,1,0,0,0,0,0,0,0,0,0,0,2,1,1,1,0,0,0,0,0,0,0,0), -- Wendell Nascimento Borges
    --(5, 10,), -- Fábio Cardoso
    --(4, 8,7.7,92,8,3,1,0,0.01,1,0,0.1,0,1,4,14,9,2,1,0,0,6,4,1,0,12,7,2,1), -- David Carmo
    --(16, 10), -- Bruno Costa
    (15, 10,6.6,34,3,1,0,0,0,0,1,0.1,0,1,5,8,7,3,0,0,2,1,2,9,5,1,1), -- Stephen Eustaquio
    --(20, 5,6.1,26,0,2,0,0,0,0,1,0.6,0,1,4,2,2,0,0,1,1,0,0,0,0,4,0,1,0), -- Galeno
    --(19,8,), -- André Franco
    (23, 10,6.9,43,0,7,2,1,0.4,3,0,0,1,0,1,5,2,1,0,0,0,0,0,5,1,1,0), -- Francisco Evanilson
    (26, 10,6.4,14,0,1,0,0,0,0,2,0.05,0,2,3,2,2,0,0,0,0,0,0,4,1,0,0);-- Danny Namaso Loader
