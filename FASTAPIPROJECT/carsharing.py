from datetime import datetime
from fastapi import FastAPI
app = FastAPI()



@app.get("/")
def welcome():
    return {
        "message":"Welcome to car sharing service"
    }


@app.get("/date")
def date():
    curdatetime = datetime.now()
    return{
        "date": curdatetime
    }

# pip install "fastapi[all]"
# run the app with 
# uvicorn carsharing:app --reload
# doc page of the api 127.0.0.1:8000/docs
# or 127.0.0.1:8000/redoc