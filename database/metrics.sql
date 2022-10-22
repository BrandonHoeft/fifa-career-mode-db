-- starting pass at offensive rate metrics
with offense as (
    select off_id,
           off.fk_game_id,
           p.full_name,
           ovr.minutes,
           ovr.rating,
           possession_pct,
           dribble_att,
           dribble_compl,
           dribble_dist,
           dribble_beat,
           dribble_knock_on,
           goals,
           non_pen_xg,
           shots,
           shots_on_targ,
           assists,
           xa,
           second_assists,
           key_passes,
           players_beat_by_passes,
           passes_att,
           passes_compl,
           lobs_compl,
           through_balls_compl,
           crosses_att,
           crosses_compl
    from player_stats_off off
inner join players p
    on off.fk_player_id = p.player_id
        inner join player_stats_overall ovr on
        off.fk_player_id = ovr.fk_player_id
        and off.fk_game_id = ovr.fk_game_id
order by full_name, fk_game_id
)

2 *5.0 + 15 * 9.0 / 17

145 / 17
, cum_offense as (

    select
        full_name,
        sum(minutes) as total_minutes,
        sum(minutes * rating) / sum(minutes) as weighted_rating,
        round(sum(minutes::numeric) / 90, 2) as _90s, -- # of 90 minutes completed
        sum(possession_pct) as poss_pct_tot,
        sum(dribble_compl) as dribble_compl_tot,
        case
            when sum(dribble_att) = 0
                then 1 -- used as a denominator in other metrics, can't divide by 0
            else sum(dribble_att)
            end as dribble_att_tot,
        sum(dribble_beat) as dribble_beat_tot,
        sum(shots) as shots_tot,
        sum(goals) as goals_tot,
        sum(non_pen_xg) as xg_tot,
        sum(xa) as xa_tot,
        sum(players_beat_by_passes) as pbp_tot,
        sum(through_balls_compl) as thball_compl_tot
    from offense
    group by full_name

)

select
    full_name,
    total_minutes,
    _90s,
    weighted_rating,
    --dribbling
    round(poss_pct_tot / _90s, 2) as poss_pct_per90,
    dribble_compl_tot,
    round(dribble_compl_tot / _90s, 2) as dribble_compl_per90,
    round(dribble_compl_tot::numeric / dribble_att_tot, 2) as dribble_succ_rt, -- nulls if 0 dribbles completed
    round(dribble_beat_tot / _90s, 2) as dribble_beat_per_90,
    round(dribble_beat_tot::numeric / dribble_att_tot, 2) as dribble_beat_rt,
    --shooting
    shots_tot,
    round(shots_tot / _90s, 2) as shots_per90,
    goals_tot,
    round(goals_tot / _90s, 2) as goals_per90,
    xg_tot,
    round(xg_tot / _90s, 2) as xg_per90,
    --passing
    xa_tot,
    round(xa_tot / _90s, 2) as xa_per90,
    pbp_tot,
    round (pbp_tot / _90s, 2) as pbp_per90, -- players beat by passes
    thball_compl_tot,
    round(thball_compl_tot / _90s, 2) as thballs_compl_per90
from cum_offense




-- select full_name, sum(non_pen_xg) as total_xg
-- from cum_offense
-- group by full_name
-- order by total_xg desc
