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
    (1, 'Nico', 'González', '2022-01-03', 'CM', 'CDM'),
    (1, 'Vasco', 'Sousa', '2003-04-03', 'CAM', 'CM'),
    (1, 'Bernardo', 'Folha', '2002-03-22', 'CM', NULL),
    (1, 'Romário', 'Baró', '2000-01-25', 'CM', 'RM'),
    (1, 'Alan', 'Varela', '2001-07-04', 'CM', 'CDM'),
    (1, 'Jorge', 'Sánchez', '1997-12-10', 'RB', 'LB');


insert into standings_snapshot (fk_season_id, fk_team_id, standings_as_of, points, goal_diff)
values
    (1, 1, '2023-04-01', 47, 14), -- FC Porto
    (1, 2, '2023-04-01', 38, 0), -- Arouca
    (1, 3, '2023-04-01', 63, 29), -- Benfica
    (1, 4, '2023-04-01', 22, -18), -- Boavista
    (1, 5, '2023-04-01', 56, 23), -- Braga
    (1, 6, '2023-04-01', 31, -6), -- Casa Pia
    (1, 7, '2023-04-01', 31, -12), -- Chaves
    (1, 8, '2023-04-01', 28, -7), -- Estoril
    (1, 9, '2023-04-01', 26, -9), -- Famalicão
    (1, 10, '2023-04-01', 41, 7), -- Gi Vicente
    (1, 11, '2023-04-01', 28, -6), -- Marítimo
    (1, 12, '2023-04-01', 21, -16), -- Paços de Ferreira
    (1, 13, '2023-04-01', 36, -4), -- Portimonense
    (1, 14, '2023-04-01', 30, -9), -- Rio Ave
    (1, 15, '2023-04-01', 42, 4), -- Santa Clara
    (1, 16, '2023-04-01', 56, 23), -- Sporting CP
    (1, 17, '2023-04-01', 40, -1), -- Vitória de Guimarães
    (1, 18, '2023-04-01', 30, -12); -- Vizela




--------------------------------------------------------------------------------
-- Game Log 39: away vs Boavista
INSERT INTO games (fk_season_id, game_num, game_minutes, home_or_away, fk_opp_id,
                   opp_goals, opp_xg, opp_poss_pct, opp_shots, my_goals, my_xg, my_shots)
VALUES
	(1,30,10,'away',7,1,1.8,37,8,2,6.6,14);



INSERT INTO player_stats (fk_player_id, fk_game_id, rating, minutes, poss_won, poss_lost,
                          goals, non_pen_xg, shots, assists, key_passes, passes_att, passes_compl, duels_att, duels_won)
VALUES
(5,39,6.8,93,3,0,0,0,0,0,1,3,3,5,2),  -- Fábio Cardoso
(6,39,8.4,97,3,0,1,1,1,0,0,4,3,6,5),  -- Pepe Laveran Lima Ferreira
(7,39,7.1,97,2,1,0,0,0,0,0,8,6,10,5),  -- Iván Marcano
(14,39,7.9,97,4,3,0,0,0,0,2,14,13,12,7),  -- Marko Grujić
(18,39,7.8,97,3,3,0,0.5,1,1,4,12,9,4,3),  -- Pepê Gabriel Aquino Cossa
(19,39,7.5,97,3,2,0,0.2,2,0,1,9,8,11,8),  -- André Franco
(21,39,6.2,31,0,0,0,0,1,0,0,2,2,0,0),  -- Gabriel Veron
(22,39,6.8,97,0,3,0,0,0,0,1,9,3,7,1),  -- Gonçalo Borges
(24,39,7.7,97,0,8,1,4,6,0,1,10,9,15,5),  -- Mehdi Taremi
(25,39,7.1,66,0,0,0,0.5,1,1,2,9,9,5,1),  -- Toni Martínez
(27,39,6.8,97,3,4,0,0.3,2,0,2,18,14,13,6)  -- Nico González