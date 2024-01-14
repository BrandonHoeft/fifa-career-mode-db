
with player_stats as (

    select * from {{ source('postgres_fifa_db', 'player_stats') }}

)

, players as (

    select * from {{ source('postgres_fifa_db', 'players') }}

)

, games as (

    select * from {{ source('postgres_fifa_db', 'games') }}

)

, seasons as (

    select * from {{ source('postgres_fifa_db', 'seasons') }}

)

, leagues as (

    select * from {{ source('postgres_fifa_db', 'leagues') }}

)

, teams as (

    select * from {{ source('postgres_fifa_db', 'teams') }}

)

, raw_player_stats_preprocessed as (
    select full_name,
           primary_pos,
           case when primary_pos in('CB', 'LB', 'LWB', 'RB', 'RWB')  then 'Defender'
                when primary_pos in('CDM', 'CM', 'CAM')  then 'Midfielder'
                when primary_pos in('ST', 'CF', 'LW', 'LM', 'RW', 'RM')  then 'Attacker'
                else 'Goalie'
           end as player_type,
           fk_game_id,
           rating,
           minutes,
           poss_lost,
           goals,
           /* Giving FIFA's xG a haircut
            real world non-penalty xG per shot = 0.10.
            sample FIFA non-penalty xG per shot = 0.22. Derived from player_stats table: round(non_pen_xg / nullif(shots, 0), 2)
            ratio of 0.10 / 0.22 = 45% haircut to get more realistic FIFA xG outputs
            */
           --round(non_pen_xg * 0.45, 2) as non_pen_xg, -- downweight the FIFA engine's xG
           non_pen_xg,
           shots,
           assists,
           xa,
           key_passes,
           passes_att,
           pass_pct,
           round(passes_att * (pass_pct / 100), 0) as passes_compl, -- Derived
           line_brk_passes,
           -- defensive/transition
           tackles,
           interceptions,
           off_duels,
           def_duels,
           -- game metadata & context
           l.name as league,
           s.year,
           g.home_or_away,
           t.name as opponent,
           case when g.my_goals > g.opp_goals then 3
                when g.my_goals = g.opp_goals then 1
                else 0
           end as result_points
    from player_stats
    inner join players p on player_stats.fk_player_id = p.player_id
    /* below is useful if I want to pre-filter to a particular tournament */
    inner join games g on player_stats.fk_game_id = g.game_id
    inner join seasons s on g.fk_season_id = s.season_id
    inner join leagues l on s.fk_league_id = l.league_id
    inner join teams t on g.fk_opp_id = t.team_id
    order by full_name, fk_game_id
)

select * from raw_player_stats_preprocessed