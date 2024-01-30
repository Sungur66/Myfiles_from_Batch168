from flask import Flask, url_for, redirect, render_template, request
import pickle


app = Flask(__name__)


@app.route("/") # http://127.0.0.1:5000/
def home():
    prediction = request.args.get("prediction")
    return render_template("home.html", prediction=prediction)

@app.route("/about")
def about():
    return render_template("about.html")


@app.route("/predict", methods=["POST", "GET"])
def predict():
    if request.method == "POST":
        budget = request.form["budget"]
        
        model = pickle.load(open("simple_linear_regression.pkl", "rb"))
        prediction = model.predict([[int(budget)]])
        prediction = int(prediction[0])
        
        return redirect(url_for("home", prediction=f"Predicted Sales Amount: {prediction} Millions"))
    
    
    
if __name__ == "__main__":
    app.run(debug=True)