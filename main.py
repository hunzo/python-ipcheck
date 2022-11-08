from flask import Flask, request, render_template

app = Flask(__name__)

@app.get("/")
def main():
    try:
        ip =  request.headers["x-real-ip"]
    except:
        ip = request.remote_addr
    
    context = {
        "ip": ip
    }
    
    return render_template("index.html", data=context)


    