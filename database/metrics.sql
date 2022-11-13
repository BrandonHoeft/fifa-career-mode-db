-- starting pass at offensive rate metrics
with offense as (
    select off_id,
           off.fk_game_id,
           p.full_name,
           p.primary_pos,
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

, cum_offense as (

    select
        full_name,
        primary_pos,
        sum(minutes) as total_minutes,
        round(sum(minutes * rating) / sum(minutes), 2) as weighted_rating,
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
        sum(assists) as assist_tot,
        sum(xa) as xa_tot,
        sum(players_beat_by_passes) as pbp_tot,
        sum(through_balls_compl) as thball_compl_tot
    from offense
    group by full_name, primary_pos

)

select
    full_name,
    primary_pos,
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
    assist_tot,
    xa_tot,
    round(xa_tot / _90s, 2) as xa_per90,
    pbp_tot,
    round (pbp_tot / _90s, 2) as pbp_per90, -- players beat by passes
    thball_compl_tot,
    round(thball_compl_tot / _90s, 2) as thballs_compl_per90
from cum_offense
where primary_pos like any (array['%W', '%M', 'ST'])






-- starting pass at defensive rate metrics
with defense as (
    select def_id,
           def.fk_game_id,
           p.full_name,
           p.primary_pos,
           p.second_pos,
           ovr.minutes,
           stand_tkl_att,
           stand_tkl_won,
           slide_tkl_att,
           slide_tkl_won,
           interceptions,
           blocks,
           clearances,
           off_duels_att,
           off_duels_won,
           def_duels_att,
           def_duels_won,
           air_duels_att,
           air_duels_won,
           beaten_by_opp,
           fouls_committed
    from player_stats_def def
         inner join players p on def.fk_player_id = p.player_id
         inner join player_stats_overall ovr on def.fk_player_id = ovr.fk_player_id
                and def.fk_game_id = ovr.fk_game_id
)

, cum_defense as (

    select
        full_name,
        primary_pos,
        second_pos,
        sum(minutes) as total_minutes,
        round(sum(minutes::numeric) / 90, 2) as _90s, -- # of 90 minutes completed
        sum(stand_tkl_att) as stand_tkl_att_tot,
        sum(stand_tkl_won) as stand_tkl_won_tot,
        sum(slide_tkl_att) as slide_tkl_att_tot,
        sum(slide_tkl_won) as slide_tkl_won_tot,
        sum(def_duels_att) as def_duels_att_tot,
        sum(def_duels_won) as def_duels_won_tot,
        sum(air_duels_att) as air_duels_att_tot,
        sum(air_duels_won) as air_duels_won_tot
    from defense
    group by full_name, primary_pos, second_pos

)

select
    full_name,
    primary_pos,
    second_pos,
    _90s,
    round((stand_tkl_won_tot + slide_tkl_won_tot) / _90s, 2) as succ_tkl_tot_per90,
    stand_tkl_att_tot,
    stand_tkl_won_tot,
    round(stand_tkl_won_tot::numeric / coalesce(nullif(stand_tkl_att_tot, 0), 1), 2) as stand_tkl_succ_rt,
    slide_tkl_att_tot,
    slide_tkl_won_tot,
    round(slide_tkl_won_tot::numeric / coalesce(nullif(slide_tkl_att_tot, 0), 1), 2) as slide_tkl_succ_rt,
    def_duels_att_tot,
    def_duels_won_tot,
    round(def_duels_won_tot::numeric / coalesce(nullif(def_duels_att_tot, 0), 1), 2) as def_duels_succ_rt,
    air_duels_att_tot,
    air_duels_won_tot,
    round(air_duels_won_tot::numeric / coalesce(nullif(air_duels_att_tot, 0), 1), 2) as air_duels_succ_rt
from cum_defense
where primary_pos like any (array['%B', 'C%M'])