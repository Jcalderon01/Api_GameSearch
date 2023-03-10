from flask import Flask

app = Flask(__name__)


@app.route("/")
def main():
    return "Hola Ite"

# ENDPOINT


@app.route("/bye")
def adios():
    return "bye bye                                                                                     "


@app.route("/json")
if __name__ == '__main__':
    app.run()


@app.route("/about")
def about():
    with open('api.json',"r") as json:
        display = json.read()   
        return display