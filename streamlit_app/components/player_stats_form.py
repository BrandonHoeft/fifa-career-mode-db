import streamlit as st
from queries import display_last_game_data, get_max_fk_game_id, get_active_players, translate_player_name_to_player_id, insert_player_stats
import traceback

def player_stats_form():
    st.header("Submit Individual Player Game Stats")

    st.title("Last Game Context")

    # Display the seasons data as a table
    last_game = display_last_game_data()
    st.dataframe(last_game)

    # Dropdown for fk_game_id (placeholder, integrate with DB to auto-populate)
    #last_game_ids = get_last_n_game_ids(n=1)
    #fk_game_id = st.selectbox('Select Game ID', last_game_ids)  # Replace with actual game IDs
    last_game_id = get_max_fk_game_id()
    fk_game_id = st.number_input('Select Game ID', min_value=1, value=last_game_id)
    # Dropdown for players (placeholder, integrate with DB)
    active_players = get_active_players()
    player = st.selectbox('Select Active Roster Player', active_players)  # Replace with actual player names
    fk_player_id = translate_player_name_to_player_id(player)

    # Other input fields for player stats
    rating = st.number_input('Rating (e.g. 6.7)', min_value=0.0, step=0.1, format="%.1f")
    minutes = st.number_input('Minutes Played', min_value=1, max_value=130)
    poss_won = st.number_input('Possessions Won', min_value=0)
    poss_lost = st.number_input('Possessions Lost', min_value=0)
    goals = st.number_input('Goals', min_value=0)
    non_pen_xg = st.number_input('non-penalty xG (e.g. 2.7, 0.0)', min_value=0.0, step=0.1, format="%.1f")
    shots = st.number_input('Shots', min_value=0)
    assists = st.number_input('Assists', min_value=0)
    key_passes = st.number_input('Key Passes', min_value=0)
    passes_att = st.number_input('Passes Attempted', min_value=0)
    passes_compl = st.number_input('Passes Completed', min_value=0)
    duels_att = st.number_input('Duels Attempted', min_value=0)
    duels_won = st.number_input('Duels Won', min_value=0)

    # Submit button
    if st.button('Submit Player Stats'):
        # Logic to insert data into the database
        try:
            insert_player_stats(fk_player_id, fk_game_id, rating, minutes, poss_won, poss_lost, goals, non_pen_xg, shots, assists, key_passes, passes_att, passes_compl, duels_att, duels_won)  # Add other fields as necessary
        except:
            traceback.print_exc()
        else:
            st.success(f"Player stats submitted successfully for {player} in game_id: {fk_game_id}")
