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

    # Check if the default columns exist in the DataFrame
    if default_x_column in df.columns and default_y_column in df.columns:
        x_axis_val = st.selectbox('Select X-Axis', options=df.columns,
                                  index=df.columns.get_loc(default_x_column))
        y_axis_val = st.selectbox('Select Y-Axis', options=df.columns,
                                  index=df.columns.get_loc(default_y_column))
    else:
        # Fallback to the first two columns if defaults are not found
        x_axis_val = st.selectbox('Select X-Axis', options=df.columns, index=0)
        y_axis_val = st.selectbox('Select Y-Axis', options=df.columns, index=1)

    # for a 3rd dimension overlay: continuous, discrete, or categorical!
    # Add a 'None' option for color mapping
    color_options = ['None'] + list(df.columns)
    color_to_marks = st.selectbox('Map a Color to Marks (Optional)', options=color_options)
    # Define default color when 'None' is selected
    default_color = '#FFFFFF'  # White

    # Conditionally set the color parameter in the plot
    if color_to_marks != 'None':
        plot = px.scatter(df, x=x_axis_val, y=y_axis_val,
                          color=color_to_marks,  # this changes compared to 'else'
                          hover_data=['full_name', 'primary_pos'],
                          marginal_x='histogram',
                          marginal_y='histogram',
                          opacity=0.5, size_max=100,
                          title=f'{x_axis_val} versus {y_axis_val}')
    else:
        plot = px.scatter(df, x=x_axis_val, y=y_axis_val,
                          hover_data=['full_name', 'primary_pos'],
                          marginal_x='histogram',
                          marginal_y='histogram',
                          opacity=0.5, size_max=100,
                          title=f'{x_axis_val} versus {y_axis_val}')
        plot.update_traces(marker=dict(color=default_color))

    st.plotly_chart(plot)



