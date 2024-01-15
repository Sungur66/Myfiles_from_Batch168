from flask import Flask
from markupsafe import escape


app = Flask(__name__)


@app.route("/") # http://127.0.0.1:5000/
def hello_world():
    return "Hello Ben Flask Projesiyim"

@app.route("/about") # http://127.0.0.1:5000/about
def about():
    return "Bu sayfa hakkımızda sayfasıdır"

@app.route("/<name>")
def hello_name(name):
    return f"Hello, {escape(name)}!"


@app.route("/user/<username>")
def show_user_profile(username):
    return f"User {escape(username)}\'s profile"

@app.route("/post/<int:post_id>")
def show_post(post_id):
    return f"Post {post_id}"




if __name__ == "__main__":
    app.run(debug = True)