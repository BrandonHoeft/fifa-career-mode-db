--  query templates for loading tables
insert into leagues (name)
values
    ('Premier League'),
    ('EFL Cup'),
    ('FA Cup'),
    ('Champions League'),
    ('Europa League'),
    ('Europa Conference League');

insert into teams (name, team_logo_img_url)
values ('Tottenham Hotspur', 'https://tmssl.akamaized.net/images/wappen/head/148.png?lm=1544345801'),
       ('Arsenal', 'https://tmssl.akamaized.net/images/wappen/head/11.png?lm=1489787850'),
       ('Aston Villa', 'https://tmssl.akamaized.net/images/wappen/head/405.png?lm=1469443765'),
       ('Bournemouth', 'https://tmssl.akamaized.net/images/wappen/head/989.png?lm=1457991811'),
       ('Brentford', 'https://tmssl.akamaized.net/images/wappen/head/1148.png?lm=1625150543'),
       ('Brighton & Hove Albion', 'https://tmssl.akamaized.net/images/wappen/head/1237.png?lm=1492718902'),
       ('Burnley', 'https://tmssl.akamaized.net/images/wappen/head/1132.png?lm=1686818840'),
       ('Chelsea', 'https://tmssl.akamaized.net/images/wappen/head/631.png?lm=1682435911'),
       ('Crystal Palace', 'https://tmssl.akamaized.net/images/wappen/head/873.png?lm=1457723287'),
       ('Everton', 'https://tmssl.akamaized.net/images/wappen/head/29.png?lm=1445949846'),
       ('Fulham', 'https://tmssl.akamaized.net/images/wappen/head/931.png?lm=1556831687'),
       ('Luton Town', 'https://tmssl.akamaized.net/images/wappen/head/1031.png?lm=1457723228'),
       ('Liverpool', 'https://tmssl.akamaized.net/images/wappen/head/31.png?lm=1456567819'),
       ('Manchester City', 'https://tmssl.akamaized.net/images/wappen/head/281.png?lm=1467356331'),
       ('Manchester United', 'https://tmssl.akamaized.net/images/wappen/head/985.png?lm=1457975903'),
       ('Newcastle United', 'https://tmssl.akamaized.net/images/wappen/head/762.png?lm=1472921161'),
       ('Nottingham Forest', 'https://tmssl.akamaized.net/images/wappen/head/703.png?lm=1598890289'),
       ('Sheffield United', 'https://tmssl.akamaized.net/images/wappen/head/350.png?lm=1409254138'),
       ('West Ham United', 'https://tmssl.akamaized.net/images/wappen/head/379.png?lm=1464675260'),
       ('Wolverhampton Wanderers', 'https://tmssl.akamaized.net/images/wappen/head/543.png?lm=1467496784');

insert into seasons (fk_league_id, fk_team_id, year) values (1, 1, 2023);
insert into seasons (fk_league_id, fk_team_id, year) values (2, 1, 2023);
insert into seasons (fk_league_id, fk_team_id, year) values (3, 1, 2023);

