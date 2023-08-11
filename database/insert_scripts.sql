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
    (1, 'Bernardo', 'Folha', '2002-03-22', 'CM', NULL);


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
-- game log 15: Liga away vs estoril
INSERT INTO games (fk_season_id, game_num, game_minutes, home_or_away, fk_opp_id,
                   opp_goals, opp_xg, opp_poss_pct, opp_shots, my_goals, my_xg, my_shots)
VALUES
	(1,15,16,'away',8,5,5.1,50,14,1,1.7,6)


INSERT INTO player_stats (fk_player_id, fk_game_id, rating, minutes, poss_won,
                          poss_lost, goals, non_pen_xg, shots, assists, key_passes,
                          passes_att, passes_compl, duels_att, duels_won)
VALUES
-- (4,15,,,,,,,,,,,,,),  -- Carmo David
(5,15,7.3,92,5,3,0,0,0,0,1,11,9,13,6),  -- Fábio Cardoso
-- (6,15,,,,,,,,,,,,,),  -- Pepe Laveran Lima Ferreira
(7,15,7.1,92,11,2,0,0,0,0,0,13,11,17,9),  -- Iván Marcano
(8,15,5.9,28,1,0,0,0,0,0,0,4,3,4,2),  -- Zaidu Sanusi
(9,15,6.3,92,5,2,0,0,0,0,0,12,10,10,4),  -- Wendell Nascimento Borges
-- (10,15,,,,,,,,,,,,,),  -- João Mário
-- (11,15,,,,,,,,,,,,,),  -- Wilson Manafá
-- (12,15,,,,,,,,,,,,,),  -- Rodrigo Conceição
-- (13,15,,,,,,,,,,,,,),  -- Mateus Uribe
-- (14,15,,,,,,,,,,,,,),  -- Marko Grujić
(15,15,6,92,1,5,0,0,0,0,0,15,9,2,0),  -- Stephen Eustaquio
-- (16,15,,,,,,,,,,,,,),  -- Bruno Costa
-- (17,15,,,,,,,,,,,,,),  -- Otávio Edmilson da Silva Monteiro
(18,15,7.2,92,1,0,0,0,0,1,1,8,8,7,4),  -- Pepê Gabriel Aquino Cossa
(19,15,6.9,73,1,4,1,0.2,1,0,0,17,13,6,4),  -- André Franco
(20,15,5.8,36,1,3,0,0,0,0,0,3,1,7,2),  -- Wenderson Galeno
(21,15,6.3,92,0,4,0,0.2,1,0,1,12,9,6,3),  -- Gabriel Veron
(22,15,6.1,56,0,3,0,0,0,0,1,6,4,5,4),  -- Gonçalo Borges
-- (23,15,,,,,,,,,,,,,),  -- Francisco Evanilson
(24,15,5.9,73,0,5,0,0.8,2,0,1,18,16,3,2),  -- Mehdi Taremi
(25,15,5.9,19,0,1,0,0,0,0,0,2,1,1,1),  -- Toni Martínez
-- (26,15,,,,,,,,,,,,,),  -- Daniel Namaso Loader
(27,15,6.3,64,3,3,0,0,1,0,0,8,6,11,6),  -- Nico González
(28,15,5.9,19,1,3,0,0.5,1,0,0,3,3,6,4)  -- Vasco Sousa
-- (29,15,,,,,,,,,,,,,),  -- Bernardo Folha

