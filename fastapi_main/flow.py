import uvicorn
from fastapi import FastAPI
from pydantic import BaseModel, HttpUrl

app = FastAPI()

class Url(BaseModel):
    url: str

class Annalysis(BaseModel):
    url:str

@app.post("/url", response_model = Annalysis)
def annalysis(url:Url):
    return url

if __name__ == "__main__":
    uvicorn.run("flow:app", reload=True)