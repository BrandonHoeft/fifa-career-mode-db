
with stg_player_gamelog_stats as (

    select * from {{ ref('stg_player_gamelog_stats') }}

)

, cum_stats as (

    select
        -- Dims
        full_name,
        primary_pos,
        pos_type,
        player_img_url,
        -- measures
        sum(minutes) as total_minutes,
        round(sum(minutes * rating) / sum(minutes), 2) as weighted_rating,
        round(sum(minutes::numeric) / 90, 2) as _90s, -- # of 90 minutes completed
        sum(poss_lost) as poss_lost_tot,
        sum(shots) as shots_tot,
        sum(non_pen_xg) as npxg_tot,
        sum(goals) as goals_tot,
        -- passing related
        sum(passes_att) as pass_att_tot, -- new
        sum(passes_compl) as pass_compl_tot, -- new
        sum(assists) as assist_tot,
        sum(xa) as xa_tot,
        sum(key_passes) as key_pass_tot,
        sum(line_brk_passes) as line_brk_pass_tot,
    -- defensive/transition cumulative stats
        sum(tackles) as tkl_won_tot,
        sum(interceptions) as intrcpt_tot,
        sum(off_duels) as off_duels_won_tot,
        sum(def_duels) as def_duels_won_tot
    from stg_player_gamelog_stats
    group by full_name, primary_pos, pos_type, player_img_url

)

select
    -- dims
    full_name,
    primary_pos,
    pos_type,
    player_img_url,
    -- measures
    total_minutes,
    _90s,
    weighted_rating,
    -- possession
    round(poss_lost_tot / _90s, 2) as poss_lost_per_90,
    --shooting
    shots_tot,
    round(shots_tot / _90s, 2) as shots_per90,
    goals_tot,
    round(goals_tot / _90s, 2) as goals_per90,
    npxg_tot,
    round(npxg_tot / _90s, 2) as npxg_per90,
    round(npxg_tot / nullif(shots_tot,0), 2) as npxg_per_shot, -- indicator of shot quality
    round(goals_tot - npxg_tot, 2) as goals_minus_npxg, -- luck/skill relative to goals
    --passing / chance creation
    round(pass_compl_tot * 4 / _90s, 2) as pass_compl_per90, --4.5 is extrapolating 20 minutes of real game time
    round(pass_compl_tot::numeric / nullif(pass_att_tot,0),2) as pass_compl_pct,
    assist_tot,
    round(assist_tot / _90s, 2) as assists_per90,
    xa_tot,
    round(xa_tot / _90s, 2) as xA_per90,
    key_pass_tot,
    round(key_pass_tot / _90s, 2) as key_passes_per90,
    line_brk_pass_tot,
    round(line_brk_pass_tot / _90s, 2) as line_brk_passes_per90,

    round((goals_tot + assist_tot) / _90s, 2) as goals_plus_assists_per90,
    round((npxg_tot + xa_tot) / _90s, 2) as xG_plus_xA_per90,

    100 * round((assist_tot + key_pass_tot)::numeric / nullif(pass_att_tot, 0), 2) as SCA_per_100_passes,
    -- recovery/challenges
    round((tkl_won_tot + intrcpt_tot + def_duels_won_tot) / _90s, 2) as recovery_per90,
    round(tkl_won_tot / _90s, 2) as tkl_won_per90,
    round(intrcpt_tot / _90s, 2) as intrcpt_per90,
    round(off_duels_won_tot / _90s, 2) as off_duels_won_per90,
    round(def_duels_won_tot / _90s, 2) as def_duels_won_per90
from cum_stats