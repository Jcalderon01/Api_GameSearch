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
    
    
@app.route("/api/sql/videogames")
def videogames():
    connection = mysql.connector.connect(host='localhost',
                                         database='gamesearch',
                                         user='',
                                         password='')
    
    sql_select_Query = "select * from videogames"
    cursor = connection.cursor()
    cursor.execute(sql_select_Query)
    records = cursor.fetchall()
    datos_json = []
    for row in records:
        datos_json.append({
            'videogame_id': row[0], 
            'videogame_name': row[1],
            'videogame_publisher': row[2],
            'videogame_release_date': row[3],
            'videogame_platform': row[4],
            'videogame_genre': row[5],
            'videogame_rating': row[6],
            'videogame_description': row[7]
        })
        
    connection.close()
    return jsonify(datos_json)
