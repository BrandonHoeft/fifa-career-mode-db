import streamlit as st
from components.game_form import game_form
from components.player_stats_form import player_stats_form
from components.create_player import create_player_form
from components.standings_form import insert_standings_form
from components.plots import interactive_scatterplot

# Configure Page
st.set_page_config(layout="wide")

# Streamlit app title
st.title('FIFA Career Mode CRUD App')

# Create Sidebar to main page with radio buttons to go to other forms/pages
form_type = st.sidebar.radio("Pages:",
    options=['Insert Game',
    'Insert Player Stats',
    'Manage Players',
    'Insert Standings',
    'Plots'])

if form_type == 'Insert Game':
    game_form()
elif form_type == 'Insert Player Stats':
    player_stats_form()
elif form_type == 'Manage Players':
    create_player_form()
elif form_type == 'Insert Standings':
    insert_standings_form()
elif form_type == 'Plots':
    interactive_scatterplot()