import pandas as pd
import plotly_express as px
import streamlit as st
from queries import query_player_metrics, get_players

def interactive_scatterplot():
    # Source Data staging
    df = query_player_metrics()
    dimension_cols = ['full_name', 'primary_pos', 'pos_type', 'player_img_url']
    measure_cols = df.copy().drop(columns=dimension_cols).columns

    # Visual Container for Data Filtering Toggles
    with st.container(border=True):
        st.subheader('Data Filters')

        # Dropdown for Year
        year_of_play_list = sorted(df.year.unique())
        years_selected = st.multiselect(
            'Choose Year(s)', options=year_of_play_list,
            default=year_of_play_list[-1])  # max year default
        df = df[df['year'].isin(years_selected)]

        goalies_button = st.radio("Include Goalies?", ('No', 'Yes'), index=0)
        if goalies_button == 'No':
            df = df[df['primary_pos'] != 'GK']

        # Dropdown for position type filter
        position_types_list = list(df.pos_type.unique())
        position_type_options = st.multiselect('Filter Position Types (Optional)', options=position_types_list, default=position_types_list)
        if len(position_type_options) < len(position_types_list):
            df = df[df['pos_type'].isin(position_type_options)]

    # Visual Container for Plotting Options
    with st.container(border=True):
        st.subheader('Plotting options')
        default_x_column = 'total_minutes'
        default_y_column = 'weighted_rating'
        x_axis_val = st.selectbox('Select X-Axis', options=measure_cols, index=measure_cols.get_loc(default_x_column) if default_x_column in df.columns else 0)
        y_axis_val = st.selectbox('Select Y-Axis', options=measure_cols, index=measure_cols.get_loc(default_y_column) if default_y_column in df.columns else 1)

        # Dropdown for size parameter
        size_options = ['None'] + list(measure_cols)
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
    }

    # Conditionally add the size parameter
    if size_val != 'None':
        plot_args['size'] = size_val

    plot = px.scatter(df, **plot_args)

    # Calculate median, min, and max for x and y
    median_x, min_x, max_x = df[x_axis_val].median(), df[x_axis_val].min(), df[x_axis_val].max()
    median_y, min_y, max_y = df[y_axis_val].median(), df[y_axis_val].min(), df[y_axis_val].max()

    # Add vertical line at median of x
    plot.add_shape(type='line',
                  x0=median_x, y0=min_y, x1=median_x, y1=max_y,
                  line=dict(color='Gray', dash='dot'),
                  xref='x',
                  yref='y')  # yref='paper' to span the full height

    # Add horizontal line at median of y
    plot.add_shape(type='line',
                  x0=min_x, y0=median_y, x1=max_x, y1=median_y,
                  line=dict(color='Gray', dash='dot'),
                  xref='x', yref='y')  # xref='paper' to span the full width

    # use a default sizing
    if size_val == 'None':
        plot.update_traces(marker=dict(size=14))

    # Set the size of the plot to be square
    plot.update_layout(
        width=600,  # Width of the plot in pixels
        height=600,  # Height of the plot in pixels, up from 450 default
        font=dict(
            family="Arial, sans-serif",
            size=18,  # up from 12-default
        )
    )
    plot.update_xaxes(showgrid=False)
    plot.update_yaxes(showgrid=False)
    plot.update_traces(opacity=0.75, selector=dict(mode='markers'))

    st.plotly_chart(plot, theme='streamlit', use_container_width=True)

#TODO: work on this
def radar_plot():
    # # Source Data staging
    # df = query_player_metrics()
    #
    # # Identify field types
    # dimension_cols = ['full_name', 'primary_pos', 'pos_type', 'player_img_url']
    # measure_cols = df.copy().drop(columns=dimension_cols).columns
    #
    # # Identify Templates
    # defender_template = [col for col in measure_cols if col in ['weighted_rating', 'recovery_per90', 'tkl_won_per90', 'intrcpt_per90', 'def_duels_won_per90', 'off_duels_won_per90', 'pass_compl_per90', 'line_brk_passes_per90', 'poss_lost_per_90']]
    # attacker_template = [col for col in measure_cols if col in ['weighted_rating', 'poss_lost_per_90', 'shots_per90','line_brk_passes_per90', 'recovery_per90', 'off_duels_won_per90', 'def_duels_won_per90']]
    #
    # # Dropdown for Year
    # year_of_play_list = sorted(df.year.unique())
    # years_selected = st.multiselect(
    #     'Choose Year(s)', options=year_of_play_list,
    #     default=year_of_play_list[-1])  # max year default
    # df = df[df['year'].isin(years_selected)]
    #
    # # Dropdown for players (placeholder, integrate with DB)
    # active_players = get_players(active=True)
    # player1 = st.selectbox('Select Active Roster Player', active_players,
    #                       key="radar_plot_select_1st_player")  # Replace with actual player names
    #
    # # Calculate percentiles and normalize
    # df_normalized = df.copy()
    # for col in defender_template:
    #     df_normalized[col] = df[col].rank(pct=True) * 100
    #
    # df = df.loc[df['full_name'] == player1, defender_template]







