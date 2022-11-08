from flask import Flask, request, render_template

app = Flask(__name__)

@app.get("/")
def main():
    print(request.headers)
    try:
        ip_add =  request.headers["X-Forwarded-For"]
        print(ip_add)
        ip = ip_add.split(",")[0]
        print(ip)
    except:
        ip = request.remote_addr
    
    context = {
        "ip": ip
    }
    
    return render_template("index.html", data=context)


    
