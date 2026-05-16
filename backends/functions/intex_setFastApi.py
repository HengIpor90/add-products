# ដាក់ lifespan ចូលក្នុង FastAPI
# def function():
from fastapi import FastAPI

from routers import product_route, user_route
from rules import lifespan


app = FastAPI(title="Café Signal API", lifespan=lifespan)
app = FastAPI(title="Café Signal API v1.0") 

# រួមបញ្ចូល Route ពី Router នីមួយៗ
app.include_router(user_route.router)
app.include_router(product_route.router)

@app.get("/")
async def root():
    return {"status": "Online", "project": "Café Signal"}