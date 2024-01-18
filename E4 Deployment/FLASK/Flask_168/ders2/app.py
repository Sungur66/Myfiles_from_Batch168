from flask import Flask, url_for, redirect, request


app = Flask(__name__)


@app.route("/admin") # http://127.0.0.1/admin
def admin():
    return "Hello, Admin!"

@app.route("/guest/<guestname>") # http://127.0.0.1/guest/guestname
def guest(guestname):
    return f"Hello guest {guestname}"

@app.route("/user/<username>")
def hello_user(username):
    if username == "mehmet":
        return redirect(url_for("admin"))
    else:
        return redirect(url_for("guest", guestname=username))
    
@app.route("/success/<name>")
def success(name):
    return f"{name} login oldunuz."

@app.route("/fail/<name>")
def fail(name):
    return f"{name}, kullanıcı değilsiniz."

user = "deneme"

@app.route("/login/<loginuser>", methods=["GET", "POST"])
def login(loginuser):
    print(request.method)
    
    
    if request.method == "POST":
        loginuser = request.form["isim"]
        
        if loginuser == user:
            return redirect(url_for("success", name=loginuser))
        else:
            return redirect(url_for("fail", name=loginuser))
        
    
    else:
        
        if loginuser == user:
            return redirect(url_for("success", name=loginuser))
        else:
            return redirect(url_for("fail", name=loginuser))
    
    
    
    
    
    

if __name__ == "__main__":
    app.run(debug = True)