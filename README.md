# fifa-career-mode-db
`postgres` database project, involving 3NF modeling for ingestion and analysis of FIFA video game career mode player stats.
 
 Runs as a container service using `docker-compose`
 

# Entity Relationship Diagram for Flask CRUD app

This ERD describes the physical data model behind the CRUD app, which is third-normal form.
 
```mermaid
erDiagram
    LEAGUES }|--|{ SEASONS : have
       LEAGUES {
           identity league_id
           string name
    }
    TEAMS }|--|{ SEASONS : compete-in
       TEAMS {
           identity team_id
           string team_name
    }
       SEASONS {
           identity season_id
           integer fk_league_id
           integer fk_team_id
           smallint year
    }
    SEASONS }|--|| GAMES : have
        GAMES {
            identity game_id
            integer fk_season_id
            integer fk_opp_id
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
            identity player_id
            integer fk_team_id
            text first_name
            text last_name
            text-generated full_name
            date birthday
            text primary_pos
            text secondary_pos
        }

```