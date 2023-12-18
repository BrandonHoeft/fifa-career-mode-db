import psycopg2
from sqlalchemy import create_engine

def get_db_connection():
    engine = create_engine('postgresql+psycopg2://root:root@postgres:5432/fifa23')
    return engine.connect()