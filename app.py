from flask import Flask
from flask import jsonify

app = Flask(__name__)


@app.route("/")
def main():
    return "Hola Ite"


@app.route("/bye")
def adios():
    return "bye bye                                                                                     "


@app.route("/about")
def about():
    with open('api.json', "r") as json:
        display = json.read()
        return display
