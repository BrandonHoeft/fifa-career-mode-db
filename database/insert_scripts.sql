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
-- game log 1: away vs SC Braga
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
    (1,1,18,'away',5,1,3,48,15,0,2.4,13);

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
    (10, 1,7.4,92,4,4,1,0,0,0,0,0,0,0,5,12,8,1,2,3,0,3,3,2,0,11,6,2,1), -- João Mário
    (6, 1, 5.7,23,0,1,1,0,0.01,1,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,1,0), -- Pepe CB
    (7, 1, 7.1,92,6,2,3,0,0,0,0,0,0,0,6,15,14,3,1,0,0,8,2,5,0,14,6,5,2), --Iván Marcano
    (8, 1, 7.1,92,4,3,0,0,0.2,1,0,0,0,1,9,14,11,0,3,1,0,3,0,4,0,7,3,4,1), -- Zaidu Sanusi
    (13, 1,6.2,71,8,2,1,0,0.01,1,0,0,0,2,3,22,21,8,2,0,0,4,1,4,0,9,2,7,6), -- Mateus Uribe
    (12, 1, 7, 92,3,6,7,0,0.3,5,0,0,0,0,10,16,13,3,1,2,1,4,3,2,0,16,11,3,0), -- Stephen Eustaquio
    (17, 1,6.5,92,3,6,2,0,0.5,2,0,0,0,2,2,20,15,5,3,0,0,1,0,4,0,13,8,2,1), -- Otávio Edmilson da Silva Monteiro
    (18, 1, 5.8,62,0,4,1,0,0.2,1,0,0,0,2,3,14,9,2,4,1,0,1,0,0,0,4,4,0,0), -- Pepê Gabriel Aquino Cossa
    (23, 1, 6.6,92,0,2,0,0,0,0,0,0.9,0,2,4,6,5,0,2,1,1,0,0,0,0,2,1,1,0), -- Francisco Evanilson
    (24, 1, 6.5,92,0,5,0,0,1.1,2,0,0,0,0,2,13,8,2,3,1,0,1,0,0,0,4,4,3,1), -- Mehdi Taremi

    (5, 1, 6.6, 69, 2,3,1,0,0,0,0,0,0,1,5,12,10,1,1,0,0,1,0,2,0,5,3,5,2), -- Fábio Cardoso
    --(4, 1, ...), -- David Carmo
    --(9, 1, ), -- Wendell Nascimento Borges
    --(11, 1, ), -- Wilson Manafá
    --(14, 1, ), -- Marko Grujic
    --(16, 1, ), -- Bruno Costa
    (19, 1, 6.3,21,2,1,1,0,0,0,0,0.1,0,1,5,6,5,2,4,0,0,2,1,1,0,2,1,2,2), -- André Franco
    (20, 1, 5.6,30,0,3,0,0,0,0,0,0,0,0,0,3,1,0,1,0,0,0,0,0,0,1,0,1,0); -- Galeno
    --(21, 1, ), -- Gabriel Veron
    --(25, 1, ), -- Toni Martinez
    --(26, 1, ), -- Danny Namaso Loader


