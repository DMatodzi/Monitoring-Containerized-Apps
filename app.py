import os 

from flask import Flask

# create and configure the app
app = Flask(__name__)

@app.route('/')
def hello():
    return "<h1>Hello, CyberFoundation!</h1>"

app.run(host='0.0.0.0', port=5000, debug=True)