import streamlit as st
from components.game_form import game_form
from components.player_stats_form import player_stats_form
from components.create_player import create_player_form

# Configure Page
st.set_page_config(layout="wide")

# Streamlit app title
st.title('FIFA Career Mode CRUD App')

# Toggle between 'Game' and 'Player Stats' forms
with st.sidebar:
    form_type = st.radio(
            "Choose the type of data to insert:",
            ('Game', 'Player Stats', 'Manage Players')
    )

if form_type == 'Game':
    game_form()
elif form_type == 'Player Stats':
    player_stats_form()
elif form_type == 'Manage Players':
    create_player_form()