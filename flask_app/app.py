# runbook: $ `flask --debug run` from CLI for dev/test interactivity to render change on the fly

from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def index():
    """root page of analytics logging web app"""
    return render_template('index.html')

if __name__ == "__main__":
    app.run()