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
-- game log 8: away vs Boavista
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
    (3,8,20,'away',4, 0,1.9,58,8,0,2.0,20);

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
    (10, 8,7.2,92,4,4,3,0,0.1,5,0,0,0,0,6,10,8,3,2,1,0,4,2,3,0,8,5,1,1), -- João Mário
    (7,8,6.7,92,6,2,0,0,0,0,0,0,0,0,4,9,7,2,0,0,0,3,0,6,0,10,6,7,2), --Iván Marcano
    (4, 8,7.7,92,8,3,1,0,0.01,1,0,0.1,0,1,4,14,9,2,1,0,0,6,4,1,0,12,7,2,1), -- David Carmo
    (9, 8,6.4,92,3,5,1,0,0,0,0,0,0,0,1,9,4,2,1,1,0,1,0,3,0,12,5,2,2), -- Wendell Nascimento Borges
    (13, 8,7.5,92,8,3,1,0,0.2,1,0,0.4,0,2,12,21,18,7,4,0,0,6,3,5,0,19,11,4,2), -- Mateus Uribe
    (15, 8,7.2,92,4,4,2,0,0,0,0,1,0,3,19,25,20,4,1,1,1,0,0,6,0,12,5,2,0), -- Stephen Eustaquio
    (17, 8,5.9,60,1,6,1,0,0.1,2,0,0,0,1,2,16,8,1,1,1,0,2,1,1,0,10,4,1,1), -- Otávio Edmilson da Silva Monteiro
    (23, 8,6.9,92,1,5,4,0,0.2,4,0,0,0,3,8,20,18,5,3,0,0,3,1,1,0,9,7,5,0), -- Francisco Evanilson
    (24, 8,6.3,60,1,2,1,0,0,0,0,0,0,3,6,10,9,4,2,0,0,0,0,1,0,8,4,0,0), -- Mehdi Taremi
    (21, 8,6.2,45,0,3,4,0,0.1,2,0,0,0,0,0,6,3,0,0,2,0,0,0,1,0,5,4,1,0), -- Gabriel Veron

    --(11, 8,), -- Wilson Manafá
    (12,8, 6.4, 32,1,1,0,0,0,0,0,0,0,0,1,3,3,2,1,0,0,0,0,1,0,3,2,1,1), -- Rodrigo Conceição
    --(8, 5,7.4,92,8,10,5,0,0,0,0,0,0,1,8,27,16,4,4,2,0,4,2,3,0,16,8,1,1), -- Zaidu Sanusi
    --(5, 8,), -- Fábio Cardoso
    --(6,8,), -- Pepe CB
    --(16, 6,7.2,18,0,0,0,1,1,1,0,0,0,0,2,1,1,1,0,0,0,2,0,0,0,2,1,1,0), -- Bruno Costa
    --(14, 8,), -- Marko Grujic
    --(20, 5,6.1,26,0,2,0,0,0,0,1,0.6,0,1,4,2,2,0,0,1,1,0,0,0,0,4,0,1,0), -- Galeno
    --(19,8,), -- André Franco
    (18, 8,5.9,32,0,2,1,0,0.6,4,0,0,0,1,0,4,3,1,2,0,0,1,0,0,0,3,2,1,0), -- Pepê Gabriel Aquino Cossa
    (25, 8,6.2,47,1,2,0,0,0.7,1,0,0.3,0,2,4,7,6,3,3,0,0,2,0,0,0,6,2,1,1); -- Toni Martinez
    --(26, 8,); -- Danny Namaso Loader