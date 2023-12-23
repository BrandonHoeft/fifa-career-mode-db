import streamlit as st
from queries import get_players, translate_player_name_to_player_id, insert_player, update_player, soft_delete_player  # Assume these functions exist in queries.py
import traceback

def create_player_form():
    st.title("Player Operations")

    # Form to choose operation type
    operation = st.radio("Choose CRUD", ('Create New Player', 'Update Existing Player', 'Soft Delete Player'))

    # Additional fields for creating a player
    if operation == 'Create New Player':
        fk_team_id = 1
        first_name = st.text_input('First Name')
        last_name = st.text_input('Last Name')
        birthday = st.date_input('Birthday', format='YYYY-MM-DD')
        positions = ['ST', 'CF', 'LW', 'LM', 'RW', 'RM', 'CAM', 'CM', 'CDM', 'LB', 'LWB', 'CB', 'RB', 'RWB', 'GK']
        primary_pos = st.selectbox('Primary Position', positions)
        second_pos = st.selectbox('Secondary Position', positions)
        start_date = st.date_input('Start Date', format='YYYY-MM-DD')
        player_img_url = st.text_input('Player Image URL')

        if st.button('Create Player'):
            try:
                insert_player(fk_team_id, first_name, last_name, birthday, primary_pos, second_pos, start_date, player_img_url)
            except:
                error_traceback = traceback.format_exc()
                st.error(F'ERROR\n\n{error_traceback}', icon="🚨")
            else:
                st.success(f"{first_name} {last_name} created in 'players' table!")

    # Fields for updating a player
    elif operation == 'Update Existing Player':

        # Dropdown for players (placeholder, integrate with DB)
        active_players = get_players(active=False)
        player = st.selectbox('Select Active Roster Player', active_players)
        player_id = translate_player_name_to_player_id(player)
        updated_field = st.selectbox('Field to Update', ['First Name', 'Last Name', 'Birthday', 'Primary Position', 'Secondary Position', 'Start Date', 'End Date', 'Player Image URL'])
        date_fields = ['Birthday', 'Start Date', 'End Date']

        if updated_field in date_fields:
            updated_value = st.date_input('New Date Value', format='YYYY-MM-DD')
        else:
            updated_value = st.text_input('New Text Value (unquoted)')

        if st.button('Update Player'):
            try:
                update_player(player_id, updated_field, updated_value)
            except:
                error_traceback = traceback.format_exc()
                st.error(F'ERROR\n\n{error_traceback}', icon="🚨")
            else:
                st.success(f"{player}'s {updated_field} updated to {updated_value}!")

    # Fields for soft deleting a player
    elif operation == 'Soft Delete Player':
        # Dropdown for players to soft delete (set an end_date to time at the team)
        active_players = get_players(active=False)
        player = st.selectbox('Select Player to Soft Delete (set an end_date value)', active_players)
        player_id = translate_player_name_to_player_id(player)
        end_date = st.date_input('Set End Date Value', format='YYYY-MM-DD')

        if st.button('Soft Delete Player'):
            try:
                soft_delete_player(player_id, end_date)
            except:
                error_traceback = traceback.format_exc()
                st.error(F'ERROR\n\n{error_traceback}', icon="🚨")
            else:
                st.success(f"{player} soft deleted successfully!")