insert into players (fk_team_id, first_name, last_name, birthday, primary_pos, second_pos, start_date, end_date, player_img_url)
values
    (1, 'Guglielmo', 'Vicario', '1996-10-07', 'GK', NULL, '2023-07-01', NULL, 'https://cdn.sofifa.net/players/240/091/24_240.png'),
    (1, 'Fraser', 'Forster', '1988-03-17', 'GK', NULL, '2023-07-01', NULL, NULL),
    (1, 'Brandon', 'Austin', '1999-01-08', 'GK', NULL, '2023-07-01', NULL, NULL),
    (1, 'Alfie', 'Whiteman', '1998-10-02', 'GK', NULL, '2023-07-01', NULL, NULL),
    (1, 'Cristian', 'Romero', '1998-04-27', 'CB', NULL, '2023-07-01', NULL, 'https://cdn.sofifa.net/players/232/488/24_240.png'),
    (1, 'Micky', 'van de Ven', '2001-04-19', 'CB', 'LB', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/264/453/24_240.png'),
    (1, 'Japhet', 'Tanganga', '1999-03-31', 'CB', 'RB', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/236/600/24_240.png'),
    (1, 'Eric', 'Dier', '1994-01-15', 'CB', NULL, '2023-07-01', NULL, 'https://cdn.sofifa.net/players/202/335/24_240.png'),
    (1, 'Joe', 'Rodon', '1997-10-27', 'CB', NULL, '2023-07-01', NULL, 'https://cdn.sofifa.net/players/229/266/24_240.png'),
    (1, 'Ashley', 'Phillips', '2005-06-26', 'CB', NULL, '2023-07-01', NULL, 'https://cdn.sofifa.net/players/264/731/24_240.png'),
    (1, 'Emerson', 'Royal', '1999-01-14', 'RB', NULL, '2023-07-01', NULL, 'https://cdn.sofifa.net/players/247/204/24_240.png'),
    (1, 'Pedro', 'Porro', '1999-09-13', 'RB', 'RWB', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/243/576/24_240.png'),
    (1, 'Djed', 'Spence', '2000-08-09', 'RWB', 'RB', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/243/702/24_240.png'),
    (1, 'Destiny', 'Udogie', '2002-11-28', 'LB', 'LWB', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/259/583/24_240.png'),
    (1, 'Ben', 'Davies', '1993-04-24','LB', 'CB', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/205/923/24_240.png'),
    (1, 'Ryan', 'Sessegnon', '2000-05-18', 'LB', 'LW', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/235/883/24_240.png'),
    (1, 'James', 'Maddison', '1996-11-23', 'CAM', 'RM', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/220/697/24_240.png'),
    (1, 'Pape Matar', 'Sarr', '2002-09-14', 'CM', 'CDM', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/259/868/24_240.png'),
    (1, 'Giovani', 'Lo Celso', '1996-04-09', 'CAM', 'LM', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/226/226/24_240.png'),
    (1, 'Rodrigo', 'Bentancur', '1997-06-25', 'CM', 'CDM', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/227/535/24_240.png'),
    (1, 'Yves', 'Bissouma', '1996-08-30', 'CDM', 'CM', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/236/480/24_240.png'),
    (1, 'Pierre-Emile', 'Höjbjerg', '1995-08-5', 'CM', 'CDM', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/213/648/24_240.png'),
    (1, 'Oliver', 'Skipp', '2000-09-16', 'CDM', 'CM', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/241/042/24_240.png'),
    (1, 'Alfie', 'Devine', '2004-08-01', 'CAM', 'LW', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/264/180/24_240.png'),
    (1, 'Ivan', 'Perisic', '1989-02-02', 'LWB', 'LM', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/181/458/24_240.png'),
    (1, 'Dejan', 'Kulusevski', '2000-04-25', 'RW', 'CAM', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/247/394/24_240.png'),
    (1, 'Manor', 'Solomon', '1999-07-24', 'LW', 'RW', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/246/791/24_240.png'),
    (1, 'Bryan', 'Gil', '2001-02-11', 'RW', 'LW', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/246/785/24_240.png'),
    (1, 'Heung-Min', 'Son', '1992-07-08', 'LW', 'ST', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/200/104/24_240.png'),
    (1, 'Richarlison', 'de Andrade', '1997-05-10', 'ST', 'LW', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/231/943/24_240.png'),
    (1, 'Alejo', 'Véliz', '2003-09-19', 'ST', NULL, '2023-07-01', NULL, 'https://cdn.sofifa.net/players/269/176/24_240.png'),
    (1, 'Dane', 'Scarlett', '2004-03-24', 'ST', NULL, '2023-07-01', NULL, 'https://cdn.sofifa.net/players/261/025/24_240.png'),
    (1, 'Troy', 'Parrott', '2002-02-04', 'ST', 'RM', '2023-07-01', NULL, 'https://cdn.sofifa.net/players/245/902/24_240.png'),
    (1, 'Jamie', 'Donley', '2005-01-03', 'CAM', 'ST', '2023-07-01', NULL, 'https://www.footballdatabase.eu/images/photos/players/a_467/467842.jpg'),
    (1, 'Alfie', 'Dorrington', '2005-04-20', 'CB', NULL, '2023-07-01', NULL, NULL),
    (1, 'Mikey', 'Moore', '2007-08-11', 'CAM', 'LW', '2023-07-01', NULL, 'https://pbs.twimg.com/media/Fu-63mBWAAAOa74?format=jpg&name=medium')


-- Season 1  premier league (season_id=1)
insert into standings_snapshot (fk_season_id, fk_team_id, standings_as_of, points)
 values
     (1, 1, '2023-08-01', 0), -- Tottenham
     (1, 2, '2023-08-01', 0), -- Arsenal
     (1, 3, '2023-08-01', 0), -- Aston Villa
     (1, 4, '2023-08-01', 0), -- Bournemouth
     (1, 5, '2023-08-01', 0), -- Brentford
     (1, 6, '2023-08-01', 0), -- Brighton & Hove Albion
     (1, 7, '2023-08-01', 0), -- Chelsea
     (1, 8, '2023-08-01', 0), -- Crystal Palace
     (1, 9, '2023-08-01', 0), -- Everton
     (1, 10, '2023-08-01', 0), -- Fulham
     (1, 11, '2023-08-01', 0), -- Liverpool
     (1, 12, '2023-08-01', 0), -- Luton Town
     (1, 13, '2023-08-01', 0), -- Liverpool
     (1, 14, '2023-08-01', 0), -- Manchester City
     (1, 15, '2023-08-01', 0), -- Manchester United
     (1, 16, '2023-08-01', 0), -- Newcastle United
     (1, 17, '2023-08-01', 0), -- Nottingham Forest
     (1, 18, '2023-08-01', 0), -- Southampton
     (1, 19, '2023-08-01', 0), -- West Ham United
     (1, 20, '2023-08-01', 0); -- Wolverhampton Wanderers
