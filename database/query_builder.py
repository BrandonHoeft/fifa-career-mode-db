## Module that can take a list of inputs and generate prompt
import argparse
import pandas as pd
import psycopg2

import warnings

def connect(hostname, port, database, user, password):
    # Database connection details
    hostname = hostname
    port = port
    database = database
    user = user
    password = password

    # Connect to the database
    return psycopg2.connect(host=hostname, port=port, database=database,
                            user=user, password=password)

def gen_game_sql_template(conn, fk_season_id, game_num, game_min, home_or_away, fk_opp_id):
    games_cols = pd.read_sql("select column_name from information_schema.columns where table_name = 'games' and column_name not in ('game_id', 'my_poss_pct')", conn).column_name.tolist()
    sql_skeleton = f"INSERT INTO games {tuple(games_cols)}\nVALUES\n\t"
    values = f"({fk_season_id},{game_num},{game_min},{home_or_away},{fk_opp_id},,,,,,,)"
    sql_skeleton += values
    sql_skeleton = sql_skeleton.replace("'", "")  # remove quotes from field names for SQL insert
    sql_skeleton = sql_skeleton[:-32] + sql_skeleton[-32:].replace(home_or_away, f"'{home_or_away}'")  # re-add single quote to 'home' or 'away' string in VALUES clause
    print(sql_skeleton)
    return sql_skeleton

def gen_player_stats_sql_template(conn, fk_game_id):
    # Prompt for a list of names
    #Iván Marcano,Pepe Laveran Lima Ferreira,Zaidu Sanusi,Pepê Gabriel Aquino Cossa,Stephen Eustaquio,Wenderson Galeno,Otávio Edmilson da Silva Monteiro,Mehdi Taremi,Francisco Evanilson,Toni Martínez,Fábio Cardoso,Carmo David,João Mário,Marko Grujić,Nico González,Gabriel Veron,Gonçalo Borges,Daniel Namaso Loader,Wendell Nascimento Borges,Romário Baró,André Franco,Alan Varela,Jorge Sánchez,Vasco Sousa,Bernardo Folha
    player_names = pd.read_sql("select * from public.players", conn).full_name.to_list()
    names = input(f"Enter a list of names (comma-separated,no space b/w names) from:\n{player_names}").split(",")
    player_stats_cols = pd.read_sql("select column_name from information_schema.columns where table_name = 'player_stats' and column_name != 'ovr_id'", conn).column_name.tolist()
    fk_game_id = fk_game_id
    try:
        # Construct the SELECT query
        query = "SELECT player_id, full_name FROM public.players WHERE full_name IN %s"

        # Execute the query with the provided names
        df = pd.read_sql(query, conn, params=(tuple(names),))

        # Create a dictionary from the dataframe
        player_dict = df.set_index('player_id')['full_name'].to_dict()

        # Generate the SQL string skeleton
        sql_skeleton = f"INSERT INTO player_stats {tuple(player_stats_cols)}\nVALUES\n"

        for fk_player_id, full_name in player_dict.items():
            comment = f"  -- {full_name}"
            values = f"({fk_player_id},{fk_game_id},{',' * (len(player_stats_cols) - 3)})," + comment
            sql_skeleton += values + "\n"
            sql_skeleton = sql_skeleton.replace("'", "")

        print(sql_skeleton)
        return sql_skeleton

    except Exception as e:
        print("Error:", e)

    finally:
        # Close the connection
        conn.close()

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--host", help="Hostname of the database server")
    parser.add_argument("-p", "--port", type=int, help="Port number of the database server")
    parser.add_argument("-d", "--database", help="Name of the database")
    parser.add_argument("-u", "--user", help="Username for the database")
    parser.add_argument("-pw", "--password", help="Password for the database")

    args = parser.parse_args()

    pg_conn = connect(args.host, args.port, args.database, args.user, args.password)

    season_id = input("Enter the season number that will represent the season_id:")
    game_number = input(f"Enter the game number that represents the game_num/fk_game_id. Query of public.games indicates next game # is likely: {pd.read_sql('select 1+ max(game_num) from public.games', pg_conn)}")
    game_minutes = input("Enter the game length in minutes played:")
    home_or_away = input("enter home or away:")
    my_opponent_id = input(f"Enter my opponent_id from this table:\n{pd.read_sql('select * from public.teams', pg_conn)}")

    warnings.filterwarnings('ignore')
    game_sql_string = gen_game_sql_template(pg_conn, fk_season_id=season_id, game_num=game_number, game_min=game_minutes, home_or_away=home_or_away, fk_opp_id=my_opponent_id)

    # TODO: before generating this, run the game SQL query to gen proper fk_game_id that gets queried below
    # FIXME: the fk_game_id might return the wrong one. Look into transactions.
    player_stats_sql_string = gen_player_stats_sql_template(pg_conn, fk_game_id=game_number)

    print("Finished")