from fastapi import FastAPI

app = FastAPI(title="platform-app")

@app.get("/health", status_code=200)
def health_check():
    return {"status": "ok"}
