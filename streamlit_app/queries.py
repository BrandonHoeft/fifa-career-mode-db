# Import necessary modules
import pandas as pd
from db_connect import get_db_connection
from sqlalchemy import text

def display_seasons_data():
    query = """
        SELECT 
            s.season_id, 
            s.year::text, 
            l.name AS league_name, 
            t.name AS team_name
        FROM 
            seasons s
        INNER JOIN 
            leagues l ON s.fk_league_id = l.league_id
        INNER JOIN 
            teams t ON s.fk_team_id = t.team_id
    """
    with get_db_connection() as conn:
        return pd.read_sql(query, conn)


def get_season_ids():
    query_any_games_yet = "SELECT COUNT(*) FROM games"
    query = "SELECT DISTINCT fk_season_id FROM games ORDER BY fk_season_id"
    query_on_fail = "SELECT DISTINCT season_id FROM seasons ORDER BY season_id"
    with get_db_connection() as conn:
        result = conn.execute(text(query_any_games_yet))
        game_cnt_in_db = result.fetchone()[0]
        if game_cnt_in_db > 0:
            result = conn.execute(text(query))  # for existing season with games recorded
        else:
            result = conn.execute(text(query_on_fail))  # for brand new season
    data = [row[0] for row in result.fetchall()]
    return data

def get_max_game_num_plus_one(season_id):
    query = f"SELECT MAX(game_num) FROM games WHERE fk_season_id = {season_id}"
    with get_db_connection() as conn:
        try:
            result = conn.execute(text(query))
            max_game_num = result.fetchone()[0]
            max_game_num += 1
        except:
            print("this is probably b/c it's the first game of the season")
            max_game_num = 1
        return max_game_num


def get_opponents_name():
    query = "SELECT name FROM teams ORDER BY name DESC"
    with get_db_connection() as conn:
        result = conn.execute(text(query))
        return [row[0] for row in result.fetchall()]

def translate_opponent_name_to_id(name):
    query = f"SELECT team_id FROM teams WHERE name = '{name}'"
    with get_db_connection() as conn:
        result = conn.execute(text(query))
        opponent_id = result.fetchone()[0]
        return opponent_id


# Player Stats Related Queries
def display_last_game_data():
    query = """
        SELECT
            g.game_id,
            s.season_id,
            s.year::text,
            l.name AS league_name,
            g.game_num as game_number,
            t.name AS my_team,
            g.my_goals,
            t_opp.name as opp_team,
            g.opp_goals
        FROM games g
        inner join seasons s on g.fk_season_id = s.season_id
        INNER JOIN leagues l ON s.fk_league_id = l.league_id
        INNER JOIN teams t ON s.fk_team_id = t.team_id
        inner join teams t_opp on g.fk_opp_id = t_opp.team_id
        where game_id = (select max(game_id) from games) -- last game transaction in database
    """
    with get_db_connection() as conn:
        return pd.read_sql(query, conn)

def get_max_fk_game_id():
    """this is going to be the FK game_id ref for a player's game stats. ASSUMES
    that the game form of the player's game has been submitted already!"""
    query = f"SELECT MAX(game_id) FROM games"
    with get_db_connection() as conn:
        result = conn.execute(text(query))
        max_game_num = result.fetchone()[0]
        return max_game_num

# NEED TO EDIT TO BE LIKE UPDATES ABOVE: fetchall(), text(), etc
def get_active_players():
    query = "SELECT full_name FROM players WHERE end_date IS NULL ORDER BY full_name"
    with get_db_connection() as conn:
        result = conn.execute(text(query))
        return [row[0] for row in result.fetchall()]

def translate_player_name_to_player_id(name):
    query = f"SELECT player_id FROM players WHERE full_name = '{name}'"
    with get_db_connection() as conn:
        result = conn.execute(text(query))
        player_id = result.fetchone()[0]
        return player_id

# Function to insert game information
def insert_game_info(fk_season_id, fk_opp_id, game_num, game_minutes, home_or_away, opp_goals, opp_xg, opp_poss_pct, opp_shots, my_goals, my_xg, my_shots):  # Add other parameters as necessary
    # SQL query for inserting game information
    query = f"""INSERT INTO games (fk_season_id, fk_opp_id, game_num, game_minutes, home_or_away, opp_goals, opp_xg, opp_poss_pct, opp_shots, my_goals, my_xg, my_shots) 
                        VALUES (
                            {fk_season_id},
                            {fk_opp_id}, 
                            {game_num}, 
                            {game_minutes},
                            '{home_or_away}',
                            {opp_goals}, 
                            {opp_xg}, 
                            {opp_poss_pct},
                            {opp_shots},
                            {my_goals},
                            {my_xg},
                            {my_shots}
                        )"""
    with get_db_connection() as conn:
        conn.execute(text(query))
        conn.connection.commit()

# Function to insert player stats
def insert_player_stats(fk_player_id, fk_game_id, rating, minutes, poss_won, poss_lost, goals, non_pen_xg, shots, assists, key_passes, passes_att, passes_compl, duels_att, duels_won):  # Add other parameters as necessary
    query = f"""INSERT INTO player_stats (fk_player_id, fk_game_id, rating, minutes, poss_won, poss_lost, goals, non_pen_xg, shots, assists, key_passes, passes_att, passes_compl, duels_att, duels_won)
                VALUES (
                    {fk_player_id},
                    {fk_game_id},
                    {rating},
                    {minutes},
                    {poss_won},
                    {poss_lost},
                    {goals},
                    {non_pen_xg},
                    {shots},
                    {assists},
                    {key_passes},
                    {passes_att},
                    {passes_compl},
                    {duels_att},
                    {duels_won}
                )"""
    with get_db_connection() as conn:
        conn.execute(text(query))
        conn.connection.commit()