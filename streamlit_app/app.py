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
    st.title("Analytics")
    tab1, tab2, tab3, tab4 = st.tabs(["✨✨Scatterplot", "📶Dot Plot", "💥Radar Plot", "📈Standings"])

    with tab1:
        st.header("Scatterplot (x vs. y)")
        interactive_scatterplot()

    with tab2:
        #TODO: need to work on plot for this

        st.header("Dot Plot (Rank Order a Metric)")
        st.image("https://uc-r.github.io/public/images/visual/cleveland-dotplots/unnamed-chunk-9-1.png", width=200)

    with tab3:
        st.header("Radar Plot")
        #TODO: need to work on plot for this
        st.image("https://statsbomb.com/wp-content/uploads/2022/02/Pedri-La-Liga-2020_2021-2.png", width=200)

    with tab4:
        st.header("Standings History")
        #TODO: need to work on plot for this
        st.image("https://pbs.twimg.com/media/FrnUnVmWIAYi7uF.jpg:large", width=200)