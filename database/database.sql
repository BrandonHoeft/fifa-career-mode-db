-----------------------------------
-- This database is to track game-level advanced stats for players from my Fifa23 career mode saves.

-- Database Design: Nearly 3NF design to eliminate data redundancy and create data consistency
-- Ultimately, a CRUD webapp will be built on top to handle write ops, so 3NF is a good approach

-- keys: I thought some tables like leagues and teams should use natural keys (e.g. name) as the PK,
-- while others were auto-incrementing/surrogate keys (id). mix was confusing, so conformed to surrogates

-- Database name: (fifa23) is created in projects ./docker-compose.yaml
-- schema: will use public default
-----------------------------------
-- create schema coys if not exists;

-- set search path to coys, public;

create table if not exists leagues (

    league_id int primary key generated by default as identity, -- auto-generating, no need specify on INSERT
    name text not null

);

comment on table leagues is 'leagues/tournament names such as La Liga, Copa Del Rey, Champions League, ...';

create table if not exists teams (

    team_id int primary key generated by default as identity,
    name text not null,
    team_logo_img_url text

);

comment on table teams is 'team names';

create table if not exists seasons (

    season_id int primary key generated by default as identity,
    fk_league_id int references leagues (league_id) not null,
    fk_team_id int references teams (team_id) not null,
    year smallint not null,
    result text,
    notes text

);

comment on table seasons is 'identifies a unique season by league, team, and year';


create table if not exists players (

    player_id int primary key generated by default as identity,
    fk_team_id int references teams (team_id) not null,
    first_name text not null,
    last_name text not null,
    full_name text generated always as (first_name || ' ' || last_name) stored, -- auto-generated on any new row write
    birthday date not null,
    primary_pos text,
    second_pos text,
    start_date date,
    end_date date,
    player_img_url text

);

comment on table players is 'identifies player names on a team';

create table if not exists games (

    game_id int primary key generated by default as identity,
    fk_season_id int references seasons(season_id) not null,
    game_num int not null check (game_num between 1 and 38), -- no single league/tournament has more than this
    game_minutes int not null, -- minutes length of each game half
    home_or_away text not null check (home_or_away in ('home','away')),
    fk_opp_id int references teams (team_id) not null,
    opp_goals int not null,
    opp_xg numeric(3,2) not null, -- 0.09
    opp_ball_rcvry_secs int not null,
    opp_poss_pct numeric(5,2) not null, -- 45.8 or 45.80 or 46
    opp_shots int not null,
    my_goals int not null,
    my_xg numeric(3,2) not null,
    my_ball_rcvry_secs int not null,
    my_poss_pct numeric(5,2) generated always as (100 - opp_poss_pct) stored, -- auto-generated on any row write
    my_shots int not null

);

comment on table games is 'each record represents a team summary of a game I played in fifa career mode';

create table player_stats
(
	player_stat_id integer generated by default as identity
		constraint player_stats_pkey
			primary key,
	fk_player_id integer not null
		constraint player_stats_fk_player_id_fkey
			references players(player_id),
	fk_game_id integer not null
		constraint player_stats_fk_game_id_fkey
			references games(game_id),
	-- overall stats
	rating numeric(3,1) not null,
	minutes integer not null,
	poss_lost integer,
	-- shooting
	goals integer,
	non_pen_xg numeric(3,1),
	shots integer,
	-- passing
	assists integer,
	xa numeric(3,1),
	key_passes integer,
	passes_att integer,
	pass_pct numeric(5,2),
	line_brk_passes integer,
	-- defense
	tackles integer,
	interceptions integer,
	off_duels integer,
	def_duels integer

);

comment on table player_stats is 'each record represents a players individual game stats in a single league game';

create table if not exists standings_snapshot (

    standing_id int primary key generated by default as identity,
    fk_season_id int references seasons (season_id) not null,
    fk_team_id int references teams (team_id) not null,
    standings_as_of date not null,
    points integer,
    goal_diff integer -- standings tiebreaker #1

);

comment on table standings_snapshot is 'each record represents a teams place in a season as of a date snapshot';


