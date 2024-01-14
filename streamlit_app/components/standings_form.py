import streamlit as st
from queries import display_seasons_data, get_season_ids, get_team_names, translate_team_name_to_id, get_standings, insert_standings_snapshot, get_team_img_url
import traceback

def insert_standings_form():
    st.subheader("Display Seasons History", divider="rainbow")
    # Display the seasons data as a table
    df_seasons = display_seasons_data()
    st.dataframe(df_seasons)


    st.subheader("Fill Out a Standings Snapshot", divider="rainbow")
    # Fetching season IDs for the dropdown
    season_ids = get_season_ids()
    fk_season_id = st.selectbox('Select Season to Update Standings', season_ids)

    # Dropdown for teams
    teams = get_team_names()
    team = st.selectbox('Select Team Name', teams)
    team_id = translate_team_name_to_id(team)

    # Fetch and display team image
    team_img_url = get_team_img_url(team_id)
    if team_img_url:
        st.image(team_img_url, width=250, caption=f"{team}")

    snapshot_date = st.date_input('Select Snapshot as of Date', format='YYYY-MM-DD')
    points = st.number_input('Cumulative Points', min_value=0)
    goal_diff = st.number_input('Cumulative Goal Difference', min_value=-500, max_value=500, value=0)

    if st.button('Submit Standings Snapshot'):
        # Logic to insert data into the database
        try:
            insert_standings_snapshot(team_id, fk_season_id, snapshot_date,
                                      points, goal_diff)
        except:
            error_traceback = traceback.format_exc()
            st.error(F'ERROR\n\n{error_traceback}', icon="🚨")
        else:
            st.success(f"Standings snapshot submitted successfully for {team} as of {snapshot_date}!")
            df_standings = get_standings(fk_season_id, snapshot_date)
            st.dataframe(df_standings)



