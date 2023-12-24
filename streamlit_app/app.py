import streamlit as st
from components.game_form import game_form
from components.player_stats_form import player_stats_form
from components.create_player import create_player_form
from components.standings_form import insert_standings_form

# Configure Page
st.set_page_config(layout="wide")

# Streamlit app title
st.title('FIFA Career Mode CRUD App')

# Toggle between 'Game' and 'Player Stats' forms
with st.sidebar:
    form_type = st.radio(
            "Choose Your CRUD Adventure:",
            ('Insert Game', 'Insert Player Stats', 'Manage Players', 'Insert Standings')
    )

if form_type == 'Insert Game':
    game_form()
elif form_type == 'Insert Player Stats':
    player_stats_form()
elif form_type == 'Manage Players':
    create_player_form()
elif form_type == 'Insert Standings':
    insert_standings_form()