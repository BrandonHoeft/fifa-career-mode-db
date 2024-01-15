import streamlit as st
from queries import insert_team
import traceback

def create_team_form():
    # Form to choose operation type
    st.subheader("Add a new team", divider="rainbow")

    team_name = st.text_input('Team Name')
    team_logo_img_url = st.text_input('Team Logo Image URL (.png)')

    if st.button('Create Team'):
        try:
            insert_team(team_name, team_logo_img_url)
        except:
            error_traceback = traceback.format_exc()
            st.error(F'ERROR\n\n{error_traceback}', icon="🚨")
        else:
            st.success(f"{team_name} created in 'teams' table!")