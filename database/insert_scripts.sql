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
-- Game Log 28: away vs Chaves
INSERT INTO games (fk_season_id, game_num, game_minutes, home_or_away, fk_opp_id,
                   opp_goals, opp_xg, opp_poss_pct, opp_shots, my_goals, my_xg, my_shots)
VALUES
	(1,28,16,'away',4,2,1.9,43,15,4,2.7,14)


INSERT INTO player_stats (fk_player_id, fk_game_id, rating, minutes, poss_won, poss_lost,
                          goals, non_pen_xg, shots, assists, key_passes, passes_att,
                          passes_compl, duels_att, duels_won)
VALUES
-- (4,28,,,,,,,,,,,,,),  -- Carmo David
-- (5,28,,,,,,,,,,,,,),  -- Fábio Cardoso
(6,28,7.6,93,3,1,0,0,0,0,0,13,11,7,5),  -- Pepe Laveran Lima Ferreira
(7,28,7.4,93,4,1,0,0,0,1,1,14,10,14,9),  -- Iván Marcano
(8,28,7.7,93,4,6,0,0,0,0,1,19,10,13,8),  -- Zaidu Sanusi
-- (9,28,,,,,,,,,,,,,),  -- Wendell Nascimento Borges
(10,28,6.7,33,3,3,0,0,0,0,1,10,7,5,3),  -- João Mário
(14,28,6.4,53,3,2,0,0,0,0,0,12,9,5,3),  -- Marko Grujić
(18,28,8.7,93,4,0,1,0.3,2,0,3,15,14,10,3),  -- Pepê Gabriel Aquino Cossa
(19,28,5.9,11,0,0,0,0,0,0,1,2,2,0,0),  -- André Franco
(20,28,7.3,60,0,3,1,0.5,2,0,0,8,4,10,6),  -- Wenderson Galeno
(21,28,6.2,60,0,1,0,0,0,1,1,5,3,10,5),  -- Gabriel Veron
(22,28,6.8,33,1,5,0,0.3,2,0,2,8,7,7,6),  -- Gonçalo Borges
(23,28,6,11,0,0,0,0,0,0,0,2,2,1,0),  -- Francisco Evanilson
(24,28,7.5,82,0,3,2,1.2,4,0,0,8,6,13,7),  -- Mehdi Taremi
-- (25,28,,,,,,,,,,,,,),  -- Toni Martínez
(26,28,7.4,93,1,6,0,0.1,1,2,3,16,11,12,7),  -- Daniel Namaso Loader
(27,28,6.7,82,2,2,0,0.3,2,0,1,16,13,17,8),  -- Nico González
-- (30,28,,,,,,,,,,,,,),  -- Romário Baró
-- (32,28,,,,,,,,,,,,,),  -- Jorge Sánchez
(31,28,6.8,40,5,2,0,0,1,0,1,7,6,7,4)  -- Alan Varela