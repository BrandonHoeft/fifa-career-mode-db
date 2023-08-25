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
    (1, 'Baró', 'Romário', '2000-01-25', 'CM', 'RM');


insert into standings_snapshot (fk_season_id, fk_team_id, standings_as_of, points, goal_diff)
values
    (1, 1, '2022-10-31', 13, -3), -- FC Porto
    (1, 2, '2022-10-31', 11, 1), -- Arouca
    (1, 3, '2022-10-31', 20, 9), -- Benfica
    (1, 4, '2022-10-31', 9, -4), -- Boavista
    (1, 5, '2022-10-31', 23, 10), -- Braga
    (1, 6, '2022-10-31', 12, -4), -- Casa Pia
    (1, 7, '2022-10-31', 14, 3), -- Chaves
    (1, 8, '2022-10-31', 10, 0), -- Estoril
    (1, 9, '2022-10-31', 19, 6), -- Famalicão
    (1, 10, '2022-10-31', 17, 4), -- Gi Vicente
    (1, 11, '2022-10-31', 9, -4), -- Marítimo
    (1, 12, '2022-10-31', 10, -3), -- Paços de Ferreira
    (1, 13, '2022-10-31', 15, 1), -- Portimonense
    (1, 14, '2022-10-31', 12, 0), -- Rio Ave
    (1, 15, '2022-10-31', 9, -3), -- Santa Clara
    (1, 16, '2022-10-31', 22, 8), -- Sporting CP
    (1, 17, '2022-10-31', 9, -4), -- Vitória de Guimarães
    (1, 18, '2022-10-31', 10, -5); -- Vizela



--------------------------------------------------------------------------------
-- game 20: Away vs Arouca
INSERT INTO games (fk_season_id, game_num, game_minutes, home_or_away, fk_opp_id, opp_goals,
                   opp_xg, opp_poss_pct, opp_shots, my_goals, my_xg, my_shots)
VALUES
	(1,20,18,'away',2,0,3.5,38,10,4,3.3,9)



INSERT INTO player_stats (fk_player_id, fk_game_id, rating, minutes, poss_won,
                          poss_lost, goals, non_pen_xg, shots, assists, key_passes,
                          passes_att, passes_compl, duels_att, duels_won)
VALUES
(4,20,7.5,92,5,2,0,0,0,0,0,15,12,8,5),  -- Carmo David
(5,20,5.6,42,4,0,0,0,0,0,1,7,6,6,3),  -- Fábio Cardoso
-- (6,20,,,,,,,,,,,,,),  -- Pepe Laveran Lima Ferreira
-- (7,20,,,,,,,,,,,,,),  -- Iván Marcano
(8,20,7.3,92,8,2,0,0,0,0,0,18,16,10,7),  -- Zaidu Sanusi
(9,20,5.8,24,2,2,0,0,0,0,0,4,2,1,1),  -- Wendell Nascimento Borges
(10,20,6,43,1,2,0,0,1,0,0,5,5,5,3),  -- João Mário
-- (11,20,,,,,,,,,,,,,),  -- Wilson Manafá
(13,20,7.4,49,3,3,0,0,0,1,2,13,10,4,2),  -- Mateus Uribe
-- (14,20,,,,,,,,,,,,,),  -- Marko Grujić
-- (15,20,,,,,,,,,,,,,),  -- Stephen Eustaquio
(17,20,6.6,92,2,4,0,0.4,1,0,2,17,13,4,1),  -- Otávio Edmilson da Silva Monteiro
-- (18,20,,,,,,,,,,,,,),  -- Pepê Gabriel Aquino Cossa
-- (19,20,,,,,,,,,,,,,),  -- André Franco
-- (20,20,,,,,,,,,,,,,),  -- Wenderson Galeno
(21,20,8.2,92,1,8,1,0.8,1,1,1,12,7,11,6),  -- Gabriel Veron
(22,20,6.1,38,1,3,0,0.3,1,0,0,4,3,5,1),  -- Gonçalo Borges
-- (23,20,,,,,,,,,,,,,),  -- Francisco Evanilson
(24,20,5.9,54,0,6,0,0,0,0,0,9,4,3,1),  -- Mehdi Taremi
(25,20,7.4,38,1,3,1,0.6,1,0,1,5,4,7,4),  -- Toni Martínez
(26,20,7.2,54,1,4,1,0,1,0,0,5,3,4,2),  -- Daniel Namaso Loader
(27,20,7.2,68,3,2,0,0,1,1,1,21,19,5,4),  -- Nico González
-- (28,20,,,,,,,,,,,,,),  -- Vasco Sousa
(29,20,5.9,24,0,1,0,0.5,1,0,0,3,3,3,2),  -- Bernardo Folha
(30,20,7.4,68,7,5,1,0.8,1,0,1,15,13,12,7)  -- Romário Baró