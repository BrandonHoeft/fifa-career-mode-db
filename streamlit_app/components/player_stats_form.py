import streamlit as st
from queries import display_last_game_data, get_max_fk_game_id, get_players, translate_player_name_to_player_id, get_player_image_url, insert_player_stats
import traceback

def player_stats_form():
    st.title("Individual Player Game Stats Form")

    st.header("Display Last Game Data", divider="rainbow")
    # Display the seasons data as a table
    last_game = display_last_game_data()
    st.dataframe(last_game)

    st.header("Player & Game", divider="rainbow")
    # Dropdown for fk_game_id (placeholder, integrate with DB to auto-populate)
    last_game_id = get_max_fk_game_id()
    fk_game_id = st.number_input('Select Game ID', min_value=1, value=last_game_id)
    # Dropdown for players (placeholder, integrate with DB)
    active_players = get_players(active=True)
    player = st.selectbox('Select Active Roster Player', active_players)  # Replace with actual player names
    fk_player_id = translate_player_name_to_player_id(player)

    # Fetch and display player image
    player_img_url = get_player_image_url(fk_player_id)
    if player_img_url:
        st.image(player_img_url, width=250, caption=f"{player}")

    # Other input fields for player stats. Order By Game UI
    st.header("Summary", divider="rainbow")
    rating = st.number_input('Rating (e.g. 6.7)', min_value=0.0, step=0.1, format="%.1f")
    minutes = st.number_input('Minutes Played', min_value=1, max_value=130)
    passes_att = st.number_input('Passes Attempted', min_value=0)
    pass_pct = st.number_input('Passing %', min_value=0, max_value=100)
    poss_lost = st.number_input('Possessions Lost', min_value=0)
    # Shooting screen
    st.header("Shooting", divider="rainbow")
    goals = st.number_input('Goals', min_value=0)
    non_pen_xg = st.number_input('non-pen xGoals', min_value=0.0, step=0.1, format="%.1f")
    shots = st.number_input('Shots', min_value=0)
    # Passing screen
    st.header("Passing", divider="rainbow")
    assists = st.number_input('Assists', min_value=0)
    xa = st.number_input('xAssists', min_value=0.0, step=0.1, format="%.1f")
    key_passes = st.number_input('Key Passes', min_value=0)
    line_brk_passes = st.number_input('Line Breaking Passes', min_value=0)
    # Defense screen
    st.header("Defense", divider="rainbow")
    tackles = st.number_input('Tackles Won', min_value=0)
    interceptions = st.number_input('Interceptions', min_value=0)
    off_duels = st.number_input('Offensive Duels Won', min_value=0)
    def_duels = st.number_input('Defensive Duels Won', min_value=0)



    # Submit button
    if st.button('Submit Player Stats'):
        # Logic to insert data into the database
        try:
            insert_player_stats(fk_player_id, fk_game_id, rating, minutes, poss_lost, goals, non_pen_xg, shots, assists, xa, key_passes, line_brk_passes, passes_att, pass_pct, off_duels, def_duels, tackles, interceptions)  # Add other fields as necessary
        except:
            error_traceback = traceback.format_exc()
            st.error(F'ERROR\n\n{error_traceback}', icon="🚨")
        else:
            st.success(f"Submitted for {player} in game_id: {fk_game_id}."
                       f"\n<CTRL + R> to reset form")
