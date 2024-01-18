from flask import Flask, render_template, request


app = Flask(__name__)


@app.route("/") # http://127.0.0.1:5000/  ==> http://localhost:5000/
def index():
    title = "my first flask app"
    return render_template("index.html", title=title)


@app.route("/duzenle", methods=["POST"]) # http://127.0.0.1:5000/duzenle  ==> http://localhost:5000/duzenle
def duzenle():
    age = int(request.form["age"])
    name = request.form["name"]
    
    return render_template("web.html", age=age, name=name, title="APP")

if __name__ == "__main__":
    app.run(debug=True)