# fifa-career-mode-db
`postgres` database project, involving 3NF modeling for ingestion and analysis of FIFA video game career mode player stats.
 
 Runs as a container service using `docker-compose`
 

# Entity Relationship Diagram for Flask CRUD app

This ERD describes the physical data model behind the CRUD app, which is third-normal form.
 
```mermaid
erDiagram
    LEAGUES }|--|{ SEASONS : have
       LEAGUES {
           identity league_id PK "auto-incrementing"
           string name
    }
    TEAMS }|--|{ SEASONS : compete-in
       TEAMS {
           identity team_id PK "auto-incrementing"
           string team_name
    }
       SEASONS {
           identity season_id PK "auto-incrementing"
           integer fk_league_id FK "the competition/cup tournament"
           integer fk_team_id FK "ref my team playing a season"
           smallint year
    }
    SEASONS }|--|| GAMES : have
        GAMES {
            identity game_id PK "auto-incrementing"
            integer fk_season_id FK "season this game occurred in"
            integer fk_opp_id FK "the opponet of my team"
            integer game_num
            integer game_minutes
            text home_or_away
            integer opp_goals
            numeric opp_xg
            numeric-generated opp_poss_pct
            integer opp_shots
            integer opp_shots_on_targ
            integer my_goals
            numeric my_xg
            integer my_poss_pct
            integer my_shots
            integer my_shots_on_targ
       }
    TEAMS }|--|| GAMES : play
    PLAYERS ||--|{ TEAMS : contracted-to
        PLAYERS {
            identity player_id PK "auto-incrementing"
            integer fk_team_id FK "the team a player plays for"
            text first_name
            text last_name
            text-generated full_name
            date birthday
            text primary_pos
            text secondary_pos
        }
    
    GAMES }|--|| PLAYER_STATS_OVERALL : belong-to
        PLAYER_STATS_OVERALL {
            identity ovr_id PK "auto-incrementing"
            integer fk_player_id FK "player who started/subbed in a game"
            integer fk_game_id  FK "the game they played in"
            numeric rating
            integer minutes
            numeric total_dist
            numeric sprint_dist
        }
    PLAYERS }|--|| PLAYER_STATS_OVERALL : have
 
 
    GAMES }|--|| PLAYER_STATS_OFF : belong-to
        PLAYER_STATS_OFF {
            identity off_id PK "auto-incrementing"
            integer fk_player_id FK "player who started/subbed in a game"
            integer fk_game_id FK "the game they played in"
            integer possession_pct
            integer dribble_att
            integer dribble_compl
            numeric dribble_dist
            integer dribble_beat
            integer dribble_knock_on
            integer goals
            numeric non_pen_xg
            integer shots
            integer shots_on_targ
            integer assists
            numeric xa
            integer second_assists
            integer key_passes
            integer players_beat_by_passes
            integer passes_att
            integer passes_compl
            integer lobs_compl
            integer through_balls_compl
            integer crosses_attempted
            integer crosses_compl
            
        }
 
    PLAYERS }|--|| PLAYER_STATS_OFF : have
 
 
    GAMES }|--|| PLAYER_STATS_DEF : belong-to
        PLAYER_STATS_DEF {
            identity def_id PK "auto-incrementing"
            integer fk_player_id FK "player who started/subbed in a game"
            integer fk_game_id FK  "the game they played in"
            integer stand_tkl_att
            integer stand_tkl_won
            integer slide_tkl_att
            integer slide_tkl_won
            integer interceptions
            integer blocks
            integer clearances
            integer off_duels_att
            integer off_duels_won
            integer def_duels_att
            integer def_duels_won
            integer air_duels_att
            integer air_duels_won
            integer beaten_by_opp
            integer fouls_committed            
        }
 
    PLAYERS }|--|| PLAYER_STATS_DEF : have

```