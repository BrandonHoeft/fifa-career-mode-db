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
        crosses_att,
        crosses_compl,
    -- defensive stats
        tackles_att,
        tackles_won,
        intrcpts_blocks_clears,
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
        sum(passes_att) as pass_att_tot, -- new
        sum(passes_compl) as pass_compl_tot, -- new
        sum(passes_compl_press) as pass_compl_press_tot, -- new
        sum(goals) as goals_tot,
        sum(non_pen_xg) as npxg_tot,
        sum(assists) as assist_tot,
        sum(xa) as xa_tot,
        sum(second_assists) as second_assist_tot, -- new
        sum(key_passes) as key_pass_tot, -- new
        sum(players_beat_passes) as pbp_tot,
        sum(crosses_att) as cross_att_tot, -- new
        sum(crosses_compl) as cross_compl_tot, -- new
    -- defensive cumulative stats
        sum(tackles_att) as tkl_att_tot,
        sum(tackles_won) as tkl_won_tot,
        sum(intrcpts_blocks_clears) as def_actions_tot,
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
    round(npxg_tot / nullif(shots_tot,0), 2) as npxg_per_shot, -- indicator of avg shot quality
    round(goals_tot - npxg_tot, 2) as goals_minus_npxg,
    --passing
    round(pass_compl_tot * 4.5 / _90s, 2) as pass_compl_per90, --4.5 is extrapolating 20 minutes of real game time
    round(pass_compl_tot::numeric / nullif(pass_att_tot,0),2) as pass_compl_pct,
    assist_tot,
    xa_tot,
    round(xa_tot / _90s, 2) as xa_per90,
    round((xa_tot + npxg_tot) / _90s, 2) as npxg_plus_xa_per90,
    second_assist_tot,
    key_pass_tot,
    round(key_pass_tot::numeric / _90s, 2) as key_pass_per_90,
    pbp_tot,
    round (pbp_tot / _90s, 2) as pbp_per90, -- players beat by passes
    cross_att_tot,
    cross_compl_tot,
    round(cross_compl_tot::numeric / nullif(cross_att_tot,0), 2) as cross_succ_pct,
    -- defensive
    tkl_att_tot,
    tkl_won_tot,
    round(tkl_won_tot::numeric / nullif(tkl_att_tot, 0), 2) as tkl_win_pct,
    round(tkl_won_tot / _90s, 2) as tkl_won_per90,
    round(def_actions_tot / _90s, 2) as def_actions_per90,
    duels_won_tot,
    round(duels_won_tot::numeric / nullif(duels_att_tot, 0), 2) as duel_win_pct,
    air_duels_won_tot,
    round(air_duels_won_tot::numeric / nullif(air_duels_att_tot, 0), 2) as air_duel_win_pct
from cum_stats
--where primary_pos like 'CM'--like any (array['%M', 'C%M'])