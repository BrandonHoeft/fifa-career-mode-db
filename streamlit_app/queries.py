# Import necessary modules
import pandas as pd
from db_connect import get_db_connection
from sqlalchemy import text

# Player Create/Update/Soft Delete Related Queries
################################################################################
def insert_player(fk_team_id, first_name, last_name, birthday, primary_pos, second_pos, start_date, player_img_url):
    # SQL query for inserting game information
    query = f"""INSERT INTO players (fk_team_id, first_name, last_name, birthday, primary_pos, second_pos, start_date, player_img_url) 
                VALUES (
                    {fk_team_id},
                    '{first_name}', 
                    '{last_name}', 
                    '{birthday}',
                    '{primary_pos}',
                    '{second_pos}', 
                    '{start_date}', 
                    '{player_img_url}'
                )"""
    with get_db_connection() as conn:
        conn.execute(text(query))
        conn.connection.commit()

def update_player(player_id, updated_field, updated_value):
    # Mapping of field names to column names in the database
    field_to_column = { # value is the postgres format
        'First Name': 'first_name',
        'Last Name': 'last_name',
        'Birthday': 'birthday',
        'Primary Position': 'primary_pos',
        'Secondary Position': 'second_pos',
        'Start Date': 'start_date',
        'End Date': 'end_date',
        'Player Image URL': 'player_img_url'
    }

    column_name = field_to_column.get(updated_field)

    if column_name:
        query = text(f"""
            UPDATE players
            SET {column_name} = :updated_value
            WHERE player_id = :player_id
        """)

        with get_db_connection() as conn:
            conn.execute(query, {'updated_value': updated_value,
                                 'player_id': player_id})
            conn.connection.commit()


def soft_delete_player(player_id, end_date):
    query = text("""
        UPDATE players
        SET end_date = :end_date
        WHERE player_id = :player_id
    """)

    with get_db_connection() as conn:
        conn.execute(query, {'end_date': end_date, 'player_id': player_id})
        conn.connection.commit()

# Game Related Queries
################################################################################

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


def get_team_names():
    query = "SELECT name FROM teams ORDER BY name DESC"
    with get_db_connection() as conn:
        result = conn.execute(text(query))
        return [row[0] for row in result.fetchall()]

def translate_team_name_to_id(name):
    query = f"SELECT team_id FROM teams WHERE name = '{name}'"
    with get_db_connection() as conn:
        result = conn.execute(text(query))
        opponent_id = result.fetchone()[0]
        return opponent_id

def get_team_img_url(team_id):
    query = text(f"SELECT team_logo_img_url FROM teams WHERE team_id = {team_id}")
    with get_db_connection() as conn:
        result = conn.execute(query)
        row = result.fetchone()
        return row[0] if row else None  # Return the URL or None if not found



# Player Stats Related Queries
################################################################################
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

def get_players(active=True):
    if active:
        query = "SELECT full_name FROM players WHERE end_date IS NULL ORDER BY last_name"
    else:
        query = "SELECT full_name FROM players ORDER BY last_name"
    with get_db_connection() as conn:
        result = conn.execute(text(query))
        return [row[0] for row in result.fetchall()]

def translate_player_name_to_player_id(name):
    query = f"SELECT player_id FROM players WHERE full_name = '{name}'"
    with get_db_connection() as conn:
        result = conn.execute(text(query))
        player_id = result.fetchone()[0]
        return player_id

def get_player_image_url(player_id):
    query = text(f"SELECT player_img_url FROM players WHERE player_id = {player_id}")
    with get_db_connection() as conn:
        result = conn.execute(query)
        row = result.fetchone()
        return row[0] if row else None  # Return the URL or None if not found

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
def insert_player_stats(fk_player_id, fk_game_id, rating, minutes, poss_lost, goals, non_pen_xg, shots, assists, xa, key_passes, line_brk_passes, passes_att, pass_pct, off_duels, def_duels, tackles, interceptions):  # Add other parameters as necessary
    query = f"""INSERT INTO player_stats (fk_player_id, fk_game_id, rating, minutes, poss_lost, goals, non_pen_xg, shots, assists, xa, key_passes, line_brk_passes, passes_att, pass_pct, off_duels, def_duels,tackles, interceptions)
                VALUES (
                    {fk_player_id},
                    {fk_game_id},
                    {rating},
                    {minutes},
                    {poss_lost},
                    {goals},
                    {non_pen_xg},
                    {shots},
                    {assists},
                    {xa},
                    {key_passes},
                    {line_brk_passes},
                    {passes_att},
                    {pass_pct},
                    {off_duels},
                    {def_duels},
                    {tackles},
                    {interceptions}
                )"""
    with get_db_connection() as conn:
        conn.execute(text(query))
        conn.connection.commit()

# Standings Related Queries
################################################################################
def get_standings(season_id, snapshot_date):
    query = text(f"""
                SELECT
                    l.name as league,
                    s.year || '-' || s.year + 1 as year,
                    t.name as team,
                    ss.standings_as_of, 
                    ss.points,
                    ss.goal_diff
                FROM standings_snapshot ss
                LEFT JOIN teams t on ss.fk_team_id = t.team_id
                LEFT JOIN seasons s on ss.fk_season_id = s.season_id
                LEFT JOIN leagues l on s.fk_league_id = l.league_id
                WHERE ss.fk_season_id = :season_id
                    AND standings_as_of = :snapshot_date
                ORDER BY points, goal_diff DESC
                """)
    with get_db_connection() as conn:
        return pd.read_sql(query, conn, params={'season_id': season_id, 'snapshot_date': snapshot_date})


def insert_standings_snapshot(fk_team_id, fk_season_id, standings_as_of, points, goal_diff):
    # SQL query for inserting game information
    query = f"""INSERT INTO standings_snapshot (fk_team_id, fk_season_id, standings_as_of, points, goal_diff) 
                VALUES (
                    {fk_team_id},
                    {fk_season_id}, 
                    '{standings_as_of}', 
                    {points},
                    {goal_diff}
                    )"""
    with get_db_connection() as conn:
        conn.execute(text(query))
        conn.connection.commit()