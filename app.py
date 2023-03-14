import json
from flask import Flask, Response
from flask import jsonify

app = Flask(__name__)


@app.route('/', methods=['GET'])
def game_search():
    data = {
        "firstName": "GameSearch",
        "descripcion": "Es un servicio especializado en recomendarte tus juegos preferidos",
        "url": "GameSearch.com",
        "precio": "free",
        "endpoints": [
            {
                "url": "/api/profile/recomendations",
                "limit": 3
            },
            {
                "url": "/api/game/price",
                "limit": 5
            },
            {
                "url": "/api",
                "limit": 15
            }
        ]
    }
    response = Response(response=json.dumps(
        data), status=200, mimetype="application/json")
    return response


if __name__ == 'main':
    app.run(debug=True)


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
