# runbook: $ `flask run` from CLI for dev/test

from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def index():
    """root page of analytics logging web app"""
    return render_template('index.html')