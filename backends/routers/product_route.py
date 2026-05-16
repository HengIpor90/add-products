from fastapi import APIRouter, Request
from models.product_model import ProductCreate
from controllers.product_controller import upsert_product_logic, get_products_logic

router = APIRouter(prefix="/products", tags=["Products"])

@router.post("/add")
async def add_product(request: Request, product: ProductCreate):
    db = request.app.mongodb
    await upsert_product_logic(db, product)
    return {"message": f"Product '{product.title}' saved/updated"}

@router.get("/")
async def list_products(request: Request):
    db = request.app.mongodb
    return await get_products_logic(db)