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
-- game log 13: CL away vs Leverkusen
INSERT INTO games (fk_season_id, game_num, game_minutes, home_or_away, fk_opp_id,
                   opp_goals, opp_xg, opp_poss_pct, opp_shots, my_goals, my_xg, my_shots)
VALUES
	(3,13,16,'away',20,0,2.1,54,12,3,2.8,11);


INSERT INTO player_stats (fk_player_id, fk_game_id, rating, minutes, poss_won, poss_lost,
                          goals, non_pen_xg, shots, assists, key_passes, passes_att,
                          passes_compl, duels_att, duels_won)
VALUES
(4,13,7.2,92,5,1,0,0,0,0,0,10,8,4,2),  -- Carmo David
-- (5,13,,,,,,,,,,,,,),  -- Fábio Cardoso
(6,13,7,92,2,4,0,0,1,0,0,11,8,9,6),  -- Pepe Laveran Lima Ferreira
-- (7,13,,,,,,,,,,,,,),  -- Iván Marcano
-- (8,13,,,,,,,,,,,,,),  -- Zaidu Sanusi
(9,13,7.2,92,4,2,0,0,0,0,0,17,13,7,4),  -- Wendell Nascimento Borges
(10,13,5.6,39,1,1,0,0,0,0,0,6,4,5,2),  -- João Mário
-- (11,13,,,,,,,,,,,,,),  -- Wilson Manafá
-- (12,13,,,,,,,,,,,,,),  -- Rodrigo Conceição
(13,13,8,92,4,5,1,0,2,0,1,21,17,22,14),  -- Mateus Uribe
-- (14,13,,,,,,,,,,,,,),  -- Marko Grujić
(15,13,6.5,53,3,2,0,0,1,0,0,9,8,9,4),  -- Stephen Eustaquio
-- (16,13,,,,,,,,,,,,,),  -- Bruno Costa
(17,13,7.2,65,2,2,2,2.1,3,0,2,6,6,2,1),  -- Otávio Edmilson da Silva Monteiro
(18,13,6.6,86,0,2,0,0,0,0,1,10,8,7,2),  -- Pepê Gabriel Aquino Cossa
(19,13,6,6,0,0,0,0,0,0,0,1,1,1,0),  -- André Franco
(20,13,7.8,92,3,5,0,0.5,2,2,1,14,11,5,3),  -- Wenderson Galeno
(21,13,5.8,27,0,1,0,0,00,0,0,1,1,1,0),  -- Gabriel Veron
-- (22,13,,,,,,,,,,,,,),  -- Gonçalo Borges
(23,13,6.8,65,0,1,0,0.2,1,1,1,3,3,3,0),  -- Francisco Evanilson
(24,13,6.8,92,0,0,0,0,0,0,2,11,11,4,3),  -- Mehdi Taremi
-- (25,13,,,,,,,,,,,,,),  -- Toni Martínez
-- (26,13,,,,,,,,,,,,,),  -- Daniel Namaso Loader
-- (27,13,,,,,,,,,,,,,),  -- Nico González
--(28,13,,,,,,,,,,,,,),  -- Vasco Sousa
(29,13,5.7,27,0,3,0,0,1,0,0,5,3,4,1);  -- Bernardo Folha
