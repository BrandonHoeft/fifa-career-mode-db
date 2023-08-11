--  query templates for loading tables
insert into leagues (name)
values
    ('Premier League'),
    ('EFL Cup'),
    ('FA Cup'),
    ('Champions League'),
    ('Europa League'),
    ('Europa Conference League');

insert into teams (name)
values ('Tottenham Hotspur'),
       ('Arsenal'),
       ('Aston Villa'),
       ('Bournemouth'),
       ('Brentford'),
       ('Brighton & Hove Albion'),
       ('Burnley'),
       ('Chelsea'),
       ('Crystal Palace'),
       ('Everton'),
       ('Fulham'),
       ('Luton Town'),
       ('Liverpool'),
       ('Manchester City'),
       ('Manchester United'),
       ('Newcastle United'),
       ('Nottingham Forest'),
       ('Sheffield United'),
       ('West Ham United'),
       ('Wolverhampton Wanderers');

insert into seasons (fk_league_id, fk_team_id, year) values (1, 1, 2022);

insert into players (fk_team_id, first_name, last_name, birthday, primary_pos, second_pos)
values
--     (1, 'Guglielmo', 'Vicario', '1996-10-07', 'GK', NULL),
--     (1, 'Fraser', 'Forster', '1988-03-17', 'GK', NULL),
--     (1, 'Brandon', 'Austin', '1999-01-08', 'GK', NULL),
--     (1, 'Alfie', 'Whiteman', '1998-10-02', 'GK', NULL),
    (1, 'Cristian', 'Romero', '1998-04-27', 'CB', NULL),
    (1, 'Micky', 'van de Ven', '2001-04-19', 'CB', 'LB'),
    (1, 'Davinson', 'Sánchez', '1996-06-12', 'CB', NULL),
    (1, 'Japhet', 'Tanganga', '1999-03-31', 'CB', 'RB'),
    (1, 'Eric', 'Dier', '1994-01-15', 'CB', NULL),
--  (1, 'Clément', 'Lenglet', '1995-06-17', 'CB', NULL),
    (1, 'Ashley', 'Phillips', '2005-06-26', 'CB', NULL),
    (1, 'Emerson', 'Royal', '1999-01-14', 'RB', NULL),
    (1, 'Pedro', 'Porro', '1999-09-13', 'RB', 'RWB'),
--     (1, 'Djed', 'Spence', '2000-08-09', 'RWB', 'RB'),
    (1, 'Destiny', 'Udogie', '2002-11-28', 'LB', 'LWB'),
    (1, 'Ben', 'Davies', '1993-04-24','LB', 'CB'),
    (1, 'Sergio', 'Reguilón', '1996-12-16', 'LB', NULL),
    (1, 'Ryan', 'Sessegnon', '2000-05-18', 'LB', 'LW'),
    (1, 'James', 'Maddison', '1996-11-23'), 'CAM', 'RM'),
    (1, 'Giovani', 'Lo Celso', '1996-04-09', 'CAM', 'LM'),
    (1, 'Rodrigo', 'Bentancur', '1997-06-25', 'CM', 'CDM'),
    (1, 'Yves', 'Bissouma', '1996-08-30', 'CDM', 'CM'),
    (1, 'Pierre-Emile', 'Höjbjerg', '1995-08-5', 'CM', 'CDM'),
    (1, 'Tanguy', 'Ndombèlé', '1996-12-28', 'CM', 'CAM'),
    (1, 'Oliver', 'Skipp', '2000-09-16', 'CDM', 'CM'),
    (1, 'Pape Matar', 'Sarr', '2002-09-14', 'CM', 'CDM'),
    (1, 'Harvey', 'White', '2001-09-19', 'CDM', 'CM'),
    (1, 'Alfie', 'Devine', '2004-08-01', 'CAM', 'LW'),
    (1, 'Ivan', 'Perisic', '1989-02-02', 'LWB', 'LM'),
    (1, 'Dejan', 'Kulusevski', '2000-04-25', 'RW', 'CAM'),
    (1, 'Manor', 'Solomon', '1999-07-24', 'LW', 'RW'),
    (1, 'Bryan', 'Gil', '2001-02-11', 'RW', 'LW'),
    (1, 'Heung-Min', 'Son', '1992-07-08', 'LW', 'ST'),
    (1, 'Richarlison', 'de Andrade', '1997-05-10', 'ST', 'LW'),
    (1, 'Alejo', 'Véliz', '2003-09-19', 'ST', NULL),
    (1, 'Dane', 'Scarlett', '2004-03-24', 'ST', NULL),
--     (1, 'Troy', 'Parrott', '2002-02-04', 'ST', 'RM')

insert into standings_snapshot (fk_season_id, fk_team_id, standings_as_of, points, goal_diff)
values
    (1, 1, '2022-08-01', 0, 0), -- Tottenham
    (1, 2, '2022-08-01', 0, 0), -- Arsenal
    (1, 3, '2022-08-01', 0, 0), -- Aston Villa
    (1, 4, '2022-08-01', 0, 0), -- Bournemouth
    (1, 5, '2022-08-01', 0, 0), -- Brentford
    (1, 6, '2022-08-01', 0, 0), -- Brighton & Hove Albion
    (1, 7, '2022-08-01', 0, 0), -- Burnley
    (1, 8, '2022-08-01', 0, 0), -- Chelsea
    (1, 9, '2022-08-01', 0, 0), -- Crystal Palace
    (1, 10, '2022-08-01', 0, 0), -- Everton
    (1, 11, '2022-08-01', 0, 0), -- Fulham
    (1, 12, '2022-08-01', 0, 0), -- Luton Town
    (1, 13, '2022-08-01', 0, 0), -- Liverpool
    (1, 14, '2022-08-01', 0, 0), -- Manchester City
    (1, 15, '2022-08-01', 0, 0), -- Manchester United
    (1, 16, '2022-08-01', 0, 0), -- Newcastle United
    (1, 17, '2022-08-01', 0, 0), -- Nottingham Forest
    (1, 18, '2022-08-01', 0, 0), -- Sheffield United
    (1, 19, '2022-08-01', 0, 0), -- West Ham United
    (1, 20, '2022-08-01', 0, 0); -- Wolverhampton Wanderers



--------------------------------------------------------------------------------