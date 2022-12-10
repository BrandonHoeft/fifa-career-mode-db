# fifa-career-mode-db
`postgres` database project, involving 3NF modeling for ingestion and analysis of FIFA video game career mode player stats.
 
 Runs as a container service using `docker-compose`
 

# Entity Relationship Diagram for Flask CRUD app

This ERD describes the physical data model behind the CRUD app, which is [third-normal form](https://en.wikipedia.org/wiki/Third_normal_form). 

The model tracks players and team stats I play with through each game in their leagues (domestic league, cup, continental tournaments) and seasons.

I used `mermaid.js`, a javascript based diagramming tool to mock up below. Resources for how to [build this ERD](https://mermaid-js.github.io/mermaid/#/entityRelationshipDiagram) and how to [render it in Github](https://github.blog/2022-02-14-include-diagrams-markdown-files-mermaid/)
 
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
            integer my_goals
            numeric my_xg
            integer my_poss_pct
            integer my_shots
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
    
    GAMES }|--|| PLAYER_STATS : belong-to
        PLAYER_STATS {
            identity ovr_id PK "auto-incrementing"
            integer fk_player_id FK "player who started/subbed in a game"
            integer fk_game_id  FK "the game they played in"
            numeric rating
            integer minutes
            integer possession_won
            integer possession_lost
            integer dribble_beat
            integer goals
            numeric non_pen_xg
            integer shots
            integer assists
            numeric xa
            integer second_assists
            integer key_passes
            integer players_beat_by_passes
            integer passes_att
            integer passes_compl
            integer passes_compl_press
            integer through_balls_compl
            integer crosses_attempted
            integer crosses_compl
            integer tackles_att
            integer tackles_won
            integer intrcpts_blocks_clears
            integer duels_att
            integer duels_won
            integer air_duels_att
            integer air_duels_won
            
        }
    PLAYERS }|--|| PLAYER_STATS : have
 

    SEASONS }|--|{ STANDINGS_SNAPSHOT: of
        STANDINGS_SNAPSHOT {
            identity standing_id PK "auto-incrementing"
            integer fk_season_id FK  "the season this standings snapshot is of"
            integer fk_team_id FK "the team in the season of this standings snapshot"
            date standings_as_of
            integer points
            integer goal_diff
        }
    
    TEAMS }|--|{ STANDINGS_SNAPSHOT: has

```