with raw_stats as (
    select full_name,
           primary_pos,
           fk_game_id,
           rating,
           minutes,
           poss_won,
           poss_lost,
           goals,
           shots,
           assists,
           key_passes,
           passes_att,
           passes_compl,
           intrcpts_tkls,
           duels_won
    from player_stats
             inner join players p on player_stats.fk_player_id = p.player_id
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
        sum(shots) as shots_tot,
        sum(passes_att) as pass_att_tot, -- new
        sum(passes_compl) as pass_compl_tot, -- new
        sum(goals) as goals_tot,
        sum(assists) as assist_tot,
        sum(key_passes) as key_pass_tot,
    -- defensive cumulative stats
        sum(intrcpts_tkls) as intrcpts_tkls_tot,
        sum(duels_won) as duels_won_tot
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
    --shooting
    shots_tot,
    round(shots_tot / _90s, 2) as shots_per90,
    goals_tot,
    round(goals_tot / _90s, 2) as goals_per90,
    --passing
    round(pass_compl_tot * 4.5 / _90s, 2) as pass_compl_per90, --4.5 is extrapolating 20 minutes of real game time
    round(pass_compl_tot::numeric / nullif(pass_att_tot,0),2) as pass_compl_pct,
    assist_tot,
    round(assist_tot / _90s, 2) as assists_per90,
    key_pass_tot,
    round(key_pass_tot / _90s, 2) as key_passes_per90,
    -- defensive
    round(intrcpts_tkls_tot / _90s, 2) as intrcpts_tkls_per90,
    round(duels_won_tot / _90s, 2) as duels_won_per90
from cum_stats
--where primary_pos like any (array['%B', 'C%M'])