-- starting pass at  metrics
with raw_stats as (
    select
        ovr_id,
        stats.fk_game_id,
        stats.fk_player_id,
        p.full_name,
        p.primary_pos,
        minutes,
        rating,
        poss_won,
        poss_lost,
        dribble_beat,
        goals,
        non_pen_xg,
        shots,
        assists,
        xa,
        second_assists,
        key_passes,
        players_beat_passes,
        passes_att,
        passes_compl,
        passes_compl_press,
        through_balls_compl,
        crosses_att,
        crosses_compl,
    -- defensive stats
        tackles_att,
        tackles_won,
        intrcpts_blocks_clears,
        offsides_caused,
        duels_att,
        duels_won,
        air_duels_att,
        air_duels_won
    from player_stats stats
inner join players p
    on stats.fk_player_id = p.player_id
order by full_name, fk_game_id
)

, cum_stats as (

    select
        full_name,
        primary_pos,
        sum(minutes) as total_minutes,
        round(sum(minutes * rating) / sum(minutes), 2) as weighted_rating,
        round(sum(minutes::numeric) / 90, 2) as _90s, -- # of 90 minutes completed
        sum(poss_won) as poss_won_tot,
        sum(poss_lost) as poss_lost_tot,
        sum(dribble_beat) as dribble_beat_tot,
        sum(shots) as shots_tot,
        sum(goals) as goals_tot,
        sum(non_pen_xg) as npxg_tot,
        sum(assists) as assist_tot,
        sum(xa) as xa_tot,
        sum(players_beat_passes) as pbp_tot,
        sum(through_balls_compl) as thrgh_ball_tot,
    -- defensive cumulative stats
        sum(tackles_att) as tkl_att_tot,
        sum(tackles_won) as tkl_won_tot,
        sum(intrcpts_blocks_clears) as def_actions_tot,
        sum(offsides_caused) as offsided_caused_tot,
        sum(duels_att) as duels_att_tot,
        sum(duels_won) as duels_won_tot,
        sum(air_duels_att) as air_duels_att_tot,
        sum(air_duels_won) as air_duels_won_tot
    from raw_stats
    group by full_name, primary_pos

)

select
    full_name,
    primary_pos,
    total_minutes,
    _90s,
    weighted_rating,
    -- possession
    round(poss_won_tot / _90s, 2) as poss_won_per_90,
    round(poss_lost_tot / _90s, 2) as poss_lost_per_90,
    case
        when poss_lost_tot = 0
            then null
        else round(poss_won_tot::numeric / poss_lost_tot, 2)
    end as poss_won_ratio,
    round(dribble_beat_tot / _90s, 2) as dribble_beat_per90,
    --shooting
    shots_tot,
    round(shots_tot / _90s, 2) as shots_per90,
    goals_tot,
    round(goals_tot / _90s, 2) as goals_per90,
    npxg_tot,
    round(npxg_tot / _90s, 2) as npxg_per90,
    round(goals_tot - npxg_tot, 2) as goals_minus_npxg,
    --passing
    assist_tot,
    xa_tot,
    round(xa_tot / _90s, 2) as xa_per90,
    round((xa_tot + npxg_tot) / _90s, 2) as npxg_plus_xa_per90,
    pbp_tot,
    round (pbp_tot / _90s, 2) as pbp_per90, -- players beat by passes
    thrgh_ball_tot,
    round(thrgh_ball_tot / _90s, 2) as thrgh_balls_per90,

    -- defensive
    tkl_att_tot,
    tkl_won_tot,
    round(tkl_won_tot::numeric / nullif(tkl_att_tot, 0), 2) as tkl_win_pct,
    round(tkl_won_tot / _90s, 2) as tkl_won_per90,
    round(def_actions_tot / _90s, 2) as def_actions_per90
from cum_stats
--where primary_pos like any (array['%B', 'C%M'])