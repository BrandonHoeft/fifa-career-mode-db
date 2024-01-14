import pandas as pd
import plotly_express as px
import streamlit as st
from queries import query_player_metrics

def interactive_scatterplot():
    st.title("Player Performance Analytics")

    df = query_player_metrics()

    # Default column names for X and Y axes
    default_x_column = 'total_minutes'
    default_y_column = 'weighted_rating'

    x_axis_val = st.selectbox('Select X-Axis', options=df.columns, index=df.columns.get_loc(default_x_column) if default_x_column in df.columns else 0)
    y_axis_val = st.selectbox('Select Y-Axis', options=df.columns, index=df.columns.get_loc(default_y_column) if default_y_column in df.columns else 1)

    # Radio button for color selection
    color_option = st.radio("Color Options", ['None', 'By Position Type'])

    # Define color mapping for 'player_type'
    color_map = {
        'Goalie': 'White',
        'Defender': 'Orange',
        'Midfielder': 'Blue',
        'Attacker': 'Green'
    }

    # Conditionally create the plot based on color option
    if color_option == 'By Position Type':
        plot = px.scatter(df, x=x_axis_val, y=y_axis_val, color='pos_type',
                          color_discrete_map=color_map,
                          hover_data=['full_name', 'primary_pos'],
                          marginal_x='violin',
                          marginal_y='violin',
                          opacity=0.5, size_max=100,
                          title=f'{x_axis_val} versus {y_axis_val}')
    else:
        plot = px.scatter(df, x=x_axis_val, y=y_axis_val,
                          hover_data=['full_name', 'primary_pos'],
                          marginal_x='violin',
                          marginal_y='violin',
                          opacity=0.5, size_max=100,
                          title=f'{x_axis_val} versus {y_axis_val}')

    st.plotly_chart(plot)



