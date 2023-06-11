
## Module that can take a list of inputs and generate prompt
import argparse
import pandas as pd
import psycopg2

def main(hostname, port, database, user, password):

    # Database connection details
    hostname = hostname
    port = port
    database = database
    user = user
    password = password

    # Connect to the database
    conn = psycopg2.connect(host=hostname, port=port, database=database, user=user, password=password)

    # Prompt for a list of names
    # Milos Veljkovic,Niklas Stark,Marco Friedl,Anthony Jung,Mitchel Weiser,Jens Stage,Naby Keita,Julian Brandt,Dawid Kownacki,Niclas Füllkrug,Romano Schmid,Niklas Schmidt,Eren Dinkci
    names = input("Enter a list of names (comma-separated): ").split(",")
    fk_game_id = input("Enter the game number that will represent the FK game_id:")
    player_stats_cols = pd.read_sql("select column_name from information_schema.columns where table_name = 'player_stats' and column_name != 'player_game_id'", conn).column_name.tolist()

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
            #values = f"({fk_player_id}" + (f",{''}" * (num_fields - 1)) + f"),{comment}"
            values = f"({fk_player_id},{fk_game_id},{',' * (len(player_stats_cols) - 3)})," + comment
            sql_skeleton += values + "\n"

        print(sql_skeleton)

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

    main(args.host, args.port, args.database, args.user, args.password)