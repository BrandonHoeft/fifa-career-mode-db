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
-- game log 11: taca port. home vs sporting cp
INSERT INTO games (fk_season_id, game_num, game_minutes, home_or_away, fk_opp_id, opp_goals, opp_xg, opp_poss_pct, opp_shots, my_goals, my_xg, my_shots)
VALUES
	(2,11,16,'home',16,1,1.3,42,9,1,3.8,18)


INSERT INTO player_stats (fk_player_id, fk_game_id, rating, minutes, poss_won, poss_lost, goals,
                          non_pen_xg, shots, assists, key_passes, passes_att, passes_compl, duels_att, duels_won)
VALUES
-- (4,11,,,,,,,,,,,,,),  -- Carmo David
-- (5,11,,,,,,,,,,,,,),  -- Fábio Cardoso
(6,11,6.9,122,6,3,0,0.1,1,0,0,8,7,17,7),  -- Pepe Laveran Lima Ferreira
(7,11,6.9,113,6,0,0,0,0,0,0,11,10,14,7),  -- Iván Marcano
(8,11,7.5,90,8,5,0,0,0,0,0,18,13,19,9),  -- Zaidu Sanusi
-- (9,11,,,,,,,,,,,,,),  -- Wendell Nascimento Borges
(10,11,8,122,7,4,0,0.1,1,0,1,21,15,16,11),  -- João Mário
-- (11,11,,,,,,,,,,,,,),  -- Wilson Manafá
-- (12,11,,,,,,,,,,,,,),  -- Rodrigo Conceição
(13,11,8,122,8,9,0,0.9,2,1,4,32,24,16,10),  -- Mateus Uribe
(14,11,6.4,42,2,4,0,0,1,0,0,10,6,8,5),  -- Marko Grujić
-- (15,11,,,,,,,,,,,,,),  -- Stephen Eustaquio
-- (16,11,,,,,,,,,,,,,),  -- Bruno Costa
(17,11,7.1,122,1,6,0,0,1,0,1,20,14,16,8),  -- Otávio Edmilson da Silva Monteiro
(18,11,6.3,42,1,6,0,0,0,0,1,12,7,5,1),  -- Pepê Gabriel Aquino Cossa
(19,11,5.8,32,2,3,0,0.6,1,0,0,7,5,1,1),  -- André Franco
-- (20,11,,,,,,,,,,,,,),  -- Wenderson Galeno
(21,11,6.3,80,1,7,0,0.3,1,0,1,8,5,8,2),  -- Gabriel Veron
-- (22,11,,,,,,,,,,,,,),  -- Gonçalo Borges
(23,11,7.8,70,0,2,1,1,3,0,1,11,10,7,4),  -- Francisco Evanilson
(24,11,7.7,122,1,3,0,0.6,3,0,2,23,18,10,9),  -- Mehdi Taremi
(25,11,6.5,52,1,3,0,0,0,0,1,9,7,8,3),  -- Toni Martínez
(26,11,5.8,9,0,0,0,0,2,0,0,0,0,2,0),  -- Daniel Namaso Loader
(27,11,6.4,80,3,4,0,0,2,0,0,10,6,12,8)  -- Nico González
