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
    (1, 1, 2024), -- 2023-24 Liga Portugal
    (2, 1, 2024), -- 2023-24 Taca Portugal
    (5, 1, 2024); -- 2023-24 Europa League

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

insert into players (fk_team_id, first_name, last_name, birthday, primary_pos, second_pos,
                     start_date, end_date, cost, sale, acquired_rating, current_rating)
values
    (1, 'Francisco', 'Conceição', '2002-12-02', 'RM', 'RW', '2023-01-01', NULL, 12000000, NULL, 75, 75),
    (1, 'Fran', 'Navarro', '1998-02-03', 'ST', NULL, '2023-07-06', NULL, 20000000, NULL, 78, 78),
    (1, 'Nacho', 'Fernández', '1990-01-18', 'CB', 'LB', '2023-07-09', NULL, 0, NULL, 82, 82),
    (1, 'Zé Luís', 'Andrede', '1991-01-24', 'ST', NULL, '2023-08-08', NULL, 4800000, NULL, 75, 75),
    (1, 'Malang', 'Sarr', '1999-01-23', 'CB', NULL, '2023-08-31', NULL, 0, NULL, 76, 76),
    (1, 'Iván', 'Jaime', '2000-09-26', 'CAM', 'CM', '2023-08-28', NULL, 18000000, NULL, 76, 76),
    (1, 'Pedro', 'Gonçalves', '2006-02-23', 'CM', 'CDM', '2023-09-02', NULL, 0, NULL, 68, 68); -- youth team promoted


-- Season 2  Liga Portugal (season_id=4)
insert into standings_snapshot (fk_season_id, fk_team_id, standings_as_of, points, goal_diff)
values
    (4, 1, '2023-09-01', 10, 7), -- FC Porto
    (4, 2, '2023-09-01', 5, 0), -- Arouca
    (4, 3, '2023-09-01', 7, 1), -- Benfica
    (4, 4, '2023-09-01', 4, -1), -- Boavista
    (4, 5, '2023-09-01', 12, 8), -- Braga
    (4, 6, '2023-09-01', 3, -5), -- Casa Pia
    (4, 7, '2023-09-01', 0, -8), -- Chaves
    (4, 8, '2023-09-01', 2, -6), -- Estoril
    (4, 9, '2023-09-01', 7, 1), -- Famalicão
    (4, 10, '2023-09-01', 9, 3), -- Gil Vicente
    (4, 11, '2023-09-01', 1, -4), -- Marítimo
    (4, 12, '2023-09-01', 7, 2), -- Paços de Ferreira
    (4, 13, '2023-09-01', 4, -1), -- Portimonense
    (4, 14, '2023-09-01', 6, -2), -- Rio Ave
    (4, 15, '2023-09-01', 4, -1), -- Santa Clara
    (4, 16, '2023-09-01', 10, 7), -- Sporting CP
    (4, 17, '2023-09-01', 9, 3), -- Vitória de Guimarães
    (4, 18, '2023-09-01', 3, -3); -- Vizela




--------------------------------------------------------------------------------
-- Game Log 48: away vs Braga
INSERT INTO games (fk_season_id, game_num, game_minutes, home_or_away, fk_opp_id,
                   opp_goals, opp_xg, opp_poss_pct, opp_shots, my_goals, my_xg, my_shots)
VALUES
	(4,5,16,'away',13,2,2.7,45,9,2,2.8,15)


INSERT INTO player_stats (fk_player_id, fk_game_id, rating, minutes, poss_won, poss_lost,
                          goals, non_pen_xg, shots, assists, key_passes, passes_att, passes_compl,
                          duels_att, duels_won)
VALUES
(22,48,6.1,32,0,1,0,0.7,2,0,0,2,2,4,1),  -- Gonçalo Borges
(30,48,5.8,27,0,3,0,0,0,0,0,5,3,1,0),  -- Romário Baró
(32,48,7.8,93,6,3,0,0,0,0,2,17,13,10,5),  -- Jorge Sánchez
(27,48,7.5,93,9,7,0,0,1,0,2,22,19,18,9),  -- Nico González
(31,48,6.1,68,0,4,0,0,2,0,0,11,9,7,3),  -- Alan Varela
(18,48,5.8,86,1,7,0,0.6,4,0,3,13,9,9,2),  -- Pepê Gabriel Aquino Cossa
(20,48,6.3,61,2,4,0,0.3,1,0,1,10,8,11,5),  -- Wenderson Galeno
(24,48,7.4,86,1,5,1,0.9,3,0,2,17,12,11,7),  -- Mehdi Taremi
(9,48,7.4,93,2,1,0,0,0,0,3,17,15,7,5),  -- Wendell Nascimento Borges
(4,48,7.6,93,7,3,0,0,0,0,0,11,8,17,10),  -- Carmo David
(34,48,6.1,61,0,0,0,0.3,1,0,0,6,6,4,4),  -- Fran Navarro
(35,48,6.4,93,6,4,0,0,0,0,0,13,10,12,5),  -- Nacho Fernández
(36,48,6,7,0,0,0,0,0,0,0,1,1,1,0),  -- Zé Luís Andrede
(38,48,5.9,32,1,0,0,0,1,0,0,4,3,3,1),  -- Iván Jaime
(39,48,6,7,0,0,0,0,0,0,0,1,1,0,0)  -- Pedro Gonçalves