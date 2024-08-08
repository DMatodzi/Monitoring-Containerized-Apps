import os 

from flask import Flask

# create and configure the app
app = Flask(__name__)

@app.route('/')
def hello():
    return "<h1>Hello, CyberFoundation!</h1>"