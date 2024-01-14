import pandas as pd
import plotly_express as px
import streamlit as st
from queries import query_player_metrics

def interactive_scatterplot():
    df = query_player_metrics()
    metric_cols = df.copy().drop(columns=['full_name', 'primary_pos', 'pos_type', 'player_img_url']).columns

    # Default column names for X and Y axes
    default_x_column = 'total_minutes'
    default_y_column = 'weighted_rating'

    x_axis_val = st.selectbox('Select X-Axis', options=metric_cols, index=metric_cols.get_loc(default_x_column) if default_x_column in df.columns else 0)
    y_axis_val = st.selectbox('Select Y-Axis', options=metric_cols, index=metric_cols.get_loc(default_y_column) if default_y_column in df.columns else 1)

    # Dropdown for size parameter
    size_options = ['None'] + list(metric_cols)
    size_val = st.selectbox('Mark Size Scaler (Optional)', options=size_options, index=0)

    # Define color mapping for 'player_type'
    color_map = {
        'Goalie': '#E2E2E2',  # Gray
        'Defender': '#FFA15A',  # Orange
        'Midfielder': '#316395',  # Blue
        'Attacker': '#1CBE4F'  # Green
    }

    plot_args = {
        'x': x_axis_val,
        'y': y_axis_val,
        'color': 'pos_type',
        'color_discrete_map': color_map,
        'hover_name': 'full_name',
        'hover_data': ['primary_pos'],
        'marginal_x': 'box',
        'marginal_y': 'box',
        'title': f'{x_axis_val} versus {y_axis_val}'
    }

    # Conditionally add the size parameter
    if size_val != 'None':
        plot_args['size'] = size_val

    plot = px.scatter(df, **plot_args)

    # use a default sizing
    if size_val == 'None':
        plot.update_traces(marker=dict(size=12))

    plot.update_traces(opacity=0.75, selector=dict(mode='markers'))

    st.plotly_chart(plot)
