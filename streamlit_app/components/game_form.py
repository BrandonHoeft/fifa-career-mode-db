import streamlit as st
from queries import display_seasons_data, insert_game_info, get_season_ids, get_max_game_num_plus_one, get_team_names, translate_team_name_to_id
import traceback

def game_form():
    st.subheader("Display Seasons History", divider="rainbow")

    # Display the seasons data as a table
    df_seasons = display_seasons_data()
    st.dataframe(df_seasons)

    st.subheader("Add a Game Summary", divider="rainbow")
    # Fetching season IDs for the dropdown
    season_ids = get_season_ids()
    fk_season_id = st.selectbox('Select Season to log a game played for', season_ids)



    # Other input fields (modify as per your 'games' table fields)
    opponents = get_team_names()
    opponent = st.selectbox('Opponent Team Name', opponents)
    fk_opp_id = translate_team_name_to_id(opponent)

    # Auto-populating the game number based on the selected season
    game_num_default = get_max_game_num_plus_one(fk_season_id)
    # Dropdown for game_num (placeholder, integrate with DB logic for auto-population)
    game_num = st.number_input('Game Number (pre-filled +1 from prior value for that season)', min_value=1, value=game_num_default)

    # Add other fields as necessary
    game_minutes = st.number_input('Game Minutes', min_value=4, max_value=20)
    home_or_away = st.selectbox("Home or Away:", ['home', 'away'])
    opp_poss_pct = st.number_input('Opponent Possession % (e.g. 56)', min_value=0, max_value=100)
    opp_ball_rcvry_secs = st.number_input('Opponent Ball Recovery Time (Sec)', min_value=0)
    opp_shots = st.number_input('Opponent Shots', min_value=0)
    opp_xg = st.number_input('Opponent xG (e.g. 2.7, 0.0)', min_value=0.0, step=0.1, format="%.1f")
    opp_goals = st.number_input('Opponent Goals', min_value=0)
    my_ball_rcvry_secs = st.number_input('My Ball Recovery Time (Sec)', min_value=0)
    my_shots = st.number_input('My Shots', min_value=0)
    my_xg = st.number_input('My xG', min_value=0.0, step=0.1, format="%.1f")
    my_goals = st.number_input('My Goals', min_value=0)

    # Submit button
    if st.button('Submit Game Info'):
        # Logic to insert data into the database
        try:
            insert_game_info(fk_season_id, fk_opp_id, game_num, game_minutes, home_or_away, opp_goals, opp_xg, opp_poss_pct, opp_ball_rcvry_secs, opp_shots, my_goals, my_xg, my_shots, my_ball_rcvry_secs)  # Add other fields as necessary
        except:
            error_traceback = traceback.format_exc()
            st.error(F'ERROR\n\n{error_traceback}', icon="🚨")
        else:
            st.success('Game information submitted successfully!')
