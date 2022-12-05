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
-- game log 7: home vs Gil Vicente
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
    (3,7,20,'home',10,1,2.3,47,12,4,4.9,31);

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
    (11, 7,7.4,58,3,0,2,0,0,0,0,0.8,0,3,9,13,12,2,1,1,1,2,1,1,0,5,3,0,0), -- Wilson Manafá
    (6,7,6.8,93,5,2,1,0,0,0,0,0,0,0,6,15,12,2,0,0,0,3,0,0,0,6,4,3,2), -- Pepe CB
    (5, 7,7.4,93,13,5,1,0,0.5,2,0,0,0,0,3,16,11,5,0,0,0,5,3,6,0,13,8,7,7), -- Fábio Cardoso
    (9, 7,8.4,93,8,2,1,0,0,0,0,0.2,0,5,20,24,20,3,4,1,1,4,3,4,0,8,6,2,2), -- Wendell Nascimento Borges
    (13, 7,7.7,93,5,8,2,0,0.7,5,1,0.8,0,3,10,21,15,1,3,1,0,8,2,3,1,20,12,1,1), -- Mateus Uribe
    (14, 7,7.1,93,6,6,1,0,0,0,0,0.1,0,1,12,26,21,4,5,0,0,9,2,0,0,17,11,3,2), -- Marko Grujic
    (18, 7,7.4,93,2,8,2,1,0.7,2,0,0.1,1,2,6,20,12,1,2,3,0,0,0,2,0,7,3,1,0), -- Pepê Gabriel Aquino Cossa
    (26, 7,7.4,69,1,2,2,1,0.6,4,0,0.4,1,2,2,13,12,2,5,0,0,2,0,1,0,3,3,3,3), -- Danny Namaso Loader
    (24, 7,8.6,93,1,7,2,1,0.8,6,1,1.9,0,6,25,25,21,7,8,0,0,4,1,0,0,18,7,3,2), -- Mehdi Taremi
    (21, 7,7.2,67,4,6,1,0,0.5,5,1,0.6,0,3,11,13,11,2,3,3,2,2,1,2,0,5,4,0,0), -- Gabriel Veron


    --(8, 5,7.4,92,8,10,5,0,0,0,0,0,0,1,8,27,16,4,4,2,0,4,2,3,0,16,8,1,1), -- Zaidu Sanusi
    --(7,5,6.8,92,7,2,3,0,0,00,0,0,0,0,4,15,14,5,1,0,0,7,5,5,0,25,17,0,0), --Iván Marcano
    --(10, 6,7,93,2,1,4,0,0,0,0,0,0,0,5,10,9,3,0,0,0,3,0,0,0,10,5,1,1), -- João Mário

    --(4, 4,7,92,6,3,2,0,0,0,0,0,0,0,8,13,10,5,1,0,0,5,2,4,0,17,9,0,0), -- David Carmo
    --(16, 6,7.2,18,0,0,0,1,1,1,0,0,0,0,2,1,1,1,0,0,0,2,0,0,0,2,1,1,0), -- Bruno Costa
    --(15, 6,5.8,61,1,4,0,0,0,0,0,0,0,1,5,14,10,3,3,1,0,4,0,3,0,2,1,1,0), -- Stephen Eustaquio
    --(20, 5,6.1,26,0,2,0,0,0,0,1,0.6,0,1,4,2,2,0,0,1,1,0,0,0,0,4,0,1,0), -- Galeno
    (19,7,5.8,26,0,4,0,0,0,0,0,0,0,0,2,6,4,2,2,0,0,1,0,0,0,2,1,2,0), -- André Franco
    (17, 7,6.1,24,0,0,0,0,0.2,1,0,0,0,0,1,1,1,1,0,0,0,1,0,1,0,3,1,1,1), -- Otávio Edmilson da Silva Monteiro
    --(25, 5,6.7,73,0,7,0,1,2,2,0,0,0,0,1,11,5,1,0,0,0,3,0,1,0,4,1,5,1), -- Toni Martinez
    (23, 7,6.9,35,0,3,1,1,0.5,6,0,0,0,0,3,6,6,3,3,0,0,0,0,1,0,6,4,1,0); -- Francisco Evanilson