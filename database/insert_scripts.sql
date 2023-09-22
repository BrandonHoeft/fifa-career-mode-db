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
    (1, 1, '2023-03-01', 43, 12), -- FC Porto
    (1, 2, '2023-03-01', 32, -2), -- Arouca
    (1, 3, '2023-03-01', 59, 28), -- Benfica
    (1, 4, '2023-03-01', 21, -17), -- Boavista
    (1, 5, '2023-03-01', 54, 24), -- Braga
    (1, 6, '2023-03-01', 26, -7), -- Casa Pia
    (1, 7, '2023-03-01', 27, -13), -- Chaves
    (1, 8, '2023-03-01', 25, -5), -- Estoril
    (1, 9, '2023-03-01', 24, -7), -- Famalicão
    (1, 10, '2023-03-01', 37, 7), -- Gi Vicente
    (1, 11, '2023-03-01', 24, -6), -- Marítimo
    (1, 12, '2023-03-01', 15, -6), -- Paços de Ferreira
    (1, 13, '2023-03-01', 32, -6), -- Portimonense
    (1, 14, '2023-03-01', 26, -7), -- Rio Ave
    (1, 15, '2023-03-01', 39, 6), -- Santa Clara
    (1, 16, '2023-03-01', 53, 22), -- Sporting CP
    (1, 17, '2023-03-01', 36, -2), -- Vitória de Guimarães
    (1, 18, '2023-03-01', 29, -11); -- Vizela



--------------------------------------------------------------------------------
-- Game Log 35: home vs Vizela
INSERT INTO games (fk_season_id, game_num, game_minutes, home_or_away, fk_opp_id,
                   opp_goals, opp_xg, opp_poss_pct, opp_shots, my_goals, my_xg, my_shots)
VALUES
	(1,35,10,'home',10,1,1.4,46,7,1,1.7,4)


INSERT INTO player_stats (fk_player_id, fk_game_id, rating, minutes, poss_won, poss_lost,
                          goals, non_pen_xg, shots, assists, key_passes, passes_att, passes_compl,
                          duels_att, duels_won)
VALUES
(5,35,6.9,91,3,0,0,0,0,0,1,8,8,7,4),  -- Fábio Cardoso
(7,35,6.9,91,5,1,0,0,0,1,1,5,4,7,4),  -- Iván Marcano
(8,35,6.4,91,2,0,0,0,0,0,0,4,4,6,4),  -- Zaidu Sanusi
(10,35,6.3,59,3,1,0,0,0,0,0,4,3,2,2),  -- João Mário
(18,35,6.5,91,0,5,0,0.2,1,0,0,6,3,5,2),  -- Pepê Gabriel Aquino Cossa
(19,35,6.8,77,2,4,0,0.8,1,0,1,12,10,6,4),  -- André Franco
(20,35,7.8,77,0,2,1,0.6,2,0,1,7,4,6,2),  -- Wenderson Galeno
(21,35,5.9,14,1,1,0,0,0,0,0,2,1,1,1),  -- Gabriel Veron
(24,35,5.9,91,0,4,0,0,0,0,1,7,5,11,4),  -- Mehdi Taremi
(25,35,5.7,32,0,3,0,0,0,0,0,4,1,3,0),  -- Toni Martínez
(27,35,6.3,91,6,2,0,0,0,0,1,11,9,14,8),  -- Nico González
(30,35,6.3,14,3,2,0,0,0,0,0,4,3,3,2),  -- Romário Baró
(31,35,6.3,91,1,5,0,0.1,1,0,0,10,6,6,5) -- Alan Varela

